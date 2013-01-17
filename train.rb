#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'

num_training_vectors = 400 # there are 1300+ available
num_testing_vectors  =  20

i = InteractiveImprovisor.new

puts "Training..."
surprises = i.train(num_training_vectors, num_testing_vectors)
surprises.each do |s|
  puts "\t#{s[:critic].class}: #{s[:cum_information_content]}"
end
i.save "data/production"

