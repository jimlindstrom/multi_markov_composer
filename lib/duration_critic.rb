#!/usr/bin/env ruby

class DurationCritic
  include CriticWithInfoContent

  def initialize(order)
    reset_cumulative_information_content
    @markov_chain = Math::MarkovChain.new(order, Music::Duration.num_values)
  end

  def reset
    @markov_chain.reset
  end

  def save(folder)
    filename = "#{folder}/duration_critic_#{@markov_chain.order}.yml"
    @markov_chain.save(filename)
  end

  def load(folder)
    filename = "#{folder}/duration_critic_#{@markov_chain.order}.yml"
    @markov_chain = Math::MarkovChain.load(filename)
  end

  def information_content(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    next_symbol = note.duration.to_symbol
    expectations = @markov_chain.get_expectations
    if expectations.num_observations > 0
      information_content = expectations.information_content(next_symbol.val)
    else
      information_content = Math::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    next_symbol = note.duration.to_symbol
    @markov_chain.observe(next_symbol.val)
    @markov_chain.transition(next_symbol.val)
  end

  def get_expectations
    r = @markov_chain.get_expectations
    symbol_to_outcome = lambda { |x| Music::DurationSymbol.new(x).to_object.val }
    outcome_to_symbol = lambda { |x| Music::Duration.new(x).to_symbol.val }
    r.transform_outcomes(symbol_to_outcome, outcome_to_symbol)
    return r
  end
end
