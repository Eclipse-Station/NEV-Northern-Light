/datum/storyteller/lookout  //This objective of this storyteller is to spawn antagonists at round-start, and then be quiet to let the crew roleplay and create their own drama.
	config_tag = "lookout"
	name = "The Lookout"
	welcome = "A foghorn in the distance. It's quiet, for now. Huddle close. Don't let the cold in."
	description = "A quiet storyteller that lets the ship speak for itself."

	gain_mult_mundane = 0.8
	gain_mult_moderate = 0.85
	gain_mult_major = 0.6 //STFU MY SHIT IS ON WHAT'S NEW SCOOBY DOO
	gain_mult_roleset = 0.9

	tag_weight_mults = list(TAG_COMBAT = 0.6, TAG_DESTRUCTIVE = 0.6)

	repetition_multiplier = 1 //Fine, since we want antags to spawn and not much else to happen that isn't combat or destructive.

	//Generates few events after spawning antagonists.
	points = list(
	EVENT_LEVEL_MUNDANE = 0, //Mundane
	EVENT_LEVEL_MODERATE = 10, //Moderate
	EVENT_LEVEL_MAJOR = 0, //Major
	EVENT_LEVEL_ROLESET = 220 //Roleset. Spawn one antag immediately, and another quickly.
	)
