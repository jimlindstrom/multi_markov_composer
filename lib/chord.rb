#!/usr/bin/env ruby

class Chord
  attr_reader :pitch_class, :mode

  MODES = [:major, :minor]
  MODE_TO_VAL = {:major=>0, :minor=>1}
  VAL_TO_MODE = {0=>:major, 1=>:minor}

  def initialize(pitch_class, mode)
    raise ArgumentError.new("pitch_class must be a MusicIR::PitchClass") if !pitch_class.is_a?(MusicIR::PitchClass)
    raise ArgumentError.new("mode must be one of #{MODES.inspect}") if !MODES.include?(mode)
    @pitch_class = pitch_class
    @mode = mode
  end

  def to_symbol
    MODE_TO_VAL[@mode]*12 + @pitch_class.val
  end

  def self.from_symbol(sym)
    raise ArgumentError.new("symbol must be in 0..((2*12)-1)") if sym<0 || sym>=(2*12)
    pitch_class = MusicIR::PitchClass.new(sym % 12)
    mode = VAL_TO_MODE[(sym / 12).floor]
    Chord.new(pitch_class, mode)
  end

  def self.num_values
    2*12
  end

  def self.alphabet
    @@alphabet ||= Markov::LiteralAlphabet.new( (0..((2*12)-1)).to_a )
  end

  def to_s(use_flats=true)
    @pitch_class.to_s(use_flats) + @mode.to_s
  end
end
