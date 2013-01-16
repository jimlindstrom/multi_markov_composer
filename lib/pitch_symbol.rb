#!/usr/bin/env ruby

module Music
   
  class Pitch
    def to_symbol
      return PitchSymbol.new(@val)
    end
  end
 
  class PitchSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value cannot be negative") if new_val < 0
      raise ArgumentError.new("value cannot be > 127") if new_val > 127
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      return Pitch.new(@val)
    end
  end

end
