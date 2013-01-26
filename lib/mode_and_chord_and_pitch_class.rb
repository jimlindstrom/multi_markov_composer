#!/usr/bin/env ruby

class ModeAndChordAndPitchClass
  attr_reader :mode, :chord, :pitch_class

  def initialize(mode, chord, pitch_class)
    @mode        = mode
    @chord       = chord
    @pitch_class = pitch_class
  end

  def to_symbol
    sym  = MusicIR::Chord::MODE_TO_VAL[@mode]

    sym *= MusicIR::Chord.num_values
    sym += @chord.to_symbol

    sym *= MusicIR::PitchClass.num_values
    sym += @pitch_class.val

    sym
  end

  def self.from_symbol(sym)
    pc    = MusicIR::PitchClass.new(sym % MusicIR::PitchClass.num_values)
    s     = (sym / MusicIR::PitchClass.num_values).floor

    chord = MusicIR::Chord.from_symbol(s % MusicIR::Chord.num_values)
    s     = (s / MusicIR::Chord.num_values).floor

    mode  = MusicIR::Chord::VAL_TO_MODE[s]

    ModeAndChordAndPitchClass.new(mode, chord, pc)
  end

  def self.num_values
    MusicIR::Chord::MODES.length * MusicIR::Chord.num_values * MusicIR::PitchClass.num_values
  end

  def self.alphabet
    @@alphabet ||= Markov::LiteralAlphabet.new( (0..(self.num_values-1)).to_a )
  end
end

