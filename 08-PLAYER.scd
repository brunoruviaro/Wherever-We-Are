// ===============================
// PLAYER 8 - "Projection Player"
// (may double as conductor)
// This player must be connected to the projector.
// It receives messages from other players over network.
// This player's IP address should be entered into Players 1-7 file.
// ===============================


// Load screen
"Wherever_We_Are_PROJECTION.scd".loadRelative;

// Move it to projection screen, and make it full screen.

w.fullScreen; // run this (ctrl+Enter) if needed. It should hide Ubuntu top bar in the projection screen.

w.endFullScreen

// =========================
// Projection player can control fade times by changing
// and re-evaluating this variable during performance:

~fadeTime = 13;

// =========================


