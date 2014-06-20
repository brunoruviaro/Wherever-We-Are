// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PROJECTION SETTINGS
//
// Displays a window with random "attack-decay" letters (no sound)
// How to run: Select all (ctrl + A), Evaluate (ctrl + Enter)

// Load full text (envir variable ~cage)
"Wherever_We_Are_FULL_TEXT.scd".loadRelative;
// Screen resolutions (open that file to change it)
"Wherever_We_Are_SCREEN_RESOLUTIONS.scd".loadRelative;

// Close older windows first
Window.closeAll;

// Create new window
w = Window.new("fullscreen", Rect(0, 0, ~screenWidth, ~screenHeight)).front;
w.background = Color.white;

// The numbers are the gaps and margins between objects inside window
w.view.decorator = FlowLayout( w.view.bounds, margin: ~margin, gap: ~gap );

// Letter containers
~letterArray = Array.fill(~cage.size, { arg count;
	var txt = StaticText(w.view, ~bounds);
	txt.background = Color.white;
	txt.stringColor = Color(0, 0, 0, 0); // transparent
	txt.font = Font("Courier", ~fontSize, false);
	txt.align = \center;
	txt.string = ~cage[count];
});

// Array for storing Routines (controlling visual action of each letter)
~fadeFunctionArray = Array.newClear(~letterArray.size);

// Trigger and Fade function (for when players send the right character)
~fade = { arg letterIndex, fadeTime;
	var routine, alpha = 1;

	routine = Routine { while( { alpha > 0 },
		{
			{ ~letterArray[letterIndex].stringColor = Color(0, 0, 0, alpha) }.defer;
			alpha = max(0, alpha - 0.02);
			(fadeTime/50).wait;
		}
	)};

	~fadeFunctionArray[letterIndex].stop;
	~fadeFunctionArray[letterIndex] = routine.play;

};

// Typo and Blink function (for when players send a typo)
~typo = { arg letterIndex;

	~fadeFunctionArray[letterIndex].stop;
	~fadeFunctionArray[letterIndex] = Routine {
		{ ~letterArray[letterIndex].stringColor = Color.red }.defer;
		0.5.wait;
		{ ~letterArray[letterIndex].stringColor = Color(0, 0, 0, 0) }.defer;
	}.play;

};

// Audience participation function (for audience laptops)
~audience = { arg letterIndex;
	var routine, alpha = 1, fadeTime = 2;

	routine = Routine { while( { alpha > 0 },
		{
			{ ~letterArray[letterIndex].stringColor = Color.yellow(alpha: alpha) }.defer;
			alpha = alpha - 0.02;
			(fadeTime/50).wait;
		}
	)};

	~fadeFunctionArray[letterIndex].stop;
	~fadeFunctionArray[letterIndex] = routine.play;

};


// Listen for OSC messages from players:
OSCdef(\triggerLetters, { |msg| ~fade.value(msg[1], 16) }, '/screen');

OSCdef(\triggerTypo, { |msg| ~typo.value(msg[1]) }, '/screen/typo');

OSCdef(\triggerAudience, { |msg| ~audience.value(msg[1]) }, '/screen/audience');

// Clean up letters on ctrl + period
// (make all letters invisible)
CmdPeriod.add({ ~letterArray.do({ |i| i.stringColor = Color(0, 0, 0, 0) }) });










// Test
/*
p = Pbind(
\type, \rest,
\letter, Pshuf((0..~letterArray.size-1), 1),
\fade, Pfunc( { |e| ~fade.value(e.at(\letter), 5) }),
\dur, Pwhite(0.02, 0.05)
).play;
*/




/*


// OLD Trigger and Fade function
~fade = { arg letterIndex, fadeTime;
var rout, alpha = 1;

rout = Routine { while( { alpha > 0 },
{
{ ~letterArray[letterIndex].stringColor = Color(0, 0, 0, alpha) }.defer;
alpha = alpha - 0.02;
(fadeTime/50).wait;
}
)};

// Trigger & fade only if letter is currently invisible:
{ if(
~letterArray[letterIndex].stringColor.alpha==0,
{ rout.play },
{"nothing"} )
}.defer;

};

*/
