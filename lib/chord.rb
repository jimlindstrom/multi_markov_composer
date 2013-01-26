#!/usr/bin/env ruby

class Chord
  attr_reader :pc, :type

  TYPES = [:major, :minor]
  TYPE_TO_VAL = {:major=>0, :minor=>1}
  VAL_TO_TYPE = {0=>:major, 1=>:minor}

  def initialize(pc, type)
    raise ArgumentError.new("pc must be a MusicIR::PitchClass") if !pc.is_a?(MusicIR::PitchClass)
    raise ArgumentError.new("type must be one of #{TYPES.inspect}") if !TYPES.include?(type)
    @pc = pc
    @type = type
  end

  def to_symbol
    TYPE_TO_VAL[@type]*12 + @pc.val
  end

  def self.from_symbol(sym)
    raise ArgumentError.new("symbol must be in 0..((2*12)-1)") if sym<0 || sym>=(2*12)
    pc = MusicIR::PitchClass.new(sym % 12)
    type = VAL_TO_TYPE[(sym / 12).floor]
    Chord.new(pc, type)
  end

  def self.num_values
    2*12
  end

  def self.alphabet
    @@alphabet ||= Markov::LiteralAlphabet.new( (0..((2*12)-1)).to_a )
  end

  def to_s(use_flats=true)
    @pc.to_s(use_flats) + @type.to_s
  end
end
