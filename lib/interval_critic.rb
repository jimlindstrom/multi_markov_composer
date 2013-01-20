#!/usr/bin/env ruby

class IntervalCritic
  include CriticWithInfoContent

  def initialize(order, lookahead)
    reset_cumulative_information_content
    #klass = Markov::AsymmetricBidirectionalBackoffMarkovChain
    #@markov_chain = klass.new(MusicIR::Interval.alphabet,
    #                          order, 
    #                          lookahead,
    #                          num_states=MusicIR::Interval.num_values)
    klass = Markov::MarkovChain
    @markov_chain = klass.new(MusicIR::Interval.alphabet,
                              order)
    reset!
  end

  def reset!
    @markov_chain.reset!
    @note_history = []
  end

  def save(folder)
    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.json"
    @markov_chain.save(filename)

    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'w') { |f| f.puts YAML::dump @note_history }
  end

  def load(folder)
    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.json"
    #@markov_chain = Markov::AsymmetricBidirectionalBackoffMarkovChain.load(filename)
    @markov_chain = Markov::MarkovChain.load(filename)

    filename = "#{folder}/interval_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'r') { |f| @note_history = YAML::load(f) }
  end

  def information_content_for(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must contain 'notes_left' analysis") if note.analysis[:notes_left].nil?

    tmp_note_history = @note_history.dup
    tmp_note_history.unshift note
    if tmp_note_history.length >= 2
      interval = MusicIR::Interval.calculate(tmp_note_history[-1].pitch, tmp_note_history[-2].pitch)
      next_symbol = interval.to_symbol
      if @markov_chain.expectations.num_observations > 0
        information_content = @markov_chain.expectations.information_content_for(next_symbol)
      else
        information_content = Markov::RandomVariable.max_information_content
      end
      add_to_cumulative_information_content information_content
      return information_content
    end
    return nil
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must contain 'notes_left' analysis") if note.analysis[:notes_left].nil?

    @note_history.unshift note
    if @note_history.length >= 2
      interval = MusicIR::Interval.calculate(@note_history[-1].pitch, @note_history[-2].pitch)
      @note_history.pop
      next_symbol = interval.to_symbol
      #@markov_chain.observe!(   next_symbol, note.analysis[:notes_left])
      #@markov_chain.transition!(next_symbol, note.analysis[:notes_left])
      @markov_chain.observe!(   next_symbol)
      @markov_chain.transition!(next_symbol)
    end
  end

  def expectations # outputs expectations in pitch-space
    return nil if @note_history.empty?

    # transform back from interval-space to pitch-space
    r = Markov::RandomVariable.new(MusicIR::Pitch.alphabet)
    @markov_chain.expectations.observations.each do |k,v|
      r.observe!(@note_history[-1].pitch.val + k, v)
    end
    r
  end
end
