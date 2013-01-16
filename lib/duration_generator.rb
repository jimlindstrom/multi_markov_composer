#!/usr/bin/env ruby

class CustomDurationCritic < DurationCritic
  def load(folder)
    # do nothing
  end
end
class CustomDurationAndBeatPositionCritic < DurationAndBeatPositionCritic
  def load(folder)
    # do nothing
  end
end
class CustomComplexDurationCritic < ComplexDurationCritic
  def load(folder)
    # do nothing
  end
end

class DurationGenerator
  def initialize
    @duration_critic = DurationCritic.new(order=3)
    @duration_and_beat_position_critic = DurationAndBeatPositionCritic.new(order=2, lookahead=3)
    @complex_duration_critic = 
      ComplexDurationCritic.new(@duration_critic, 
                                @duration_and_beat_position_critic)

    @critics = [ @duration_critic,
                 @duration_and_beat_position_critic,
                 @complex_duration_critic ]

    @custom_duration_critic = CustomDurationCritic.new(order=3)
    @custom_duration_and_beat_position_critic = CustomDurationAndBeatPositionCritic.new(order=2, lookahead=3)
    @custom_complex_duration_critic = 
      CustomComplexDurationCritic.new(@custom_duration_critic, 
                                @custom_duration_and_beat_position_critic)

    @critics+= [ @custom_duration_critic,
                 @custom_duration_and_beat_position_critic,
                 @custom_complex_duration_critic ]
  end

  def get_critics
    return @critics
  end

  def reset
    @critics.each { |x| x.reset }
  end

  def generate
    expectations = @complex_duration_critic.get_expectations
    x = expectations.choose_outcome
    return Music::Duration.new(x) if !x.nil?

    raise RuntimeError.new("Failed to generate a duration")
  end

end
