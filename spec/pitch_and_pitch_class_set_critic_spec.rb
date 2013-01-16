#!/usr/bin/env ruby 

require 'spec_helper'

describe PitchAndPitchClassSetCritic do
  before(:each) do
    @vector = $meter_vectors["Bring back my bonnie to me"]
    @nq1 = @vector[:note_queue]
    @nq1.analyze!

    @vector = $meter_vectors["Battle hymn of the republic"]
    @nq2 = @vector[:note_queue]
    @nq2.analyze!
  end

  it_should_behave_like "a critic", PitchAndPitchClassSetCritic, [order=2, lookahead=1], "data/test/pitch_and_pitch_class_set_critic_#{order}_#{lookahead}.yml"

  context ".reset" do
    it "should reset to the state in which no notes have been heard yet" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      ppcs.listen(@nq1.first)
      ppcs.reset
      x = ppcs.get_expectations
      Music::Pitch.new(x.choose_outcome).val.should == @nq1.first.pitch.val
    end
    it "should reset the current pitch class set" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      ppcs.listen @nq1[0]
      ppcs.listen @nq1[1]
      ppcs.listen @nq1[2]
      ppcs.listen @nq1[3]
      ppcs.reset
      ppcs.current_pitch_class_set.vals.should == []
    end
  end

  context ".listen" do
    it "should raise an error if the note isn't tagged with the number of following notes" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      #note.analysis[:notes_left] = 1
      expect{ ppcs.listen(note) }.to raise_error(ArgumentError)
    end
  end

  context ".information_content" do
    it "should raise an error if the note isn't tagged with the number of following notes" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      #note.analysis[:notes_left] = 1
      expect{ ppcs.information_content(note) }.to raise_error(ArgumentError)
    end
    it "should return the information_content associated with the given note" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      note = Music::Note.new(Music::Pitch.new(0), Music::Duration.new(1))
      note.analysis[:notes_left] = 1
      ppcs.information_content(note).should == Math::RandomVariable.max_information_content
    end
  end

  context ".get_expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      ppcs.listen(@nq1[0])
      ppcs.reset
      ppcs.listen(@nq1[0])
      ppcs.reset
      ppcs.listen(@nq1[1])
      ppcs.reset
      x = ppcs.get_expectations
      x.information_content(@nq1[0].pitch.val).should be < x.information_content(@nq1[1].pitch.val)
    end
    it "returns a random variable that only chooses states observed" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      ppcs.listen(@nq1.first)
      ppcs.reset
      x = ppcs.get_expectations
      Music::Pitch.new(*x.choose_outcome).val.should == @nq1.first.pitch.val
    end
  end

  context ".current_pitch_class_set" do
    it "should return a PitchClassSet" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      ppcs.current_pitch_class_set.should be_an_instance_of Music::PitchClassSet
    end
    it "should contain no more pitch classes than the 'order'" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      0.upto(10) { |i| ppcs.listen @nq1[i] }
      ppcs.current_pitch_class_set.vals.length.should be <= order
    end
    it "should contain some subset of pitch classes listened to" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      expected_pcs = Music::PitchClassSet.new
      0.upto(10) do |i| 
        cur_note = @nq1[i]
        ppcs.listen cur_note
        expected_pcs.add Music::PitchClass.from_pitch(cur_note.pitch)
      end

      (ppcs.current_pitch_class_set.vals - expected_pcs.vals).should == []
    end
  end

end
