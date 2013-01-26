require 'spec_helper'

describe MusicIR::Chord do

  before(:each) do
  end

  describe ".to_symbol" do
    context "given a valid pitch class and mode" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :major }
      let(:chord) { MusicIR::Chord.new(pitch_class, mode) } 
      subject { chord.to_symbol }
      it { should be_an_instance_of Fixnum }
    end
  end

  describe "#from_symbol" do
    context "given a valid symbol" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :minor }
      let(:chord) { MusicIR::Chord.new(pitch_class, mode) } 
      let(:chord_symbol) { chord.to_symbol }
      subject { MusicIR::Chord.from_symbol(chord_symbol) }
      it { should be_an_instance_of MusicIR::Chord }
      it "should have the same pitch class value as the original chord" do
        subject.pitch_class.val.should ==  pitch_class.val
      end
      it "should have the same mode as the original chord" do
        subject.mode.should == mode
      end
    end
  end

  describe ".num_values" do
    subject { MusicIR::Chord.num_values }
    it { should be_an_instance_of Fixnum }
    it { should be == (2*12) }
  end

  describe "#alphabet" do
    subject { MusicIR::Chord.alphabet }
    it { should be_an_instance_of Markov::LiteralAlphabet }
  end

end
