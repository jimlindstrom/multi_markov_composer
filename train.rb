#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'

$MARKOV__SKIP_SLOW_ERROR_CHECKING = true 

num_training_vectors = 370 # there are 1300+ available. Only ~400 are being loaded in the spec/vectors/*_short* file, though
num_testing_vectors  =  20

i = InteractiveImprovisor.new

puts "Training..."
critic_infocontents = i.train(num_training_vectors, num_testing_vectors)
critic_infocontents.each do |c|
  printf "\t%30s: %6.4f bits/note\n", c[:critic].class, c[:mean_information_content]
end
i.save "data/production"

