#!/usr/bin/env ruby

$LOAD_PATH << '.'
require 'rubymusic_improv'

#################
Dir[File.expand_path(File.join(File.dirname(__FILE__),'..','music','specs','vectors','*.rb'))].each {|f| require f}

#                                                          #Pitch    I'val    PaPCS    CPitch   Durat'n  DaBP     CDur'n    P/D I.C
#vector = $meter_vectors["Bring back my bonnie to me"]     #271.216  298.532  428.426  270.381  346.437  172.397  172.397   1.568
#vector = $meter_vectors["Somewhere over the rainbow"]
 vector = $meter_vectors["Battle hymn of the republic"]    #134.074  145.749  289.559  147.933   80.944  152.830   95.737   1.545
#vector = $meter_vectors["This train is bound for glory"]  #348.386  203.189  543.200  207.525  174.816  158.594  118.731   1.747
#vector = $meter_vectors["Bach Minuet (2)"]                #118.101  107.593  138.159   89.699   37.319   28.563   28.563   3.140
#vector = $meter_vectors["Bach Minuet in G"]               #158.397  166.228  251.859  168.165   60.667   88.020   50.675   3.319

notes = vector[:note_queue]
notes.detect_meter
notes.tag_with_notes_left
#################

puts "Initializing..."
i = InteractiveImprovisor.new

puts "Loading..."
i.load "data/production"

puts "Running..."
i.analyze_single_note_queue notes

puts "Running again..."
i.analyze_single_note_queue notes


