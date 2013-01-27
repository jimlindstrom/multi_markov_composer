#!/usr/bin/env ruby

class DurationCritic
  include CriticWithInfoContent

  def initialize(order)
    reset_cumulative_information_content
    @markov_chain = Markov::MarkovChain.new(MusicIR::Duration.alphabet, order)
    @factor_oracle = FactorOracle::FactorOracle.new
    @duration_buffer = []
  end

  def reset!
    @markov_chain.reset!
    @factor_oracle = FactorOracle::FactorOracle.new
    @duration_buffer = []
  end

  def save(folder)
    filename = "#{folder}/duration_critic_#{@markov_chain.order}.json"
    @markov_chain.save(filename)
  end

  def load(folder)
    filename = "#{folder}/duration_critic_#{@markov_chain.order}.json"
    @markov_chain = Markov::MarkovChain.load(filename)
  end

  def information_content_for(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    next_symbol = note.duration.to_symbol
    if expectations.num_observations > 0
      information_content = expectations.information_content_for(next_symbol)
    else
      information_content = Markov::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    next_symbol = note.duration.to_symbol
    @markov_chain.observe!(next_symbol)
    @markov_chain.transition!(next_symbol)

    @factor_oracle.add_letter(@duration_buffer, next_symbol)
    @duration_buffer << next_symbol
  end

  def expectations
    e_markov = @markov_chain.expectations

    e_factors = Markov::RandomVariable.new(e_markov.alphabet)
    #e_markov.alphabet.symbols.each { |sym| e_factors.observe!(sym, 1) } # start by observing everything once (FIXME: this is blowing up the tests by introducing 
    #                                                                    # expectations for symbols that have never been observed.
    #                                                                    # The point of it, though, was to ensure that weighting these expectations by entropy 
    #                                                                    # would work. Now it's going to overstate its confidence in contexts with few observations
    1.upto(@duration_buffer.length) do |prefix_len|
      @factor_oracle.next_letters_for(@duration_buffer.last(prefix_len)).each do |duration_symbol|
        e_factors.observe!(duration_symbol, prefix_len**2)
      end
    end

    if e_markov.num_observations == 0
      e_factors
    elsif e_factors.num_observations == 0
      e_markov
    else
      e_markov.normalized_and_weighted_by_entropy + e_factors.normalized_and_weighted_by_entropy
    end
  end
end
