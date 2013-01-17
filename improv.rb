#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'

i = InteractiveImprovisor.new

puts "Loading..."
i.load "data/production"

puts "Running..."
i.run

