#!/usr/bin/env ruby

class PitchGenerator
  def initialize
    @pitch_critic = PitchCritic.new(order=2)
    @interval_critic = IntervalCritic.new(order=3, lookahead=3)
    @pitch_and_pitch_class_set_critic = PitchAndPitchClassSetCritic.new(order=3, lookahead=3)
    @complex_pitch_critic = ComplexPitchCritic.new(@pitch_critic, 
                                                   @interval_critic, 
                                                   @pitch_and_pitch_class_set_critic)

    @critics = [ @pitch_critic,
                 @interval_critic,
                 @pitch_and_pitch_class_set_critic,
                 @complex_pitch_critic ]
  end

  def critics
    return @critics
  end

  def reset!
    @critics.each { |x| x.reset! }
  end

  def generate
    expectations = @complex_pitch_critic.expectations
    x = expectations.sample
    return MusicIR::Pitch.new(x) if !x.nil?

    raise RuntimeError.new("Failed to choose a pitch")
  end
end
