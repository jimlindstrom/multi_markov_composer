#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'
$MARKOV__SKIP_SLOW_ERROR_CHECKING = true

key_estimator = KeyEstimator.new

#0.upto($fake_sensor_vectors.length) do |vector_idx|
1.upto(1) do |vector_idx|
  vector = $fake_sensor_vectors.values[vector_idx]
  event_queue = MusicIR::EventQueue.new
  vector[:events].each { |e| event_queue.enqueue e }
  stimulus_notes = MusicIR::NoteQueue.from_event_queue(event_queue)

  if stimulus_notes &&  stimulus_notes.none?{ |item| item.is_a?(MusicIR::Rest) }
    printf $fake_sensor_vectors.keys[vector_idx] + ": "
    key_estimates = []
    note_arr = []
    stimulus_notes.each do |note|
      note_arr << note
      note_arr.shift if note_arr.length > 10
      key_estimates << key_estimator.key(note_arr, show_details=false)
    end
    puts key_estimates.join(",")
    
    #final_key_val = key_to_val(key_estimates[-1])
    #start_of_final_correct_streak = key_estimates.length-1
    #while (start_of_final_correct_streak > 0) && (key_to_val(key_estimates[start_of_final_correct_streak-1]) == final_key_val)
    #  start_of_final_correct_streak -= 1
    #end
    #
    #puts start_of_final_correct_streak
  end
end


