#!/usr/bin/env ruby

module MusicIR
  class Chord
    MODE_TO_VAL = {:major=>0, :minor=>1}
    VAL_TO_MODE = {0=>:major, 1=>:minor}
  
    def to_symbol
      MODE_TO_VAL[@mode]*12 + @pitch_class.val
    end
  
    def self.from_symbol(sym)
      raise ArgumentError.new("symbol must be in 0..((2*12)-1)") if sym<0 || sym>=(2*12)
      pitch_class = MusicIR::PitchClass.new(sym % 12)
      mode = VAL_TO_MODE[(sym / 12).floor]
      Chord.new(pitch_class, mode)
    end
  
    def self.num_values
      2*12
    end
  
    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..((2*12)-1)).to_a )
    end
  end
end
