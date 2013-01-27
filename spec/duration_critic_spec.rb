#!/usr/bin/env ruby 

require 'spec_helper'

describe DurationCritic do
  it_should_behave_like "a critic", DurationCritic, [order=1], "data/test/duration_critic_#{order}.json"

  describe ".reset!" do
    subject { DurationCritic.new(order=1) }
    context "after listening to one note" do
      before { subject.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))) }
      it "expects starting notes (as though nothing had been listened to)" do
        subject.reset!
        MusicIR::Duration.new(subject.expectations.sample).val.should == 1
      end
    end
  end

  describe ".listen" do
  end

  describe ".information_content" do
  end

  describe ".expectations" do
    context "when one note has been heard twice and a second one once" do
      let(:dc) { DurationCritic.new(order=1) }
      before(:all) do
        #puts "x: " + dc.expectations.observations.inspect
        2.times do
          dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1)))
          dc.reset!
        end
        1.times do
          dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(0)))
          dc.reset!
        end
      end
      subject { dc.expectations }
      it { should be_an_instance_of Markov::RandomVariable }
      it "attributes less information_content to the former state" do
        subject.information_content_for(1).should be < subject.information_content_for(0)
      end
      its(:sample) { should_not be_nil }
      it "returns a random variable that only chooses states observed" do
        #puts "x: " + subject.observations.inspect
        [0, 1].should include(MusicIR::Duration.new(subject.sample).val)
      end
    end
    context "given a 3rd order critic" do
      let(:dc) { DurationCritic.new(order=3) }
      context "after hearing 1,2,3,6 and 5,2,3,4 and 5,2,3" do
        before(:all) do
          [1,2,3,6].each do |x|
            dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(x)))
          end
          dc.reset!
          [5,2,3,4].each do |x|
            dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(x)))
          end
          dc.reset!
          [5,2,3].each do |x|
            dc.listen(MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(x)))
          end
        end
        subject { dc.expectations }
        it { should be_an_instance_of Markov::RandomVariable }
        it "chooses 4 (disabiguating the 2 strings based on the differing (n-3)th symbols)" do
          MusicIR::Duration.new(subject.sample).val.should == 4
        end
      end
    end
  end


end
