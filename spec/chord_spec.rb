require 'spec_helper'

describe Chord do

  before(:each) do
  end

  describe "#new" do
    context "given a valid pitch class and chord type"do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:chord_type)  { :major }
      subject { Chord.new(pitch_class, chord_type) } 
      it { should be_an_instance_of Chord }
    end
  end

  describe ".to_symbol" do
    context "given a valid pitch class and chord type" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:chord_type)  { :major }
      let(:chord) { Chord.new(pitch_class, chord_type) } 
      subject { chord.to_symbol }
      it { should be_an_instance_of Fixnum }
    end
  end

  describe "#from_symbol" do
    context "given a valid symbol" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:chord_type)  { :minor }
      let(:chord) { Chord.new(pitch_class, chord_type) } 
      let(:chord_symbol) { chord.to_symbol }
      subject { Chord.from_symbol(chord_symbol) }
      it { should be_an_instance_of Chord }
      it "should have the same pitch class value as the original chord" do
        subject.pc.val.should ==  pitch_class.val
      end
      it "should have the same chord type as the original chord" do
        subject.type.should == chord_type
      end
    end
  end

  describe ".to_s" do
    context "given a valid pitch class and chord type" do
      let(:pitch_class) { MusicIR::PitchClass.from_s("C#") }
      let(:chord_type)  { :major }
      let(:chord) { Chord.new(pitch_class, chord_type) } 
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
