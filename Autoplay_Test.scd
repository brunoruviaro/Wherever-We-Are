// ===============================
// Wherever We Are
// AUTOPLAY (test file only)
//
// AUTOPLAYER
// This file was created in May 2017 with the purpose of
// simulating the performance of the piece with fully automated players.
// Mostly for demonstration.
// ===============================

s.boot;

// Load full text
"Wherever_We_Are_FULL_TEXT.scd".loadRelative;

// Load projection screen
"Wherever_We_Are_PROJECTION.scd".loadRelative;

// Load synth
"Wherever_We_Are_SYNTH.scd".loadRelative;

// Load localhost address
~here = NetAddr("localhost", 57120);

// Load a few more things (autoplay-specific)
"Autoplay_Functions.scd".loadRelative;

// Start stop players
(
s.volume = -12;
Pbindef(\p1).play;
Pbindef(\p2).play;
Pbindef(\p3).play;
Pbindef(\p4).play;
Pbindef(\p5).play;
Pbindef(\p6).play;
)

(
Pbindef(\p1).pause;
Pbindef(\p2).pause;
Pbindef(\p3).pause;
Pbindef(\p4).pause;
Pbindef(\p5).pause;
Pbindef(\p6).pause;
)

// Choose demo mode
~demo1.value;

~demo2.value;




(
Pbindef(\p1,
	\sparseness, Pseg( Pseq([10, 1/2, 1],inf), Pseq([30, 10], inf), \linear),
	\dur, 0.1, //Pwhite(0.1, 1) * Pkey(\sparseness)
);
)



Pbindef(\p6, \dur, 1);

// Add content to players






// NEXT: add player to randomize fade time


~fadeTime = 1;


// NEXT: add player 7


// NEXT: design speeding up and break over 5-6 minutes













