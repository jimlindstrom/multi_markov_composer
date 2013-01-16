# beat_position_spec.rb

require 'spec_helper'

describe Music::DurationAndBeatPosition do

  before(:each) do
    @bp = Music::BeatPosition.new
    @bp.measure = nil
    @bp.beat    = 2
    @bp.subbeat = 3
    @bp.beats_per_measure = 4
    @bp.subbeats_per_beat = 4

    @d = Music::Duration.new(3)
  end

  context "to_symbol" do
    it "should return a DurationAndBeatPositionSymbol" do
      dbp = Music::DurationAndBeatPosition.new(@d, @bp)
      dbp.to_symbol.should be_an_instance_of Music::DurationAndBeatPositionSymbol
    end
    it "should return a DurationAndBeatPositionSymbol whose duration corresponds to the DurationAndBeatPosition's duration" do
      dbp = Music::DurationAndBeatPosition.new(@d, @bp)
      dbp.to_symbol.to_object.duration.val.should == dbp.duration.val
    end
    it "should return a DurationAndBeatPositionSymbol whose beat position corresponds to the DurationAndBeatPosition's beat position" do
      dbp = Music::DurationAndBeatPosition.new(@d, @bp)
      dbp.to_symbol.to_object.beat_position.to_hash.should == dbp.beat_position.to_hash
    end
  end

end
