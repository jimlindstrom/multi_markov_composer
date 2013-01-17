#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'

num_training_vectors = 400 # there are 1300+ available
num_testing_vectors  =  20

i = InteractiveImprovisor.new

puts "Training..."
critic_infocontents = i.train(num_training_vectors, num_testing_vectors)
critic_infocontents.each do |c|
  puts "\t#{c[:critic].class}: #{c[:cum_information_content]}"
end
i.save "data/production"

