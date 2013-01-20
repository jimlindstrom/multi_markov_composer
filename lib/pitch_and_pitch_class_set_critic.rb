#!/usr/bin/env ruby

class PitchAndPitchClassSetCritic
  include CriticWithInfoContent

  def initialize(order, lookahead)
    reset_cumulative_information_content
    klass = (order > 1) ?  Markov::AsymmetricBidirectionalBackoffMarkovChain : Markov::AsymmetricBidirectionalMarkovChain
    @markov_chain = klass.new(MusicIR::PitchAndPitchClassSet.alphabet,
                              MusicIR::Pitch.alphabet,
                              order, 
                              lookahead)
    reset!
  end

  def reset!
    @markov_chain.reset!
    @note_history = []
  end

  def save(folder)
    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.json"
    @markov_chain.save(filename)

    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'w') { |f| f.puts YAML::dump @note_history }
  end

  def load(folder)
    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}.json"
    klass = (@markov_chain.order > 1) ?  Markov::AsymmetricBidirectionalBackoffMarkovChain : Markov::AsymmetricBidirectionalMarkovChain
    @markov_chain = klass.load(filename)

    filename = "#{folder}/pitch_and_pitch_class_set_critic_#{@markov_chain.order}_#{@markov_chain.lookahead}_note_history.yml"
    File.open(filename, 'r') { |f| @note_history = YAML::load(f) }
  end

  def information_content_for(note)
    raise ArgumentError.new("not a note.  is a #{note.class}") if note.class != MusicIR::Note
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?

    saved_note_history = @note_history.dup
    @note_history.push note
    pcs = current_pitch_class_set
    @note_history = saved_note_history

    next_outcome = note.pitch.to_symbol

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
    raise ArgumentError.new("note must have notes_left analysis") if note.analysis[:notes_left].nil?

    @note_history.push note
    pcs = current_pitch_class_set

    output_symbol = note.pitch.to_symbol
    input_symbol  = MusicIR::PitchAndPitchClassSet.new(note.pitch, pcs).to_symbol

    @markov_chain.observe!(output_symbol, note.analysis[:notes_left])
    @markov_chain.transition!(input_symbol, note.analysis[:notes_left])
  end

  def expectations
    @markov_chain.expectations
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
