// "Wherever we are, ..." (quote from John Cage's "Credo")
// EXAMPLE 1
//
// Displays a window with random "attack-decay" letters (no sound)
// How to run: Select all (ctrl + A), Evaluate (ctrl + Enter)

// Close older windows first
Window.closeAll;

// Create new window
w = Window.new("fullscreen", Window.screenBounds).front;
w.background = Color.white;

// The numbers are the gaps and margins between objects inside window
w.view.decorator = FlowLayout( w.view.bounds, margin: 0@0, gap: 9@18 );

// Text
~cage = "Wherever we are, what we hear is mostly noise. When we ignore it, it disturbs us. When we listen to it, we find it fascinating. The sound of a truck at fifty mph. Static between the stations. Rain. We want to capture and control these sounds, to use them, not as sound effects, but as musical instruments.   ";

// Letter containers
a = Array.fill(~cage.size, { arg count;
	var txt = StaticText(w.view, 40@50);
	txt.background = Color.white;
	txt.stringColor = Color(0, 0, 0, 0); // transparent
	txt.font = Font("Courier", 52, false);
	txt.align = \center;
	txt.string = ~cage[count];
});

// Fade function
~fade = { arg letterIndex, fadeTime;
	var rout, alpha = 1;
	rout = Routine { while( { alpha > 0 },
			{
				{ a[letterIndex].stringColor = Color(0, 0, 0, alpha) }.defer(0);
				alpha = alpha - 0.01;
				(fadeTime/100).wait;
			}
	)};

	{ if(
		a[letterIndex].stringColor.alpha==0,
		{ rout.play },
		{"nothing"} )
	}.defer;

};


// Play
p = Pbind(
	\type, \rest,
	\letter, Pshuf((0..a.size-1), 1),
	\fade, Pfunc( { |e| ~fade.value(e.at(\letter), 30) }),
	\dur, Pwhite(0.02, 0.1)
).play;

// Clean up letters on ctrl + period
CmdPeriod.add({ a.do({ |i| i.stringColor = Color(0, 0, 0, 0) }) });


