/datum/species/mothmen
	name = SPECIES_MOTH
	name_plural = "Mothpeople"
	icobase = 'icons/mob/human_races/r_moth.dmi'
	deform = 'icons/mob/human_races/r_moth.dmi'
	darksight = 12 //MOTHSSSS
//	ambiguous_genders = TRUE //Somewhat hard to get what gender a moff is
	total_health = 90 //Slightly more fragile
	brute_mod = 1
	burn_mod = 1.25 //Insects and fire
//	economic_modifier = 5 //Wagecuckin' it

	flash_mod = 2 //LAMP

	color_mult = 1

	tail = "tail" //Their wings are a tail because :v
	icobase_tail = 1

/*	male_cough_sounds = list('sound/effects/mob_effects/tesharicougha.ogg','sound/effects/mob_effects/tesharicoughb.ogg')
	female_cough_sounds = list('sound/effects/mob_effects/tesharicougha.ogg','sound/effects/mob_effects/tesharicoughb.ogg')
	male_sneeze_sound = 'sound/effects/mob_effects/tesharisneeze.ogg'
	female_sneeze_sound = 'sound/effects/mob_effects/tesharisneeze.ogg'

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw
*/
	slowdown = -0.3 //Slightly more faster
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR //No eye colour

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120
/*
	breath_cold_level_1 = 260	//Default 240 - Lower is better
	breath_cold_level_2 = 200	//Default 180
	breath_cold_level_3 = 120	//Default 100
*/
	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000
/*
	breath_heat_level_1 = 450	//Default 380 - Higher is better
	breath_heat_level_2 = 530	//Default 450
	breath_heat_level_3 = 1400	//Default 1250

	minimum_breath_pressure = 13	//Smaller, means they need less air. Also bubgs.
*/
	blurb = "An experiment of growing vast amounts of organic silk gone awry! These insectoid creatures were created by Lazarus Foundation \
	for commercial profit, but turned out to be sapient. Quickly adopted by the shrewd HR department of NanoTrasen, these arthropods \
	are educated and assigned mostly as menial workers on NanoTrasen ships and stations."
	
	reagent_tag = IS_MOTH