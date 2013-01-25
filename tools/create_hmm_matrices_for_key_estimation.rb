#!/usr/bin/env ruby

PITCH_CLASSES = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
CHORD_TYPES = ["Maj","Min","Dim","Aug","Sus"]
SIMPLE_CHORD_TYPES = ["Maj","Min"]
SELF_TRANSITION_PROB = 0.25

CHORDS = PITCH_CLASSES.map { |pitch_class| CHORD_TYPES.map { |chord_type| pitch_class + " " + chord_type } }.flatten
SIMPLE_CHORDS = PITCH_CLASSES.map { |pitch_class| SIMPLE_CHORD_TYPES.map { |chord_type| pitch_class + " " + chord_type } }.flatten

class MsftData
  attr_reader :chord_prior_prob
  attr_reader :chord_trans_prob

  def initialize(filename)
    @chord_prior_prob = {}
    @chord_trans_prob = {}
    
    f = File.open(filename)
    
    dummy = f.gets # should be 60
    
    CHORDS.each do |chord|
      @chord_prior_prob[chord] = Math.exp(f.gets.chop.to_f)
    end
    
    dummy = f.gets # should be 60 60
    
    CHORDS.each do |chord1|
      @chord_trans_prob[chord1] = { }
      CHORDS.each do |chord2|
        @chord_trans_prob[chord1][chord2] = Math.exp(f.gets.chop.to_f)
      end
    end
    
    f.close
  end
end

if ARGV.length != 1
  puts "usage: #{__FILE__} <chord data filename>"
  exit 0
end
filename = ARGV[0]
msft_data = MsftData.new(filename)

puts "#!/usr/bin/env ruby"
puts
puts "# see: http://research.microsoft.com/en-us/um/people/dan/chords/"
puts "# see: https://github.com/dtkirsch/hmm/blob/master/test/test_hmm.rb"
puts


sum_of_simple_chord_prior_probs = msft_data.chord_prior_prob.select{ |chord,prob| SIMPLE_CHORDS.include?(chord) }
                                                            .values
                                                            .inject(:+)
simple_chord_prior_prob_keys    = msft_data.chord_prior_prob.select{ |chord,prob| SIMPLE_CHORDS.include?(chord) }
                                                            .keys
simple_chord_prior_prob_vals    = msft_data.chord_prior_prob.select{ |chord,prob| SIMPLE_CHORDS.include?(chord) }
                                                            .values
                                                            .map{ |prob| prob / sum_of_simple_chord_prior_probs }
simple_chord_prior_prob = Hash[simple_chord_prior_prob_keys.zip(simple_chord_prior_prob_vals)]
simple_chord_prior_prob_sorted_vals = SIMPLE_CHORDS.map{ |chord| simple_chord_prior_prob[chord] }
puts "$key_estimator_hmm_pi = NArray" + simple_chord_prior_prob_sorted_vals.inspect
puts

simple_trans_probs = []
SIMPLE_CHORDS.each_with_index do |chord1, chord1_idx|
  simple_chord_sum_prob = msft_data.chord_trans_prob[chord1].select{ |chord2, prob| SIMPLE_CHORDS.include?(chord2) }.values.inject(:+)
  trans_probs = SIMPLE_CHORDS.map do |chord2|
    msft_data.chord_trans_prob[chord1][chord2] / simple_chord_sum_prob * (1 - SELF_TRANSITION_PROB)
  end
  trans_probs[chord1_idx] += SELF_TRANSITION_PROB
  simple_trans_probs << trans_probs
end
puts "$key_estimator_hmm_a = NArray" + simple_trans_probs.inspect + ".transpose(1,0)"
puts

hmm_b = []
0.upto(11) do |offset|
  maj_scale = [1,0,1,0,1,1,0,1,0,1,0,1]
  maj_triad = [3,0,0,0,5,0,0,3,0,0,0,0]
  sum = maj_scale.zip(maj_triad).map{ |x| x[0]+x[1] }
  offset.times do
    sum = sum[-1..-1] + sum[0..-2]
  end
  k = sum.inject(:+).to_f
  hmm_b << sum.map{ |x| x/k }

  min_scale = [1,0,1,1,0,1,0,1,0.5,0.5,0.5,0.5]
  min_triad = [3,0,0,5,0,0,0,3,0,0,0,0]
  sum = min_scale.zip(min_triad).map{ |x| x[0]+x[1] }
  offset.times do
    sum = sum[-1..-1] + sum[0..-2]
  end
  k = sum.inject(:+).to_f
  hmm_b << sum.map{ |x| x/k }
end
puts "$key_estimator_hmm_b = NArray.to_na(#{hmm_b.inspect}).transpose(1,0)"
puts

