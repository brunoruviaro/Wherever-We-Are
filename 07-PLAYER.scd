// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PLAYER 7

/*
DO ONCE:
- Write in the IP address of the destination (projection laptop). IP address needs to be a string (between double quotes), for example: "129.210.101.32".
- Save the changes.
*/

// HOW TO RUN: SELECT ALL (ctrl+A), EVALUATE (ctrl+Enter)
// A preferable alternative is to simply run the following command from a terminal:

// sclang PLAYER-7_Wherever_We_Are.scd

{

	~player = 7;
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

	// Player 7 loads a different file
	"Wherever_We_Are_PLAYER-7_SETTINGS.scd".loadRelative;

	"END".postln;

}.fork;