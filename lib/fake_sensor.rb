#!/usr/bin/env ruby

class FakeSensor
  LOGGING = false

  def initialize(vectors, num_responses)
    @vectors = vectors
    @vector_keys = @vectors.keys[0..(num_responses-1)]
    @vectors = @vectors.select{|k,v| @vector_keys.include? k}
  end

  def get_stimulus
    return nil if @vector_keys.empty?
    next_vector_key = @vector_keys.shift
    puts "FakeSensor returning \"#{next_vector_key}\"" if LOGGING
    vector = @vectors[next_vector_key]

    event_queue = Midi::EventQueue.new
    vector[:events].each do |e|
      event_queue.enqueue e
    end
    return event_queue
  end
end
