#!/usr/bin/ruby env

require 'spec_helper'

describe DurationGenerator do
  before(:each) do
    m = Music::Meter.new(3, 4, 1)

    @notes = Music::NoteQueue.new

    n = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
    n.analysis[:beat_position] = m.initial_beat_position
    @notes.push n

    n = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(2))
    n.analysis[:beat_position] = @notes.first.analysis[:beat_position] + @notes.first.duration
    @notes.push n

    @notes.analyze!
  end

  context ".get_critics" do
    it "should return an array containing critics" do
      pg = PitchGenerator.new
      critics = pg.get_critics
      critics.should be_an_instance_of Array
    end
    it "should return an array containing critics" do
      pg = PitchGenerator.new
      critics = pg.get_critics
      critics.each do |critic|
        #critic.should be_a_kind_of Critic
        pending
      end
    end
  end

  context ".reset" do
    it "should cause the next duration (the first in a seq) to be an observed starting duration" do
      dg = DurationGenerator.new
      critics = dg.get_critics
      critics.each do |critic|
        @notes.each do |note|
          critic.listen note 
        end
      end
      dg.reset
      dg.generate.val.should == 1
    end
  end

  context ".generate" do
    it "should return a duration" do
      dg = DurationGenerator.new
      critics = dg.get_critics
      critics.each do |critic|
        @notes.each do |note|
          critic.listen note 
        end
      end
      dg.reset
      dg.generate.should be_an_instance_of Music::Duration
    end
  end
end
