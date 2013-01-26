# Markov Composer

This project is about exploring the application to music composition of a [multiple viewpoint](http://scholar.google.com/scholar?q=multiple+viewpoint+music&btnG=&hl=en&as_sdt=0%2C33) system that uses complex markov chains to model individual viewpoints (e.g., pitch intervals, inter-onset intervals, etc).

## Ideas I'm exploring

### Using a Set of Critics to Collaboratively Analyze and Generate Music

At the highest level, the improvisor is a Listener and a Generator.  The Listener takes in note sequences
and feeds them, one by one, into critics.  Each critic is listening along a specific dimension (pitch
intervals, durations, etc), and learns the statistical regularities of time sequences with markov chains.  
The Generator uses the same critics to generate music.  At each time increment, it asks all critics what
their expectations are about the next time increment.  Rather than having the critics return exact values,
they instead return probability distributions.  This allows the Generator to combine the distributions and
thereby generate notes that correspond to the expectations of all critics. 

There's a lot more work I'd like to do on adding higher-order critics that know about scales, chords, 
position within a phrase, etc.  

This is inspired by the architectures of Douglass Hofstadter's FARG group.

### Surprise/Expectation

Each of the critics reports its surprise at each new input, based on what it knows of the time series
statistics.  Currently the improvisor looks for minimal-surprise improvisations, as a means of generating
statistically plausible output.  Eventually, I'd like to have a 'surprise critic', which listens to all 
the other critics and learns about the ebb and flow of intentional surprise.  This could allow the
improvisor to generate much more interesting output.

