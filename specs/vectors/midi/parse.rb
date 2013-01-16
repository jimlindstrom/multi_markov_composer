#!/usr/bin/env ruby

require 'midilib'
require 'midilib/io/seqreader'

# Create a new, empty sequence.
seq = MIDI::Sequence.new()

# Read the contents of a MIDI file into the sequence.
File.open(ARGV[0], 'rb') do |file|
  #puts "reading file #{file}"
  seq.read(file) do |num_tracks, i|
    #puts "read track #{i} of #{num_tracks}"
  end
end

puts "\t\"File: #{ARGV[0]}\" =>"
puts "\t{"

#majorkeys = ['c flat', 'g flat', 'd flat', 'a flat', 'e flat', 'b flat', 'f', 'c', 'g', 'd', 'a', 'e', 'b', 'f sharp', 'c sharp']
#minorkeys = ['a flat', 'e flat', 'b flat', 'f', 'c', 'g', 'd', 'a', 'e', 'b', 'f sharp', 'c sharp', 'g sharp', 'd sharp', 'a sharp']
#
#seq.tracks[0].events.each do |e|
#  if e.respond_to?(:minor_key?) # what if there are two of these??
#    is_major = (e.major_key?)     ? "true" : "false"
#    is_sharp = (e.sharpflat >= 0) ? "true" : "false"
#
#    if e.major_key?
#      pitch_class = majorkeys[e.sharpflat + 7]
#    else
#      pitch_class = minorkeys[e.sharpflat + 7]
#    end
#
#    puts "\t\t:key_sig => Music::KeySignature.new(is_major=#{is_major}, is_sharp=#{is_sharp}, pitch_class=\"#{pitch_class}\"),"
#  end
#end

puts "\t\t:events =>"
puts "\t\t["

seq.tracks[1].events.each do |e|
  timestamp = e.time_from_start
  if e.respond_to?(:off)
    pitch    = e.note
    velocity = e.velocity
    puts "\t\t\tMidi::NoteOnEvent.new({:pitch => #{pitch}, :velocity => #{velocity}, :timestamp => #{timestamp}}),"
  elsif e.respond_to?(:on)
    pitch    = e.note
    velocity = e.velocity
    puts "\t\t\tMidi::NoteOffEvent.new({:pitch => #{pitch}, :velocity => #{velocity}, :timestamp => #{timestamp}}),"
  end
end


puts "\t\t],"
puts "\t},"
