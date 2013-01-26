$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path("#{File.dirname(__FILE__)}/lib")

require "bundler"

require 'rspec'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/*_spec.rb'
end

task :default => :spec
