#!/usr/bin/env ruby

module MusicIR
  
  class Interval
    def to_symbol
      return @val
    end

    def self.from_symbol(s)
      Interval.new(s)
    end

    def self.alphabet
      Markov::LiteralAlphabet.new( (-127..127).to_a )
    end
  end

end
