#!/usr/bin/env ruby

module MusicIR
  class NoteQueue
    attr_reader :key

    PITCH_CLASS_STRINGS = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    CHORD_TYPES         = [:major, :minor]
    CHORDS              = PITCH_CLASS_STRINGS.map { |pc_str| CHORD_TYPES.map { |ct| Chord.new(PitchClass.from_s(pc_str), ct) } }.flatten
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
          likeliest_chords = inferred_chords
        end
  
        cur_key_pitch_class = PitchClass.new((cur_key_pitch_class.val+1)%12)
      end
  
      @key = Chord.new(likeliest_key_pitch_class, :major) #FIXME ... or minor?

      self.each_with_index do |note, idx|
        note.analysis[:implied_chord] = likeliest_chords[idx]
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

