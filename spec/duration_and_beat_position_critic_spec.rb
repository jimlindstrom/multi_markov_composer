#!/usr/bin/env ruby 

require 'spec_helper'

describe DurationAndBeatPositionCritic do
  before(:each) do
    @vector = $meter_vectors["Bring back my bonnie to me"]
    @nq1 = @vector[:note_queue]
    @nq1.detect_meter
    @nq1.analyze!
    @nq1.analyze_harmony!

    @vector = $meter_vectors["Battle hymn of the republic"]
    @nq2 = @vector[:note_queue]
    @nq2.detect_meter
    @nq2.analyze!
    @nq2.analyze_harmony!
  end

  it_should_behave_like "a critic", DurationAndBeatPositionCritic, [order=2, lookahead=1], "data/test/duration_and_beat_position_critic_#{order}_#{lookahead}.json"

  context ".reset!" do
    it "should reset to the state in which no notes have been heard yet" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      dc.listen(@nq1.first)
      dc.reset!
      x = dc.expectations
      MusicIR::Duration.new(x.sample).val.should == @nq1.first.duration.val
    end
  end

  context ".listen" do
    it "should raise an error if the note has no meter analysis" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      #note.analysis[:notes_left] = 1
      expect{ dc.listen(note) }.to raise_error(ArgumentError)
    end
    it "should raise an error if the note isn't tagged with the number of following notes" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      #note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      note.analysis[:notes_left] = 1
      expect{ dc.listen(note) }.to raise_error(ArgumentError)
    end
  end

  context ".information_content_for" do
    it "should raise an error if the note has no meter analysis" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      #note.analysis[:notes_left] = 1
      expect{ dc.information_content_for(note) }.to raise_error(ArgumentError)
    end
    it "should raise an error if the note isn't tagged with the number of following notes" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      #note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      note.analysis[:notes_left] = 1
      expect{ dc.information_content_for(note) }.to raise_error(ArgumentError)
    end
    it "should return the information_content associated with the given note" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:beat_position] = @nq1.first.analysis[:beat_position].dup
      note.analysis[:notes_left] = 1
      dc.information_content_for(note).should == Markov::RandomVariable.max_information_content
    end
  end

  context ".expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      dc.listen(@nq1[0])
      dc.reset!
      dc.listen(@nq1[0])
      dc.reset!
      dc.listen(@nq2[1])
      dc.reset!
      x = dc.expectations

      x.information_content_for(@nq1[0].duration.val).should be < x.information_content_for(@nq2[1].duration.val)
    end
    it "returns a random variable that only chooses states observed" do
      dc = DurationAndBeatPositionCritic.new(order=2, lookahead=1)
      dc.listen(@nq1.first)
      dc.reset!
      x = dc.expectations
      MusicIR::Duration.new(x.sample).val.should == 1
    end
  end

end
