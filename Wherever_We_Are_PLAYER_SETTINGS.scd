// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PLAYER SETTINGS

// NetAddr of projection laptop (target)
var destination = NetAddr(~destination, 57120);

var key_a = 97; // unicode for character "a"
var key_z = 122;  // unicode for character "z"
var key_A = 65; // unicode for character "A" (capital A)
var key_Z = 90; // unicode for character "Z" (capital Z)
var key_0 = 48; // unicode for character "0" (zero)
var key_9 = 57; // unicode for character "9" (nine)

var len = 900; // typing window size: length
var hi = 100; // typing window size: height
var pointer = 0;

// Typing window
var win = Window.new(
	name: ~splitCage[~player],
	bounds: Rect(500, Window.screenBounds.height-600, len, hi));

// Text container
var tex = StaticText(win, Rect(5, 5, len-10, hi-10)).focus(true);

// What to do at each key press
tex.keyDownAction =	{ arg view, char, modifiers, unicode, keycode;
	var this_rate = 1;
	var sentence = ~splitCage[~player];
	/*

	If typed character matches the next character of the sentence:
	- play sample (a "note" from the corresponding player score)
	- send character to remote destination,
	- increment pointer,
	- post updated string on local window,

	If typed character does not match:
	- blink local text in red.
	- send red blink to destination
	- play a noise

	*/

	if(unicode>0, // ignore shift key

		{
			if(char.asString == sentence.at(pointer).asString,
				{
					var index;
					var midinote = ~score[~player][pointer];

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
					destination.sendMsg("/screen", pointer + ~sentenceIndex[~player]);
					pointer = (pointer + 1) % sentence.size;
					tex.string = sentence.keep(pointer);

					// ["buffer", ~bufferArray[~score[~player][pointer]] ].postln;
					[ "note", ~score[~player][pointer] ].postln;

				},
				{
					{
						destination.sendMsg("/screen/typo", pointer + ~sentenceIndex[~player]);
						{ tex.stringColor = Color.red }.defer;
						0.3.wait;
						{ tex.stringColor = Color.black }.defer;
					}.fork;
					// if typo, play a noise (rain, truck, static)
					Synth("qwerty-mono-sample-playback", [
						\buffer, ~bufferArray[ [40, 47, 48, 52, 54, 66, 69, 79, 82, 86, 102].choose ],
						\rate, { rrand(0.8, 1.5) }.value,
						\amp, { rrand(0.1, 0.2) }.value

					]);



				}
			);
	})

};

	tex.font_(Font("Courier", 30));
	tex.stringColor_(Color.black);
	win.front;

	// End of File




	/*
	case
	{(unicode >= key_A) && (unicode <= key_Z)} {bufnum = unicode - key_A; this_rate = 0.6 * ~transp.value}
	{(unicode >= key_a) && (unicode <= key_z)} {bufnum = unicode - key_a; this_rate = 1 * ~transp.value}
	{(unicode >= key_0) && (unicode <= key_9)} {bufnum = rrand(0, b.media.size-1); this_rate = 5}
	{(unicode >= 33) && (unicode <= 127)} {bufnum = rrand(0, b.media.size-1); this_rate = 2}
	{true} {bufnum = -1}; // flag: not a letter nor number; don't play anything

	// Call appropriate synth (mono or stereo) and post some info:
	if( (bufnum != -1), {

	case
	{b.media[bufnum].numChannels == 1} {Synth("qwerty-mono-sample-playback", [\bufnum, bufnum, \rate, this_rate])}
	{b.media[bufnum].numChannels == 2} {Synth("qwerty-stereo-sample-playback", [\bufnum, bufnum, \rate, this_rate])};

	["Letter: "++ char, "Playback Speed: " ++ this_rate, "Number of Channels: " ++ b.media[bufnum].numChannels].postln;
	["Sound File: " ++ b.media[bufnum].path].postln;
	" ".postln;
	});
	*/