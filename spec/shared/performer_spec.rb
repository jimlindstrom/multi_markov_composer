#!/usr/bin/env ruby 

require 'spec_helper'

shared_examples_for "a performer" do # |performer, event_queue|
  context ".perform" do
    it "takes an event queue" do
      performer.perform event_queue
    end
  end
end
