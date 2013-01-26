module MusicIR
  class PitchAndPitchClassSet
    attr_accessor :pitch, :pitch_class_set
   
    def initialize(pitch, pcs)
      @pitch           = pitch
      @pitch_class_set = pcs
    end
  
    def to_symbol
      sym  = @pitch.to_symbol
  
      sym *= PitchClassSet.num_values
      sym += @pitch_class_set.to_symbol
  
      return sym
    end

    def self.from_symbol(sym)
      s = sym

      pcs_val = (s % PitchClassSet.num_values)
      pcs = MusicIR::PitchClassSet.from_symbol(pcs_val)
      s = (s / PitchClassSet.num_values).floor

      p_val = s
      pitch = MusicIR::Pitch.from_symbol(p_val)
      PitchAndPitchClassSet.new(pitch, pcs)
    end
 
    def self.num_values
      return Pitch.num_values * PitchClassSet.num_values
    end

    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
    end
  end
end

