#!/usr/bin/env ruby 

require 'spec_helper'

describe DurationAndBeatPositionCritic do
  before(:each) do
    @vector = $meter_vectors["Bring back my bonnie to me"]
    @nq1 = @vector[:note_queue]
    @nq1.detect_meter
    @nq1.analyze!

    @vector = $meter_vectors["Battle hymn of the republic"]
    @nq2 = @vector[:note_queue]
    @nq2.detect_meter
    @nq2.analyze!
  end

  it_should_behave_like "a critic", DurationAndBeatPositionCritic, [order=2, lookahead=1], "data/test/duration_and_beat_position_critic_#{order}_#{lookahead}.yml"

  context ".reset" do
    it "should reset to the state in which no notes have been heard yet" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      dc.listen(@nq1.first)
      dc.reset
      x = dc.get_expectations
      Music::Duration.new(x.choose_outcome).val.should == @nq1.first.duration.val
    end
  end

  context ".listen" do
    it "should raise an error if the note has no meter analysis" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      #note.analysis[:notes_left] = 1
      expect{ dc.listen(note) }.to raise_error(ArgumentError)
    end
    it "should raise an error if the note isn't tagged with the number of following notes" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      #note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      note.analysis[:notes_left] = 1
      expect{ dc.listen(note) }.to raise_error(ArgumentError)
    end
  end

  context ".information_content" do
    it "should raise an error if the note has no meter analysis" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      #note.analysis[:notes_left] = 1
      expect{ dc.information_content(note) }.to raise_error(ArgumentError)
    end
    it "should raise an error if the note isn't tagged with the number of following notes" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      #note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      note.analysis[:notes_left] = 1
      expect{ dc.information_content(note) }.to raise_error(ArgumentError)
    end
    it "should return the information_content associated with the given note" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      note.analysis[:notes_left] = 1
      dc.information_content(note).should == Math::RandomVariable.max_information_content
    end
  end

  context ".get_expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      dc.listen(@nq1[0])
      dc.reset
      dc.listen(@nq1[0])
      dc.reset
      dc.listen(@nq2[1])
      dc.reset
      x = dc.get_expectations

      puts "x: " + x.inspect
      x.information_content(@nq1[0].duration.val).should be < x.information_content(@nq2[1].duration.val)
    end
    it "returns a random variable that only chooses states observed" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      dc.listen(@nq1.first)
      dc.reset
      x = dc.get_expectations
      Music::Duration.new(x.choose_outcome).val.should == 1
    end
  end

end
