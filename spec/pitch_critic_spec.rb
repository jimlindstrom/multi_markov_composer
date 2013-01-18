#!/usr/bin/env ruby

require 'spec_helper'

describe PitchCritic do

  it_should_behave_like "a critic", PitchCritic, [order=1], "data/test/pitch_critic_#{order}.yml"

  context ".reset" do
    it "should reset to the state in which no notes have been heard yet" do
      order = 1
      pc = PitchCritic.new(order)
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
      pc.reset
      x = pc.expectations
      MusicIR::Pitch.new(x.sample).val.should == 1
    end
  end

  context ".listen" do
    pending
  end

  context ".get_expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      order = 1
      pc = PitchCritic.new(order)
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
      pc.reset
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
      pc.reset
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(0)))
      pc.reset
      x = pc.get_expectations
      x.information_content_for(1).should be < x.information_content_for(0)
    end
    it "returns a random variable that only chooses states observed" do
      order = 1
      pc = PitchCritic.new(order)
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
      pc.reset
      x = pc.get_expectations
      MusicIR::Pitch.new(x.sample).val.should == 1
    end
    it "returns a random variable that only chooses states observed (higher order)" do
      order = 3
      pc = PitchCritic.new(order)
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(0)))
      pc.reset
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(4), MusicIR::Duration.new(0)))
      pc.reset
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(0)))
      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(0)))
      x = pc.get_expectations
      MusicIR::Pitch.new(x.sample).val.should == 4
    end
  end


end
