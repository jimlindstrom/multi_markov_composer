#!/usr/bin/env ruby

class Performer
  def initialize
    raise RuntimeError.new("Cannot instantiate abstract base class.")
  end

  def perform
    raise RuntimeError.new("Cannot instantiate abstract base class.")
  end
end
