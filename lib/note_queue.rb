#!/usr/bin/env ruby

module MusicIR
  class NoteQueue
    PITCH_CLASS_STRINGS = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    CHORD_MODES         = [:major, :minor]
    CHORDS              = PITCH_CLASS_STRINGS.map { |pc_str| CHORD_MODES.map { |ct| Chord.new(PitchClass.from_s(pc_str), ct) } }.flatten
    CHORD_STRINGS       = CHORDS.map{ |chord| chord.to_s }

    @@hmm = nil
  
    def analyze_harmony!
      max_likelihood = nil
      likeliest_key_pitch_class = nil
      likeliest_chords = nil

      cur_key_pitch_class = PitchClass.from_s("C")
      0.upto(11) do |transpose_steps| 
        pitch_classes = transposed_pitch_classes(transpose_steps)

        pitch_class_strings = pitch_classes.map{ |pc| pc.to_s(use_flats=false) } # convert using sharps, not flats
        pitch_class_indices = pitch_class_strings.map{ |str| PITCH_CLASS_STRINGS.index(str) }
  
        inferred_chord_strings = hmm.decode(pitch_class_strings)
        inferred_chord_indices = inferred_chord_strings.map{ |chord_str| CHORD_STRINGS.index(chord_str) }
        inferred_chords        = inferred_chord_indices.map{ |chord_idx| CHORDS[chord_idx] }
  
        likelihood = hmm.likelihood(pitch_class_strings) * 10**(self.length)
        chord_prior_probs = inferred_chord_indices.map{ |chord_idx| hmm.pi[chord_idx] }
        likelihood *= chord_prior_probs.inject(:*)

        if (!max_likelihood) || (likelihood > max_likelihood)
          max_likelihood = likelihood
          likeliest_key_pitch_class = cur_key_pitch_class
          likeliest_chords = inferred_chords.map do |chord|
            Chord.new(MusicIR::PitchClass.new((chord.pitch_class.val+transpose_steps)%12), chord.mode)
          end
        end
  
        cur_key_pitch_class = PitchClass.new((cur_key_pitch_class.val+1)%12)
      end
  
      tonic_chords = likeliest_chords.select{ |chord| chord.pitch_class.val==likeliest_key_pitch_class.val }
      major_tonic_count = tonic_chords.select{ |chord| chord.mode==:major }.length
      minor_tonic_count = tonic_chords.select{ |chord| chord.mode==:minor }.length
      key_chord_mode = (major_tonic_count >= minor_tonic_count) ? :major : :minor

      self.each_with_index do |note, idx|
        note.analysis[:key]   = Chord.new(likeliest_key_pitch_class, key_chord_mode)
        note.analysis[:chord] = likeliest_chords[idx]
      end
    end
     
  private

    def hmm
      if !@@hmm
        @@hmm = HMM::Classifier.new
        @@hmm.o_lex = PITCH_CLASS_STRINGS
        @@hmm.q_lex = CHORD_STRINGS
        @@hmm.a     = $key_estimator_hmm_a
        @@hmm.b     = $key_estimator_hmm_b
        @@hmm.pi    = $key_estimator_hmm_pi
      end
      return @@hmm
    end
 
    def transposed_pitch_classes(steps_down)
      self.map do |note| 
        PitchClass.new( ( PitchClass.from_pitch(note.pitch).val+12-steps_down) % 12 ) # transpose down by a # of steps
      end
    end
  end
end

