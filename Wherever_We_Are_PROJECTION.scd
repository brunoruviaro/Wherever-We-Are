// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PROJECTION SETTINGS
//
// Displays a window with random "attack-decay" letters (no sound)
// How to run: Select all (ctrl + A), Evaluate (ctrl + Enter)

// Load full text (envir variable ~cage)
"Wherever_We_Are_FULL_TEXT.scd".loadRelative;

// Close older windows first
Window.closeAll;

// Create new window
w = Window.new("fullscreen", Window.screenBounds).front;
w.background = Color.white;

// The numbers are the gaps and margins between objects inside window
w.view.decorator = FlowLayout( w.view.bounds, margin: 0@0, gap: 9@18 );

// Letter containers
~letterArray = Array.fill(~cage.size, { arg count;
	var txt = StaticText(w.view, 40@50);
	txt.background = Color.white;
	txt.stringColor = Color(0, 0, 0, 0); // transparent
	txt.font = Font("Courier", 52, false);
	txt.align = \center;
	txt.string = ~cage[count];
});


// Trigger and Fade function
~fade = { arg letterIndex, fadeTime;
	var rout, alpha = 1;

	rout = Routine { while( { alpha > 0 },
			{
			{ ~letterArray[letterIndex].stringColor = Color(0, 0, 0, alpha) }.defer;
				alpha = alpha - 0.01;
				(fadeTime/100).wait;
			}
	)};

	// Trigger & fade only if letter is currently invisible:
	{ if(
		~letterArray[letterIndex].stringColor.alpha==0,
		{ rout.play },
		{"nothing"} )
	}.defer;

};

// Listen for OSC messages from players:
OSCdef(\triggerLetters, { |msg| ~fade.value(msg[1], 5) }, '/screen');
OSCdef(\triggerTypo, { |msg|
	{
		{ ~letterArray[msg[1]].stringColor = Color.red }.defer;
		0.2.wait;
		{ ~letterArray[msg[1]].stringColor = Color(0, 0, 0, 0) }.defer;

	}.fork;
}, '/screen/typo');


// Clean up letters on ctrl + period
// (make all letters invisible)
CmdPeriod.add({ ~letterArray.do({ |i| i.stringColor = Color(0, 0, 0, 0) }) });










// Test
/*
p = Pbind(
	\type, \rest,
	\letter, Pshuf((0..a.size-1), 1),
	\fade, Pfunc( { |e| ~fade.value(e.at(\letter), 5) }),
	\dur, Pwhite(0.02, 0.05)
).play;
*/
