#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'
require 'spec/vectors/fake_sensor_vectors'

module MusicIR
  class WeightedPitchClassSet
    def normalized_weights
      sum = @weight.map{ |x| x || 0 }.inject(:+).to_f
      @weight.map{ |x| (x || 0) / sum }
    end
  end
end

0.upto($fake_sensor_vectors.length) do |vector_idx|
  begin
    vector = $fake_sensor_vectors.values[vector_idx]
    event_queue = MusicIR::EventQueue.new
    vector[:events].each { |e| event_queue.enqueue e }
    stimulus_notes = MusicIR::NoteQueue.from_event_queue(event_queue)

    if stimulus_notes 
      if stimulus_notes.any?{ |item| item.is_a?(MusicIR::Rest) }
        #puts "WARNING: skipping stimulus. Can't handle MusicIR::Rest's yet."
      else
        stimulus_notes.analyze!
        wpcs = MusicIR::WeightedPitchClassSet.new
        stimulus_notes.each do |note|
          wpcs.add(MusicIR::PitchClass.from_pitch(note.pitch), note.duration.val)
        end
        puts wpcs.normalized_weights.map{ |x| x.to_s }.join(", ")
      end
    end
  rescue
    # skipping
  end
end

