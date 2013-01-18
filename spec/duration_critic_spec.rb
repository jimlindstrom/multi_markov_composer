#!/usr/bin/env ruby 

require 'spec_helper'

describe DurationCritic do
  it_should_behave_like "a critic", DurationCritic, [order=1], "data/test/duration_critic_#{order}.yml"

  context ".reset" do
    it "should reset to the state in which no notes have been heard yet" do
      order = 1
      dc = DurationCritic.new(order)
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)))
      dc.reset
      x = dc.get_expectations
      MusicIR::Duration.new(x.sample).val.should == 1
    end
  end

  context ".listen" do
  end

  context ".information_content" do
  end

  context ".get_expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      order = 1
      dc = DurationCritic.new(order)
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)))
      dc.reset
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)))
      dc.reset
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(0)))
      dc.reset
      x = dc.get_expectations
      x.information_content_for(1).should be < x.information_content_for(0)
    end
    it "returns a random variable that only chooses states observed" do
      order = 1
      dc = DurationCritic.new(order)
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)))
      dc.reset
      x = dc.get_expectations
      MusicIR::Duration.new(x.sample).val.should == 1
    end
    it "returns a random variable that only chooses states observed (higher order)" do
      order = 3
      dc = DurationCritic.new(order)
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(2)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(3)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(6)))
      dc.reset
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(5)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(2)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(3)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(4)))
      dc.reset
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(5)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(2)))
      dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(3)))
      x = dc.get_expectations
      MusicIR::Duration.new(x.sample).val.should == 4
    end
  end


end
