#!/usr/bin/env ruby 

require 'spec_helper'

describe IntervalCritic do
  it_should_behave_like "a critic", IntervalCritic, [order=2, lookahead=1], "data/test/interval_critic_#{order}_#{lookahead}.yml"

  context ".reset" do
    it "should reset to the state in which no notes have been heard yet" do
      ic = IntervalCritic.new(order=2, lookahead=1)

      base_note = (rand*50).floor + 25
      interval = (rand*20).floor - 10

      note = MusicIR::Note.new(MusicIR::Pitch.new(base_note), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      ic.listen note

      note = MusicIR::Note.new(MusicIR::Pitch.new(base_note + interval), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 1
      ic.listen note

      ic.reset

      base_note = (rand*50).floor + 25

      note = MusicIR::Note.new(MusicIR::Pitch.new(base_note), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      ic.listen note

      x = ic.get_expectations
      MusicIR::Pitch.new(x.sample).val.should == (base_note + interval)
    end
  end

  context ".listen" do
    it "should raise an error if the note analysis does not contain notes_left" do
      ic = IntervalCritic.new(order=2, lookahead=1)
      expect { ic.listen(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0))) }.to raise_error
    end
  end

  context ".information_content" do
    it "should raise an error if the note analysis does not contain notes_left" do
      ic = IntervalCritic.new(order=2, lookahead=1)
      expect { ic.information_content(MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0))) }.to raise_error
    end
    it "should return nil, if zero notes have been heard" do
      ic = IntervalCritic.new(order=2, lookahead=1)

      note = MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      ic.information_content(note).should be_nil
    end
    it "should return the information_content associated with the given note, if 1 or more notes have been heard" do
      ic = IntervalCritic.new(order=2, lookahead=1)

      note = MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(9), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      ic.information_content(note).should be_within(0.001).of(Markov::RandomVariable.max_information_content)
    end
  end

  context ".get_expectations" do
    it "returns a random variable that is less information_contentd about states observed more often" do
      ic = IntervalCritic.new(order=2, lookahead=1)

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      dummy = ic.information_content(note)
      ic.listen(note)

      ic.reset

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      dummy = ic.information_content(note)
      ic.listen(note)

      ic.reset

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      dummy = ic.information_content(note)
      ic.listen(note)

      ic.reset

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      dummy = ic.information_content(note)
      ic.listen(note)

      x = ic.get_expectations
      x.information_content(MusicIR::Pitch.new(1).val).should be < x.information_content(MusicIR::Pitch.new(0).val)
    end
    it "returns a random variable that only chooses states observed" do
      ic = IntervalCritic.new(order=2, lookahead=1)

      base_note = (rand*50).floor + 25
      interval  = (rand*10).floor - 5

      note = MusicIR::Note.new(MusicIR::Pitch.new(base_note), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(base_note + interval), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 2
      dummy = ic.information_content(note)
      ic.listen(note)

      ic.reset

      base_note = (rand*50).floor + 25

      note = MusicIR::Note.new(MusicIR::Pitch.new(base_note), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 3
      dummy = ic.information_content(note)
      ic.listen(note)

      x = ic.get_expectations
      MusicIR::Pitch.new(x.sample).val.should == (base_note + interval)
    end
    it "returns a random variable that only chooses states observed (higher order)" do
      ic = IntervalCritic.new(order=3, lookahead=1)

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 8
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 7
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 6
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 5
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1)) # 3
      note.analysis[:notes_left] = 4
      dummy = ic.information_content(note)
      ic.listen(note)

      ic.reset

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 8
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(1)) # 5
      note.analysis[:notes_left] = 7
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 6
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(7), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 5
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(8), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 4
      dummy = ic.information_content(note)
      ic.listen(note)

      ic.reset

      note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1))
      note.analysis[:notes_left] = 8
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(1)) # 5
      note.analysis[:notes_left] = 7
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 6
      dummy = ic.information_content(note)
      ic.listen(note)

      note = MusicIR::Note.new(MusicIR::Pitch.new(7), MusicIR::Duration.new(1)) # 1
      note.analysis[:notes_left] = 5
      dummy = ic.information_content(note)
      ic.listen(note)

      10.times do # it's probabalistic, so let's try it a few times
        x = ic.get_expectations
        last_note = 7
        expected_interval = 1
        MusicIR::Pitch.new(x.sample).val.should == (last_note + expected_interval)
      end
    end
  end


end
