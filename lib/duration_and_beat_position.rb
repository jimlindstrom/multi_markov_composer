#!/usr/bin/env ruby

module MusicIR
 
  class DurationAndBeatPosition
    def to_symbol
      v  = @duration.to_symbol
  
      v *= BeatPosition.num_values
      v += @beat_position.to_symbol
  
      v
    end
 
    def self.from_symbol(sym)
      s = sym
      bp = BeatPosition.from_symbol(s % BeatPosition.num_values)

      s = (s / BeatPosition.num_values).floor
      d  = Duration.new(s)

      DurationAndBeatPosition.new(d, bp)
    end

    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..(MusicIR::DurationAndBeatPosition.num_values-1)).to_a )
    end
  end

end

