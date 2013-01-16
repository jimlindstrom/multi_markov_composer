#!/usr/bin/env ruby

module Music
  
  class Interval
    def to_symbol
      return IntervalSymbol.new(@val+127)
    end
  end

  class IntervalSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value cannot be negative") if new_val < 0
      raise ArgumentError.new("value cannot be > 254") if new_val > 254
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      return Interval.new(@val-127)
    end
  end

end
