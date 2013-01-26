#!/usr/bin/env ruby

module MusicIR
   
  class Meter
    def to_symbol
      sym  = Array(2..6).index(@beats_per_measure) 
      sym *= [2, 4, 8].length
      sym += [2, 4, 8].index(@beat_unit)
      sym *= [1, 2, 4].length
      sym += [1, 2, 4].index(@subbeats_per_beat)
      return sym
    end
  
    def self.from_symbol(sym)
      s = sym
  
      subbeats_per_beat = [1, 2, 4][s % [1, 2, 4].length]
      s = Float(s / [1, 2, 4].length).floor
  
      beat_unit = [2, 4, 8][s % [2, 4, 8].length]
      s = Float(s / [2, 4, 8].length).floor
  
      beats_per_measure = Array(2..6)[s % Array(2..6).length]
  
      return Meter.new(beats_per_measure, beat_unit, subbeats_per_beat)
    end

    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
    end
  end

end

