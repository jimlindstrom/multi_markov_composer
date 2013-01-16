#!/usr/bin/env ruby

require 'spec_helper'

describe PitchCritic do

  it_should_behave_like "a critic", PitchCritic, [order=1], "data/test/pitch_critic_#{order}.yml"

  context ".reset" do
    it "should reset to the state in which no notes have been heard yet" do
      order = 1
      pc = PitchCritic.new(order)
      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
      pc.reset
      x = pc.get_expectations
      Music::Pitch.new(x.choose_outcome).val.should == 1
    end
  end

  context ".listen" do
    pending
  end

  context ".get_expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      order = 1
      pc = PitchCritic.new(order)
      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
      pc.reset
      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
      pc.reset
      pc.listen(Music::Note.new(Music::Pitch.new(0), Music::Duration.new(0)))
      pc.reset
      x = pc.get_expectations
      x.information_content(1).should be < x.information_content(0)
    end
    it "returns a random variable that only chooses states observed" do
      order = 1
      pc = PitchCritic.new(order)
      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
      pc.reset
      x = pc.get_expectations
      Music::Pitch.new(x.choose_outcome).val.should == 1
    end
    it "returns a random variable that only chooses states observed (higher order)" do
      order = 3
      pc = PitchCritic.new(order)
      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(2), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(3), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(6), Music::Duration.new(0)))
      pc.reset
      pc.listen(Music::Note.new(Music::Pitch.new(5), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(2), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(3), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(4), Music::Duration.new(0)))
      pc.reset
      pc.listen(Music::Note.new(Music::Pitch.new(5), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(2), Music::Duration.new(0)))
      pc.listen(Music::Note.new(Music::Pitch.new(3), Music::Duration.new(0)))
      x = pc.get_expectations
      Music::Pitch.new(x.choose_outcome).val.should == 4
    end
  end


end
