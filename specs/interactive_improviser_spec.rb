#!/usr/bin/env ruby 

require 'spec_helper'

describe InteractiveImprovisor do
  context ".new" do
    it "should create a new InteractiveImprovisor" do
      i = InteractiveImprovisor.new
      i.should be_an_instance_of InteractiveImprovisor
    end
  end

  context ".train" do
    it "should return a hash of each critic and it's cumulative information_content over the testing vectors" do
      i = InteractiveImprovisor.new
      num_training_vectors = 2
      num_testing_vectors  = 2
      i.train(num_training_vectors, num_testing_vectors).first.keys.should == [:critic, :cum_information_content]
    end
    it "should cause critics to get smarter and have lower cumulative information_content over testing vectors" do
      i = InteractiveImprovisor.new
      num_training_vectors = 4
      num_testing_vectors  = 10
      cum_error_less_training = i.train(num_training_vectors, num_testing_vectors)

      i = InteractiveImprovisor.new
      num_training_vectors = 16
      num_testing_vectors  = 10
      cum_error_more_training = i.train(num_training_vectors, num_testing_vectors)

      cum_error_more_training.first[:cum_information_content].should < cum_error_less_training.first[:cum_information_content]
    end
  end

  context ".save" do
    it "should save all the critices to <folder>/*critic*.yml" do
      i = InteractiveImprovisor.new
      num_training_vectors = 5
      num_testing_vectors  = 0
      i.train(num_training_vectors, num_testing_vectors)
      Dir[File.expand_path(File.join(File.dirname(__FILE__),"..","data","test",'*yml'))].each { |f| File.delete(f) }
      i.save "data/test"
      Dir[File.expand_path(File.join(File.dirname(__FILE__),"..","data","test",'*yml'))].length.should > 1
    end
  end

  context ".load" do
    it "should load all the critices from <folder>/*critic*.yml" do
      i = InteractiveImprovisor.new
      num_training_vectors = 5
      num_testing_vectors  = 0
      i.train(num_training_vectors, num_testing_vectors)
      Dir[File.expand_path(File.join(File.dirname(__FILE__),"..","data","test",'*yml'))].each { |f| File.delete(f) }
      i.save "data/test"

      i2 = InteractiveImprovisor.new
      i2.load "data/test"
      pending
    end
  end

  context ".run" do
    it "should listen for stimuli and play responses" do
      i = InteractiveImprovisor.new
      num_training_vectors = 10
      num_testing_vectors  = 0
      i.train(num_training_vectors, num_testing_vectors)
      use_real_midi=false
      i.run(use_real_midi)
      pending("still need to test side effects")
    end
  end

  context ".get_single_improvisation" do
    before(:all) do
      @i = InteractiveImprovisor.new
      num_training_vectors = 10
      num_testing_vectors  = 0
      @i.train(num_training_vectors, num_testing_vectors)
    end
    it "should generate metrically-intelligable improvisations >70% of the time" do
      correct_detections = 0
      10.times do
        nq = @i.get_single_improvisation
        if nq.detect_meter
          # an even better test would be to see if the detected meter is the same as the planned meter
          correct_detections += 1
        end
      end
      correct_detections.should be > 7
    end
  end
end
