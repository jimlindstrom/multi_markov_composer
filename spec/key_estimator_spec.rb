#!/usr/bin/env ruby 

require 'spec_helper'

describe KeyEstimator do
  describe ".new" do
    subject { KeyEstimator.new }
    it { should be_an_instance_of(KeyEstimator) }
  end

  describe ".key" do
    let(:key_estimator) { KeyEstimator.new }
    context "given an array of notes" do 
      before do
        vector = $fake_sensor_vectors.values[5]
        #puts "File:"+ $fake_sensor_vectors.keys[5] ## Expect this to be "./jsbach_chorales/013606b_.mid"
        event_queue = MusicIR::EventQueue.new
        vector[:events].each { |e| event_queue.enqueue e } 
        @notes = MusicIR::NoteQueue.from_event_queue(event_queue)
      end
    
      subject { key_estimator.key(@notes, show_details=false) }

      it { should be_an_instance_of(MusicIR::PitchClass) }
      its(:val) { should == MusicIR::PitchClass.from_s("D").val }  
    end
  end
end
