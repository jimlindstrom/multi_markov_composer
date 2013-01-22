#!/usr/bin/env ruby

#require 'spec/vectors/fake_sensor_vectors' unless $SKIP_FAKE_SENSORS
require 'spec/vectors/fake_sensor_vectors_short'  # only loads about 400

class InteractiveImprovisor

  LOGGING = true

  def initialize
    @improvisor = Improvisor.new
    @listener   = Listener.new
    @improvisor.critics.each { |c| @listener.add_critic(c) }
  end

  def train(num_training_vectors, num_testing_vectors)
    # FIXME: this is basically running the same thing twice, over different samples
    @sensor = FakeSensor.new($fake_sensor_vectors, num_training_vectors)
    num_notes = 0
    puts "\ttraining over #{num_training_vectors} vectors" if LOGGING
    until (stimulus_events = @sensor.get_stimulus).nil?
      stimulus_notes = MusicIR::NoteQueue.from_event_queue(stimulus_events)
      if stimulus_notes 
        if stimulus_notes.any?{ |item| item.is_a?(MusicIR::Rest) }
          puts "WARNING: skipping stimulus. Can't handle MusicIR::Rest's yet."
        else
          @listener.listen stimulus_notes
          num_notes += stimulus_notes.length
        end
      end
    end

    if num_testing_vectors > 0
      @improvisor.critics.each { |c| c.reset_cumulative_information_content }
      num_notes = 0
  
      @sensor = FakeSensor.new($fake_sensor_vectors, num_training_vectors+num_testing_vectors)
      puts "\ttesting over #{num_testing_vectors} vectors" if LOGGING
      num_training_vectors.times { @sensor.get_stimulus } # throw away the ones we already trained on
      until (stimulus_events = @sensor.get_stimulus).nil?
        stimulus_notes = MusicIR::NoteQueue.from_event_queue(stimulus_events)
        if stimulus_notes 
          if stimulus_notes.any?{ |item| item.is_a?(MusicIR::Rest) }
            puts "WARNING: skipping stimulus. Can't handle MusicIR::Rest's yet."
          else
            @listener.listen(stimulus_notes, do_logging=true)
            num_notes += stimulus_notes.length
          end
        end
      end
    end

    return @improvisor.critics
                      .map { |c| { :critic=>c, 
                                   :cum_information_content=>c.cumulative_information_content,
                                   :mean_information_content=>c.cumulative_information_content/num_notes.to_f } }
  end

  def save(folder)
    @improvisor.critics.each { |c| c.save(folder) }
  end

  def load(folder)
    @improvisor.critics.each { |c| c.load(folder) }
  end

  def get_single_improvisation
    @improvisor.generate
  end

  def analyze_single_note_queue(notes)
    @listener.listen(notes, do_logging=true)
  end

  def run
    @sensor = FakeSensor.new($fake_sensor_vectors, 10)
    @performer = FakePerformer.new

    puts "Listening..." if LOGGING
    until (stimulus_events = @sensor.get_stimulus).nil?
      stimulus_notes = MusicIR::NoteQueue.from_event_queue(stimulus_events)
      if stimulus_notes.any?{ |item| item.is_a?(MusicIR::Rest) }
        puts "WARNING: skipping stimulus. Can't handle MusicIR::Rest's yet."
      else
        @listener.listen stimulus_notes

        puts "Improvising..." if LOGGING
        response_notes = @improvisor.generate # FIXME: make this not train
        @listener.listen(stimulus_notes, do_logging=true) if !stimulus_notes.nil?
  		# FIXME: this is only here to print it out.  make this not train...
  
        max_tempo = 450
        min_tempo = 300
        response_notes.tempo = min_tempo + (rand*(max_tempo-min_tempo)).round
        response_notes.tempo *= response_notes.first.analysis[:beat_position].subbeats_per_beat # scale up tempo to keep it interesting
        puts "\ttempo: #{response_notes.tempo}" if LOGGING
        response_events = response_notes.to_event_queue
        @performer.perform response_events
      end

      puts "Listening..." if LOGGING
    end
  end

end
