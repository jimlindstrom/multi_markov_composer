$meter_vectors = {}
$phrasing_vectors = {}

###############################################################################
# MusicIR::Notes
###############################################################################

PFs3 = PGb3 = 54
PG3  =        55
PGs3 = PAb3 = 56
PA3  =        57
PAs3 = PBb3 = 58
PB3  =        59

PC4  =        60
PCs4 = PDb4 = 61
PD4  =        62
PDs4 = PEb4 = 63
PE4  =        64
PF4  =        65
PFs4 = PGb4 = 66
PG4  =        67
PGs4 = PAb4 = 68
PA4  =        69
PAs4 = PBb4 = 70
PB4  =        71

PC5  =        72
PCs5 = PDb5 = 73
PD5  =        74
PDs5 = PEb5 = 75
PE5  =        76
PF5  =        77
PFs5 =        78
PG5  =        79

###############################################################################
# My Bonnie Lies Over The Ocean
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 80

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # my			0		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # bon-		1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # -nie		2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # lies		3

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # o-			4	
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # -ver		5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		6

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # o-			7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(4)) # -cean		8		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # my			9		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # bon-		10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # -nie		11
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # lies		12

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # o-			13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # -ver		14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # the		15

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(5)) # sea		16		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # my			17		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # bon-		18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # -nie		19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # lies		20

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # o-			21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # -ver		22
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		23

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # o-			24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(4)) # -cean		25		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # so			26		++
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # bring		27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # back		28
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # my			29

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bon-		30
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -nie		31
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # to			32

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(6)) # me			33		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # bring		34		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # back		35

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # bring		36

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # back		37		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # oh			38		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bring		39
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # back		40
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # my			41
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bon-		42
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -nie		43
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # to			44
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # me,		45
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # to			46
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # me			47		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # bring		48		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # back		49

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # bring		50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # back		51		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) # oh			52		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bring		53
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # back		54
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # my			55
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # bon-		56
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -nie		57
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # to			58
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(6)) # me			59		--

m = MusicIR::Meter.new(3, 4, 1) # 3/4 time, quarter note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: beat 3 
b.subbeat     = 0 # 0-based: first subbeat
b.beats_per_measure = 3 # 0-based: beat 3 
b.subbeats_per_beat = 1 # 0-based: first subbeatision

$meter_vectors["Bring back my bonnie to me"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  8 })
phrases.push({ :start_idx =>  9, :end_idx => 16 })
phrases.push({ :start_idx => 17, :end_idx => 25 })
phrases.push({ :start_idx => 26, :end_idx => 33 })
phrases.push({ :start_idx => 34, :end_idx => 37 })
phrases.push({ :start_idx => 38, :end_idx => 47 })
phrases.push({ :start_idx => 48, :end_idx => 51 })
phrases.push({ :start_idx => 52, :end_idx => 59 })

$phrasing_vectors["Bring back my bonnie to me"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }



###############################################################################
# Battle Hymn of the Republic
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 100

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # mine		 0		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # eyes		 1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # have		 2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # seen		 3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(1)) # the		 4
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # glo-		 5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # -ry		 6
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # of			 7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # the		 8

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # com-		 9
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # -ing		10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # of			11
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # the		12
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # lord;		13		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # he			14		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) # is			15

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # tramp-		16
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # -ling		17
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(3)) # out		18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # the		19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # vint-		20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) # -age		21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(3)) # where		22
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		23

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # grapes		24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # of			25
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # wrath		26
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(1)) # are		27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(4)) # stor'd;	28		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # he			29		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # hath		30

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # loosed		31
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # the		32
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(3)) # fate-		33
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(1)) # -ful		34
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # light-		35
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) # -ning		36
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # of			37
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) # his		38

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # ter-		39
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) # -ri-		40
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(3)) # -ble		41
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) # swift		42
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # sword;		43		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # his		44		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(4)) # truth		45
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(4)) # is			46
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # march-		47
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(4)) # -ing		48

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(16)) # on		49		--


m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: beat 4 
b.subbeat     = 3 # 0-based: last subbeatision
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # 4th of quarter notes

$meter_vectors["Battle hymn of the republic"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 28 })
phrases.push({ :start_idx => 29, :end_idx => 43 })
phrases.push({ :start_idx => 44, :end_idx => 49 })

$phrasing_vectors["Battle hymn of the republic"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Bach - Minuet in G
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 80

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2))		#  0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) 		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		#  3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		#  4
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(2)) 		#  5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		#  6
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		#  7	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(2)) 		#  8	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		#  9
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) 		# 10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new(1)) 		# 11
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs5),MusicIR::Duration.new(1)) 		# 12
  
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG5 ),MusicIR::Duration.new(2)) 		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		# 14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(2)) 		# 15	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) 		# 16	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new(1)) 		# 17
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		# 18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		# 19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1))		# 20	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) 		# 21	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(1)) 		# 22
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		# 23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) 		# 24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		# 25	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new(2)) 		# 26	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		# 27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) 		# 28
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(1)) 		# 29
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) 		# 30

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(6))		# 31	--

m = MusicIR::Meter.new(3, 4, 2) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 3 # 3 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Bach Minuet in G"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  7 })
phrases.push({ :start_idx =>  8, :end_idx => 15 })

# Any of these continuations seems plausible:

#phrases.push({ :start_idx => 16, :end_idx => 20 })
#phrases.push({ :start_idx => 21, :end_idx => 25 })
#phrases.push({ :start_idx => 26, :end_idx => 31 })

phrases.push({ :start_idx => 16, :end_idx => 25 })
phrases.push({ :start_idx => 26, :end_idx => 31 })

#phrases.push({ :start_idx => 16, :end_idx => 20 })
#phrases.push({ :start_idx => 21, :end_idx => 25 })
#phrases.push({ :start_idx => 26, :end_idx => 30 })
#phrases.push({ :start_idx => 31, :end_idx => 31 })

$phrasing_vectors["Bach Minuet in G"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Somewhere over the rainbow
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 60

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(4)) # some-		 0		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(4)) # -where		 1

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) # ov-		 2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(1)) # -er		 3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(1)) # the		 4
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new(2)) # rain-		 5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(2)) # -bow		 6		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(4)) # way		 7		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new(4)) # up			 8

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(8)) # high		 9		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new(4)) # there's	10		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(4)) # a			11

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # land		12
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(1)) # that		13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new(1)) # I			14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # heard		15
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(2)) # of			16		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new(2)) # once		17		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new(1)) # in			18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(1)) # a			19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new(2)) # lu-		20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new(2)) # -la-		21

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new(8)) # -by		22		--

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Somewhere over the rainbow"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx =>  9 })
phrases.push({ :start_idx => 10, :end_idx => 16 })
phrases.push({ :start_idx => 17, :end_idx => 22 })

$phrasing_vectors["Somewhere over the rainbow"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# This train is bound for glory
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 100

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		 0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(4)) # train		 1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # is 		 2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(3)) # bound		 3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # for		 4
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs4 ),MusicIR::Duration.new(2)) # glo-		 5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3  ),MusicIR::Duration.new(2)) # -ry		 6

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		 7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(14)) # train	 8	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # this		 9	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(4)) # train		10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5  ),MusicIR::Duration.new(2)) # is 		11
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5 ),MusicIR::Duration.new(3)) # bound		12
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1)) # for		13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # glo-		14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # -ry		15

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # this		16
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(14)) # train	17	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2)) # this		18	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(4)) # train		19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5  ),MusicIR::Duration.new(2)) # is 		20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5 ),MusicIR::Duration.new(3)) # bound		21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1)) # for		22
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # glo-		23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # -ry		24	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # don't		25	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # take		26
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # no-		27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # -thing	28
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # but		29
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # the		30
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(1)) # right-	31
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(1)) # -eous		32
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # an'		33
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # the		34
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs4 ),MusicIR::Duration.new(2)) # ho-		35
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3  ),MusicIR::Duration.new(2)) # -ly		36	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		37	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(4)) # train		38
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4 ),MusicIR::Duration.new(2)) # is 		39
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(3)) # bound		40
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1)) # for		41
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs4 ),MusicIR::Duration.new(2)) # glo-		42
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3  ),MusicIR::Duration.new(2)) # -ry		43

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(2)) # this		44
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(14)) # train	45	--

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # half of quarter notes

$meter_vectors["This train is bound for glory"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  8 })
phrases.push({ :start_idx =>  9, :end_idx => 17 })

#phrases.push({ :start_idx => 18, :end_idx => 24 })
#phrases.push({ :start_idx => 25, :end_idx => 36 })
phrases.push({ :start_idx => 18, :end_idx => 36 }) # this keeps the phrase lengths the same...

phrases.push({ :start_idx => 37, :end_idx => 45 })

$phrasing_vectors["This train is bound for glory"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Bach Minuet (2)
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2)) 	#  0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		#  2

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(2))		#  3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(1))		#  4
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1))		#  5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(2))		#  6	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(2)) 	#  7	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		#  8
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5  ),MusicIR::Duration.new(2))		#  9

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(4)) 	# 10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(2))		# 11	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5  ),MusicIR::Duration.new(2))		# 12	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5  ),MusicIR::Duration.new(1))		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1))		# 14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(1))		# 15
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(1))		# 16	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5  ),MusicIR::Duration.new(2))		# 17	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5  ),MusicIR::Duration.new(1))		# 18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4  ),MusicIR::Duration.new(1))		# 19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4  ),MusicIR::Duration.new(1))		# 20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(1))		# 21	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(2))		# 22	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4  ),MusicIR::Duration.new(1))		# 23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4  ),MusicIR::Duration.new(1))		# 24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4 ),MusicIR::Duration.new(2))		# 25

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4  ),MusicIR::Duration.new(6)) 	# 26	--

m = MusicIR::Meter.new(3, 4, 2) # 3/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: beat 1 
b.subbeat     = 0 # 0-based: first subbeatision
b.beats_per_measure = 3 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Bach Minuet (2)"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 11 })
phrases.push({ :start_idx => 12, :end_idx => 16 })
phrases.push({ :start_idx => 17, :end_idx => 21 })
phrases.push({ :start_idx => 22, :end_idx => 26 })

$phrasing_vectors["Bach Minuet (2)"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }

###############################################################################
# Amazing Grace
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		#  0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  1

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  4

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  5	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  6	++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		#  7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		#  8

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 4))		#  9	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 10	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 11

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		# 12
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 14

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 15
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 16

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new(10))		# 17	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 18	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 19

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 4))		# 20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 22

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 23	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 24	++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		# 25
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 26

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 4))		# 27	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 28	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 29

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 4))		# 30
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 31
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 32

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 33
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 34

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new(12))		# 35	--

m = MusicIR::Meter.new(3, 4, 2) # 3/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: third beat
b.subbeat     = 1 # 0-based: second eighth note
b.beats_per_measure = 3 # 3 beats
b.subbeats_per_beat = 2 # half of quarter notes

$meter_vectors["Amazing Grace"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  5 })
phrases.push({ :start_idx =>  6, :end_idx =>  9 })
phrases.push({ :start_idx => 10, :end_idx => 17 })
phrases.push({ :start_idx => 18, :end_idx => 23 })
phrases.push({ :start_idx => 24, :end_idx => 35 })

$phrasing_vectors["Amazing Grace"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }

###############################################################################
# Ode to Joy
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 70

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  0 ++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		#  3

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		#  4
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		#  5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  6
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  7

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  8
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  9
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 11

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 12
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 14 --

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 15 ++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 16
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 17
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 18

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 22

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 25
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 26

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 28
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 29 --

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 30 ++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 31
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 32
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 33

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 34
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 35
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 36
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 37
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 38

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 39
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 40
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 41
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 42
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 43

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 44
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 45
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 46 --

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 47 ++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 48
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 49
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 51
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 52
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 53
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 54

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 55
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 56
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 57
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 58

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 59
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 60
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 61 --

m = MusicIR::Meter.new(4, 4, 2) # 3/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first eight not
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes (eighth notes)

$meter_vectors["Ode to Joy"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 14 })
phrases.push({ :start_idx => 15, :end_idx => 29 })
phrases.push({ :start_idx => 30, :end_idx => 46 })
phrases.push({ :start_idx => 47, :end_idx => 61 })

$phrasing_vectors["Ode to Joy"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Auld Lang Syne
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 90

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		#  0  ++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 1))		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		#  3
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  4

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		#  5
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		#  6
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		#  7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		#  8
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		#  9

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		# 11
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 12
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 13

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 14  --
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 15  ++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 16
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 17
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 19

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 22
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 24

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		# 25
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 1))		# 26
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 2))		# 27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		# 28

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 6))		# 29  --
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 30  ++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 31
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 32
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 33
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 34

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 35
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 36
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 37
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 38

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 39
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 40
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 41
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 42

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 43 --
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 44 ++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 45
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 46
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 47
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 48

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 49
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 50
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 51
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 52
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 53

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 3))		# 54
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 1))		# 55
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 2))		# 56
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		# 57

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 8))		# 58 --

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: fourth beat
b.subbeat     = 0 # 0-based: first eight note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # half of quarter notes (eighth notes)

$meter_vectors["Auld Lang Syne"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 14 })
phrases.push({ :start_idx => 15, :end_idx => 29 })
phrases.push({ :start_idx => 30, :end_idx => 43 })
phrases.push({ :start_idx => 44, :end_idx => 58 })

$phrasing_vectors["Auld Lang Syne"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Oh my darling, Clementine
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 100

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		#  0   In		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  1   a

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		#  2   ca-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		#  3   vern,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		#  4   in
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   a

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		#  6   can-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		#  7   yon,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  8   ex-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  8   ca-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 6))		#  9   va-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 10   ting
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 11   for
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 12   a

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 13   mine,	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 14   Dwelt	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 15   a

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 4))		# 16   mi-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 4))		# 17   ner
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 18   for-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 19   ty

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 20   nin-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 21   er
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 22   and
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 23   his

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 24   daugh-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 25   ter,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 26   Clem-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 27   en-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 8))		# 28   tine.	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 29   Oh		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 30   my

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 31   dar-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 32   ling,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 33   oh
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 34   my

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 35   dar-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 36   ling,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 37   oh
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 38   my

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 6))		# 39   dar-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 40   ling
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 41   Clem-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 42   en-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 43   tine,	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 44   You		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 45   are

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 6))		# 46   Lost
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 47   and
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 48   gone
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 49   for-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 50   ev-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 51   er.
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 52   Dread-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 53   ful

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 54   sor-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 55   ry,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 56   Clem-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 57   en-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 8))		# 58   tine.	--

m = MusicIR::Meter.new(3, 4, 4) # 3/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: third beat
b.subbeat     = 0 # 0-based: first eight note
b.beats_per_measure = 3 # 4 beats
b.subbeats_per_beat = 4 # quarter of quarter notes (sixteenth notes)

$meter_vectors["Clementine"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 28 })
phrases.push({ :start_idx => 29, :end_idx => 43 })
phrases.push({ :start_idx => 44, :end_idx => 58 })

$phrasing_vectors["Clementine"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# When the saints...
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 40

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		#  0   Oh		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		#  1   when
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  2   the

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  3   saints

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		#  4   
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		#  5   go
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		#  6   mar-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  7   ching

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  8   in.	

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		#  9   			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 10   Oh		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 11   when
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 12   the

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 13   saints
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 14   go

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 15   mar-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 16   ching

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 17   in.

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		# 18   			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 19   Oh		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 20   Lord
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 21   I

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 22   want
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 23   to

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 24   be
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   in
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 26   that

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 27   num-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 28   ber.

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 1))		# 29   			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 30   Oh		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 31   when
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 32   the

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 33   saints
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 34   go

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 35   mar-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 36   ching

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 37   in.		--

m = MusicIR::Meter.new(4, 4, 1) # 4/4 time, quarter note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 1 # quarter notes

$meter_vectors["When the Saints"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  9 })
phrases.push({ :start_idx => 10, :end_idx => 18 })
phrases.push({ :start_idx => 19, :end_idx => 29 })
phrases.push({ :start_idx => 30, :end_idx => 37 })

$phrasing_vectors["When the Saints"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Battle Cry of Freedom
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 90

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  0   Yes			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  1   we'll

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  2   ral-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  3   ly
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		#  4   'round
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  5   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		#  6   flag,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		#  7   boys,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		#  8   we'll

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  9   ral-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 10   ly
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 11   once
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 12   a-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 13   gain.		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 14   Shout-		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 15   ing
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 16   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 2))		# 17   batt-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 18   le
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 19   cry
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 20   of

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 8))		# 21   Free-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 22   dom!			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 23   We			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 24   will

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 25   ral-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 26   ly
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 27   from
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 28   hill-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 29   side
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 30   we'll

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 31   gath-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 32   er
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 33   from
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 34   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 35   plain.		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 36   Shout-		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 37   ing
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 38   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 2))		# 39   batt-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 40   le
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 41   cry
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 42   of

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 43   Free-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 44   dom!			--
nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 45   				++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 46   The

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 47   Un-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 48   ion
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 49   for-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 50   ev-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		# 51   er!
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 52   Hur-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 53   ah,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 54   boys,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 55   hur-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 8))		# 56   ah!			--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 57   Down			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 58   with
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 59   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 60   trai-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 6))		# 61   tor,

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 4))		# 62   Up
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 63   with
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 64   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 65   star!		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 66   While		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 67   we

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 68   ral-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 69   ly
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 70   round
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 71   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 72   flag,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 73   boys,

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 74   ral-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 75   ly
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 76   once
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 77   a-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 78   gain.		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 4))		# 79   Shout-		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 3))		# 80   ing
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		# 81   the
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 82   Batt-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 83   le
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 84   cry
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 85   of

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 8))		# 86   Free-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 4))		# 87   dom!			--

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # sixteenth notes

$meter_vectors["Battle Cry of Freedom"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 22 })
phrases.push({ :start_idx => 23, :end_idx => 35 })
phrases.push({ :start_idx => 36, :end_idx => 44 })
phrases.push({ :start_idx => 45, :end_idx => 56 })
phrases.push({ :start_idx => 57, :end_idx => 65 })
phrases.push({ :start_idx => 66, :end_idx => 78 })
phrases.push({ :start_idx => 79, :end_idx => 87 })

$phrasing_vectors["Battle Cry of Freedom"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Yesterday (Beatles)   -- FIXME: there are some accidentals wrong, toward the end
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  0   Yes-		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  1   ter-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 6))		#  2   day	

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		#  3   --		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  4   all		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   my
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		#  6   trou-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		#  7   bles
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		#  8   seem
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  9   so

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		# 10   far
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 11   a-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 6))		# 12   way.

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 13   --		--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 14   Now		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 15   it
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 16   looks
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 17   as
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 18   though
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 19   they're

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 20   here
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 21   to
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 22   stay.	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 23   Oh		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 24   I
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   be-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 3))		# 26   lieve
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 27   in

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 28   yes-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 29   ter-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 5))		# 30   day.		--

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Yesterday (Beatles)"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  3 })
phrases.push({ :start_idx =>  4, :end_idx => 13 })
phrases.push({ :start_idx => 14, :end_idx => 22 })
phrases.push({ :start_idx => 23, :end_idx => 30 })

$phrasing_vectors["Yesterday (Beatles)"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Yellow Submarine
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 60

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  0   In			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		#  1   the

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 5))		#  2   town
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  3   where
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  4   I
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   was

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 6))		#  6   born			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  7   lived		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  8   a

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  9   ma-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 10   a-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 11   n
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 12   who
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 13   sailed
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 14   the

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 15   sea;			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 16   and			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 17   he

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 5))		# 18   told
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 19   us
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 20   of
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 21   his

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 6))		# 22   life			--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 23   in			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 24   the

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 25   la-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 26   a-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 27   nd
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 28   of
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 29   sub-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 30   mar-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 31   ines.		--

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: 4th beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Yellow Submarine"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 15 })
phrases.push({ :start_idx => 16, :end_idx => 22 })
phrases.push({ :start_idx => 23, :end_idx => 31 })

$phrasing_vectors["Yellow Submarine"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Nowhere Man
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  0   He's		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  1   a
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		#  2   real

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		#  3   no-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		#  4   whe-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		#  5   re
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  6   man,
nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		#  7   ..		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  8   sit-		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  9   ting
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 3))		# 10   in
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 11   his

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 12   no-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 13   o-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 14   whe-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		# 15   re
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 2))		# 16   land
nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 17   ..		--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 18   mak-		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 19   ing
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 20   all-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 21   ll
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 22   his

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		# 23   no-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 24   o-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 25   where
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		# 26   plans	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 27   for		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 3))		# 28   no-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 29   bod-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 30   y.
nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 2))		# 31   ..		

nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 8))		# 32   ..		--

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Nowhere Man"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  7 })
phrases.push({ :start_idx =>  8, :end_idx => 17 })
phrases.push({ :start_idx => 18, :end_idx => 26 })
phrases.push({ :start_idx => 27, :end_idx => 32 })

$phrasing_vectors["Nowhere Man"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Ask Me Now
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 90

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		#  0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		#  3 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB3 ),MusicIR::Duration.new( 2))		#  4 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 6))		#  5 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		#  6
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		#  7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		#  8
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb3),MusicIR::Duration.new( 2))		#  9 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA3 ),MusicIR::Duration.new( 2))		# 10 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 11 	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 2))		# 12	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 2))		# 14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		# 15
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 4))		# 16
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 17

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 8))		# 18	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 19	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new( 2))		# 20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb3),MusicIR::Duration.new( 2))		# 21
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 2))		# 22 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs3),MusicIR::Duration.new( 2))		# 23 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 6))		# 24 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 2))		# 25
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new( 2))		# 26
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 2))		# 27
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new( 1))		# 28 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 29 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 2))		# 30 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 6))		# 31 	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDb5),MusicIR::Duration.new( 2))		# 32	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 2))		# 33	
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGb4),MusicIR::Duration.new( 2))		# 34
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 1))		# 35 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb3),MusicIR::Duration.new( 1))		# 36 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 37 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PAb3),MusicIR::Duration.new( 6))		# 38 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDb4),MusicIR::Duration.new(12))		# 39	--

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 4 # eighth notes

$meter_vectors["Ask Me Now (Monk)"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx => 11 })
phrases.push({ :start_idx => 12, :end_idx => 18 })
phrases.push({ :start_idx => 19, :end_idx => 31 })
phrases.push({ :start_idx => 32, :end_idx => 39 })

$phrasing_vectors["Ask Me Now (Monk)"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# In a Sentimental Mood
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 60

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		#  3 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		#  4 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  5 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG5 ),MusicIR::Duration.new(10))		#  6	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  7	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG5 ),MusicIR::Duration.new( 1))		#  8
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF5 ),MusicIR::Duration.new( 1))		#  9
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		# 10
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 11
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 12

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 7))		# 15	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 16	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 17
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 1))		# 18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 1))		# 19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 20
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 21

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 5))		# 22
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC5 ),MusicIR::Duration.new( 1))		# 25

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 6))		# 26	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD5 ),MusicIR::Duration.new( 2))		# 27	++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 4))		# 28
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 29

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 8))		# 30	--

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 1 # 0-based: second beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["In a Sentimental Mood"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 15 })
phrases.push({ :start_idx => 16, :end_idx => 26 })
phrases.push({ :start_idx => 27, :end_idx => 30 })

$phrasing_vectors["In a Sentimental Mood"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# Monk's Mood
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 50

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 1))		#  0	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 1))		#  1
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PBb4),MusicIR::Duration.new( 1))		#  2
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PAb4),MusicIR::Duration.new( 1))		#  3 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  4 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new(10))		#  5 	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		#  6	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		#  7
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		#  8
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 3))		#  9 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG3 ),MusicIR::Duration.new( 1))		# 10 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PC4 ),MusicIR::Duration.new( 8))		# 11	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 2))		# 12	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs4),MusicIR::Duration.new( 1))		# 13
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 1))		# 14
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 15 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 16 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 17
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PEb4),MusicIR::Duration.new( 1))		# 18
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 1))		# 19
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGb4),MusicIR::Duration.new( 2))		# 20 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 21 	--

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 2))		# 22	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 1))		# 23
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 1))		# 24
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 3))		# 25 
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PD4 ),MusicIR::Duration.new( 1))		# 26 

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PG4 ),MusicIR::Duration.new( 8))		# 27	--

m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 0 # 0-based: first beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["Monk's Mood"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  5 })
phrases.push({ :start_idx =>  6, :end_idx => 11 })
phrases.push({ :start_idx => 12, :end_idx => 21 })
phrases.push({ :start_idx => 22, :end_idx => 27 })

$phrasing_vectors["Monk's Mood"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# All My Loving (Beatles)
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 90

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  0	Close	++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		#  1	your
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 5))		#  2	eyes

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		#  3	and
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		#  4	I'll
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  5	kiss

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 5))		#  6	you,	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		#  7	to-		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		#  8	mor-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 1))		#  9	row
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		# 10	I'll
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 11	miss

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 5))		# 12	you.	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 13	Re-		++

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 3))		# 14	mem-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 3))		# 15	ber
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 16	I'll

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 3))		# 17	al-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 1))		# 18	wa-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 19	ays
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 20	be
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 8))		# 21	true.	--

#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 22	And		++
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 2))		# 23	then
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 4))		# 24	while
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 2))		# 25	I'm
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 1))		# 26	a-
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 5))		# 27	way,	--
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 28	I'll	++
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 2))		# 29	write
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 4))		# 30	home
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 2))		# 31	ev-
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PDs5),MusicIR::Duration.new( 1))		# 32	ery
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 33	da-
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 4))		# 34	ay,		--
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		# 35	And		++
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 36	I'll
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 4))		# 37	send
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 38	all
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 39	my
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 2))		# 40	lov-
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PGs4),MusicIR::Duration.new( 4))		# 41	in'
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 42	to
#
#nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 8))		# 43	you		--
#
m = MusicIR::Meter.new(4, 4, 2) # 4/4 time, eighth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 2 # 0-based: third beat
b.subbeat     = 0 # 0-based: first eighth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # eighth notes

$meter_vectors["All My Loving"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  6 })
phrases.push({ :start_idx =>  7, :end_idx => 12 })
phrases.push({ :start_idx => 13, :end_idx => 21 })
#phrases.push({ :start_idx => 22, :end_idx => 27 })
#phrases.push({ :start_idx => 28, :end_idx => 34 })
#phrases.push({ :start_idx => 35, :end_idx => 43 })

$phrasing_vectors["All My Loving"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }


###############################################################################
# In My Life (Beatles)
###############################################################################

nq = MusicIR::NoteQueue.new
nq.tempo = 100

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		#  0	There		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		#  1	are

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		#  2	pla-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		#  3	ces
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		#  4	I
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 4))		#  5	re-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 2))		#  6	mem-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		#  7	ber			
nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 8))		#  8				--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		#  9	all			++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 10	my

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 6))		# 11	li-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		# 12	i-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 13	i-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 14	ife
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 15	though

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 16	some
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 17	have
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 6))		# 18	changed.	--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 2))		# 19	Some		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PFs4),MusicIR::Duration.new( 2))		# 20	for-

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 21	ev-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 4))		# 22	er,
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 4))		# 23	not
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 4))		# 24	for

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE5 ),MusicIR::Duration.new( 2))		# 25	bet-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 26	ter
nq.push MusicIR::Rest.new(                       MusicIR::Duration.new( 8))		# 27				--
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 2))		# 28	some		++
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 29	have

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 6))		# 30	go-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 1))		# 31	o-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PB4 ),MusicIR::Duration.new( 1))		# 32	o-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PA4 ),MusicIR::Duration.new( 6))		# 33	one
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PF4 ),MusicIR::Duration.new( 2))		# 34	and

nq.push MusicIR::Note.new(MusicIR::Pitch.new(PE4 ),MusicIR::Duration.new( 4))		# 35	some
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 2))		# 36	re-
nq.push MusicIR::Note.new(MusicIR::Pitch.new(PCs5),MusicIR::Duration.new( 6))		# 37	main.		--

m = MusicIR::Meter.new(4, 4, 4) # 4/4 time, sixteenth note pulses
b = MusicIR::BeatPosition.new
b.measure     = 0
b.beat        = 3 # 0-based: fourth beat
b.subbeat     = 0 # 0-based: first sixteenth note
b.beats_per_measure = 4 # 4 beats
b.subbeats_per_beat = 2 # sixteenth notes

$meter_vectors["In My Life"] =
  {
    :meter               => m,
    :first_beat_position => b,
    :note_queue          => nq
  }

phrases = [ ]
phrases.push({ :start_idx =>  0, :end_idx =>  8 })
phrases.push({ :start_idx =>  9, :end_idx => 18 })
phrases.push({ :start_idx => 19, :end_idx => 27 })
phrases.push({ :start_idx => 28, :end_idx => 37 })

$phrasing_vectors["In My Life"] =
  {
    :note_queue          => nq,
    :phrase_boundaries   => phrases
  }

