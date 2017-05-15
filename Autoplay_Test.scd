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

SystemClock.sched(10, { ~startAll.value; });

~pauseAll.value;


// Choose demo mode
// just average speed typing
~demo1.value;
// compressed version of piece progression
~demo2.value;




