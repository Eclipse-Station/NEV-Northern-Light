/datum/storyteller/tyrant
	config_tag = "tyrant"
	name = "The Tyrant"
	welcome = "The universe itself is against you. Stand with your friends and defy the stars."
	description = "Ruthless storyteller that inspires unity in the crew by trying to crush them. Generates no antagonists."

	gain_mult_mundane = 1.5
	gain_mult_moderate = 1.5
	gain_mult_major = 1.5
	gain_mult_roleset = 0

	tag_weight_mults = list(TAG_COMBAT = 1.6, TAG_DESTRUCTIVE = 1.2)

	//Comrade generates a LOT of events, but never creates antagonists
	points = list(
	EVENT_LEVEL_MUNDANE = 50, //Mundane
	EVENT_LEVEL_MODERATE = 50, //Moderate
	EVENT_LEVEL_MAJOR = 80, //Major
	EVENT_LEVEL_ROLESET = 0 //Roleset
	)