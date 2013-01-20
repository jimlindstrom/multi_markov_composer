#!/usr/bin/env ruby

require 'spec_helper'

describe PitchCritic do

  it_should_behave_like "a critic", PitchCritic, [order=1], "data/test/pitch_critic_#{order}.json"

  describe ".reset!" do
    subject { PitchCritic.new(order=1) }
    context "notes have been listened to" do
      let(:first_pitch_val) { 1 }
      before { subject.listen(MusicIR::Note.new(MusicIR::Pitch.new(first_pitch_val), MusicIR::Duration.new(0))) }
      it "expects starting notes (as though nothing had been listened to)" do
        subject.reset!
        MusicIR::Pitch.new(subject.expectations.sample).val.should == first_pitch_val
      end
    end
  end

  describe ".listen" do
    pending
  end

  describe ".expectations" do
    context "when one note has been listened to twice and another only once" do
      let(:pc) { PitchCritic.new(order=1) }
      before(:all) do
        2.times do
          pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0)))
          pc.reset!
        end
        1.times do
          pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(0)))
          pc.reset!
        end
      end
      subject { pc.expectations }
      it { should be_an_instance_of Markov::RandomVariable }
      it "attributes less information content to the former" do
        subject.information_content_for(1).should be < subject.information_content_for(0)
      end
      it "chooses only states observed" do
        [0, 1].should include(MusicIR::Pitch.new(subject.sample).val)
      end
    end
    context "given a 3rd-order critic" do
      let(:pc) { PitchCritic.new(order=3) }
      context "after listening to 1,2,3,6 and 5,2,3,4 and 5,2,3" do
        before(:all) do
          [1,2,3,6].each do |x|
            pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(x), MusicIR::Duration.new(0)))
          end
          pc.reset!
          [5,2,3,4].each do |x|
            pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(x), MusicIR::Duration.new(0)))
          end
          pc.reset!
          [5,2,3].each do |x|
            pc.listen(MusicIR::Note.new(MusicIR::Pitch.new(x), MusicIR::Duration.new(0)))
          end
        end
        subject { pc.expectations }
        it "returns 4 (by distinguishing based on the (n-3)th symbol)" do
          MusicIR::Pitch.new(subject.sample).val.should == 4
        end
      end
    end
  end


end
