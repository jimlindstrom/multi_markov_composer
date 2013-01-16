# beat_position_spec.rb

require 'spec_helper'

describe MusicIR::PitchAndPitchClassSet do

  before(:each) do
    @pcs = MusicIR::PitchClassSet.new
    @pcs.add(MusicIR::Pitch.new(4))
    @pcs.add(MusicIR::Pitch.new(6))
    @pcs.add(MusicIR::Pitch.new(1))
    @pcs.add(MusicIR::Pitch.new(9))

    @p = MusicIR::Pitch.new(3)
  end

  context "num_values" do
    it "should return #{MusicIR::Pitch.num_values*MusicIR::PitchClassSet.num_values}" do
      MusicIR::PitchAndPitchClassSet.num_values.should == MusicIR::Pitch.num_values*MusicIR::PitchClassSet.num_values
    end
  end

  context "pitch_class_set" do
    it "should return whatever you set it to" do
      dbp = MusicIR::PitchAndPitchClassSet.new(@p, @pcs)
      dbp.pitch_class_set.vals.should == @pcs.vals
    end
  end

  context "pitch" do
    it "should return whatever you set it to" do
      dbp = MusicIR::PitchAndPitchClassSet.new(@p, @pcs)
      dbp.pitch.val.should == @p.val
    end
  end

end
