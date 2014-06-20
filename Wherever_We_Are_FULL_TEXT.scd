// Wherever We Are (2012-2014)
// piece for laptop orchestra (6 players plus conductor)
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

~score = [
	// nothing on slot zero
	nil,
	// PLAYER 1: beginning of sonata 2
	[76, 77, 78, 81, 83, 83, 81, 78, 77, 76, 70, 71, 72, 70, 71, 72, 75, 75, 81, 84, 87, 91, 93, 93, 91, 91, 87, 87, 84, 84, 81, 84, 79, 77, 84, 79, 79, 77, 75, 75, 75, 58, 59, 58, 59, 58],

	// PLAYER 2: beginning of sonata 3
	[57, 57, 77, 78, 80, 81, 57, 80, 77, 78, 57, 77, 78, 80, 81, 57, 80, 77, 78, 77, 78, 80, 81, 80, 57, 77, 71, 57, 57, 61, 62, 63, 62, 61],

	// PLAYER 3: beginning of sonata 5
	[59, 63, 66, 69, 71, 75, 78, 81, 83, 83, 86, 84, 56, 63, 66, 69, 68, 75, 78, 81, 84, 84, 90, 86, 95, 102, 90, 84, 78, 71, 88, 84, 81, 84, 88, 91, 95, 91, 88, 84, 60, 59, 55, 52, 48 ],

	// PLAYER 4: sonatat X (or XI?)
	[40, 47, 50, 78, 90, 54, 59, 69, 68, 79, 83, 95, 26, 38, 57, 62, 54, 66, 78, 62, 67, 81, 86, 78, 90, 102, 86, 91, 70, 78, 81, 69, 81, 83, 81, 68, 81, 83, 81, 67, 81, 83, 62, 58, 60, 56, 74, 86, 88, 76, 88, 89, 89, 91, 100, 97, 94, 91, 88, 85, 82, 79, 82, 85, 88, 91, 94, 97, 101],

	// PLAYER 5: beginning of sonata 5
	[59, 63, 66, 69, 71, 75, 78, 81, 83, 83, 86, 84, 56, 63, 66, 69, 68, 75, 78, 81, 84, 84, 90, 86, 95, 102, 90, 84, 78, 71, 88, 84, 81, 84, 88, 91, 95, 91, 88, 84, 60, 59, 55, 52],

	// PLAYER 6 (mix of 1 and 4):
	[40, 47, 50, 78, 90, 54, 59, 69, 68, 79, 83, 95, 26, 38, 57, 62, 54, 66, 78, 62, 67, 81, 86, 78, 90, 102, 81, 83, 81, 68, 81, 83, 81, 67, 81, 57, 57, 77, 78, 80, 81, 57, 80, 77, 80, 81, 57, 80, 77, 78, 77, 78, 80, 81, 80, 57, 77, 71, 57, 57, 61, 62],


];


// ~splitCage.collect{ |i| i.size }
// [ 0, 46, 34, 45, 69, 44, 62 ]


"Wherever We Are - full text loaded.".postln;
"".postln;

// End Of File














// add samples for truck rain static
// [ 40, 47, 48, 52, 54, 66, 69, 79, 82, 86, 102 ].size


/*

// these are the notes used by Cage (taken from Buffer midinote indices)
a = ~bufferArray.collect{ |item, index| if(item.notNil, { index } ) }.reject{ |i| i.isNil };

b = ~score.flat.reject{ |i| i.isNil };

// QUESTION: Are all elements from Array a present in Array b?

// true if present, false if absent:
a.collect{ |item| [item, b.indexOf(item).notNil].postln };

// prints only common items:
a.collect{ |item| if(b.indexOf(item).notNil, { (item.asString ++ " is present").postln }) };

// prints only items from a that are NOT present in b:
a.collect{ |item| if(b.indexOf(item).isNil, { (item.asString ++ " is NOT present").postln }) };

x = a.collect{ |item| if(b.indexOf(item).isNil, { item }) }.reject{ |i| i.isNil };
