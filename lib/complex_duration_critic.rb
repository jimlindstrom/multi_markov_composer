#!/usr/bin/env ruby

class ComplexDurationCritic
  include CriticWithInfoContent

  def initialize(duration_critic, duration_and_beat_position_critic)
    reset_cumulative_information_content

    @duration_critic = duration_critic
    @duration_and_beat_position_critic = duration_and_beat_position_critic
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
    next_symbol = note.duration.to_symbol
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
    # do nothing...
  end

  def expectations
    e_arr = []

    [@duration_critic, @duration_and_beat_position_critic].each do |critic|
      e = critic.expectations
      if e && (e.num_observations > 0)
        e_arr << e.normalized_and_weighted_by_entropy
      end
    end

    if e_arr.length > 0
      return e_arr.inject(:+)
    else
      @duration_critic.reset! # we got to a point where we have no data.  reset, to get back to some stat we know about
      return @duration_critic.expectations
    end
  end

end
