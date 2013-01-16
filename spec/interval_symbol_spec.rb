#!/usr/bin/env ruby

require 'spec_helper'

describe Music::IntervalSymbol do
  before do
  end

  context "new" do
    it "should take an integer from 0 to 254" do
      Music::IntervalSymbol.new(0).should be_an_instance_of Music::IntervalSymbol
    end
    it "should take an integer from 0 to 254" do
      Music::IntervalSymbol.new(254).should be_an_instance_of Music::IntervalSymbol
    end
    it "raise an error on integers < 0" do
      expect { Music::IntervalSymbol.new(-1) }.to raise_error(ArgumentError)
    end
    it "raise an error on integers > 255" do
      expect { Music::IntervalSymbol.new(255) }.to raise_error(ArgumentError)
    end
  end

  context "to_object" do
    it "should return a Interval" do
      p = Music::IntervalSymbol.new(0)
      p.to_object.should be_an_instance_of Music::Interval
    end
    it "should return a Interval whose value corresponds to the IntervalSymbol's value" do
      p = Music::IntervalSymbol.new(0)
      p.to_object.val.should equal -127
    end
    it "should perform the inverse of Interval.to_symbol" do
      p = Music::IntervalSymbol.new(0)
      p.to_object.to_symbol.val.should == 0
    end
    it "should perform the inverse of Interval.to_symbol" do
      p = Music::IntervalSymbol.new(254)
      p.to_object.to_symbol.val.should == 254
    end
  end

  context "val" do
    it "should get the value of the interval" do
      p = Music::IntervalSymbol.new(10)
      p.val.should equal 10
    end
  end

  context "set_val" do
    it "should set the value of the interval" do
      p = Music::IntervalSymbol.new(10)
      p.set_val(5)
      p.val.should equal 5
    end
  end
end
