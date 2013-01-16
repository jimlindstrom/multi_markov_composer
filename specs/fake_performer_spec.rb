#!/usr/bin/env ruby 

require 'spec_helper'

describe FakePerformer do
  before do
    @performer   = FakePerformer.new

    @event_queue = Midi::EventQueue.new
    vector = $fake_sensor_vectors["mary had a little lamb (phrase 1)"]
    vector[:events].each do |e|
      @event_queue.enqueue e
    end

  end

  it_should_behave_like "a performer" do
    let(:performer) {@performer}
    let(:event_queue) {@event_queue}
  end
end
