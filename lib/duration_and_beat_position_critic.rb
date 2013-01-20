#!/usr/bin/env ruby

class DurationAndBeatPositionCritic
  include CriticWithInfoContent

  def initialize(order, lookahead)
    reset_cumulative_information_content
    klass = (order > 1) ?  Markov::AsymmetricBidirectionalBackoffMarkovChain : Markov::AsymmetricBidirectionalMarkovChain
    @markov_chain = klass.new(MusicIR::DurationAndBeatPosition.alphabet, 
                              MusicIR::Duration.alphabet, 
                              order, 
                              lookahead)
  end

  def reset!
    @markov_chain.reset!
  end

  def save(folder)
    filename = "#{folder}/duration_and_beat_position_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.json"
    @markov_chain.save(filename)
  end

  def load(folder)
    filename = "#{folder}/duration_and_beat_position_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.json"
    klass = (@markov_chain.order > 1) ?  Markov::AsymmetricBidirectionalBackoffMarkovChain : Markov::AsymmetricBidirectionalMarkovChain
    @markov_chain = klass.load(filename)
  end

  def information_content_for(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must have meter analysis") if note.analysis[:beat_position].nil?
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?
    next_outcome = note.duration.to_symbol
    next_state   = MusicIR::DurationAndBeatPosition.new(note.duration, note.analysis[:beat_position]).to_symbol
    expectations = @markov_chain.expectations
    if expectations.num_observations > 0
      information_content = expectations.information_content_for(next_outcome)
    else
      information_content = Markov::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must have meter analysis") if note.analysis[:beat_position].nil?
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?
    next_outcome = note.duration.to_symbol
    next_state   = MusicIR::DurationAndBeatPosition.new(note.duration, note.analysis[:beat_position]).to_symbol
    @markov_chain.observe!(next_outcome, note.analysis[:notes_left])
    @markov_chain.transition!(next_state, note.analysis[:notes_left])
  end

  def expectations
    @markov_chain.expectations
  end
end
