#!/usr/bin/env ruby 

require 'spec_helper'

describe MidiPerformer, :midi_tests => true do
  before(:each) do
    Midi::Loopback.create

    @performer   = MidiPerformer.new("VirMIDI 1-0")

    @event_queue = Midi::EventQueue.new
    vector = $fake_sensor_vectors["mary had a little lamb (phrase 1)"]
    vector[:events].each do |e|
      @event_queue.enqueue e
    end
  end

  after(:each) do
    @performer.close

    Midi::Loopback.destroy
  end

  it_should_behave_like "a performer" do
    let(:performer) {@performer}
    let(:event_queue) {@event_queue}
  end
end
