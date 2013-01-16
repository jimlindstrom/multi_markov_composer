#!/usr/bin/env ruby

require 'spec_helper'

describe MusicIR::Interval do

  context "to_symbol" do
    it "should return a IntervalSymbol" do
      p = MusicIR::Interval.new(0)
      p.to_symbol.should be_an_instance_of MusicIR::IntervalSymbol
    end
    it "should return a IntervalSymbol whose value corresponds to the Interval's value" do
      p = MusicIR::Interval.new(10)
      p.to_symbol.val.should equal 137
    end
    it "should perform the inverse of IntervalSymbol.to_object" do
      p = MusicIR::Interval.new(127)
      p.to_symbol.to_object.val.should == 127
    end
    it "should perform the inverse of IntervalSymbol.to_object" do
      p = MusicIR::Interval.new(-127)
      p.to_symbol.to_object.val.should be -127
    end
  end

end
