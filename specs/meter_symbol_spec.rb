#!/usr/bin/env ruby 

require 'spec_helper'

describe Music::MeterSymbol do
  before do
  end

  context "new" do
    it "should take an integer from 0 to 44" do
      Music::MeterSymbol.new(0).should be_an_instance_of Music::MeterSymbol
    end
    it "should take an integer from 0 to 44" do
      Music::MeterSymbol.new(44).should be_an_instance_of Music::MeterSymbol
    end
    it "raise an error on integers < 0" do
      expect { Music::MeterSymbol.new(-1) }.to raise_error(ArgumentError)
    end
    it "raise an error on integers > 44" do
      expect { Music::MeterSymbol.new(45) }.to raise_error(ArgumentError)
    end
  end

  context "to_object" do
    it "should return a Meter" do
      m = Music::MeterSymbol.new(0)
      m.to_object.should be_an_instance_of Music::Meter
    end
    it "should return a Meter whose value corresponds to the MeterSymbol's value" do
      m = Music::MeterSymbol.new(0)
      m.to_object.beats_per_measure.should equal 2
      m.to_object.beat_unit.should equal 2
      m.to_object.subbeats_per_beat.should equal 1
    end
  end

  context "val" do
    it "should get the value of the meter" do
      m = Music::MeterSymbol.new(10)
      m.val.should equal 10
    end
  end

  context "set_val" do
    it "should set the value of the meter" do
      m = Music::MeterSymbol.new(10)
      m.set_val(5)
      m.val.should equal 5
    end
  end
end
