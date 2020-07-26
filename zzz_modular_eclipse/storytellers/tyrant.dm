/datum/storyteller/tyrant
	config_tag = "tyrant"
	name = "The Tyrant"
	welcome = "The universe itself is against you. Stand with your friends and defy the stars."
	description = "Ruthless storyteller that inspires unity in the crew by trying to crush them. Generates no antagonists."

	gain_mult_mundane = 2
	gain_mult_moderate = 2
	gain_mult_major = 2.2
	gain_mult_roleset = 0

	tag_weight_mults = list(TAG_COMBAT = 1.6, TAG_DESTRUCTIVE = 1.2)

	repetition_multiplier = 0.75 //We want a variety of things to happen. The default setting causes infestation to gain a hilariously high weight over time

	//Tyrant generates a LOT of events, but never creates antagonists
	points = list(
	EVENT_LEVEL_MUNDANE = 25, //Mundane
	EVENT_LEVEL_MODERATE = 50, //Moderate
	EVENT_LEVEL_MAJOR = 80, //Major
	EVENT_LEVEL_ROLESET = 0 //Roleset
	)