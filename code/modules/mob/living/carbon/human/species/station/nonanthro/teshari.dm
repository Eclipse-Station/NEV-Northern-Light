/datum/species/teshari
	name = SPECIES_TESHARI
	name_plural = SPECIES_TESHARI
	icobase = 'icons/mob/human_races/r_teshari_vr.dmi'
	deform = 'icons/mob/human_races/r_teshari_vr.dmi'
	total_health = 75 //Extremely more fragile
	brute_mod = 1
	burn_mod = 1


	color_mult = 1

	tail = "seromitail"
	icobase_tail = 1
/*
	male_cough_sounds = list('sound/effects/mob_effects/tesharicougha.ogg','sound/effects/mob_effects/tesharicoughb.ogg')
	female_cough_sounds = list('sound/effects/mob_effects/tesharicougha.ogg','sound/effects/mob_effects/tesharicoughb.ogg')
	male_sneeze_sound = 'sound/effects/mob_effects/tesharisneeze.ogg'
	female_sneeze_sound = 'sound/effects/mob_effects/tesharisneeze.ogg'

	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw
*/
	slowdown = -0.5 //Slightly more faster
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR //No eye colour

	cold_level_1 = 200 //Default 260 - Lower is better
	cold_level_2 = 160 //Default 200
	cold_level_3 = 100 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	blurb = "Hee hoo teshies" //Holy smokes I need someone to write this for me - Nestor

	humaniform = FALSE
	alt_icons_tag = "teshari"



/datum/species/teshari/get_gender_icon(var/g = MALE, var/slot)
	alt_icons = list(
		"uniform"		= (g == MALE) ? 'zzz_modular_eclipse/icons/mob/cut_up/teshari/uniform.dmi' : 'zzz_modular_eclipse/icons/mob/cut_up/teshari/uniform_f.dmi',
		"suit"			= (g == MALE) ? 'zzz_modular_eclipse/icons/mob/cut_up/teshari/suit.dmi' : 'zzz_modular_eclipse/icons/mob/cut_up/teshari/suit_f.dmi',
		"gloves"		= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/gloves.dmi',
		"glasses"		= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/glasses.dmi',
		"ears"			= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/ears.dmi',
		"mask"			= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/mask.dmi',
		"hat"			= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/hat.dmi',
		"shoes"			= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/shoes.dmi',
		"belt"			= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/belt.dmi',
		"s_store"		= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/s_store.dmi',
		"backpack"		= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/backpack.dmi',
		"underwear"		= 'zzz_modular_eclipse/icons/mob/cut_up/teshari/underwear.dmi'
		)
	return alt_icons[slot]