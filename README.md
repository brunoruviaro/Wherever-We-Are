Wherever-We-Are
===============

Piece for laptop orchestra.
Created for SCLOrk in 2013, second version in 2014.

### Description

Seven players total.

Six of the players type excerpts from a quote from John Cage on their laptops. Each letter plays a sample (mostly prepared piano, occasionally sounds of rain and trucks).

The seventh player runs a laptop connected to a projector receiving OSC messages from the other six players.

Each letter typed by a player flashes on screen for a few seconds, then fades out. The randomized appearance of letters on screen gives the audience the chance to read Cage's quote, not all at once, but put together as pieces of a puzzle. The seventh player controls fade time of these letters.

The full quote is:

> Wherever we are, what we hear is mostly noise. When we ignore it, it disturbs us. When we listen to it, we find it fascinating. The sound of a truck at fifty mph. Static between the stations. Rain. We want to capture and control these sounds, to use them, not as sound effects, but as musical instruments.

### Set-up

1. Players open file "Where_We_Are_PLAYER.scd". Each player should have a unique number assigned to the variable ~player (from 1 to 6). The file "Where_We_Are_PLAYER_SETTINGS.scd" only needs to be opened once to adjust the proper IP address of the projection laptop (in the variable called "destination").

2. The Wherever-We-Are folder should contain all scd files and a single subfolder with all the samples. This subfolder should be called "samples" (all lowercase). The audio files can be downloaded from:

3. The projection laptop uses the file "Wherever_We_Are_PROJECTION.scd" to create the projection window. The projection window should be displayed in full screen mode on the wall or proper screen visible to the audience. The projection player controls fade time of the letters using the file "Wherever_We_Are_PROJECTION_FADETIME.scd" during performance.

4. The file "Where_We_Are_SCREEN_RESOLUTIONS.scd" offers a couple of common resolutions. This file will be loaded by the PROJECTION file mentioned above, so you don't have to open this file every time. New resolutions can be easily created here to adapt for specific needs depending on the equipment used. Occasionally, it might be necessary to tweak font size, margin, gap between letters, etc so that the full screen projection shows the full quote evenly distributed on the screen.

5. No other files need to be changed (in principle...)

### How to play

Projection player starts projection on screen. A gray empty screen is displayed. Fade time is set to a medium value (for example, 15 seconds).

Typing players start typing their fragment of the quote, slowly. Each player has a specific segment of the text assigned to them: it is conveniently used as the title of their individual typing window. They should simply type that sequence of characters in order. If they make a mistake, a different sound is played. Spaces, commas, and periods are also valid characters that need to be typed in the right sequence.

Typing players gradually speed up the rate of typing. Individual volume levels may be controlled in real time using their audio interfaces.

Projection player occasionally decreases fade time little by little.

Loudest part of the piece is when all players are typing as fast as they can, while letter fade time is set to very short (say, 1 or 2 seconds). At this point Cage's quote is almost likely easy to read in its entirety on screen.

Suddenly, projection player changes fade time to very long (for exampe, 30 or 40 seconds). Right after the change, projection player gives a cue to other players to slow down quickly so that texture becomes very rarified and filled with silence. It shouldn't take too long between the cue and the establishment rarified texture. The result on screen now is that sparse sounds trigger letters that stick around for a long time on screen.

Typing players type their sentence once or twice more, very sparse, then the piece ends with the last fading letters on screen.

The piece is open to variations or adaptations departing from this general shape.

### Optional "interference" laptops

Two or more laptops may be given to other players, or the audience, to "interfere" with the projected letters. These laptops should use the file "Wherever_We_Are_AUDIENCE.scd". These players can type anything they want (any sequence of characters), and the effect will be of "erasure" or existing letters on the projection. Each typed letter will also play a sample, but these laptops may or may not be connected to speakers depending on the context and constraints of a given performance.



