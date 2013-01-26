#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::NoteQueue do
  describe ".analyze_harmony!" do
    before(:all) do
      vector = $fake_sensor_vectors.values[5]
      #puts "File:"+ $fake_sensor_vectors.keys[5] ## Expect this to be "./jsbach_chorales/013606b_.mid"
      event_queue = MusicIR::EventQueue.new
      vector[:events].each { |e| event_queue.enqueue e } 
      @notes = MusicIR::NoteQueue.from_event_queue(event_queue)
      @notes.analyze_harmony!
    end

    subject { @notes }

    it "should set a key for each note" do
      subject.all?{ |note| note.analysis[:key].class == Chord }.should be_true
    end

    it "should set the right key for the first  note" do
      subject.first.analysis[:key].to_s.should == "Dmajor"
    end

    it "should set a harmonic context for each note" do
      subject.all?{ |note| note.analysis[:chord].class == Chord }.should be_true
    end

    it "should set the right chord for the first note" do
      subject.first.analysis[:chord].to_s.should == "Bminor"
    end
  end
end
