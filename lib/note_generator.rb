#!/usr/bin/env ruby

class NoteGenerator
  def initialize
    @pitch_generator = PitchGenerator.new
    @duration_generator = DurationGenerator.new
  end

  def critics
    @pitch_generator.critics + @duration_generator.critics
  end

  def reset!
    @pitch_generator.reset!
    @duration_generator.reset!
  end

  def generate
    return MusicIR::Note.new(@pitch_generator.generate, @duration_generator.generate)
  end
end
