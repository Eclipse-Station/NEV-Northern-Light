#define DEFAULT_HUNGER_FACTOR 0.05 // Factor of how fast mob nutrition decreases

#define REM 0.2 // Means 'Reagent Effect Multiplier'. This is how many units of reagent are consumed per tick

#define CHEM_TOUCH		1	// splashing
#define CHEM_INGEST		2	// ingestion
#define CHEM_BLOOD		3	// injection

// Atom reagent_flags
#define INJECTABLE		(1<<0)	// Makes it possible to add reagents through droppers and syringes.
#define DRAWABLE		(1<<1)	// Makes it possible to remove reagents through syringes.

#define REFILLABLE		(1<<2)	// Makes it possible to add reagents through any reagent container.
#define DRAINABLE		(1<<3)	// Makes it possible to remove reagents through any reagent container.

#define TRANSPARENT		(1<<4)	// For containers with fully visible reagents.
#define AMOUNT_VISIBLE	(1<<5)	// For non-transparent containers that still have the general amount of reagents in them visible.

#define NO_REACT        (1<<6)  // Applied to a reagent holder, the contents will not react with each other.


// Is an open container for all intents and purposes.
#define OPENCONTAINER 	(REFILLABLE | DRAINABLE | TRANSPARENT)


#define MINIMUM_CHEMICAL_VOLUME 0.01

#define SOLID			1
#define LIQUID			2
#define GAS				3

#define REAGENTS_OVERDOSE 30

#define REAGENTS_MIN_EFFECT_MULTIPLIER 0.2
#define REAGENTS_MAX_EFFECT_MULTIPLIER 2.5

#define CHEM_SYNTH_ENERGY 3000 // How much energy does it take to synthesize 1 unit of chemical, in Joules.

#define CE_STABLE "stable" // Inaprovaline
#define CE_ANTIBIOTIC "antibiotic" // Spaceacilin
#define CE_BLOODRESTORE "bloodrestore" // Iron/nutriment
#define CE_PAINKILLER "painkiller"
#define CE_ALCOHOL "alcohol" // Liver filtering
#define CE_ALCOHOL_TOXIC "alcotoxic" // Liver damage
#define CE_SPEEDBOOST "gofast" // Hyperzine
#define CE_PULSE      "xcardic" // increases or decreases heart rate
#define CE_NOPULSE    "heartstop" // stops heartbeat
#define CE_MIND    		 "mindbending"  // Stabilizes or wrecks mind. Used for hallucinations
#define CE_ANTITOX       "antitox"      // Dylovene
#define CE_TOXIN         "toxins"       // Generic toxins, stops autoheal.
#define CE_SPEECH_VOLUME     "speach_volume"    // speech volume multiplier , default volume is integer and equals 2
#define CE_BLOODCLOT 	"bloodclot"	// Promote healing but thickens blood, slows and stops bleeding (range 0 - 1)
#define CE_OXYGENATED    "oxygen"       // Dexalin.
#define CE_PURGER "purger"	//Purger
#define CE_NOWITHDRAW "no_withdrawal" 
#define CE_VOICEMIMIC "voice_mimic"
#define CE_DYNAMICFINGERS "dynfingers"

// Reagent specific heat is not yet implemented, this is here for compatibility reasons
#define SPECIFIC_HEAT_DEFAULT			200

// // // ECLIPSE-ADDED DEFINES BEYOND THIS POINT // // //

// Ported from ES13
// Some on_mob_life() procs check for alien races.
// Used mostly to allow chems to react differently for different species.
#define IS_DIONA		1
#define IS_VOX			2	//Race not implemented.
#define IS_SKRELL		3
#define IS_UNATHI		4
#define IS_TAJARA		5
#define IS_XENOS		6	//Race not implemented.
#define IS_TESHARI		7
#define IS_SLIME		8
#define IS_VULP			9
#define IS_ZORREN		10
#define IS_SERGAL		11
#define IS_NEVREAN		12
#define IS_AKULA		13
#define IS_GOLEM		14
#define IS_MOTH			15