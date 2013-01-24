#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'

vector_idx = ARGV[0].to_i

puts "name: " + $fake_sensor_vectors.keys[vector_idx]
vector = $fake_sensor_vectors.values[vector_idx]
event_queue = MusicIR::EventQueue.new
vector[:events].each { |e| event_queue.enqueue e }
stimulus_notes = MusicIR::NoteQueue.from_event_queue(event_queue)
if stimulus_notes && stimulus_notes.none?{ |item| item.is_a?(MusicIR::Rest) }
  if stimulus_notes.analyze!
    stimulus_notes.detect_meter
    last_note = nil
    stimulus_notes.each do |note|
      if !last_note || (note.analysis[:beat_position].beat < last_note.analysis[:beat_position].beat)
        printf "| "
      end
      printf "#{MusicIR::PitchClass.from_pitch(note.pitch).to_s}[#{note.duration.val}] "
      last_note = note
    end
    puts
  else
    puts "couldn't detect meter"
  end
else
  puts "couldn't be parsed, or contains a rest"
end
