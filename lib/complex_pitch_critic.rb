#!/usr/bin/env ruby

class ComplexPitchCritic
  include CriticWithInfoContent

  def initialize(pitch_critic, interval_critic, pitch_and_pitch_class_set_critic)
    reset_cumulative_information_content

    @pitch_critic = pitch_critic
    @interval_critic = interval_critic
    @pitch_and_pitch_class_set_critic = pitch_and_pitch_class_set_critic
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
    next_symbol = note.pitch.to_symbol
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
    # do nothing
  end

  def get_expectations
    e1 = @pitch_and_pitch_class_set_critic.get_expectations
    e2 = @interval_critic.get_expectations

    if !e1.nil? and !e2.nil?
      # NOTE: when multiplying instead of adding these expecations, the 
      # cumulative information content of this critic doubled or tripled
      expectations = e1 + e2
    elsif !e1.nil?
      expectations = e1 
    elsif !e2.nil?
      expectations = e2
    else
      expectations = Math::RandomVariable.new(Music::Pitch.num_values)
    end

    return expectations if expectations.num_observations > 0

    expectations = @pitch_critic.get_expectations
    return expectations if expectations.num_observations > 0

    @pitch_critic.reset # we got to a point where we have no data.  reset, to get back to some stat we know about
    expectations = @pitch_critic.get_expectations
    return expectations
  end
end
