#!/usr/bin/env ruby 

require 'spec_helper'

shared_examples_for "a sensor" do #|sensor, expected_num_responses|
  context ".get_stimulus" do
    it "return a Midi::EventQueue" do
      sensor.get_stimulus.should be_an_instance_of Midi::EventQueue
    end
    it "return nil if there are no more stimuli" do
      stimuli          = []
      expected_stimuli = []
      expected_num_responses.times do |stimulus_idx|
        puts "waiting for stimulus # #{stimulus_idx}"
        stimuli.push sensor.get_stimulus.class
        expected_stimuli.push Midi::EventQueue
      end

      stimuli.push sensor.get_stimulus.class
      expected_stimuli.push NilClass

      stimuli.should be == expected_stimuli
    end
  end
end
