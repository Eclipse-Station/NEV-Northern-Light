/datum/species/human
	name = "Human"
	name_plural = "Humans"
	primitive_form = "Monkey"
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol government maintains control of its far-flung people, powerful corporate \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 17
	max_age = 110
	spawn_flags = CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

/datum/species/human/get_bodytype()
	return "Human"


/datum/species/unathi
	name = SPECIES_UNATHI
	name_plural = "Unathi"
	icobase = 'icons/mob/human_races/r_lizard.dmi'
	deform = 'icons/mob/human_races/r_def_lizard.dmi'
	tail = "sogtail"
	tail_animation = 'icons/mob/species/unathi/unathi_tail.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	primitive_form = SPECIES_MONKEY_UNATHI
	darksight = 3
//	ambiguous_genders = TRUE
	gluttonous = 1
	slowdown = 0.5
	total_health = 125
	brute_mod = 0.85
	burn_mod = 0.85
//	metabolic_rate = 0.85
//	item_slowdown_mod = 0.25
	mob_size = MOB_LARGE
	blood_volume = 840
//	bloodloss_rate = 0.75
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_UNATHI)
	name_language = LANGUAGE_UNATHI
//	species_language = LANGUAGE_UNATHI
//	health_hud_intensity = 2.5

	min_age = 32
	max_age = 260

//	economic_modifier = 7

	blurb = "A heavily reptillian species, Unathi hail from the \
	Uuosa-Eso system, which roughly translates to 'burning mother'.<br/><br/>Coming from a harsh, inhospitable \
	planet, they mostly hold ideals of honesty, virtue, proficiency and bravery above all \
	else, frequently even their own lives. They prefer warmer temperatures than most species and \
	their native tongue is a heavy hissing laungage called Sinta'Unathi."

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

/*	breath_cold_level_1 = 260	//Default 240 - Lower is better
	breath_cold_level_2 = 200	//Default 180
	breath_cold_level_3 = 120	//Default 100



	breath_heat_level_1 = 450	//Default 380 - Higher is better
	breath_heat_level_2 = 530	//Default 450
	breath_heat_level_3 = 1400	//Default 1250

	minimum_breath_pressure = 18	//Bigger, means they need more air
*/
	body_temperature = T20C

	spawn_flags = CAN_JOIN | IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#34AF10"
	blood_color = "#b3cbc3"
	base_color = "#066000"

//	reagent_tag = IS_UNATHI

//	move_trail = /obj/effect/decal/cleanable/blood/tracks/claw
/*
	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest/unathi),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin/unathi),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/unathi),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

	//No kidneys or appendix
	has_organ = list(
		O_HEART =    /obj/item/organ/internal/heart/unathi,
		O_LUNGS =    /obj/item/organ/internal/lungs/unathi,
		O_LIVER =    /obj/item/organ/internal/liver/unathi,
		O_BRAIN =    /obj/item/organ/internal/brain/unathi,
		O_EYES =     /obj/item/organ/internal/eyes,
		)
*/

	heat_discomfort_level = 295
	heat_discomfort_strings = list(
		"You feel soothingly warm.",
		"You feel the heat sink into your bones.",
		"You feel warm enough to take a nap."
		)

	cold_discomfort_level = 292
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your scales bristle against the cold."
		)
/*
	descriptors = list(
		/datum/mob_descriptor/height = 2,
		/datum/mob_descriptor/build = 2
		)*/

/datum/species/unathi/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/tajaran
	name = SPECIES_TAJ
	name_plural = "Tajaran"
	icobase = 'icons/mob/human_races/r_tajaran.dmi'
	deform = 'icons/mob/human_races/r_def_tajaran.dmi'
	tail = "tajtail"
	tail_animation = 'icons/mob/species/tajaran/tail.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 8
	slowdown = -0.5
//	snow_movement = -1		//Ignores half of light snow
	brute_mod = 1.15
	burn_mod =  1.15
	flash_mod = 1.1
//	metabolic_rate = 1.1
	gluttonous = 1
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_SIIK, LANGUAGE_AKHANI, LANGUAGE_ALAI)
	name_language = LANGUAGE_SIIK
//	species_language = LANGUAGE_SIIK
//	health_hud_intensity = 2.5

	min_age = 17
	max_age = 80

//	economic_modifier = 7

	blurb = "The Tajaran are a mammalian species resembling roughly felines, hailing from Meralar in the Rarkajar system. \
	While reaching to the stars independently from outside influences, the humans engaged them in peaceful trade contact \
	and have accelerated the fledgling culture into the interstellar age. Their history is full of war and highly fractious \
	governments, something that permeates even to today's times. They prefer colder, tundra-like climates, much like their \
	home worlds and speak a variety of languages, especially Siik and Akhani."

	body_temperature = 320.15	//Even more cold resistant, even more flammable

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80  //Default 120



	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000
	/*
	breath_cold_level_1 = 180	//Default 240 - Lower is better
	breath_cold_level_2 = 100	//Default 180
	breath_cold_level_3 = 60	//Default 100
	breath_heat_level_1 = 360	//Default 380 - Higher is better
	breath_heat_level_2 = 430	//Default 450
	breath_heat_level_3 = 1000	//Default 1250
*/
	primitive_form = SPECIES_MONKEY_TAJ

	spawn_flags = CAN_JOIN | IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

//	reagent_tag = IS_TAJARA

//	move_trail = /obj/effect/decal/cleanable/blood/tracks/paw

	heat_discomfort_level = 292
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	cold_discomfort_level = 275
/*
	has_organ = list(    //No appendix.
		O_HEART =    /obj/item/organ/internal/heart,
		O_LUNGS =    /obj/item/organ/internal/lungs,
		O_VOICE = 		/obj/item/organ/internal/voicebox,
		O_LIVER =    /obj/item/organ/internal/liver,
		O_KIDNEYS =  /obj/item/organ/internal/kidneys,
		O_BRAIN =    /obj/item/organ/internal/brain,
		O_EYES =     /obj/item/organ/internal/eyes
		)
*/
/datum/species/tajaran/equip_survival_gear(var/mob/living/carbon/human/H)
	..()
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/sandal(H),slot_shoes)

/datum/species/skrell
	name = SPECIES_SKRELL
	name_plural = "Skrell"
	icobase = 'icons/mob/human_races/r_skrell.dmi'
	deform = 'icons/mob/human_races/r_def_skrell.dmi'
	primitive_form = SPECIES_MONKEY_SKRELL
	unarmed_types = list(/datum/unarmed_attack/punch)
	blurb = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_SKRELLIAN, LANGUAGE_SCHECHI)
	name_language = LANGUAGE_SKRELLIAN
//	species_language = LANGUAGE_SKRELLIAN
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_TERMINUS, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)
//	health_hud_intensity = 2

//	water_movement = -3

	min_age = 19
	max_age = 130

//	economic_modifier = 12

	darksight = 4
	flash_mod = 1.2
//	chemOD_mod = 0.9

//	bloodloss_rate = 1.5

//	ambiguous_genders = TRUE

	spawn_flags = CAN_JOIN | IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR

	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	base_color = "#006666"

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120



	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000
/*
	breath_cold_level_1 = 250	//Default 240 - Lower is better
	breath_cold_level_2 = 190	//Default 180
	breath_cold_level_3 = 120	//Default 100

	breath_heat_level_1 = 400	//Default 380 - Higher is better
	breath_heat_level_2 = 500	//Default 450
	breath_heat_level_3 = 1350	//Default 1250

	reagent_tag = IS_SKRELL*/

/*	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/skrell),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)

/datum/species/skrell/can_breathe_water()
	return TRUE*/
