#!/usr/bin/env ruby

class ComplexDurationCritic
  include CriticWithInfoContent

  def initialize(duration_critic, duration_and_beat_position_critic)
    reset_cumulative_information_content

    @duration_critic = duration_critic
    @duration_and_beat_position_critic = duration_and_beat_position_critic
  end

  def reset
    # do nothing...
  end

  def save(folder)
    # do nothing...
  end

  def load(folder)
    # do nothing...
  end

  def information_content(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    next_symbol = note.duration.to_symbol
    expectations = get_expectations
    if expectations.num_observations > 0
      information_content = expectations.information_content(next_symbol.val)
    else
      information_content = Math::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    # do nothing...
  end

  def get_expectations
    # try generating from the history of {beat position; duration} symbols
    e = @duration_and_beat_position_critic.get_expectations
    return e if !e.nil? and e.num_observations > 0

    # try generating just from the history of durations (independent of beat position)
    e = @duration_critic.get_expectations
    return e if !e.nil? and e.num_observations > 0

    # still no luck?  then reset and just pick a random duration
    @duration_critic.reset
    e = @duration_critic.get_expectations
    return e
  end
end
