#!/usr/bin/env ruby 

require 'spec_helper'

describe FakeSensor do

  it_should_behave_like "a sensor" do
    let(:sensor) {FakeSensor.new($fake_sensor_vectors, expected_num_responses=5)}
    let(:expected_num_responses) {expected_num_responses=5}
  end


end

