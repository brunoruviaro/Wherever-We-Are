// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// SYNTH (sample playback)

// Nothing needs to be changed in this file.
// All parameters can now be controlled directly through the Player patch.
// MONO FILES.


s.waitForBoot({

	// Free all existing buffers
	Buffer.freeAll;


	// Create bufferArray with 128 slots (so it's easy to think of midinotes)
	~bufferArray = Array.newClear(128);


	// Load all samples (sound files should be named from their midinote number, like 060.wav).
	// Array index becomes the same as midinote number.

	"samples/*.wav".resolveRelative.pathMatch.do({ |path|
		// only works if file name has 3 digits, like 060.wav
		var midinote = path.keep(-7).keep(3).asInteger;
		~bufferArray[midinote] = Buffer.read(s, path);
		midinote.postln;
	});


	// Create a SynthDef to play samples
	SynthDef("qwerty-mono-sample-playback", {
		arg buffer = 0, rate = 1, amp = 0.5;
		var out;
		out = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate, doneAction: 2);
		Out.ar(0, [out, out] * amp)
	}).add;

	// Create a SynthDef to play filtered samples - FOR PLAYER 7
	SynthDef("qwerty-mono-sample-playback-FILTER", {
		arg buffer = 0, rate = 1, amp = 0.5;
		var out, env;
		env = Env.perc(0.01, 6, amp, 4).kr(2);
		out = PlayBuf.ar(1, buffer, BufRateScale.kr(buffer) * rate);
		out = BPF.ar(out, LFNoise2.ar(1/10).range(100, 5000), 0.1);
		Out.ar(0, [out, out] * env)
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

});