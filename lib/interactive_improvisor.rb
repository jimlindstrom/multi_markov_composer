#!/usr/bin/env ruby

require 'specs/vectors/fake_sensor_vectors'

class InteractiveImprovisor

  LOGGING = true

  def initialize
    @improvisor = Improvisor.new

    @listener = Listener.new
    @improvisor.get_critics.each { |c| @listener.add_critic(c) }
  end

  def train(num_training_vectors, num_testing_vectors)
    @sensor = FakeSensor.new($fake_sensor_vectors, num_training_vectors)
    puts "\ttraining over #{num_training_vectors} vectors" if LOGGING
    until (stimulus_events = @sensor.get_stimulus).nil?
      stimulus_notes = Music::NoteQueue.from_event_queue(stimulus_events)
      @listener.listen stimulus_notes if !stimulus_notes.nil?
    end

    if num_testing_vectors > 0
      @improvisor.get_critics.each { |c| c.reset_cumulative_information_content }
  
      @sensor = FakeSensor.new($fake_sensor_vectors, num_training_vectors+num_testing_vectors)
      puts "\ttesting over #{num_testing_vectors} vectors" if LOGGING
      num_training_vectors.times { @sensor.get_stimulus } # throw away the ones we already trained on
      until (stimulus_events = @sensor.get_stimulus).nil?
        stimulus_notes = Music::NoteQueue.from_event_queue(stimulus_events)
        @listener.listen(stimulus_notes, do_logging=true) if !stimulus_notes.nil?
      end
    end

    return @improvisor.get_critics.map { |c| { :critic=>c, :cum_information_content=>c.cumulative_information_content } }
  end

  def save(folder)
    @improvisor.get_critics.each { |c| c.save(folder) }
  end

  def load(folder)
    @improvisor.get_critics.each { |c| c.load(folder) }
  end

  def get_single_improvisation
    @improvisor.generate
  end

  def analyze_single_note_queue(notes)
    @listener.listen(notes, do_logging=true)
  end

  def run(use_real_midi=true)
    setup(use_real_midi)

    puts "Listening..." if LOGGING
    until (stimulus_events = @sensor.get_stimulus).nil?
      stimulus_notes = Music::NoteQueue.from_event_queue(stimulus_events)
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

      puts "Listening..." if LOGGING
    end

    teardown
  end

  private

  def setup(use_real_midi=true)
    if use_real_midi
      clock      = Midi::Clock.new(0)
      @sensor    = MidiSensor.new("VMPK Output", clock)
      @sensor.set_stimulus_timeout(5.0)
      #@performer = MidiPerformer.new("VMPK Input")
      @performer = MidiPerformer.new("TiMidity port 0")
    else
      @sensor = FakeSensor.new($fake_sensor_vectors, 10)
      @performer = FakePerformer.new
    end
  end

  def teardown
    @sensor.close if @sensor.class == MidiSensor
    @performer.close if @performer.class == MidiPerformer
  end
  
end
