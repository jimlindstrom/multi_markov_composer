#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'
require 'ruby-prof'

$MARKOV__SKIP_SLOW_ERROR_CHECKING = true 
#$FACTOR_ORACLE__SKIP_SLOW_ERROR_CHECKING = true

num_training_vectors = 4 
num_testing_vectors  = 1

i = InteractiveImprovisor.new

puts "Training..."
RubyProf.start
critic_infocontents = i.train(num_training_vectors, num_testing_vectors)
critic_infocontents.each do |c|
  printf "\t%33s: %6.4f bits/note\n", c[:critic].class, c[:mean_information_content]
end
#i.save "data/production"

result = RubyProf.stop
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
