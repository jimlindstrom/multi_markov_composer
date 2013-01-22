#!/usr/bin/env ruby

class ComplexPitchCritic
  include CriticWithInfoContent

  def initialize(pitch_critic, interval_critic, pitch_and_pitch_class_set_critic)
    reset_cumulative_information_content

    @pitch_critic = pitch_critic
    @interval_critic = interval_critic
    @pitch_and_pitch_class_set_critic = pitch_and_pitch_class_set_critic
  end

  def reset!
    # do nothing...
  end

  def save(folder)
    # do nothing...
  end

  def load(folder)
    # do nothing...
  end

  def information_content_for(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    next_symbol = note.pitch.to_symbol
    _expectations = expectations
    if _expectations.num_observations > 0
      information_content = _expectations.information_content_for(next_symbol)
    else
      information_content = Markov::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    # do nothing
  end

  def expectations
    e_arr = []

    [@pitch_critic, @interval_critic, @pitch_and_pitch_class_set_critic].each do |critic|
      e = critic.expectations
      if e && (e.num_observations > 0)
        e_arr << e.normalized_and_weighted_by_entropy
      end
    end

    if e_arr.length > 0
      return e_arr.inject(:+)
    else
      @pitch_critic.reset! # we got to a point where we have no data.  reset, to get back to some stat we know about
      return @pitch_critic.expectations
    end
  end
end
