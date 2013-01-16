#!/usr/bin/env ruby

module CriticWithInfoContent
  attr_reader :cumulative_information_content

  def reset_cumulative_information_content
    @cumulative_information_content = 0.0
  end

  def add_to_cumulative_information_content(s)
    @cumulative_information_content += s
  end
end
