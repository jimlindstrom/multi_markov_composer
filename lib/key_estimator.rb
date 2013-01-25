#!/usr/bin/env ruby

class KeyEstimator
  PITCH_CLASSES = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
  CHORD_TYPES   = ["Maj","Min"]
  CHORDS        = PITCH_CLASSES.map { |pitch_class| CHORD_TYPES.map { |chord_type| pitch_class + " " + chord_type } }.flatten
  
  def initialize
    @hmm = HMM::Classifier.new
    @hmm.o_lex = PITCH_CLASSES
    @hmm.q_lex = CHORDS
    @hmm.a     = $key_estimator_hmm_a
    @hmm.b     = $key_estimator_hmm_b
    @hmm.pi    = $key_estimator_hmm_pi
  end

  def key(notes, show_details=false)
    max_likelihood = -1e9
    likeliest_chord_pitch_class = nil
    cur_key_pitch_class = MusicIR::PitchClass.from_s("C")
    0.upto(11) do |transpose_steps| 
      pitch_classes = KeyEstimator.notes_to_transposed_pitch_classes(notes, transpose_steps)
      pitch_class_strings = pitch_classes.map{ |pc| pc.to_s(use_flats=false) } # convert using sharps, not flats
      pitch_class_indices = pitch_class_strings.map{ |str| PITCH_CLASSES.index(str) }

      inferred_chord_strings = @hmm.decode(pitch_class_strings)
      inferred_chord_indices = inferred_chord_strings.map{ |chord_str| CHORDS.index(chord_str) }

      chord_prior_probs = inferred_chord_indices.map{ |chord_idx| @hmm.pi[chord_idx] }

      likelihood = @hmm.likelihood(pitch_class_strings) * 10**(notes.length)
      likelihood *= chord_prior_probs.inject(:*)
      if likelihood > max_likelihood
        max_likelihood = likelihood
        likeliest_chord_pitch_class = cur_key_pitch_class
      end

      if show_details
        chord_trans_probs = [0.0]
        chord_trans_probs += inferred_chord_indices.each_cons(2).map{ |pair| hmm.a[pair[0], pair[1]] }
        note_observ_probs = inferred_chord_indices.zip(pitch_class_indices).map{ |x| hmm.b[x[0], x[1]] }
  
        puts "\n#{cur_key_pitch_class} -> "
        puts pitch_class_strings.join("\t")
        puts note_observ_probs.map{ |x| sprintf("%5.3f", x) }.join("\t")
        puts inferred_chord_strings.join("\t")
        puts chord_trans_probs.map{ |x| sprintf("%5.3f", x) }.join("\t")
        puts chord_prior_probs.map{ |x| sprintf("%5.3f", x) }.join("\t")
        puts "likelihood -> #{likelihood}"
      end

      cur_key_pitch_class = MusicIR::PitchClass.new((cur_key_pitch_class.val+1)%12)
    end

    likeliest_chord_pitch_class
  end

  def self.notes_to_transposed_pitch_classes(notes, steps_down)
    notes.map do |note| 
      pc = MusicIR::PitchClass.from_pitch(note.pitch)  # raw PC
      pc = MusicIR::PitchClass.new( (pc.val+12-steps_down) % 12 ) # transpose down by a # of steps
    end
  end
end

