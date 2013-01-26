#!/usr/bin/env ruby

module MusicIR
   
  class Duration
    def to_symbol
      return @val
    end

    def self.from_symbol(sym)
      Duration.new(sym)
    end

    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..(MusicIR::Duration.num_values-1)).to_a )
    end
  end

end

