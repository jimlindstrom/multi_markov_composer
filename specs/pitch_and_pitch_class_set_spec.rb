# beat_position_spec.rb

require 'spec_helper'

describe Music::PitchAndPitchClassSet do

  before(:each) do
    @pcs = Music::PitchClassSet.new
    @pcs.add(Music::Pitch.new(4))
    @pcs.add(Music::Pitch.new(6))
    @pcs.add(Music::Pitch.new(1))
    @pcs.add(Music::Pitch.new(9))

    @p = Music::Pitch.new(3)
  end

  context "num_values" do
    it "should return #{Music::Pitch.num_values*Music::PitchClassSet.num_values}" do
      Music::PitchAndPitchClassSet.num_values.should == Music::Pitch.num_values*Music::PitchClassSet.num_values
    end
  end

  context "pitch_class_set" do
    it "should return whatever you set it to" do
      dbp = Music::PitchAndPitchClassSet.new(@p, @pcs)
      dbp.pitch_class_set.vals.should == @pcs.vals
    end
  end

  context "pitch" do
    it "should return whatever you set it to" do
      dbp = Music::PitchAndPitchClassSet.new(@p, @pcs)
      dbp.pitch.val.should == @p.val
    end
  end

end
