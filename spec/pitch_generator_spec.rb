#!/usr/bin/env ruby 

require 'spec_helper'

describe PitchGenerator do
  before do
  end

  context ".get_critics" do
    it "should return an array containing critics" do
      pg = PitchGenerator.new
      critics = pg.get_critics
      critics.should be_an_instance_of Array
    end
    it "should return an array containing critics" do
      pg = PitchGenerator.new
      critics = pg.get_critics
      critics.each do |critic|
        #critic.should be_a_kind_of PitchCritic
        pending
      end
    end
  end

  context ".reset" do
    it "should cause the next pitch (the first in a seq) to be an observed starting pitch" do
      note1 = MusicIR::Note.new(MusicIR::Pitch.new(50), MusicIR::Duration.new(1))
      note2 = MusicIR::Note.new(MusicIR::Pitch.new(55), MusicIR::Duration.new(1))
      note1.analysis[:notes_left] = 2
      note2.analysis[:notes_left] = 1

      pg = PitchGenerator.new
      critics = pg.get_critics
      critics.each do |critic|
        critic.listen note1
        critic.listen note2
      end
      pg.reset
      pg.generate.val.should == 50
    end
  end

  context ".generate" do
    it "should return a pitch" do
      note1 = MusicIR::Note.new(MusicIR::Pitch.new(50), MusicIR::Duration.new(1))
      note2 = MusicIR::Note.new(MusicIR::Pitch.new(55), MusicIR::Duration.new(1))
      note1.analysis[:notes_left] = 2
      note2.analysis[:notes_left] = 1

      pg = PitchGenerator.new
      critics = pg.get_critics
      critics.each do |critic|
        critic.listen note1
        critic.listen note2
      end
      pg.reset
      pg.generate.should be_an_instance_of MusicIR::Pitch
    end
  end
end
