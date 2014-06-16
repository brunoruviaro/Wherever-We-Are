// "Wherever we are, ..." (quote from John Cage's "Credo")
// EXAMPLE 2
//
// Builds from Example 1. Here a Pbind factory creates a simulation
// of live players typing segments of the text at different speeds.

// Run Example 1 first (wait until it finishes)
"Wherever_We_Are_Example_1.scd".loadRelative;

// Create Pbind factory:
(
~pBindFactory = { arg range, fadeTime, minDur = 0.1, maxDur = 0.3;
	Pbind(
		\type, \rest,
		\letter, Pseq(range, inf),
		\fade, Pfunc( { |e| ~fade.value(e.at(\letter), fadeTime) }),
		\dur, Pwhite(minDur, maxDur)
	).play;
};
)

// Run "players" one at a time:
~pBindFactory.value((0..50), 1);
~pBindFactory.value((51..99), 5);
~pBindFactory.value((100..150), 2);
~pBindFactory.value((151..200), 1);
~pBindFactory.value((201..250), 3);
~pBindFactory.value((251..304), 3, 0.05, 0.1);


// "Matrix" style (top to bottom)
(
27.do({ arg count;
	// var dur = count.linlin(0, 26, 1, 0.5); // right to left
	// var dur = count.linlin(0, 26, 0.5, 1); // left to right
	// var dur = 0.5; // equal
	var dur = rrand(0.5, 1); // random
	~pBindFactory.value(
		range: (0, 28 .. 304) + count,
		fadeTime: 3,
		minDur: dur,
		maxDur: dur);
});
)

// "Matrix" style 2
(
27.do({ arg count;
	var dur = Array.series(27, 0.5, 0.05).scramble;

	~pBindFactory.value(
		range: (0, 28 .. 304) + count,
		fadeTime: 5,
		minDur: dur[count],
		maxDur: dur[count]);
});
)
