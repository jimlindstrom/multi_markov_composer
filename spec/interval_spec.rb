#!/usr/bin/env ruby

require 'spec_helper'

describe MusicIR::Interval do

  context "to_symbol" do
    it "should return a IntervalSymbol" do
      p = MusicIR::Interval.new(0)
      p.to_symbol.should be_an_instance_of Fixnum
    end
    it "should return a IntervalSymbol whose value corresponds to the Interval's value" do
      p = MusicIR::Interval.new(10)
      p.to_symbol.should equal 10
    end
    it "should perform the inverse of IntervalSymbol.to_object" do
      p = MusicIR::Interval.new(127)
      MusicIR::Interval.from_symbol(p.to_symbol).val.should == 127
    end
    it "should perform the inverse of IntervalSymbol.to_object" do
      p = MusicIR::Interval.new(-127)
      MusicIR::Interval.from_symbol(p.to_symbol).val.should == -127
    end
  end

end
