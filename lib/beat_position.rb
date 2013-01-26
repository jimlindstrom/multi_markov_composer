module MusicIR
  class BeatPosition
  
    def to_symbol
      validate
  
      sym  = @beat
  
      sym *= [0, 1, 2, 3].length
      sym += [0, 1, 2, 3].index(@subbeat)
  
      sym *= Array(2..6).length
      sym += Array(2..6).index(@beats_per_measure)
  
      sym *= [1, 2, 4].length
      sym += [1, 2, 4].index(@subbeats_per_beat)
  
      return sym
    end
  
    def self.from_symbol(sym)
      b = BeatPosition.new
  
      s = sym
      b.subbeats_per_beat = [1, 2, 4][s % [1, 2, 4].length]
      s = Float(s / [1, 2, 4].length).floor
  
      b.beats_per_measure = Array(2..6)[s % Array(2..6).length]
      s = Float(s / Array(2..6).length).floor
  
      b.subbeat = [0, 1, 2, 3][s % [0, 1, 2, 3].length]
      s = Float(s / [0, 1, 2, 3].length).floor
      
      b.beat = Array(0..5)[s % Array(0..5).length]
  
      return b
    end

    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
    end
  end
end
