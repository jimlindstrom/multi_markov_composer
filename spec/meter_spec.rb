#!/usr/bin/env ruby 

require 'spec_helper'

describe Music::Meter do
  context "to_symbol" do
    it "should return a MeterSymbol" do
      @beats_per_measure = 3 # 3/4 time
      @beat_unit         = 4
      @subbeats_per_beat = 2 # expressed in eight notes
      m = Music::Meter.new(@beats_per_measure, @beat_unit, @subbeats_per_beat)
      m.to_symbol.should be_an_instance_of Music::MeterSymbol
    end
    it "should return a MeterSymbol whose value corresponds to the Meter's value" do
      @beats_per_measure = 2 # 3/4 time
      @beat_unit         = 2
      @subbeats_per_beat = 1 # expressed in eight notes
      m = Music::Meter.new(@beats_per_measure, @beat_unit, @subbeats_per_beat)
      m.to_symbol.val.should equal 0
    end
  end

end
