#!/usr/bin/env ruby

class Improvisor
  LOGGING = true

  def initialize
    @note_generator = NoteGenerator.new
  end

  def critics
    @note_generator.critics
  end

  def generate
    @note_generator.reset!
    response = MusicIR::NoteQueue.new

    # FIXME: replace this with a critic / random variable
    meter = MusicIR::Meter.random
    beat_position = meter.initial_beat_position
    puts "\tmeter: #{meter.inspect}"

    # FIXME: replace this with a critic / random variable
    max_num_notes = 16
    min_num_notes = 10
    num_notes = min_num_notes + (rand*(max_num_notes-min_num_notes)).round

    num_notes.times do 
      # generate another note
      response.push @note_generator.generate

      # update the last note with its beat position
      response.last.analysis[:beat_position] = beat_position
      beat_position += response.last.duration

      # update the last note with the number of notes left
      response.last.analysis[:notes_left] = num_notes - response.length

      response.analyze_harmony! # FIXME: this should be done intentionally, rather than by backing it out...

      # FIXME: there needs to be a test around this. It was missing
      critics.each { |critic| critic.listen response.last } 
    end

    return response
  end
end
