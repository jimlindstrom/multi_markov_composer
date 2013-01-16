#!/usr/bin/env ruby

require 'midilib'
require 'midilib/io/seqreader'

# Create a new, empty sequence.
seq = MIDI::Sequence.new()

# Read the contents of a MIDI file into the sequence.
File.open(ARGV[0], 'rb') do |file|
  seq.read(file) do |num_tracks, i|
  end
end

File.open(ARGV[1], 'wb') do |file|
  seq.tracks = seq.tracks[0..1]
  seq.write(file)
end

