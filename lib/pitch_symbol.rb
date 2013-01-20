#!/usr/bin/env ruby

module MusicIR
   
  class Pitch
    def to_symbol
      return @val
    end

    def self.from_symbol(sym)
      Pitch.new(sym)
    end

    def self.alphabet
      Markov::LiteralAlphabet.new( (0..127).to_a )
    end
  end

end
