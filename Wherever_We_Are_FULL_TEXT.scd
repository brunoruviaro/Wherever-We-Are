// Wherever We Are (2012-2014)
// piece for laptop orchestra
//
// "Wherever we are, ..." (quote from John Cage's "Credo")
//
// FULL TEXT



// Full Text
~cage = "Wherever we are, what we hear is mostly noise. When we ignore it, it disturbs us. When we listen to it, we find it fascinating. The sound of a truck at fifty mph. Static between the stations. Rain. We want to capture and control these sounds, to use them, not as sound effects, but as musical instruments.   ";



// Text split into 6 sentences (one for each player)
~splitCage = [
	nil,
	"Wherever we are, what we hear is mostly noise.",                          // 1
	"When we ignore it, it disturbs us.",                                      // 2
	"When we listen to it, we find it fascinating.",                           // 3
	"The sound of a truck at fifty mph. Static between the stations. Rain.",   // 4
	"We want to capture and control these sounds,",                            // 5
	"to use them, not as sound effects, but as musical instruments."           // 6
];


// Starting index of each sentence within the full paragraph.
~sentenceIndex = [
	nil, // padding
	~cage.find("Wherever"), // player 1
	~cage.find("When we ignore"), // player 2
	~cage.find("When we listen"), // player 3
	~cage.find("The sound"), // player 4
	~cage.find("We want"), // player 5
	~cage.find("to use") // player 6
];


// Note sequences (midinotes)
~sonata2 = [76, 77, 78, 81, 83, 83, 81, 78, 77, 76, 70, 71, 72, 70, 71, 72, 75, 75, 81, 84, 87, 91, 93, 93, 91, 91, 87, 87, 84, 84, 81, 84, 79, 77, 84, 79, 79, 77, 75, 75, 75, 58, 59, 58, 59, 58 ];



"Wherever We Are - full text loaded.".postln;
"".postln;

// End Of File