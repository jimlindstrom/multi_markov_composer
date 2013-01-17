#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'
Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','music','specs','vectors','*.rb'))].each {|f| require f}

puts "Opening port"
@performer   = MidiPerformer.new("TiMidity port 1")

#$phrasing_vectors.keys.sort.each do |key|
  key = $phrasing_vectors.keys.sort[19]
  puts "playing #{key}"
  vector = $phrasing_vectors[key]
  nq = vector[:note_queue]
  @performer.perform nq.to_event_queue
#end

puts "closing"
@performer.close

puts "done!"


