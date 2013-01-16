require 'markov'
require 'music_ir'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require File.join(File.dirname(__FILE__), 'lib', 'duration_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'interval_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'pitch_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'meter_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'beat_position_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'duration_and_beat_position_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'pitch_class_set_symbol')
require File.join(File.dirname(__FILE__), 'lib', 'pitch_and_pitch_class_set_symbol.rb')

require File.join(File.dirname(__FILE__), 'lib', 'critic')
require File.join(File.dirname(__FILE__), 'lib', 'duration_critic')
require File.join(File.dirname(__FILE__), 'lib', 'duration_and_beat_position_critic')
require File.join(File.dirname(__FILE__), 'lib', 'pitch_and_pitch_class_set_critic')
require File.join(File.dirname(__FILE__), 'lib', 'pitch_critic')
require File.join(File.dirname(__FILE__), 'lib', 'interval_critic')
require File.join(File.dirname(__FILE__), 'lib', 'complex_pitch_critic')
require File.join(File.dirname(__FILE__), 'lib', 'complex_duration_critic')

require File.join(File.dirname(__FILE__), 'lib', 'duration_generator')
require File.join(File.dirname(__FILE__), 'lib', 'pitch_generator')

require File.join(File.dirname(__FILE__), 'lib', 'listener')
require File.join(File.dirname(__FILE__), 'lib', 'improvisor')
require File.join(File.dirname(__FILE__), 'lib', 'note_generator')

require File.join(File.dirname(__FILE__), 'lib', 'sensor')
require File.join(File.dirname(__FILE__), 'lib', 'fake_sensor')

require File.join(File.dirname(__FILE__), 'lib', 'performer')
require File.join(File.dirname(__FILE__), 'lib', 'fake_performer')

require File.join(File.dirname(__FILE__), 'lib', 'interactive_improvisor')
