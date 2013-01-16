#!/usr/bin/env ruby

module Music

  class PitchAndPitchClassSet
    attr_accessor :pitch, :pitch_class_set
  
    def self.num_values
      return Pitch.num_values * PitchClassSet.num_values
    end
  
    def initialize(pitch, pcs)
      @pitch           = pitch
      @pitch_class_set = pcs
    end
  
    def to_symbol
      v  = @pitch.to_symbol.val
  
      v *= PitchClassSet.num_values
      v += @pitch_class_set.to_symbol.val
  
      return PitchAndPitchClassSetSymbol.new(v)
    end
  end
 
  class PitchAndPitchClassSetSymbol
    def initialize(new_val)
      set_val(new_val)
    end
  
    def set_val(new_val)
      raise ArgumentError.new("value cannot be negative") if new_val < 0
      raise ArgumentError.new("value cannot be >= #{PitchAndPitchClassSet.num_values}") if new_val >= PitchAndPitchClassSet.num_values
  
      @val = new_val
    end
  
    def val
      return @val
    end
  
    def to_object
      pcss = PitchClassSetSymbol.new(@val % PitchClassSet.num_values)
      ps   = PitchSymbol.new((@val / PitchClassSet.num_values).floor)
      ppcs = PitchAndPitchClassSet.new(ps.to_object, pcss.to_object)
      return ppcs
    end
  end

end

