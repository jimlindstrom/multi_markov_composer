# beat_position_spec.rb

require 'spec_helper'

describe MusicIR::BeatPosition do
  let(:measure)           { 2 }
  let(:beat)              { 2 }
  let(:subbeat)           { 3 }
  let(:beats_per_measure) { 4 }
  let(:subbeats_per_beat) { 1 }
  let(:beat_pos)          { MusicIR::BeatPosition.new }
  before do
    beat_pos.measure           = measure
    beat_pos.beat              = beat
    beat_pos.subbeat           = subbeat
    beat_pos.beats_per_measure = beats_per_measure
    beat_pos.subbeats_per_beat = subbeats_per_beat
  end

  describe ".to_symbol" do
    subject { beat_pos.to_symbol }

    it { should be_a Fixnum }
  end

  describe "#from_symbol" do
    subject { MusicIR::BeatPosition.from_symbol(beat_pos.to_symbol) }

    it { should be_a MusicIR::BeatPosition }
    its(:measure)           { should be_nil } # FIXME: This is weird, and should probably be rethought.
    its(:beat)              { should == beat }
    its(:subbeat)           { should == subbeat }
    its(:beats_per_measure) { should == beats_per_measure }
    its(:subbeats_per_beat) { should == subbeats_per_beat }
  end

  describe "#alphabet" do
    subject { MusicIR::BeatPosition.alphabet }
    it { should be_a Markov::LiteralAlphabet }
  end
end
