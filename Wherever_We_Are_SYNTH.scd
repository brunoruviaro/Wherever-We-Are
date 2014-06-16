// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// SYNTH (sample playback)

// Nothing needs to be changed in this file.
// All parameters can now be controlled directly through the Player patch.
// Accepts both mono and stereo samples. Calls appropriate Synth accordingly.
// Master Volume control available (controllable from main Player patch).

Buffer.freeAll;

~bufferArray = ("samples/*.wav".resolveRelative).pathMatch.collect { |i| Buffer.read(s, i)};

// Create a SynthDef to play samples
SynthDef("qwerty-mono-sample-playback", {
	arg bufnum = 0, rate = 1; // default values
	var out;
	//	out = SinOsc.ar(freq)*0.1;
	out = PlayBuf.ar(1, bufnum, rate, doneAction: 2);
	Out.ar(0, [out, out] * 0.5)
}).add;

SynthDef("qwerty-stereo-sample-playback", {
	arg bufnum = 0, rate = 1; // default values
	var out;
	//	out = SinOsc.ar(freq)*0.1;
	out = PlayBuf.ar(2, bufnum, rate, doneAction: 2);
	Out.ar(0, out)
}).add;

["Number of Samples Loaded Successfully: " ++ ~bufferArray.size].postln;

if(~bufferArray.size == 0, {"ERROR: No sound files were loaded. Wrong folder?".postln});
" ".postln;


/*
SynthDef("masterAmp", {arg inbus = 0, amp = 1;
     ReplaceOut.ar(inbus, In.ar(inbus, 2) * amp);
     }).add;

*/
// ~masterAmp = Synth("masterAmp", target: 0, addAction: \addToTail);

// Test
// {PlayBuf.ar(2, b.media[rrand(0, (b.media.size-1))])}.play; // number of channels and buffer
//////////////////////

//b.media.size