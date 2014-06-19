// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// AUDIENCE PLAYER SETTINGS

var destination, win, localLetterArray, tex;

// Init
"Wherever_We_Are_FULL_TEXT.scd".loadRelative;

// var dummy2 = Window.closeAll;

// NetAddr of projection laptop (target)
destination = NetAddr("127.0.0.1", 57120);

// Typing window
win = Window.new(
	name: "jOhN cAgE",
	bounds: Rect(10, 10, 1000, 700),
	resizable: false).front;

// The numbers are the gaps and margins between objects inside window
win.view.decorator = FlowLayout( win.view.bounds, margin: 0@0, gap: 9@15 );

// Window background color
win.background = Color.gray;

localLetterArray = Array.fill(~cage.size, { arg count;
	var txt = StaticText(win.view, 30@40);
	txt.background = Color.gray;
	txt.stringColor = Color(0, 0, 0, 0); // transparent
	txt.font = Font("Courier", 32, false);
	txt.align = \center;
	txt.string = ~cage[count];
});


// Dummy just to input text
tex = StaticText(win, 15@5).focus(true);

// What to do at each key press:
// Audience member types a letter
// Find if and where that letter is present in Cage's paragraph
// If present, pick a random occurrence of it and make it blink on screen
// Send that letterIndex to destination so it also blinks there.

tex.keyDownAction =	{ arg view, char, modifiers, unicode, keycode;

	var candidates = ~cage.ascii.findAll([unicode]);

	if(candidates.notNil, {
		var letterIndex = candidates.choose;
		letterIndex.postln;

		// 1. Blink letter on local screen
		if(localLetterArray[letterIndex].stringColor.alpha == 0,
			{
				Routine { var alpha = 1, fadeTime = 6;
					while( { alpha > 0 },
						{
							{ localLetterArray[letterIndex].stringColor = Color.yellow(alpha: alpha) }.defer;
							alpha = max(0, alpha - (1/30));
							(fadeTime/30).wait;
						}
				)}.play;
			},
			{ "already busy".postln });

		// 2. Send letter to remote projection screen
		destination.sendMsg("/screen/audience", letterIndex);

		// 3. Play a sample locally
		Synth("qwerty-mono-sample-playback", [
			\buffer, ~bufferArray.reject{ |x| x.isNil }.choose,
			\rate, { rrand(0.8, 1.0) },
			\amp, { rrand(0.02, 0.5) }.value ]);



	});







};

// tex.font_(Font("Courier", 30));
// tex.stringColor_(Color.black);
// tex.string = "(type to make sounds and interact with the projection)";
// win.front;

// End of File

/*

