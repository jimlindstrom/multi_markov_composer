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


if seq.tracks[0].events.select{ |e| e.respond_to?(:minor_key?) }.length != 1
  raise RuntimeError.new("Has more than one key signiture")
end
if seq.tracks[0].events.select{ |e| e.respond_to?(:denominator) }.length != 1
  raise RuntimeError.new("Has more than one time signiture")
end
if seq.tracks[0].events.select{ |e| e.respond_to?(:tempo) }.length != 1
  raise RuntimeError.new("Has more than one tempo")
end


puts "  \"File: #{ARGV[0]}\" =>"
puts "  {"

puts "    :ppqn => #{seq.ppqn},"

majorkeys = ['Cb', 'Gb', 'Db', 'Ab', 'Eb', 'Bb', 'F', 'C', 'G', 'D', 'A', 'E', 'B', 'F#', 'C#']
minorkeys = ['Ab', 'Eb', 'Bb', 'F', 'C', 'G', 'D', 'A', 'E', 'B', 'F#', 'C#', 'G#', 'D#', 'A#']

seq.tracks[0].events.each do |e|
  if e.respond_to?(:minor_key?) # what if there are two of these??
    mode = (e.major_key?) ? :major : :minor

    if e.major_key?
      pitch_class = majorkeys[e.sharpflat + 7]
    else
      pitch_class = minorkeys[e.sharpflat + 7]
    end

    puts "    :key_sig => MusicIR::Chord.new(MusicIR::PitchClass.from_s(\"#{pitch_class}\"), :#{mode}),"

  elsif e.respond_to?(:denominator)
    puts "    :time_sig_numerator => #{e.numerator},"
    puts "    :time_sig_denominator => #{2**e.denominator},"
    puts "    :time_sig_ticks => #{e.metronome_ticks}, # ticks (timestamp units) / quarter note"

  elsif e.respond_to?(:tempo)
    puts "    :tempo => #{e.tempo}, # msec / quarter note"
  end
end


puts "    :events =>"
puts "    ["

seq.tracks[1].events.each do |e|
  timestamp = e.time_from_start
  if e.respond_to?(:off)
    pitch    = e.note
    velocity = e.velocity
    puts "      MusicIR::NoteOnEvent.new({:pitch => #{pitch}, :velocity => #{velocity}, :timestamp => #{timestamp}}),"
  elsif e.respond_to?(:on)
    pitch    = e.note
    velocity = e.velocity
    puts "      MusicIR::NoteOffEvent.new({:pitch => #{pitch}, :velocity => #{velocity}, :timestamp => #{timestamp}}),"
  end
end


puts "    ],"
puts "  },"
