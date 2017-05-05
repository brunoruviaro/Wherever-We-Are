// ===============================
// Wherever We Are
// AUTOPLAY (test file only)
//
// AUTOPLAYER
// This file was created in May 2017 with the purpose of
// simulating the performance of the piece with fully automated players.
// Mostly for demonstration.
// ===============================


// Load full text
"Wherever_We_Are_FULL_TEXT.scd".loadRelative;

// Load projection screen
"Wherever_We_Are_PROJECTION.scd".loadRelative;

// Load synth
"Wherever_We_Are_SYNTH.scd".loadRelative;

// Load localhost address
~here = NetAddr("localhost", 57120);

// Load a couple extra functions
"Autoplay_Functions.scd".loadRelative;


// *******
// PLAYERS
(
Pbindef(\p1, \type, \rest).play;
Pbindef(\p2, \type, \rest).play;
Pbindef(\p3, \type, \rest).play;
Pbindef(\p4, \type, \rest).play;
Pbindef(\p5, \type, \rest).play;
Pbindef(\p6, \type, \rest).play;
)


Pbindef(\p1, \dur, 1);

// Add content to players
(
Pbindef(\p1,
	\type, \rest,
	\dur, Pwhite(0.05, 1),
	\pointer, Pseq((0..~splitCage[1].size-1), inf),
	\doIt, Pfunc({arg ev;
		[
			~playCharacter,
			~playTypo,
		]
		.wchoose([0.9, 0.1]) // 10% chance of a typo
		.value(pointer: ev[\pointer], thisPlayer: 1);

	})

); // end of player

Pbindef(\p2,
	\type, \rest,
	\dur, Pwhite(0.05, 1),
	\pointer, Pseq((0..~splitCage[2].size-1), inf),
	\doIt, Pfunc({arg ev;
		[
			~playCharacter,
			~playTypo,
		]
		.wchoose([0.9, 0.1]) // 10% chance of a typo
		.value(pointer: ev[\pointer], thisPlayer: 2);

	})

); // end of player

Pbindef(\p3,
	\type, \rest,
	\dur, Pwhite(0.05, 1),
	\pointer, Pseq((0..~splitCage[3].size-1), inf),
	\doIt, Pfunc({arg ev;
		[
			~playCharacter,
			~playTypo,
		]
		.wchoose([0.9, 0.1]) // 10% chance of a typo
		.value(pointer: ev[\pointer], thisPlayer: 3);

	})

); // end of player

Pbindef(\p4,
	\type, \rest,
	\dur, Pwhite(0.05, 1),
	\pointer, Pseq((0..~splitCage[4].size-1), inf),
	\doIt, Pfunc({arg ev;
		[
			~playCharacter,
			~playTypo,
		]
		.wchoose([0.9, 0.1]) // 10% chance of a typo
		.value(pointer: ev[\pointer], thisPlayer: 4);

	})

); // end of player

Pbindef(\p5,
	\type, \rest,
	\dur, Pwhite(0.05, 1),
	\pointer, Pseq((0..~splitCage[5].size-1), inf),
	\doIt, Pfunc({arg ev;
		[
			~playCharacter,
			~playTypo,
		]
		.wchoose([0.9, 0.1]) // 10% chance of a typo
		.value(pointer: ev[\pointer], thisPlayer: 5);

	})

); // end of player

Pbindef(\p6,
	\type, \rest,
	\dur, Pwhite(0.05, 1),
	\pointer, Pseq((0..~splitCage[6].size-1), inf),
	\doIt, Pfunc({arg ev;
		[
			~playCharacter,
			~playTypo,
		]
		.wchoose([0.9, 0.1]) // 10% chance of a typo
		.value(pointer: ev[\pointer], thisPlayer: 6);

	})

); // end of player
)



// NEXT: add player to randomize fade time


~fadeTime = 1;


// NEXT: add player 7


// NEXT: design speeding up and break over 5-6 minutes













