#!/usr/bin/env ruby

module MusicIR

  class PitchAndPitchClassSet
    attr_accessor :pitch, :pitch_class_set
  
    def self.num_values
      return Pitch.num_values * PitchClassSet.num_values
    end
  
    def initialize(pitch, pcs)
      @pitch           = pitch
      @pitch_class_set = pcs
    end
  
    def to_symbol
      v  = @pitch.to_symbol
  
      v *= PitchClassSet.num_values
      v += @pitch_class_set.to_symbol.val
  
      return v
    end

    def self.from_symbol(sym)
      pcss = (@val % PitchClassSet.num_values)
      ps   = (@val / PitchClassSet.num_values).floor
      PitchAndPitchClassSet.new(ps, pcss)
    end

    def self.alphabet
      Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
    end
  end
 
end

