#!/usr/bin/env ruby

PITCH_CLASSES = ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
CHORD_TYPES = ["Maj","Min","Dim","Aug","Sus"]
SIMPLE_CHORD_TYPES = ["Maj","Min"]
SELF_TRANSITION_PROB = 0.25

CHORDS = PITCH_CLASSES.map { |pitch_class| CHORD_TYPES.map { |chord_type| pitch_class + " " + chord_type } }.flatten
SIMPLE_CHORDS = PITCH_CLASSES.map { |pitch_class| SIMPLE_CHORD_TYPES.map { |chord_type| pitch_class + " " + chord_type } }.flatten

chord_prob = {}
chord_trans_prob = {}

filename = ARGV[0]
f = File.open(filename)

dummy = f.gets # should be 60

CHORDS.each do |chord|
  chord_prob[chord] = Math.exp(f.gets.chop.to_f)
end

dummy = f.gets # should be 60 60

CHORDS.each do |chord1|
  chord_trans_prob[chord1] = { }
  CHORDS.each do |chord2|
    chord_trans_prob[chord1][chord2] = Math.exp(f.gets.chop.to_f)
  end
end

f.close

sum_of_chord_probs = chord_prob.select{ |chord,prob| SIMPLE_CHORDS.include?(chord) }.values.inject(:+)
simple_chord_prob = Hash[chord_prob.select{ |chord,prob| SIMPLE_CHORDS.include?(chord) }.keys.zip(chord_prob.select{ |chord,prob| SIMPLE_CHORDS.include?(chord) }.values.map{ |prob| prob / sum_of_chord_probs })]
puts "pi = NArray" + simple_chord_prob.values.inspect

simple_trans_probs = []
SIMPLE_CHORDS.each_with_index do |chord1, chord1_idx|
  simple_chord_sum_prob = chord_trans_prob[chord1].select{ |chord2, prob| SIMPLE_CHORDS.include?(chord2) }.values.inject(:+)
  trans_probs = SIMPLE_CHORDS.map do |chord2|
    chord_trans_prob[chord1][chord2] / simple_chord_sum_prob * (1 - SELF_TRANSITION_PROB)
  end
  trans_probs[chord1_idx] += SELF_TRANSITION_PROB
  simple_trans_probs << trans_probs
end
puts "a = NArray" + simple_trans_probs.inspect + ".transpose(1,0)"

