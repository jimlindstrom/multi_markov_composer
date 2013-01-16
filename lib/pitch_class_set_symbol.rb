#!/usr/bin/env ruby

module Music
   
  class PitchClassSet
  
    def to_symbol
      v = 0
      0.upto(11).each do |i|
        v += 2**i if @vals.include?(i)
      end
  
      return PitchClassSetSymbol.new(v)
    end
  
  end
 
  class PitchClassSetSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value cannot be negative") if new_val < 0
      raise ArgumentError.new("value cannot be > 4095") if new_val > 4095
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      b = PitchClassSet.new

      v = val
      11.downto(0).each do |i|
        pow2 = 2**i
        if v >= pow2
          v -= pow2
          b.add(PitchClass.new(i))
        end
      end
  
      return b
    end
  end

end
