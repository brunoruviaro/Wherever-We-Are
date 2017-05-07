
// AUTOPLAY FUNCTIONS IN THIS BLOCK
// 1- PLAY CHARACTER
// 2- PLAY TYPO
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
		\amp, { rrand(0.02, 0.5) }.value ]);

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
		\amp, { rrand(0.1, 0.2) }.value

	]);
	"TYPO!"; // will post automatically as it is the last thing

}; // end of playTypo function












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

	"Demo 1 loaded: basic sequential play, medium-fast, 10% typos";

}; //end of pbindef score


// Load demo1 as default at start-up
~demo1.value;



// ================
// DEMO 2 SCORE
// ================

// BsdfsdfsdfMO
// MEasdfsdfE
// 10% TYPOS

~demo2 = {

	var sparseness = Pseg( Pseq([10, 1, 1],inf), Pseq([30, 10], inf), \linear);
	var dur = Pwhite(0.1, 1) * Pkey(\time);

	Pbindef(\p1,
		\sparseness, sparseness,
		\dur, dur
	);
	Pbindef(\p2,
		\sparseness, sparseness,
		\dur, dur
	);
	Pbindef(\p3,
		\sparseness, sparseness,
		\dur, dur
	);
	Pbindef(\p4,
		\sparseness, sparseness,
		\dur, dur
	);
	Pbindef(\p5,
		\sparseness, sparseness,
		\dur, dur
	);
	Pbindef(\p6,
		\sparseness, sparseness,
		\dur, dur
	);

	"Demo 2 loaded";

}; // end of pbindef score