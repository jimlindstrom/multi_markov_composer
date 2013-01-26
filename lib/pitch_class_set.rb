module MusicIR
  class PitchClassSet

    POWERS_OF_2 = (0..11).map{ |x| 2**x }
  
    def to_symbol
      sym = 0
      0.upto(11).each do |i|
        sym += POWERS_OF_2[i] if @vals.include?(i)
      end
  
      return sym
    end
 
    def self.from_symbol(sym)
      b = PitchClassSet.new

      v = sym
      11.downto(0).each do |i|
        if v >= POWERS_OF_2[i]
          v -= POWERS_OF_2[i]
          b.add(PitchClass.new(i))
        end
      end
  
      return b
    end

    def self.alphabet
      @@alphabet ||= Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
    end
  end
end
