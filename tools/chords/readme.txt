--------
OVERVIEW
--------

This archive contains the chord transition matrix data used the user study presented in:

Nichols E, Morris D, Basu S.  Data-Driven Exploration of Musical Chord Sequences.  Proceedings of IUI 2009.

We refer the reader to our paper for a description of the generation of these transition matrices.


-----
FILES
-----

The four directories contained here correspond to the four experimental conditions described in our paper.  Each directory contains the corresponding data for the four control axes used in that condition, in ASCII text files whose format is described below:

Genre (transitions matrices derived from labeled genre data):
	beatles.txt
	country.txt
	pop.txt
	rock.txt

Genre+AbsDiff (transitions matrices derived from our AbsDiff clustering routine using genre labels as cluster seeds):
	beatles+absdiff.txt
	country+absdiff.txt
	pop+absdiff.txt
	rock+absdiff.txt

PCA (principal components analysis of all chord transitions in our database)
	pca_transmodel_1.txt
	pca_transmodel_2.txt
	pca_transmodel_3.txt
	pca_transmodel_4.txt
	pca_transmodel_mean.txt
	
Random+AbsDiff (transitions matrices derived from our AbsDiff clustering routine using random seeds):
	transmodel0RandAbsDiff.txt
	transmodel1RandAbsDiff.txt
	transmodel2RandAbsDiff.txt
	transmodel3RandAbsDiff.txt
	

------------
FILE FORMATS
------------

All of the files contained here describe transition probabilities among chords. All songs were transposed into the key of C before analysis.  Our dictionary of chords includes five triad types - major, minor, diminished, augmented, suspended - so we define 60 types of chords, one triad type on each of 12 possible roots, numbered as follows:

1  = C Major
2  = C Minor
3  = C Dim
4  = C Aug
5  = C Suspended
6  = C# Major
7  = C# Minor
...
59 = B Aug
60 = B suspended

Additionally we define two special chords that represent "start of song" and "end of song", so the probability of each chord starting and ending a song can be reflected in our data.

All probabilities are represented as _log_-probability values, so all values are negative.

For all conditions other than the PCA condition, each text file contains one transition matrix, in the following format:

n (# chords, always 60)
logP(chord 1 appearing at the start of a song)
logP(chord 2 appearing at the start of a song)
....
logP(chord 60 appearing at the start of a song)
n n (matrix size, always 60 60)
logP(chord 1 -> chord 1)
logP(chord 1 -> chord 2)
logP(chord 1 -> chord 3)
....
logP(chord 2 -> chord 1)
logP(chord 2 -> chord 2)
...
logP(chord 60 -> chord 59)
logP(chord 60 -> chord 60)
n (# chords, always 60)
logP(chord 1 appearing at the end of a song)
logP(chord 2 appearing at the end of a song)
...
logP(chord 60 appearing at the end of a song)

The files in the 'pca' directory, which correspond to the PCA-based axes presented in our paper, are in the following format:

variance
n (# chords, always 60)
P(chord 1 appearing at the start of a song)
P(chord 2 appearing at the start of a song)
....
P(chord 60 appearing at the start of a song)
n n (matrix size, always 60 60)
P(chord 1 -> chord 1)
P(chord 1 -> chord 2)
P(chord 1 -> chord 3)
....
P(chord 2 -> chord 1)
P(chord 2 -> chord 2)
...
P(chord 60 -> chord 59)
P(chord 60 -> chord 60)
n (# chords, always 60)
P(chord 1 appearing at the end of a song)
P(chord 2 appearing at the end of a song)
...
P(chord 60 appearing at the end of a song)

Note that unlike the other conditions, these are transition probabilities, not log-probabilities, so they can be combined directly without exponentiating.  Also note the introduction of an additional line at the beginning of the file, specifying the variance for this component.  We provide four principal components in the files pca_transmodel_[1-4].txt, and the mean - to which scaled principal component values are added to produce a transition matrix - in the file pca_transmodel_mean.txt.
