#!/usr/bin/env ruby 

require 'spec_helper'

describe Improvisor do
  before do
  end

  context ".get_critics" do
    before(:all) do
      i = Improvisor.new
      @critics = i.get_critics
    end
    it "should return an array containing critics" do
      @critics.should be_an_instance_of Array
    end
    it "should return an array containing critics" do
      @critics.each do |critic|
        #critic.should be_a_kind_of Critic
        pending
      end
    end
  end

  context ".generate" do
    before(:each) do
      m = Music::Meter.new(4, 4, 1)
  
      @notes = Music::NoteQueue.new
  
      n = Music::Note.new(Music::Pitch.new(100), Music::Duration.new(1))
      n.analysis[:beat_position] = m.initial_beat_position
      @notes.push n
   
      n = Music::Note.new(Music::Pitch.new(102), Music::Duration.new(2))
      n.analysis[:beat_position] = @notes.last.analysis[:beat_position] + @notes.last.duration
      @notes.push n

      n = Music::Note.new(Music::Pitch.new(104), Music::Duration.new(4))
      n.analysis[:beat_position] = @notes.last.analysis[:beat_position] + @notes.last.duration
      @notes.push n

      @notes.analyze!

      @i = Improvisor.new
      critics = @i.get_critics
      critics.each do |critic|
        critic.reset
        @notes.each do |note|
          critic.listen note
        end
      end
    end
    it "should return an array of notes" do
      response = @i.generate
      response.should be_an_instance_of Music::NoteQueue
    end
  end
end
