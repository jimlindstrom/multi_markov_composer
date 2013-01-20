#!/usr/bin/env ruby 

require 'spec_helper'

shared_examples_for "a critic" do |class_type, params_for_new, filename|

  before(:each) do
    @notes = MusicIR::NoteQueue.new
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(61), MusicIR::Duration.new( 1))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(60), MusicIR::Duration.new( 2))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(62), MusicIR::Duration.new( 4))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(59), MusicIR::Duration.new( 6))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(53), MusicIR::Duration.new( 8))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(63), MusicIR::Duration.new(10))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(77), MusicIR::Duration.new(12))
    @notes.push MusicIR::Note.new(MusicIR::Pitch.new(89), MusicIR::Duration.new(14))

    @notes.analyze!

    # since this is unlikely to have any real meter, just make up one and apply it
    meter = MusicIR::Meter.random
    beat_position = meter.initial_beat_position
    @notes.each do |note|
      note.analysis[:beat_position] = beat_position
      beat_position += note.duration
    end
  end

  describe ".new" do
    it "should return a critic" do
      class_type.new(*params_for_new).should be_an_instance_of class_type
    end
  end

  describe ".information_content_for" do
    # add test: cumulative_information_content is only updated when this is called.. Which is weird
    context "the second time it hears a sequence" do
      it "should be less surprised" do
        c = class_type.new(*params_for_new)
  
        cum_info_contents = []
  
        2.times do
          @notes.each do |n| 
            dummy = c.information_content_for n 
            c.listen n 
          end
          cum_info_contents << c.cumulative_information_content
    
          c.reset!
          c.reset_cumulative_information_content
        end
  
        cum_info_contents.last.should < cum_info_contents.first
      end
    end
  end

#  describe ".reset!" do
#    it "should reset to the state in which no notes have been heard yet" do
#      pc = PitchCritic.new()
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
#      pc.reset!
#      x = pc.expectations
#      MusicIR::Pitch.new(x.choose_outcome).val.should == 1
#    end
#  end

  describe ".save" do
    it "should save a file, named <folder>/<critic_name>_<params>.json" do
      c = class_type.new(*params_for_new)
      File.delete filename if FileTest.exists? filename
      c.save "data/test"
      FileTest.exists?(filename).should == true
    end
  end

  describe ".load" do
    before(:each) do
      @c = class_type.new(*params_for_new)

      @notes.each do |n|
        info_content = @c.information_content_for n
        @c.listen n
      end
      @c.reset!

      @notes[0..3].each do |n|
        info_content = @c.information_content_for n
        @c.listen n
      end

      @c.save "data/test"

      @c2 = class_type.new(*params_for_new)
      @c2.load "data/test"
    end
    it "should load a saved file, but have zero cumulative info content" do
      @c2.cumulative_information_content.should be_within(0.0001).of(0.0)
    end
    it "should load a saved file, and have the same expecations" do
      @c.expectations.sample.should == @c2.expectations.sample
    end
  end

  describe ".cumulative_information_content" do
    before(:each) do
      @c = class_type.new(*params_for_new)
    end
    context "initially" do
      it "should return zero" do
        @c.cumulative_information_content.should be_within(0.0001).of(0.0)
      end
    end
    context "after resetting" do
      before(:each) do
        @cum_info_content = 0.0
        3.times do
          @notes.each do |n|
            @cum_info_content += (@c.information_content_for(n) || 0.0)
            @c.listen n
          end
          @c.reset!
        end
      end
      it "should return the sum of all information_content (since last reset)" do
        @c.cumulative_information_content.should be_within(0.0001).of(@cum_info_content)
      end
      context "after calling reset_cumulative_information_content" do
        before(:each) do
          @c.reset_cumulative_information_content
        end
        it "should return zero" do
          @c.cumulative_information_content.should be_within(0.0001).of(0.0)
        end
      end
    end
  end

  describe ".expectations" do
    it "returns a random variable (or nil, initially)" do 
      c = class_type.new(*params_for_new)

      # IntervalCritic, e.g., needs to queue up 1 note before having expectations
      while c.expectations.nil? and !@notes.empty? 
        n = @notes.shift
        info_content = c.information_content_for n
        c.listen n
      end

      c.expectations.should be_an_instance_of Markov::RandomVariable
    end
#    it "returns a random variable that is less information_contentd about states observed more often" do
#      order = 1
#      pc = PitchCritic.new(order)
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
#      pc.reset!
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
#      pc.reset!
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(0)))
#      pc.reset!
#      x = pc.expectations
#      x.information_content_for(1).should be < x.information_content_for(0)
#    end
#    it "returns a random variable that only chooses states observed" do
#      order = 1
#      pc = PitchCritic.new(order)
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
#      pc.reset!
#      x = pc.expectations
#      MusicIR::Pitch.new(x.sample).val.should == 1
#    end
#    it "returns a random variable that only chooses states observed (higher order)" do
#      order = 3
#      pc = PitchCritic.new(order)
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(0)))
#      pc.reset!
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(4), MusicIR::Duration.new(0)))
#      pc.reset!
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(0)))
#      pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(0)))
#      x = pc.expectations
#      MusicIR::Pitch.new(x.sample).val.should == 4
#    end
  end

end
