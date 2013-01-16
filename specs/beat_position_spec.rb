# beat_position_spec.rb

require 'spec_helper'

describe Music::BeatPosition do

  before(:each) do
  end

  context "to_symbol" do
    it "should return a BeatPositionSymbol" do
      b = Music::BeatPosition.new
      b.measure = 0
      b.beat    = 2
      b.subbeat = 3
      b.beats_per_measure = 4
      b.subbeats_per_beat = 1
      b.to_symbol.should be_an_instance_of Music::BeatPositionSymbol
    end
    it "should return a BeatPositionSymbol whose value corresponds to the BeatPosition's value" do
      b = Music::BeatPosition.new
      b.measure = 0
      b.beat    = 2
      b.subbeat = 3
      b.beats_per_measure = 4
      b.subbeats_per_beat = 1

      keys = [:beat, :beats_per_measure, :subbeat, :subbeats_per_beat]
      obj1 = b
      h1   = Hash[*keys.zip(keys.map{ |x| obj1.send(x.to_s) }).flatten]

      keys = [:beat, :beats_per_measure, :subbeat, :subbeats_per_beat]
      obj2 = b.to_symbol.to_object
      h2   = Hash[*keys.zip(keys.map{ |x| obj2.send(x.to_s) }).flatten]

      h1.should == h2
    end
  end

end
