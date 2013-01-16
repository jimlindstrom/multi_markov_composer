#!/usr/bin/env ruby

require 'spec_helper'

describe MusicIR::Duration do

  context "to_symbol" do
    it "should return a DurationSymbol" do
      p = MusicIR::Duration.new(0)
      p.to_symbol.should be_an_instance_of MusicIR::DurationSymbol
    end
    it "should return a DurationSymbol whose value corresponds to the Duration's value" do
      p = MusicIR::Duration.new(10)
      p.to_symbol.val.should equal 10
    end
  end

end
