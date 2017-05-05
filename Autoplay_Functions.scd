
// TWO AUTOPLAY FUNCTIONS IN THIS BLOCK
// 1- PLAY CHARACTER
// 2- PLAY TYPO
//
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
