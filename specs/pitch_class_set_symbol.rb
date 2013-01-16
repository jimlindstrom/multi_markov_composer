#!/usr/bin/env ruby 

require 'spec_helper'

describe Music::PitchClassSetSymbol do
  before do
  end

  context "new" do
    it "should take an integer from 0 to 4095" do
      Music::PitchClassSetSymbol.new(0).should be_an_instance_of Music::PitchClassSetSymbol
    end
    it "should take an integer from 0 to 4095" do
      Music::PitchClassSetSymbol.new(4095).should be_an_instance_of Music::PitchClassSetSymbol
    end
    it "raise an error on integers < 0" do
      expect { Music::PitchClassSetSymbol.new(-1) }.to raise_error(ArgumentError)
    end
    it "raise an error on integers > 4095" do
      expect { Music::PitchClassSetSymbol.new(4096) }.to raise_error(ArgumentError)
    end
  end

  context "to_object" do
    it "should return a PitchClassSet" do
      pcss = Music::PitchClassSetSymbol.new(0)
      pcss.to_object.should be_an_instance_of Music::PitchClassSet
    end
    it "should return a PitchClassSet whose value corresponds to the PitchClassSetSymbol's value" do
      pcss = Music::PitchClassSetSymbol.new(102)
      pcss.to_object.to_symbol.val.should == pcss.val
    end
  end

  context "val" do
    it "should get the value of the beat_position" do
      pcss = Music::PitchClassSetSymbol.new(10)
      pcss.val.should == 10
    end
  end

  context "set_val" do
    it "should set the value of the beat_position" do
      pcss = Music::PitchClassSetSymbol.new(10)
      pcss.set_val(5)
      pcss.val.should == 5
    end
  end
end
