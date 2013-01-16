#!/usr/bin/env ruby

module Music
   
  class Duration
    def to_symbol
      return DurationSymbol.new(@val)
    end
  end
 
  class DurationSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value (#{new_val}) cannot be negative") if new_val < 0
      raise ArgumentError.new("value (#{new_val}) cannot be > 127") if new_val > 127
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      return Duration.new(@val)
    end
  end

end

