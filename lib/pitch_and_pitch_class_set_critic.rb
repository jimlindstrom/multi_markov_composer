#!/usr/bin/env ruby

class PitchAndPitchClassSetAlphabet < Markov::LiteralAlphabet
  def initialize
    letters = (0..(MusicIR::PitchAndPitchClassSet.num_values-1)).to_a
    super(letters)
  end
end

class PitchAndPitchClassSetCritic
  include CriticWithInfoContent

  def initialize(order, lookahead)
    reset_cumulative_information_content
    klass = Markov::AsymmetricBidirectionalBackoffMarkovChain
    @markov_chain = klass.new(PitchAndPitchClassSetAlphabet.new,
                              order, 
                              lookahead, 
                              num_states=MusicIR::PitchAndPitchClassSet.num_values)
    reset
  end

  def reset
    @markov_chain.reset!
    @note_history = []
  end

  def save(folder)
    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.yml"
    @markov_chain.save(filename)

    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'w') { |f| f.puts YAML::dump @note_history }
  end

  def load(folder)
    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.yml"
    @markov_chain = Markov::AsymmetricBidirectionalBackoffMarkovChain.load(filename)

    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'r') { |f| @note_history = YAML::load(f) }
  end

  def information_content(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?

    saved_note_history = @note_history.dup
    @note_history.push note
    pcs = current_pitch_class_set
    @note_history = saved_note_history

    next_outcome = note.pitch.to_symbol

    expectations = @markov_chain.expectations
    if expectations.num_observations > 0
      information_content = expectations.information_content_for(next_outcome.val)
    else
      information_content = Markov::RandomVariable.max_information_content
    end
    add_to_cumulative_information_content information_content
    return information_content
  end

  def listen(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?

    @note_history.push note
    pcs = current_pitch_class_set

    next_state   = MusicIR::PitchAndPitchClassSet.new(note.pitch, pcs).to_symbol
    next_outcome = note.pitch.to_symbol

    @markov_chain.observe!(next_outcome.val, note.analysis[:notes_left])
    @markov_chain.transition!(next_state.val, note.analysis[:notes_left])
  end

  def get_expectations
    @markov_chain.expectations
    #symbol_to_outcome = lambda { |x| MusicIR::PitchSymbol.new(x).to_object.val }
    #outcome_to_symbol = lambda { |x| MusicIR::Pitch.new(x).to_symbol.val }
    #r.transform_outcomes(symbol_to_outcome, outcome_to_symbol)
    #return r
  end

  def current_pitch_class_set
    wpcs = MusicIR::WeightedPitchClassSet.new()
    weight = 1.0
    (@note_history.length-1).downto(0) do |note_idx|
      cur_note=@note_history[note_idx]
      wpcs.add(MusicIR::PitchClass.from_pitch(cur_note.pitch), weight*cur_note.duration.val)
      weight *= 0.9
    end

    return wpcs.top_n_pitch_classes(@markov_chain.order)
  end
end
