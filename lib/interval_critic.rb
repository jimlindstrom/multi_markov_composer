#!/usr/bin/env ruby

class IntervalCritic
  include CriticWithInfoContent

  def initialize(order, lookahead)
    reset_cumulative_information_content
    @markov_chain = Math::AsymmetricBidirectionalBackoffMarkovChain.new(order, 
                                                                        lookahead,
                                                                        num_states=Music::Interval.num_values, 
                                                                        num_outcomes=Music::Interval.num_values)
    reset
  end

  def reset
    @markov_chain.reset
    @note_history = []
  end

  def save(folder)
    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.yml"
    @markov_chain.save(filename)

    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'w') { |f| f.puts YAML::dump @note_history }
  end

  def load(folder)
    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.yml"
    @markov_chain = Math::AsymmetricBidirectionalBackoffMarkovChain.load(filename)

    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'r') { |f| @note_history = YAML::load(f) }
  end

  def information_content(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    raise ArgumentError.new("note must contain 'notes_left' analysis") if note.analysis[:notes_left].nil?

    tmp_note_history = @note_history.dup
    tmp_note_history.unshift note
    if tmp_note_history.length >= 2
      interval = Music::Interval.calculate(tmp_note_history[-1].pitch, tmp_note_history[-2].pitch)
      next_symbol = interval.to_symbol
	  expectations = @markov_chain.get_expectations
	  if expectations.num_observations > 0
	    information_content = expectations.information_content(next_symbol.val)
	  else
        information_content = Math::RandomVariable.max_information_content
	  end
      add_to_cumulative_information_content information_content
      return information_content
    end
    return nil
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != Music::Note
    raise ArgumentError.new("note must contain 'notes_left' analysis") if note.analysis[:notes_left].nil?

    @note_history.unshift note
    if @note_history.length >= 2
      interval = Music::Interval.calculate(@note_history[-1].pitch, @note_history[-2].pitch)
      @note_history.pop
      next_symbol = interval.to_symbol
      @markov_chain.observe(next_symbol.val, note.analysis[:notes_left])
      @markov_chain.transition(next_symbol.val, note.analysis[:notes_left])
    end
  end

  def get_expectations
    return nil if @note_history.empty?

    r = @markov_chain.get_expectations
    symbol_to_outcome = lambda { |x| Music::IntervalSymbol.new(x).to_object.val + @note_history[-1].pitch.val }
    outcome_to_symbol = lambda { |x| Music::Interval.new(x - @note_history[-1].pitch.val).to_symbol.val }
    r.transform_outcomes(symbol_to_outcome, outcome_to_symbol)
    return r
  end
end
