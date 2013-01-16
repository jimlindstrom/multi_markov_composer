#!/usr/bin/env ruby 

require 'spec_helper'

describe MidiSensor, :midi_tests => true do

  before :each do
    MusicIR::Loopback.create

    clock = MusicIR::Clock.new(0)
    @sensor = MidiSensor.new("VirMIDI 1-1", clock)
    @sensor.set_stimulus_timeout(1.0)

    @expected_num_responses = 1

    Thread.abort_on_exception = true
    @outport = MusicIR::OutPort.new("VirMIDI 1-0")
    @thread_id = Thread.new do
      @expected_num_responses.times do |stimulus_idx|
        sleep 0.25

        puts "Writing stimulus # #{stimulus_idx}"
        notes_in_stimulus=30
        notes_in_stimulus.times do 
          @event = MusicIR::NoteOnEvent.new({  :pitch=>100, :velocity=>100, :timestamp=>0})
          @outport.write(@event) if !@outport.nil?
          sleep 0.1
          @event = MusicIR::NoteOffEvent.new({ :pitch=>100, :velocity=>100, :timestamp=>0})
          @outport.write(@event) if !@outport.nil?
          sleep 0.1
        end
      end
    end
  end
  
  after(:each) do
    @outport.close if !@outport.nil?
    @outport = nil if !@outport.nil?
    Thread.kill(@thread_id)

    @sensor.close

    MusicIR::Loopback.destroy
  end

  it_should_behave_like "a sensor" do
    let(:sensor) {@sensor}
    let(:expected_num_responses) {@expected_num_responses}
  end

end

