require 'spec_helper'

describe ModeAndChordAndPitchClass do
  let(:mode)        { :minor }
  let(:chord)       { Chord.new(MusicIR::PitchClass.from_s("F"), :major) }
  let(:pitch_class) { MusicIR::PitchClass.from_s("B") }

  describe "#new" do
    subject { ModeAndChordAndPitchClass.new(mode, chord, pitch_class) }
    it { should be_an_instance_of ModeAndChordAndPitchClass }
  end

  describe ".to_symbol" do
    subject { ModeAndChordAndPitchClass.new(mode, chord, pitch_class).to_symbol }
    it { should be_an_instance_of Fixnum }
    it { should be >= 0 }
    it { should be < ModeAndChordAndPitchClass.num_values }
  end

  describe "#from_symbol" do
    subject { ModeAndChordAndPitchClass.from_symbol(ModeAndChordAndPitchClass.new(mode, chord, pitch_class).to_symbol) }
    its(:mode) { should == mode }
    it "should have the same chord" do
      subject.chord.to_s.should == chord.to_s
    end
    it "should have the same pitch_class" do
      subject.pitch_class.to_s.should == pitch_class.to_s
    end
  end

  describe "#num_values" do
    subject { ModeAndChordAndPitchClass.num_values }
    it { should == (Chord::TYPES.length * Chord.num_values * MusicIR::PitchClass.num_values) }
  end

  describe "#alphabet" do
    subject { ModeAndChordAndPitchClass.alphabet }
    it { should be_an_instance_of Markov::LiteralAlphabet }
  end
end

