#!/usr/bin/env ruby

class DurationAndBeatPositionCritic
  include CriticWithInfoContent

  def initialize(order, lookahead)
    reset_cumulative_information_content
    @markov_chain = Math::AsymmetricBidirectionalBackoffMarkovChain.new(order, 
                                                                        lookahead, 
                                                                        num_states=Music::DurationAndBeatPosition.num_values, 
                                                                        num_outcomes=Music::Duration.num_values)
  end

  def reset
    @markov_chain.reset
  end

  def save(folder)
    filename = "#{folder}/duration_and_beat_position_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.yml"
    @markov_chain.save(filename)
  end

  def load(folder)
    filename = "#{folder}/duration_and_beat_position_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.yml"
    @markov_chain = Math::AsymmetricBidirectionalBackoffMarkovChain.load(filename)
  end

  def information_content(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    raise ArgumentError.new("note must have meter analysis") if note.analysis[:beat_position].nil?
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?
    next_outcome = note.duration.to_symbol
    next_state   = Music::DurationAndBeatPosition.new(note.duration, note.analysis[:beat_position]).to_symbol
    expectations = @markov_chain.get_expectations
    if expectations.num_observations > 0
      information_content = expectations.information_content(next_outcome.val)
    else
      information_content = Math::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    raise ArgumentError.new("note must have meter analysis") if note.analysis[:beat_position].nil?
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?
    next_outcome = note.duration.to_symbol
    next_state   = Music::DurationAndBeatPosition.new(note.duration, note.analysis[:beat_position]).to_symbol
    @markov_chain.observe(next_outcome.val, note.analysis[:notes_left])
    @markov_chain.transition(next_state.val, note.analysis[:notes_left])
  end

  def get_expectations
    r = @markov_chain.get_expectations
    symbol_to_outcome = lambda { |x| Music::DurationSymbol.new(x).to_object.val }
    outcome_to_symbol = lambda { |x| Music::Duration.new(x).to_symbol.val }
    r.transform_outcomes(symbol_to_outcome, outcome_to_symbol)
    return r
  end
end
