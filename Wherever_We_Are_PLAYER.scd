// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PLAYER

/*
DO ONCE:
- Choose your player number (variable ~player below). Should be a number between 1 and 7.
- Write in the IP address of the destination (projection laptop). IP address needs to be a string (between double quotes), for example: "129.210.101.32".
- Save the changes.
*/

// HOW TO RUN: SELECT ALL (ctrl+A), EVALUATE (ctrl+Enter)
// A preferable alternative is to simply run the following command from a terminal:

// sclang Wherever_We_Are_PLAYER.scd

// The advantage of doing via terminal is that there is no way to accidentally introduce a typo in the code, causing last minute errors and desperation just before the performance...

{

	~player = 5;
	("PLAYER NUMBER: " ++ ~player).postln;
	1/2.wait;

	~destination = "129.210.101.32";
	("DESTINATION IP: " ++ ~destination).postln;
	1/2.wait;

	"Wherever_We_Are_FULL_TEXT.scd".loadRelative;
	1/2.wait;

	"LOADING SAMPLES...".postln;
	"Wherever_We_Are_SYNTH.scd".loadRelative;
	5.wait;

	if(~player==7,
		{ "Wherever_We_Are_EXTRA_PLAYER_SETTINGS.scd".loadRelative },
		{ "Wherever_We_Are_PLAYER_SETTINGS.scd".loadRelative }
	);

	"END".postln;
}.fork;