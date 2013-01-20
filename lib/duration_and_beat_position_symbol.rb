#!/usr/bin/env ruby

module MusicIR
 
  class DurationAndBeatPosition
    def to_symbol
      v  = @duration.to_symbol
  
      v *= BeatPosition.num_values
      v += @beat_position.to_symbol.val
  
      v
    end
 
    def self.from_symbol(sym)
      bps = BeatPositionSymbol.new(sym % BeatPosition.num_values)
      d   = Duration.new((sym / BeatPosition.num_values).floor)
      DurationAndBeatPosition.new(d, bps.to_object)
    end

    def self.alphabet
      Markov::LiteralAlphabet.new( (0..(MusicIR::DurationAndBeatPosition.num_values-1)).to_a )
    end
  end

end

