Wherever-We-Are
===============

Piece for laptop orchestra.
Created for SCLOrk in 2013, second version in 2014.

### Summary

For a minimum of 8 players.

*Players 1-6* type excerpts of a quote from John Cage. Each letter plays a sample of prepared piano. When a typo occurs samples of rain and trucks are played. Text is displayed on projection to the audience.

*Player 7* types any letters in any order, erasing letters from the projection screen. Player 7 produces sounds similar to players 1-6, but slightly processed.

*Player 8* is the "projection" player. It receives OSC messages from the other players. This laptop is connected to a projector. The player controls fade time of letters on projection screen.

Each letter typed by a player flashes on screen for a few seconds, then fades out. The randomized appearance of letters on screen gives the audience the chance to read Cage's quote, not all at once, but put together as pieces of a puzzle. 

The full quote is:

> Wherever we are, what we hear is mostly noise. When we ignore it, it disturbs us. When we listen to it, we find it fascinating. The sound of a truck at fifty mph. Static between the stations. Rain. We want to capture and control these sounds, to use them, not as sound effects, but as musical instruments.

### Preliminary set-up

1. DO ONCE: Players open their respective file (beginning with PLAYER-1, PLAYER-2, etc.). They have to specify the IP address of the computer that will be projecting letters on the screen. This should be written (assigned) to the variable ~destination. Assuming IP address and player numbers won't change, there is no need to open this file again in rehearsals and concert.

2. DO ONCE: The Wherever-We-Are folder (clone of this github folder) contains all needed SuperCollider (*.scd) files. In addition, all players need to download a folder with samples from here: https://ccrma.stanford.edu/~ruviaro/audio/wherever_we_are/samples.zip - This folder must be copied inside the main Wherever-We-Are folder, and must be called "samples" (all lowercase). 

3. DO ONCE: Configure proper screen resolution for the projection in the file "Wherever_We_Are_SCREEN_RESOLUTIONS.scd". Two common resolutions are included by default (1024 x 768 and 1366 x 768). New resolutions can be easily created here to adapt for specific needs depending on the equipment used. Make sure only the desired resolution is commented out in the code. Occasionally, it might be necessary to tweak font size, margin, gap between letters, etc so that the full screen projection shows the full quote evenly distributed on the screen. This file will eventually be loaded automatically, so you don't have to open it every time.

4. Laptops need to be connected to a local network (wifi OK) to exchange OSC messages.

### Getting ready to play

#### PLAYER 8 (PROJECTION PLAYER)

* Do not use mirror screens (i.e., laptop screen separate from projection screen). 
* Open file "PLAYER-8_Wherever_We_Are.scd" in SuperCollider and run it line by line (Control + Enter on a line to run it).
* The first line loads the projection window: you should now see a gray, empty projection window displayed. Place it on the projector screen. Make it fullscreen using the next line `w.fullScreen`.
* During performance, you will be controling fade time of the letters using the line `~fadeTime = x`, where 'x' is the number of seconds the letters take to fade out on the screen.
 
#### PLAYERS 1, 2, 3, 4, 5, and 6 (TYPING PLAYERS)

* Go to a terminal, find your way to the Wherever-We-Are folder, and run the program from there (see below).
* Wait a few seconds as the program starts up (you will see updates on the terminal window).
* If all goes well, you should now have the small "typing window" where you will type Cage's excerpt.

Example: assuming the Wherever-We-Are folder was saved under Music/SuperCollider/, the two terminal commands would be:
```
cd Music/SuperCollider/Wherever-We-Are/
sclang Wherever_We_Are_PLAYER.scd
```
The advantage of starting up the program via terminal (as opposed to actually opening the file in the SuperCollider IDE) is that you avoid accidentally introducing a typo into the code, which might cause errors and inevitable panic just before a performance.

### How to play

* Players 1-6 take care of typing actual excerpts of text. The letters will show up on the projection screen in the specific sequence forming Cage's quote. Each player has a unique segment of the text assigned to them: the assigned segment is conveniently used as the title of their individual typing window.
* Player 7 is free to type any text. These letters will show up on the projection screen in yellow, in random order.
* Player 8 (projection player) simply changes the fade time of the letters at specific points in the piece (and may act as conductor as well).

#### Sparse beginning
* Players 1-6 start typing their fragment of the quote, slowly. They should simply type that sequence of characters in order. If they make a mistake, a different sound is played. Spaces, commas, and periods are also valid characters that need to be typed in the correct sequence.
* Player 7 also starts typing slowly, being generally sparser than players 1-6.
* Player 8 simply sets fade time to a number around 10 or 15 seconds.

#### Progression towards revealing the full text

* All typing players gradually speed up the rate of typing. Individual volume levels may be controlled in real time using their audio interfaces. It is up to the conductor to rehearse with the ensemble and suggest the right balance of volume.
* Projection player occasionally decreases fade time little by little. The result is that letters disappear more quickly from screen, as the players speed up the typing.
* Loudest and busiest part of the piece is when all players are typing as fast as they can, while letter fade time is set to very short (say, 1 or 2 seconds). At this point Cage's quote is likely to read in its entirety on screen, even though individual letters are all flashing in and out very quickly.

#### Break, then sparse ending

* Suddenly, projection player changes fade time to very long (for exampe, 30 or 40 seconds). At the sime time, projection player gives a cue to other players to slow down the typing immediately so that texture becomes very rarified and filled with silence. It shouldn't take too long between the cue and the establishment of the rarified texture. The result on screen now is that sparse sounds trigger letters that stick around for a long time on screen.
* Typing players type their sentence once or twice more, very sparsely, then the piece ends with the last fading letters on screen.

### Final comments

* The piece is open to variations or adaptations departing from this general shape.
* Players should not make mistakes (typos) on purpose. They should simply attempt to type their sentences as precisely as possible, only varying speed and rhythm. Mistakes are likely to occur as the typing speed goes up, and that's what will bring up the occasional rain and truck samples.
* Generally speaking, the role of player #7 (the random yellow letters) is to create a shadow of interference in what players 1-6 are doing. The specific result of player 7's typing is an "erasure" of existing letters on the projection. The sounds coming from player 7 are similar to those from players 1-6, but heavily filtered.


