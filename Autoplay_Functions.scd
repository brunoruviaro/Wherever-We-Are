
// AUTOPLAY FUNCTIONS IN THIS BLOCK
// 1- PLAY CHARACTER
// 2- PLAY TYPO
// 3- PLAY YELLOW
// 3- PBINDEFS (scores)




// ================
// PLAY CHARACTER
// ================

// this function just needs a pointer
// Pbind should increase pointer and send it to function
// Pbind should know size of thisplayer function.
~playCharacter = {arg pointer, thisPlayer;

	var this_rate = 1;
	var index;
	var midinote = ~score[thisPlayer][pointer];

	// if midinote from score is one of the UNPREPARED notes (for which we have samples),
	// then play just one of the highest available notes, transposed up,
	// else play requested midinote.
	if([40, 47, 48, 52, 54, 66, 69, 79, 82, 86, 102].includes(midinote),
		{ index = [100, 101].choose; this_rate = { rrand(2, 3) }.value },
		{ index = midinote });

	Synth("qwerty-mono-sample-playback", [
		\buffer, ~bufferArray[index],
		\rate, this_rate,
		\amp, { rrand(0.02, 0.5) }.value,
		\pan, [ -1, -0.6, -0.2, 0.2, 0.6, 1 ].at(thisPlayer - 1)
	]);

	// send character to remote screen.
	~here.sendMsg("/screen", pointer + ~sentenceIndex[thisPlayer]);
	// post info
	[ "note", ~score[thisPlayer][pointer] ]; // will be posted as it's the last thing

}; // end of playCharacter function









// ================================
// PLAY TYPO
// ================================
// this function to be chosen occasionally
// note: differently from live performance,
// this won't prevent pointer from increasing in the Pbindef
// In other words, when a typo happens, it will blink red
// on screen, and pointer will move on to next letter
// (in live performance, the system gets "stuck" on same letter until
// player gets it right)

~playTypo = {arg pointer, thisPlayer;

	// typo: send typo msg to screen
	~here.sendMsg("/screen/typo", pointer + ~sentenceIndex[thisPlayer]);

	// typo: play a noise (rain, truck, static)
	Synth("qwerty-mono-sample-playback", [
		\buffer, ~bufferArray[ [40, 47, 48, 52, 54, 66, 69, 79, 82, 86, 102].choose ],
		\rate, { rrand(0.8, 1.5) }.value,
		\amp, { rrand(0.1, 0.2) }.value,
		\pan, [ -1, -0.6, -0.2, 0.2, 0.6, 1 ].at(thisPlayer - 1)

	]);
	"TYPO!"; // will post automatically as it is the last thing

}; // end of playTypo function








// ================================
// PLAY YELLOW
// ================================
// this function emulates player 7
// yellow characters on screen

~playYellow = {

	// send yellow random letter to screen
	~here.sendMsg("/screen/audience", ~cage.ascii.choose);

	// play a sample
	Synth("qwerty-mono-sample-playback-FILTER",
		[
			\buffer, ~bufferArray.reject{ |x| x.isNil }.choose,
			\rate, { rrand(1.5, 2.0) }.value,
			\amp, { rrand(0.02, 0.5) }.value,
			\pan, { rrand(-1.0, 1.0) }.value
		]
	);

	"YELLOW!"; // will post automatically as it is the last thing

}; // end of playYellow function








~startAll = {
	s.volume = -12;
	Pbindef(\p1).play;
	Pbindef(\p2).play;
	Pbindef(\p3).play;
	Pbindef(\p4).play;
	Pbindef(\p5).play;
	Pbindef(\p6).play;
	Pbindef(\p7).play;
	Pbindef(\fade).play;
};


~pauseAll = {
	Pbindef(\p1).pause;
	Pbindef(\p2).pause;
	Pbindef(\p3).pause;
	Pbindef(\p4).pause;
	Pbindef(\p5).pause;
	Pbindef(\p6).pause;
	Pbindef(\p7).pause;
	Pbindef(\fade).pause;
};









// ================
// DEMO 1 SCORE
// ================

// BASIC RANDOM PLAY DEMO
// MEDIDUM-FAST PACE
// 10% TYPOS

~demo1 = {

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

	Pbindef(\p7,
		\type, \rest,
		\dur, Prand([
			Pwhite(0.1, 0.5, 1),
			Pwhite(0.1, 0.5, 2),
			Pwhite(0.1, 0.5, 3),
			Pwhite(0.1, 0.5, 4),
			10, 5, 6, 1, 4
			],
			inf
		),
		\doIt, Pfunc({ ~playYellow.value })
	); // end of player

	Pbindef(\fade,
		\type, \rest,
		\dur, Pwhite(1, 10),
		\fade, Pfunc({ ~fadeTime = rrand(1, 20); ["FADE", ~fadeTime].postln; })
	); // end of player

	"Demo 1 loaded: basic sequential play, medium-fast, 10% typos";

}; //end of pbindef score

// load demo 1 values by default
~demo1.value;

// ================
// DEMO 2 SCORE
// ================

// BsdfsdfsdfMO
// MEasdfsdfE
// 10% TYPOS

~demo2 = {

	~myDur = {
		Pseg(
			// LEVELS
			Pseq([
				0, // start slow
				// intermediate steps
				rrand(0.2, 0.5),
				rrand(0.3, 0.7),
				rrand(0.7, 0.9),
				1, // arrive at max speed

				rrand(0.9, 1), // stay at max speed

				rrand(0, 0.05), // return to slow
				0.1, // mid slow
				0 // final slow
			]),
			// TIMES
			Pseq([
				// go from slow to first step in
				40,
				// from 2nd to 3rd in
				25,
				// from 3rd to 4th in
				20,
				// arrive at max speed in
				10,
				// stay at max speed for
				16,
				// suddently return to slow in
				1,
				// reach mid slow in
				15,
				// final rallentando in
				20
			]),
			\linear
		).linexp(0, 1, 10, 0.1);
	};

	Pbindef(\p1,
		\dur, ~myDur.value,
	);

	Pbindef(\p2,
		\dur, ~myDur.value
	);

	Pbindef(\p3,
		\dur, ~myDur.value
	);

	Pbindef(\p4,
		\dur, ~myDur.value
	);

	Pbindef(\p5,
		\dur, ~myDur.value
	);

	Pbindef(\p6,
		\dur, ~myDur.value
	);

	Pbindef(\p7,
		\type, \rest,
		\timer, ~myDur.value,
		\dur, Prand([
			Pwhite(0.1, 0.5, 1),
			Pwhite(0.1, 0.5, 2),
			Pwhite(0.1, 0.5, 3),
			Pwhite(0.05, 0.2, 4),
			10, 5, 6, 1, 4
			],
			inf
		),
		\doIt, Pfunc({ ~playYellow.value })
	);

	Pbindef(\fade,
		\type, \rest,
		\dur, Pwhite(1, 10),
		\fade, Pfunc({ ~fadeTime = rrand(1, 20); ["FADE", ~fadeTime].postln; })
	); // end of player


	"Demo 2 loaded";

}; // end of pbindef score