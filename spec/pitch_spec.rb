#!/usr/bin/env ruby 

require 'spec_helper'

describe MusicIR::Pitch do

  context "to_symbol" do
    it "should return a PitchSymbol" do
      p = MusicIR::Pitch.new(0)
      p.to_symbol.should be_an_instance_of MusicIR::PitchSymbol
    end
    it "should return a PitchSymbol whose value corresponds to the Pitch's value" do
      p = MusicIR::Pitch.new(10)
      p.to_symbol.val.should equal 10
    end
  end

end
