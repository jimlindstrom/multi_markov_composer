#!/usr/bin/env ruby

class CustomPitchCritic < PitchCritic
  def load(folder)
    # do nothing, because this one is custom, per-song
  end
end
class CustomIntervalCritic < IntervalCritic
  def load(folder)
    # do nothing, because this one is custom, per-song
  end
end
class CustomPitchAndPitchClassSetCritic < PitchAndPitchClassSetCritic
  def load(folder)
    # do nothing, because this one is custom, per-song
  end
end
class CustomComplexPitchCritic < ComplexPitchCritic
  def load(folder)
    # do nothing, because this one is custom, per-song
  end
end

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

    # I'm guessing this was an attempt to allow each song to exhibit its own idioms & 
    # tendencies, which could get mixed in with more global expectations. For now, though
    # I'm shutting it off.
    #@custom_pitch_critic = CustomPitchCritic.new(order=2)
    #@custom_interval_critic = CustomIntervalCritic.new(order=3, lookahead=3)
    #@custom_pitch_and_pitch_class_set_critic = CustomPitchAndPitchClassSetCritic.new(order=3, lookahead=3)
    #@custom_complex_pitch_critic = CustomComplexPitchCritic.new(@custom_pitch_critic, 
    #                                               @custom_interval_critic, 
    #                                               @custom_pitch_and_pitch_class_set_critic)

    #@critics +=[ @custom_pitch_critic,
    #             @custom_interval_critic,
    #             @custom_pitch_and_pitch_class_set_critic,
    #             @custom_complex_pitch_critic ]
  end

  def get_critics
    return @critics
  end

  def reset
    @critics.each { |x| x.reset }
  end

  def generate
    expectations = @complex_pitch_critic.get_expectations
    x = expectations.sample
    return MusicIR::Pitch.new(x) if !x.nil?

    raise RuntimeError.new("Failed to choose a pitch")
  end
end
