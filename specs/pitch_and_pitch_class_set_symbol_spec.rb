#!/usr/bin/env ruby 

require 'spec_helper'

describe Music::PitchAndPitchClassSetSymbol do
  before do
  end

  context "new" do
    it "should take an integer from 0 to #{Music::PitchAndPitchClassSet.num_values-1}" do
      Music::PitchAndPitchClassSetSymbol.new(0).should be_an_instance_of Music::PitchAndPitchClassSetSymbol
    end
    it "should take an integer from 0 to #{}" do
      Music::PitchAndPitchClassSetSymbol.new(Music::PitchAndPitchClassSet.num_values-1).should be_an_instance_of Music::PitchAndPitchClassSetSymbol
    end
    it "raise an error on integers < 0" do
      expect { Music::PitchAndPitchClassSetSymbol.new(-1) }.to raise_error(ArgumentError)
    end
    it "raise an error on integers > 46079" do
      expect { Music::PitchAndPitchClassSetSymbol.new(Music::PitchAndPitchClassSet.num_values) }.to raise_error(ArgumentError)
    end
  end

  context "to_object" do
    it "should return a PitchAndPitchClassSet" do
      dbps = Music::PitchAndPitchClassSetSymbol.new(0)
      dbps.to_object.should be_an_instance_of Music::PitchAndPitchClassSet
    end
    it "should return a PitchAndPitchClassSet whose value corresponds to the PitchAndPitchClassSetSymbol's value" do
      dbps = Music::PitchAndPitchClassSetSymbol.new(21231)
      dbps.to_object.to_symbol.val.should == dbps.val
    end
  end

  context "val" do
    it "should get the value of the beat_position" do
      dbps = Music::PitchAndPitchClassSetSymbol.new(10)
      dbps.val.should == 10
    end
  end

  context "set_val" do
    it "should set the value of the beat_position" do
      dbps = Music::PitchAndPitchClassSetSymbol.new(10)
      dbps.set_val(5)
      dbps.val.should == 5
    end
  end
end
