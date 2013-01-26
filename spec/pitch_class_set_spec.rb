require 'spec_helper'

describe MusicIR::PitchClassSet do
  let(:pcs) { MusicIR::PitchClassSet.new }
  before do
    pcs.add(MusicIR::PitchClass.new(3))
    pcs.add(MusicIR::PitchClass.new(1))
    pcs.add(MusicIR::PitchClass.new(8))
    pcs.add(MusicIR::PitchClass.new(11))
    pcs.add(MusicIR::PitchClass.new(0))
  end

  describe ".to_symbol" do
    subject { pcs.to_symbol } 

    it { should be_a Fixnum }
  end

  describe "#from_symbol" do
    subject { MusicIR::PitchClassSet.from_symbol(pcs.to_symbol) }

    it { should be_a MusicIR::PitchClassSet }
    its(:vals) { should == pcs.vals }
  end

  describe "#alphabet" do
    subject { MusicIR::PitchClassSet.alphabet }

    it { should be_a Markov::LiteralAlphabet }
  end
end
