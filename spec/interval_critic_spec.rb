require 'spec_helper'

describe IntervalCritic do
  let(:order)     { 2 }
  let(:lookahead) { 1 }

  it_should_behave_like "a critic", IntervalCritic, [order=2, lookahead=1], "data/test/interval_critic_#{order}_#{lookahead}.json"

  # sample data for tests below
  let(:note_without_notes_left)  { MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(0))                   }
  let(:valid_note_with_analysis) { MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1), {:notes_left=>3}) }

  describe ".reset!" do
    subject { IntervalCritic.new(order, lookahead) }
    let(:base_note1) { (rand*50).floor + 25 }
    let(:base_note3) { (rand*50).floor + 25 }
    let(:interval)   { (rand*20).floor - 10 }
    before do
      subject.listen MusicIR::Note.new(MusicIR::Pitch.new(base_note1           ), MusicIR::Duration.new(1), {:notes_left=>2})
      subject.listen MusicIR::Note.new(MusicIR::Pitch.new(base_note1 + interval), MusicIR::Duration.new(1), {:notes_left=>1})
      subject.reset!
      subject.listen MusicIR::Note.new(MusicIR::Pitch.new(base_note3           ), MusicIR::Duration.new(1), {:notes_left=>2})
    end

    it "should reset to the state in which no notes have been heard yet" do
      (MusicIR::Pitch.new(subject.expectations.sample).val - base_note3).should == interval
    end
  end

  describe ".listen" do
    subject { IntervalCritic.new(order, lookahead) }
    it "should raise an error if the note analysis does not contain notes_left" do
      expect { subject.listen(note_without_notes_left) }.to raise_error
    end
  end

  describe ".information_content_for" do
    let(:ic) { IntervalCritic.new(order, lookahead) }
    context "if the note does not contain a notes_left analysis" do
      it "should raise an error" do
        expect { ic.information_content_for(note_without_notes_left) }.to raise_error
      end
    end
    context "before any notes have been heard" do
      it "should return nil" do
        ic.information_content_for(valid_note_with_analysis).should be_nil
      end
    end
    context "if 1 or more valid notes have been heard" do
      before do
        note = MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1), {:notes_left=>3})
        ic.information_content_for(note)
        ic.listen(note)
      end
  
      it "should return the information_content associated with the given note" do
        note = MusicIR::Note.new(MusicIR::Pitch.new(9), MusicIR::Duration.new(1), {:notes_left=>2})
        ic.information_content_for(note).should be_within(0.001).of(Markov::RandomVariable.max_information_content)
      end
    end
  end

  describe ".expectations" do
    context "having heard one interval once and another twice" do
      let(:ic) { IntervalCritic.new(order, lookahead) }
      let(:interval1) { 1 }
      let(:interval2) { 2 }
      before do
        1.times do
          base_pitch = (20..50).to_a.sample
          [ MusicIR::Note.new(MusicIR::Pitch.new(base_pitch          ), MusicIR::Duration.new(1), {:notes_left=>3}),
            MusicIR::Note.new(MusicIR::Pitch.new(base_pitch+interval1), MusicIR::Duration.new(1), {:notes_left=>2}) ].each do |note|
            dummy = ic.information_content_for(note)
            ic.listen(note)
          end
          ic.reset!
        end
  
        2.times do
          base_pitch = (20..50).to_a.sample
          [ MusicIR::Note.new(MusicIR::Pitch.new(base_pitch          ), MusicIR::Duration.new(1), {:notes_left=>3}),
            MusicIR::Note.new(MusicIR::Pitch.new(base_pitch+interval2), MusicIR::Duration.new(1), {:notes_left=>2}) ].each do |note|
            dummy = ic.information_content_for(note)
            ic.listen(note)
          end
          ic.reset!
        end
  
        note = MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1), {:notes_left=>3})
        dummy = ic.information_content_for(note)
        ic.listen(note)
      end
      subject { ic.expectations }
      it { should be_a Markov::RandomVariable }
      it "should be more surprised by the former (less-observed) interval" do
        less_observed_interval = MusicIR::Pitch.new(interval1).val
        more_observed_interval = MusicIR::Pitch.new(interval2).val
        subject.information_content_for(less_observed_interval).should be > subject.information_content_for(more_observed_interval)
      end
    end
    context "having heard one interval once" do
      let(:ic) { IntervalCritic.new(order, lookahead) }
      it "returns a random variable that only chooses that interval" do
  
        base_note = (25..50).to_a.sample
        interval  = (-5..5).to_a.sample
  
        notes = []
        notes << MusicIR::Note.new(MusicIR::Pitch.new(base_note), MusicIR::Duration.new(1), {:notes_left=>3})
        notes << MusicIR::Note.new(MusicIR::Pitch.new(base_note + interval), MusicIR::Duration.new(1), {:notes_left=>2})
        notes.each do |note|
          dummy = ic.information_content_for(note)
          ic.listen(note)
        end
        ic.reset!
  
        base_note = (rand*50).floor + 25
  
        note = MusicIR::Note.new(MusicIR::Pitch.new(base_note), MusicIR::Duration.new(1), {:notes_left=>3})
        dummy = ic.information_content_for(note)
        ic.listen(note)
  
        x = ic.expectations
        MusicIR::Pitch.new(x.sample).val.should == (base_note + interval)
      end
    end
    it "returns a random variable that only chooses states observed (higher order)" do
      ic = IntervalCritic.new(order=3, lookahead=1)

      notes = []
      notes << MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1), {:notes_left=>8})
      notes << MusicIR::Note.new(MusicIR::Pitch.new(1), MusicIR::Duration.new(1), {:notes_left=>7}) # 1
      notes << MusicIR::Note.new(MusicIR::Pitch.new(2), MusicIR::Duration.new(1), {:notes_left=>6}) # 1
      notes << MusicIR::Note.new(MusicIR::Pitch.new(3), MusicIR::Duration.new(1), {:notes_left=>5}) # 1
      notes << MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1), {:notes_left=>4}) # 3
      notes.each do |note|
        dummy = ic.information_content_for(note)
        ic.listen(note)
      end
      ic.reset!

      notes = []
      notes << MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1), {:notes_left=>8})
      notes << MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(1), {:notes_left=>7}) # 5
      notes << MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1), {:notes_left=>6}) # 1
      notes << MusicIR::Note.new(MusicIR::Pitch.new(7), MusicIR::Duration.new(1), {:notes_left=>5}) # 1
      notes << MusicIR::Note.new(MusicIR::Pitch.new(8), MusicIR::Duration.new(1), {:notes_left=>5}) # 1
      notes.each do |note|
        dummy = ic.information_content_for(note)
        ic.listen(note)
      end
      ic.reset!

      notes = []
      notes << MusicIR::Note.new(MusicIR::Pitch.new(0), MusicIR::Duration.new(1), {:notes_left=>8})
      notes << MusicIR::Note.new(MusicIR::Pitch.new(5), MusicIR::Duration.new(1), {:notes_left=>7}) # 5
      notes << MusicIR::Note.new(MusicIR::Pitch.new(6), MusicIR::Duration.new(1), {:notes_left=>6}) # 1
      notes << MusicIR::Note.new(MusicIR::Pitch.new(7), MusicIR::Duration.new(1), {:notes_left=>5}) # 1
      notes.each do |note|
        dummy = ic.information_content_for(note)
        ic.listen(note)
      end

      x = ic.expectations
      last_note = 7
      expected_interval = 1
      MusicIR::Pitch.new(x.sample).val.should == (last_note + expected_interval)
    end
  end


end
