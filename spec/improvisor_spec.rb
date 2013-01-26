#!/usr/bin/env ruby 

require 'spec_helper'

describe Improvisor do
  before do
  end

  describe ".critics" do
    before(:all) do
      i = Improvisor.new
      @critics = i.critics
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

  describe ".generate" do
    before(:each) do
      m = MusicIR::Meter.new(4, 4, 1)
  
      @notes = MusicIR::NoteQueue.new
  
      n = MusicIR::Note.new(MusicIR::Pitch.new(100), MusicIR::Duration.new(1))
      n.analysis[:beat_position] = m.initial_beat_position
      @notes.push n
   
      n = MusicIR::Note.new(MusicIR::Pitch.new(102), MusicIR::Duration.new(2))
      n.analysis[:beat_position] = @notes.last.analysis[:beat_position] + @notes.last.duration
      @notes.push n

      n = MusicIR::Note.new(MusicIR::Pitch.new(104), MusicIR::Duration.new(4))
      n.analysis[:beat_position] = @notes.last.analysis[:beat_position] + @notes.last.duration
      @notes.push n

      @notes.analyze!
      @notes.analyze_harmony!

      @i = Improvisor.new
      critics = @i.critics
      critics.each do |critic|
        critic.reset!
        @notes.each do |note|
          critic.listen note
        end
        critic.reset!
      end
    end
    it "should return an array of notes" do
      response = @i.generate
      response.should be_an_instance_of MusicIR::NoteQueue
    end
  end
end
