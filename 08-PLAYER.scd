// ===============================
// PLAYER 8 - "Projection Player"
// (may double as conductor)
// This player must be connected to the projector.
// It receives messages from other players over network.
// This player's IP address should be entered into Players 1-7 file.
// ===============================


// Load screen
"Wherever_We_Are_PROJECTION.scd".loadRelative;

// Move it to projection screen, and make it full screen.

w.fullScreen; // run this (ctrl+Enter) to hide Ubuntu top bar in the projection screen.

// at the end of piece only:
w.endFullScreen

// =========================
// Projection player can control fade times by changing
// and re-evaluating this variable during performance:

~fadeTime = 10;

// =========================


(
~here = NetAddr("localhost", 57120);

Pbindef(\wow, \type, \rest).play;

Pbindef(\wow,
	\type, \rest,
	\dur, 0.05,
	\pos, Pseq((0..304), inf),
	\osc, Pfunc({ |ev| ~here.sendMsg('/screen', ev[\pos]) })
)
)

// try others
Pbindef(\wow, \pos, Pseq((0..304), inf));

Pbindef(\wow, \pos, Prand((0..304), inf));

Pbindef(\wow, \dur, 1 );

Pbindef(\wow, \dur, Pn(Pgeom(0.01, 1.2, 30)) );

Pbindef(\wow, \pos, (Pseries(0, 30, inf) + Pwhite(0, 1)).fold(0, 304));

Pbindef(\wow).stop;