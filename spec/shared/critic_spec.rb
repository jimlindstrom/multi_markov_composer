#!/usr/bin/env ruby 

require 'spec_helper'

shared_examples_for "a critic" do |class_type, params_for_new, filename|

  before(:each) do
    @notes = Music::NoteQueue.new
    @notes.push Music::Note.new(Music::Pitch.new(61), Music::Duration.new( 1))
    @notes.push Music::Note.new(Music::Pitch.new(60), Music::Duration.new( 2))
    @notes.push Music::Note.new(Music::Pitch.new(62), Music::Duration.new( 4))
    @notes.push Music::Note.new(Music::Pitch.new(59), Music::Duration.new( 6))
    @notes.push Music::Note.new(Music::Pitch.new(53), Music::Duration.new( 8))
    @notes.push Music::Note.new(Music::Pitch.new(63), Music::Duration.new(10))
    @notes.push Music::Note.new(Music::Pitch.new(77), Music::Duration.new(12))
    @notes.push Music::Note.new(Music::Pitch.new(89), Music::Duration.new(14))

    @notes.analyze!

    # since this is unlikely to have any real meter, just make up one and apply it
    meter = Music::Meter.random
    beat_position = meter.initial_beat_position
    @notes.each do |note|
      note.analysis[:beat_position] = beat_position
      beat_position += note.duration
    end
  end

  context ".new" do
    it "should return a critic" do
      class_type.new(*params_for_new).should be_an_instance_of class_type
    end
  end

  context ".information_content" do
    context "the first time it hears a sequence" do
      before(:each) do
        @c = class_type.new(*params_for_new)
  
        @info_content = nil
        while @info_content.nil? and !@notes.empty?
          n = @notes.shift
          @info_content = @c.information_content n
          @c.listen n
        end
      end
      it "should return the information_content associated with the given note" do
        @info_content.should == Math::RandomVariable.max_information_content
      end
      it "should add the information_content associated with the given note to the cumulative total" do
        @c.cumulative_information_content.should == Math::RandomVariable.max_information_content
      end
    end
    context "the first time it hears a sequence" do
      it "should be less surprised" do
        c = class_type.new(*params_for_new)
  
        info_contents = []
  
        2.times do
          @notes.each do |n|
            info_content = c.information_content n
            c.listen n
          end
          info_contents.push c.cumulative_information_content
    
          c.reset
          c.reset_cumulative_information_content
        end
  
        info_contents.last.should < info_contents.first
      end
    end
  end

#  context ".reset" do
#    it "should reset to the state in which no notes have been heard yet" do
#      pc = PitchCritic.new()
#      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
#      pc.reset
#      x = pc.get_expectations
#      Music::Pitch.new(x.choose_outcome).val.should == 1
#    end
#  end

  context ".save" do
    it "should save a file, named <folder>/<critic_name>_<params>.yml" do
      c = class_type.new(*params_for_new)
      File.delete filename if FileTest.exists? filename
      c.save "data/test"
      FileTest.exists?(filename).should == true
    end
  end

  context ".load" do
    before(:each) do
      @c = class_type.new(*params_for_new)

      @notes.each do |n|
        info_content = @c.information_content n
        @c.listen n
      end
      @c.reset

      @notes[0..3].each do |n|
        info_content = @c.information_content n
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
      @c.get_expectations.choose_outcome.should == @c2.get_expectations.choose_outcome
    end
  end

  context ".cumulative_information_content" do
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
            @cum_info_content += (@c.information_content(n) || 0.0)
            @c.listen n
          end
          @c.reset
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

  context ".get_expectations" do
    it "returns a random variable (or nil, initially)" do 
      c = class_type.new(*params_for_new)

      # IntervalCritic, e.g., needs to queue up 1 note before having expectations
      while c.get_expectations.nil? and !@notes.empty? 
        n = @notes.shift
        info_content = c.information_content n
        c.listen n
      end

      c.get_expectations.should be_an_instance_of Math::RandomVariable
    end
#    it "returns a random variable that is less information_contentd about states observed more often" do
#      order = 1
#      pc = PitchCritic.new(order)
#      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
#      pc.reset
#      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
#      pc.reset
#      pc.listen(Music::Note.new(Music::Pitch.new(0), Music::Duration.new(0)))
#      pc.reset
#      x = pc.get_expectations
#      x.information_content(1).should be < x.information_content(0)
#    end
#    it "returns a random variable that only chooses states observed" do
#      order = 1
#      pc = PitchCritic.new(order)
#      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
#      pc.reset
#      x = pc.get_expectations
#      Music::Pitch.new(x.choose_outcome).val.should == 1
#    end
#    it "returns a random variable that only chooses states observed (higher order)" do
#      order = 3
#      pc = PitchCritic.new(order)
#      pc.listen(Music::Note.new(Music::Pitch.new(1), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(2), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(3), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(6), Music::Duration.new(0)))
#      pc.reset
#      pc.listen(Music::Note.new(Music::Pitch.new(5), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(2), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(3), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(4), Music::Duration.new(0)))
#      pc.reset
#      pc.listen(Music::Note.new(Music::Pitch.new(5), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(2), Music::Duration.new(0)))
#      pc.listen(Music::Note.new(Music::Pitch.new(3), Music::Duration.new(0)))
#      x = pc.get_expectations
#      Music::Pitch.new(x.choose_outcome).val.should == 4
#    end
  end

end
