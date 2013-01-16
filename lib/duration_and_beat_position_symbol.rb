#!/usr/bin/env ruby

module Music
 
  class DurationAndBeatPosition
    def to_symbol
      v  = @duration.to_symbol.val
  
      v *= BeatPosition.num_values
      v += @beat_position.to_symbol.val
  
      return DurationAndBeatPositionSymbol.new(v)
    end
  end
 
  class DurationAndBeatPositionSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value cannot be negative") if new_val < 0
      raise ArgumentError.new("value cannot be > 46079") if new_val > 46079
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      bps = BeatPositionSymbol.new(@val % BeatPosition.num_values)
      ds  = DurationSymbol.new((@val / BeatPosition.num_values).floor)
      dbp = DurationAndBeatPosition.new(ds.to_object, bps.to_object)
      return dbp
    end
  end

end

