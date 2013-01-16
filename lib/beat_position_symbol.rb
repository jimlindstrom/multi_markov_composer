#!/usr/bin/env ruby

module Music
   
  class BeatPosition
  
    def to_symbol
      validate
  
      v  = @beat
  
      v *= [0, 1, 2, 3].length
      v += [0, 1, 2, 3].index(@subbeat)
  
      v *= Array(2..6).length
      v += Array(2..6).index(@beats_per_measure)
  
      v *= [1, 2, 4].length
      v += [1, 2, 4].index(@subbeats_per_beat)
  
      return BeatPositionSymbol.new(v)
    end
  
  end
 
  class BeatPositionSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value cannot be negative") if new_val < 0
      raise ArgumentError.new("value cannot be > 359") if new_val > 359
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      b = BeatPosition.new
  
      v = @val
      b.subbeats_per_beat = [1, 2, 4][v % [1, 2, 4].length]
      v = Float(v / [1, 2, 4].length).floor
  
      b.beats_per_measure = Array(2..6)[v % Array(2..6).length]
      v = Float(v / Array(2..6).length).floor
  
      b.subbeat = [0, 1, 2, 3][v % [0, 1, 2, 3].length]
      v = Float(v / [0, 1, 2, 3].length).floor
      
      b.beat = Array(0..5)[v % Array(0..5).length]
  
      return b
    end
  end

end
