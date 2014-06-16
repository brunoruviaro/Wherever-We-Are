(
// Close older windows first
Window.closeAll;

// Create new window
w = Window.new("fullscreen", Window.screenBounds).front;
w.background = Color.new255(255,255,255); //Color.white;

// The numbers are the gaps and margins between objects inside window
// w.view.decorator = FlowLayout( w.view.bounds, margin: 140@90, gap: 5@20 );
w.view.decorator = FlowLayout( w.view.bounds, margin: 0@0, gap: 9@18 );

~cage = "Wherever we are, what we hear is mostly noise. When we ignore it, it disturbs us. When we listen to it, we find it fascinating. The sound of a truck at fifty mph. Static between the stations. Rain. We want to capture and control these sounds, to use them, not as sound effects, but as musical instruments.";


)

Window.screenBounds
w.bounds

a.size

(
a = Array.fill(~cage.size, { arg count;
	var txt = StaticText(w.view, 40@50);
	txt.background = Color.white;
	txt.stringColor = Color(0, 0, 0, 0); // transparent
	txt.font = Font("Courier", 52, false);
	txt.align = \center;
	txt.string = ~cage[count];
});
)

a[8].stringColor = Color(0, 0, 0, 0.4);

(
~fade = { arg letter, fadeTime;
	var rout, alpha = 1;
	rout = Routine {
		while( { alpha > 0 },
			{
				{ a[letter].stringColor = Color(0, 0, 0, alpha) }.defer(0);
				alpha = alpha - 0.01;
				(fadeTime/100).wait;
			}
	);
		// { ("done fading " ++ letter ++ " " ++ a[letter].string ).postln; }.defer;
}.play;
};
)

a[30].string
2/100
~cage.size

(
p = Pbind(
	\type, \rest,
	\letter, Pseq((0..a.size-1), 1),
	\fade, Pfunc( { |e| ~fade.value(e.at(\letter), 1) }),
	\dur, Pwhite(0.02, 0.1)
).trace.play;
)

p.stop;



~fade.value(~cage.size.rand, 10)









a[7].font = Font("Courier", 52, true);
a[7].font = Font("Courier", 52, false);

a[1].string = "A"
a[1].font = Font("Courier", 24)

16.do{ StaticText(w.view, 80@80).string_( {"abcdefieouwx".choose}.value ) };

a = StaticText(w, Rect(10, 10, 200, 20));
a.string = "Rolof's Rolex";

a.background=Color.white;
a.align = \center;
a.font = Font("Courier", 31);
a.string = "Your Rolex";







// Create the function that will mass-create TextViews
~createLetters = {
	arg playername, color = Color.new255(255,255,255), fontsize = 40, win;
	var tex, responder;
	tex = TextView(win.view, 250@300);
	tex.font_(Font("Courier",fontsize));
	tex.background_(color);
	tex.editable_(false);
	tex.hasVerticalScroller_(false);
	responder = OSCFunc({ arg msg; {tex.string = msg[1].asString}.defer; }, "/"++playername.asSymbol, n);
	};

// Close older windows first
Window.closeAll;

// Create new window
w = Window.new("fullscreen", Window.screenBounds).front;
w.background = Color.new255(255,255,255); //Color.white;

// The numbers are the gaps and margins between objects inside window
w.view.decorator = FlowLayout( w.view.bounds, 10@10, 20@20 );

// Create all TextWindows
typewriter.do( { arg item, i;
	~createTextWindows.value(
		playername: item,
		color: colors[i],
		fontsize: 40,
		win: w)});