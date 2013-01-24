#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'
require 'spec/vectors/fake_sensor_vectors'

templates = []
templates << [0.192281, 0.003930, 0.205700, 0.051632, 0.130102, 0.097586, 0.002593, 0.129608, 0.011252, 0.085303, 0.020011, 0.070003] # maj
templates << [0.134023, 0.004604, 0.077237, 0.172553, 0.009880, 0.177877, 0.000384, 0.178545, 0.098985, 0.005486, 0.136055, 0.004371] # min

def key_to_val(key)
  (key[:template_idx]*12) + key[:pitch_class].val
end

def key_to_name(key)
  template_names = ["M", "m"]
  pitch_class_names = ["A","Bb","B","C","Db","D","Eb","E","F","F#","G","Ab"]
  key[:pitch_class].to_s + template_names[key[:template_idx]]
end

0.upto($fake_sensor_vectors.length) do |vector_idx|
  begin
    vector = $fake_sensor_vectors.values[vector_idx]
    event_queue = MusicIR::EventQueue.new
    vector[:events].each { |e| event_queue.enqueue e }
    stimulus_notes = MusicIR::NoteQueue.from_event_queue(event_queue)

    if stimulus_notes &&  stimulus_notes.none?{ |item| item.is_a?(MusicIR::Rest) }
      stimulus_notes.analyze!
      wpcs = MusicIR::WeightedPitchClassSet.new
      key_estimates = []
      printf $fake_sensor_vectors.keys[vector_idx] + ": "
      stimulus_notes.each do |note|
        wpcs.add(MusicIR::PitchClass.from_pitch(note.pitch), note.duration.val)
        key_estimates << wpcs.best_match_key(templates)
        printf key_to_name(key_estimates[-1]) + ","
      end
      puts
      
      #final_key_val = key_to_val(key_estimates[-1])
      #start_of_final_correct_streak = key_estimates.length-1
      #while (start_of_final_correct_streak > 0) && (key_to_val(key_estimates[start_of_final_correct_streak-1]) == final_key_val)
      #  start_of_final_correct_streak -= 1
      #end
      #
      #puts start_of_final_correct_streak
    end
  rescue Exception => e
    #raise e
  end
end


