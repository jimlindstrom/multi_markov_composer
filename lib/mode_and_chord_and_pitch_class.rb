#!/usr/bin/env ruby

class ModeAndChordAndPitchClass
  attr_reader :mode, :chord, :pitch_class

  def initialize(mode, chord, pitch_class)
    @mode        = mode
    @chord       = chord
    @pitch_class = pitch_class
  end

  def to_symbol
    sym  = Chord::MODE_TO_VAL[@mode]

    sym *= Chord.num_values
    sym += @chord.to_symbol

    sym *= MusicIR::PitchClass.num_values
    sym += @pitch_class.val

    sym
  end

  def self.from_symbol(sym)
    pc    = MusicIR::PitchClass.new(sym % MusicIR::PitchClass.num_values)
    s     = (sym / MusicIR::PitchClass.num_values).floor

    chord = Chord.from_symbol(s % Chord.num_values)
    s     = (s / Chord.num_values).floor

    mode  = Chord::VAL_TO_MODE[s]

    ModeAndChordAndPitchClass.new(mode, chord, pc)
  end

  def self.num_values
    Chord::MODES.length * Chord.num_values * MusicIR::PitchClass.num_values
  end

  def self.alphabet
    @@alphabet ||= Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
  end
end

