#!/usr/bin/env ruby

require 'spec_helper'
	
describe NoteGenerator do
  before(:each) do
    m = MusicIR::Meter.new(3, 4, 1)

    @notes = MusicIR::NoteQueue.new

    n = MusicIR::Note.new(MusicIR::Pitch.new(50), MusicIR::Duration.new(1))
    n.analysis[:beat_position] = m.initial_beat_position
    n.analysis[:key]   = MusicIR::Chord.new(MusicIR::PitchClass.from_s("C"), :major)
    n.analysis[:chord] = MusicIR::Chord.new(MusicIR::PitchClass.from_s("G"), :major)
    @notes.push n

    n = MusicIR::Note.new(MusicIR::Pitch.new(55), MusicIR::Duration.new(2))
    n.analysis[:beat_position] = @notes.first.analysis[:beat_position] + @notes.first.duration
    n.analysis[:key]   = MusicIR::Chord.new(MusicIR::PitchClass.from_s("C"), :major)
    n.analysis[:chord] = MusicIR::Chord.new(MusicIR::PitchClass.from_s("G"), :major)
    @notes.push n

    @notes.analyze!
    @notes.analyze_harmony!
  end

  context ".critics" do
    before(:all) do
      ng = NoteGenerator.new
      @critics = ng.critics
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

  context ".reset!" do
    before(:each) do
      @ng = NoteGenerator.new
      critics = @ng.critics
      critics.each do |critic|
        @notes.each do |note|
          critic.listen note
        end
      end
    end
    it "should cause the next pitch (the first in a seq) to be an observed starting pitch" do
      @ng.reset!
      @ng.generate.pitch.val.should == 50
    end
    it "should cause the next duration (the first in a seq) to be an observed starting duration" do
      @ng.reset!
      @ng.generate.duration.val.should == 1
    end
  end

  context ".generate" do
    it "should return a note" do
      ng = NoteGenerator.new
      critics = ng.critics
      critics.each do |critic|
        @notes.each do |note|
          critic.listen note
        end
      end
      ng.reset!
      ng.generate.should be_an_instance_of MusicIR::Note
    end
  end
end
