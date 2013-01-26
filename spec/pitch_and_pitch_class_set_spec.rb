require 'spec_helper'

describe MusicIR::PitchAndPitchClassSet do
  let(:pitch) { MusicIR::Pitch.new(3) }
  let(:pcs)   { MusicIR::PitchClassSet.new }
  before do
    pcs.add(MusicIR::PitchClass.new(4))
    pcs.add(MusicIR::PitchClass.new(6))
    pcs.add(MusicIR::PitchClass.new(1))
    pcs.add(MusicIR::PitchClass.new(9))
  end
  let(:papcs) { MusicIR::PitchAndPitchClassSet.new(pitch, pcs) }

  describe "#new" do
    subject { papcs }
    it { should be_a MusicIR::PitchAndPitchClassSet }
    its(:pitch) { should == pitch }
    its(:pitch_class_set) { should == pcs }
  end

  describe ".to_symbol" do
    subject { papcs.to_symbol }
    it { should be_a Fixnum }
  end

  describe "#from_symbol" do
    subject { MusicIR::PitchAndPitchClassSet.from_symbol(papcs.to_symbol) }
    it { should be_a MusicIR::PitchAndPitchClassSet }
    it "should restore a pitch with the same value" do
      subject.pitch.val.should == papcs.pitch.val
    end
    it "should restore a pitch class set with the same values" do
      subject.pitch_class_set.vals.should == papcs.pitch_class_set.vals
    end
  end

  describe "#num_values" do
    subject { MusicIR::PitchAndPitchClassSet.num_values }
    it { should == (MusicIR::Pitch.num_values * MusicIR::PitchClassSet.num_values) }
  end

  describe "#alphabet" do
    subject { MusicIR::PitchAndPitchClassSet.alphabet }
    it { should be_a Markov::LiteralAlphabet }
  end

end
