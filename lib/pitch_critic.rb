#!/usr/bin/env ruby

class PitchCritic
  include CriticWithInfoContent

  def initialize(order)
    reset_cumulative_information_content
    @markov_chain = Markov::MarkovChain.new(MusicIR::Pitch.alphabet, order)
  end

  def reset!
    @markov_chain.reset!
  end

  def save(folder)
    filename = "#{folder}/pitch_critic_#{@markov_chain.order}.json"
    @markov_chain.save(filename)
  end

  def load(folder)
    filename = "#{folder}/pitch_critic_#{@markov_chain.order}.json"
    @markov_chain = Markov::MarkovChain.load(filename)
  end

  def information_content_for(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    next_symbol = note.pitch.to_symbol
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
    next_symbol = note.pitch.to_symbol
    @markov_chain.observe!(next_symbol)
    @markov_chain.transition!(next_symbol)
  end

  def expectations
    @markov_chain.expectations
  end
end
