#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::Meter do
  let(:beats_per_measure) { 3 } # 3/4 time
  let(:beat_unit        ) { 4 }
  let(:subbeats_per_beat) { 2 } # expressed in eight notes

  describe ".to_symbol" do
    let(:meter) { MusicIR::Meter.new(beats_per_measure, beat_unit, subbeats_per_beat) }
    subject { meter.to_symbol }

    it { should be_an_instance_of(Fixnum) }
  end

  describe "#from_symbol" do
    let(:meter) { MusicIR::Meter.new(beats_per_measure, beat_unit, subbeats_per_beat) }
    subject { MusicIR::Meter.from_symbol(meter.to_symbol) }

    it { should be_an_instance_of(MusicIR::Meter) }
    it "should restore the values of the meter" do
      subject.beats_per_measure.should == beats_per_measure
      subject.beat_unit.should         == beat_unit
      subject.subbeats_per_beat.should == subbeats_per_beat
    end
  end

  describe "#alphabet" do
    subject { MusicIR::Meter.alphabet }
    it { should be_an_instance_of Markov::LiteralAlphabet }
  end
end
