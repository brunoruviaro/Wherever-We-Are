// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// PLAYER

// Choose your player number
// Write in the IP address of the destination (projection laptop).
// IP address needs to be a string (between double quotes); for example: "129.210.101.32"

~player = 1
~destination = "129.210.101.32"

"Wherever_We_Are_FULL_TEXT.scd".loadRelative;
"Wherever_We_Are_SYNTH.scd".loadRelative;
"Wherever_We_Are_PLAYER_SETTINGS.scd".loadRelative;