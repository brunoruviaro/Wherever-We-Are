// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PLAYER 2

/*

DO ONCE:
Write in the IP address of the destination (projection laptop). IP address needs to be a string (between double quotes), for example: "129.210.101.32". You may also use the name of the computer in the local network, for example "sclork-01.local". Save the changes.

HOW TO RUN: SELECT ALL (ctrl+A), EVALUATE (ctrl+Enter)

A preferable alternative is to simply run the following command from a terminal (without even opening this file):

sclang XX-PLAYER.scd

(where XX is the player number, with a leading zero, like 01-PLAYER.scd, 02-PLAYER.scd, etc)

*/

{

	~player = 2;
	("PLAYER NUMBER: " ++ ~player).postln;
	1/2.wait;

	~destination = "sclork-01.local";
	("DESTINATION IP: " ++ ~destination).postln;
	1/2.wait;

	"Wherever_We_Are_FULL_TEXT.scd".loadRelative;
	1/2.wait;

	"LOADING SAMPLES...".postln;
	"Wherever_We_Are_SYNTH.scd".loadRelative;
	5.wait;

	"Wherever_We_Are_PLAYER_SETTINGS.scd".loadRelative;

	"END".postln;
}.fork;