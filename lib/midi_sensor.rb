#!/usr/bin/env ruby

class MidiSensor
  def initialize(port_name, clock)
    @inport = Midi::InPort.new(port_name, clock)
    @read_timeout = 3.0
  end

  def close
    @inport.close
    @inport = nil
  end

  def set_stimulus_timeout(t)
    @read_timeout = t
  end

  def get_stimulus
    event_queue = Midi::EventQueue.new

    while !(evt = @inport.read_with_timeout(@read_timeout)).nil?
      event_queue.enqueue(evt)
    end
    return nil if event_queue.empty?
    return event_queue
  end
end
