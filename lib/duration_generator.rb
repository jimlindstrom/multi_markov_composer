#!/usr/bin/env ruby

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
  end

  def critics
    return @critics
  end

  def reset!
    @critics.each { |x| x.reset! }
  end

  def generate
    expectations = @complex_duration_critic.expectations
    x = expectations.sample
    return MusicIR::Duration.new(x) if !x.nil?

    raise RuntimeError.new("Failed to generate a duration")
  end
end
