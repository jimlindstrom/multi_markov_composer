$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/lib")

require "bundler"

require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
end

desc "Regenerate the parameters for the hidden markov model in the key estimator"
task :regenerate_key_estimator do
  sh "./tools/create_hmm_matrices_for_key_estimation.rb tools/chord_stats/pop_genre__chord_stats.txt > lib/key_estimator_chord_stats.rb"
end

task :default => :spec
