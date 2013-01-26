#!/usr/bin/env ruby 

require 'spec_helper'

describe PitchAndPitchClassSetCritic do
  before(:all) do
    @vector = $meter_vectors["Bring back my bonnie to me"]
    @nq1 = @vector[:note_queue]
    @nq1.analyze!
    @nq1.analyze_harmony!

    @vector = $meter_vectors["Battle hymn of the republic"]
    @nq2 = @vector[:note_queue]
    @nq2.analyze!
    @nq2.analyze_harmony!
  end

  it_should_behave_like "a critic", PitchAndPitchClassSetCritic, [order=2, lookahead=1], "data/test/pitch_and_pitch_class_set_critic_#{order}_#{lookahead}.json"

  describe ".reset!" do
    context "when a note has been listened to" do
      let(:nq) { @nq1.first }
      subject { PitchAndPitchClassSetCritic.new(order=2, lookahead=1) }
      before(:each) { subject.listen(nq) }
      it "should reset to the state in which no notes have been heard yet" do
        subject.reset!
        MusicIR::Pitch.new(subject.expectations.sample).val.should == nq.pitch.val
      end
      it "should reset the current pitch class set" do
        subject.reset!
        subject.current_pitch_class_set.vals.should == []
      end
    end
  end

  describe ".listen" do
    let(:note) { MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)) }
    subject { PitchAndPitchClassSetCritic.new(order=2, lookahead=1) }
    context "when the note is tagged with :notes_left" do
      before { note.analysis[:notes_left] = 1 }
      it "suceeeds" do
        subject.listen(note)
      end
    end
    context "when the note is not  tagged with :notes_left" do
      it "raises an error" do
        expect{ subject.listen(note) }.to raise_error(ArgumentError)
      end
    end
  end

  describe ".information_content_for" do
    it "should raise an error if the note isn't tagged with the number of following notes" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      #note.analysis[:notes_left] = 1
      expect{ ppcs.information_content_for(note) }.to raise_error(ArgumentError)
    end
    it "should return the information_content associated with the given note" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 1
      ppcs.information_content_for(note).should == Markov::RandomVariable.max_information_content
    end
  end

  # FIXME: this set of tests doesn't distinguish this critic from PitchCritic
  describe ".expectations" do
    context "when a note has been listened to twice, and another one only once" do
      let(:note1) { @nq1[0] }
      let(:note2) { @nq1[1] }
      let(:ppcs) { PitchAndPitchClassSetCritic.new(order=2, lookahead=1) }
      before(:each) do
        2.times do
          ppcs.listen(note1)
          ppcs.reset!
        end
        1.times do
          ppcs.listen(note2)
          ppcs.reset!
        end
      end
      subject { ppcs.expectations }
      it { should be_an_instance_of Markov::RandomVariable }
      it "attributes lss information to the former" do
        subject.information_content_for(note1.pitch.val).should be < subject.information_content_for(note2.pitch.val)
      end
      it "only chooses observed pitches" do
        [note1.pitch.val, note2.pitch.val].should include(MusicIR::Pitch.new(*subject.sample).val)
      end
    end
  end

  describe ".current_pitch_class_set" do
    it "should return a PitchClassSet" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      ppcs.current_pitch_class_set.should be_an_instance_of MusicIR::PitchClassSet
    end
    it "should contain no more pitch classes than the 'order'" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      0.upto(10) { |i| ppcs.listen @nq1[i] }
      ppcs.current_pitch_class_set.vals.length.should be <= order
    end
    it "should contain some subset of pitch classes listened to" do
      ppcs = PitchAndPitchClassSetCritic.new(order=2, lookahead=1)
      expected_pcs = MusicIR::PitchClassSet.new
      0.upto(10) do |i| 
        cur_note = @nq1[i]
        ppcs.listen cur_note
        expected_pcs.add MusicIR::PitchClass.from_pitch(cur_note.pitch)
      end

      (ppcs.current_pitch_class_set.vals - expected_pcs.vals).should == []
    end
  end

end
