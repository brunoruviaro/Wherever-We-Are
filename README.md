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

### Preliminary set-up

1. DO ONCE: Players open file "Where_We_Are_PLAYER.scd" to pick their unique player number (from 1 to 6). This is assigned to the variable ~player. In addition, players have to specify the IP address of the computer that will be projecting letters on the screen. This is assigned to the variable ~destination. Assuming IP address and player numbers won't change, there is no need to open this file again in rehearsals and concert.

2. DO ONCE: The Wherever-We-Are folder (clone of this github folder) should contain all scd files, plus a single subfolder with all the samples. This subfolder should be called "samples" (all lowercase), and can be downloaded from: https://ccrma.stanford.edu/~ruviaro/audio/wherever_we_are/samples.zip

3. DO ONCE: Configure proper screen resolution for the projection in the file "Wherever_We_Are_SCREEN_RESOLUTIONS.scd". Two common resolutions are included by default (1024 x 768 and 1366 x 768). New resolutions can be easily created here to adapt for specific needs depending on the equipment used. Make sure only the desired resolution is commented out in the code. Occasionally, it might be necessary to tweak font size, margin, gap between letters, etc so that the full screen projection shows the full quote evenly distributed on the screen. This file will eventually be loaded automatically, so you don't have to open it every time.

### Getting ready to play

#### PROJECTION PLAYER

* Do not use mirror screens (i.e., laptop screen separate from projection screen). 
* Open file "Wherever_We_Are_PROJECTION.scd" to create the projection window.
* Select all (ctrl+A), then evaluate (ctrl+Enter).
* You should now see a gray, empty projection window displayed. Place it in the right location (projector screen).
* Open file "Wherever_We_Are_PROJECTION_FADETIME.scd".
* Run w.fullScreen if needed (this should hide Ubuntu's top bar from the projection screen)
* During performance, you will be controling fade time of the letters.
 
#### TYPING PLAYERS

* Go to a terminal, find your way to the Wherever-We-Are folder, and run `sclang Wherever_We_Are_PLAYER.scd" from there.
* Wait a few seconds as the program starts up (you will see updates on the terminal window).
* If all goes well, you should now have the small "typing window" where you will type Cage's excerpt.

The advantage of starting up the program via terminal (as opposed to actually opening the file) is that you avoid accidentally introducing a typo into the code, which might cause errors and inevitable panic just before a performance.

### How to play

Typing players start typing their fragment of the quote, slowly. Each player has a specific segment of the text assigned to them: it is conveniently used as the title of their individual typing window. They should simply type that sequence of characters in order. If they make a mistake, a different sound is played. Spaces, commas, and periods are also valid characters that need to be typed in the right sequence.

Typing players gradually speed up the rate of typing. Individual volume levels may be controlled in real time using their audio interfaces.

Projection player occasionally decreases fade time little by little.

Loudest part of the piece is when all players are typing as fast as they can, while letter fade time is set to very short (say, 1 or 2 seconds). At this point Cage's quote is almost likely easy to read in its entirety on screen.

Suddenly, projection player changes fade time to very long (for exampe, 30 or 40 seconds). Right after the change, projection player gives a cue to other players to slow down quickly so that texture becomes very rarified and filled with silence. It shouldn't take too long between the cue and the establishment rarified texture. The result on screen now is that sparse sounds trigger letters that stick around for a long time on screen.

Typing players type their sentence once or twice more, very sparse, then the piece ends with the last fading letters on screen.

The piece is open to variations or adaptations departing from this general shape.

### Optional "interference" laptops

Two or more laptops may be given to other players, or the audience, to "interfere" with the projected letters. These laptops should use the file "Wherever_We_Are_AUDIENCE.scd". These players can type anything they want (any sequence of characters), and the effect will be of "erasure" or existing letters on the projection. Each typed letter will also play a sample, but these laptops may or may not be connected to speakers depending on the context and constraints of a given performance.



