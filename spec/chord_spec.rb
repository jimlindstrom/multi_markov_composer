require 'spec_helper'

describe Chord do

  before(:each) do
  end

  describe "#new" do
    context "given a valid pitch class and mode"do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :major }
      subject { Chord.new(pitch_class, mode) } 
      it { should be_an_instance_of Chord }
    end
  end

  describe ".to_symbol" do
    context "given a valid pitch class and mode" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :major }
      let(:chord) { Chord.new(pitch_class, mode) } 
      subject { chord.to_symbol }
      it { should be_an_instance_of Fixnum }
    end
  end

  describe "#from_symbol" do
    context "given a valid symbol" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :minor }
      let(:chord) { Chord.new(pitch_class, mode) } 
      let(:chord_symbol) { chord.to_symbol }
      subject { Chord.from_symbol(chord_symbol) }
      it { should be_an_instance_of Chord }
      it "should have the same pitch class value as the original chord" do
        subject.pitch_class.val.should ==  pitch_class.val
      end
      it "should have the same mode as the original chord" do
        subject.mode.should == mode
      end
    end
  end

  describe ".to_s" do
    context "given a valid pitch class and mode" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:mode) { :major }
      let(:chord) { Chord.new(pitch_class, mode) } 
      context "when use_flats == true or isn't specified" do
        subject { chord.to_s }
        it { should be_an_instance_of String }
        it { should == "Dbmajor" }
      end
      context "when use_flats == false" do
        subject { chord.to_s(use_flats=false) }
        it { should be_an_instance_of String }
        it { should == "C#major" }
      end
    end
  end

  describe ".num_values" do
    subject { Chord.num_values }
    it { should be_an_instance_of Fixnum }
    it { should be == (2*12) }
  end

  describe "#alphabet" do
    subject { Chord.alphabet }
    it { should be_an_instance_of Markov::LiteralAlphabet }
  end

end
