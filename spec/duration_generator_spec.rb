#!/usr/bin/ruby env

require 'spec_helper'

describe DurationGenerator do
  before(:each) do
    m = MusicIR::Meter.new(3, 4, 1)

    @notes = MusicIR::NoteQueue.new

    n = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
    n.analysis[:beat_position] = m.initial_beat_position
    @notes.push n

    n = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(2))
    n.analysis[:beat_position] = @notes.first.analysis[:beat_position] + @notes.first.duration
    @notes.push n

    @notes.analyze!
    @notes.analyze_harmony!
  end

  context ".critics" do
    it "should return an array containing critics" do
      pg = PitchGenerator.new
      critics = pg.critics
      critics.should be_an_instance_of Array
    end
    it "should return an array containing critics" do
      pg = PitchGenerator.new
      critics = pg.critics
      critics.each do |critic|
        #critic.should be_a_kind_of Critic
        pending
      end
    end
  end

  context ".reset!" do
    it "should cause the next duration (the first in a seq) to be an observed starting duration" do
      dg = DurationGenerator.new
      critics = dg.critics
      critics.each do |critic|
        @notes.each do |note|
          critic.listen note 
        end
      end
      dg.reset!
      dg.generate.val.should == 1
    end
  end

  context ".generate" do
    it "should return a duration" do
      dg = DurationGenerator.new
      critics = dg.critics
      critics.each do |critic|
        @notes.each do |note|
          critic.listen note 
        end
      end
      dg.reset!
      dg.generate.should be_an_instance_of MusicIR::Duration
    end
  end
end
