// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// EXTRA PLAYER

{
	~destination = "129.210.101.32";
	1.wait;
	["DESTINATION IP", ~destination].postln;

	"Wherever_We_Are_FULL_TEXT.scd".loadRelative;
	1.wait;

	"LOADING SAMPLES...".postln;
	"Wherever_We_Are_SYNTH.scd".loadRelative;
	5.wait;

	"Wherever_We_Are_EXTRA_PLAYER_SETTINGS.scd".loadRelative;
	"END".postln;
}.fork;