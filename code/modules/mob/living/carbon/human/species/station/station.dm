/datum/species/human
	name = SPECIES_HUMAN
	name_plural = "Humans"
	primitive_form = SPECIES_MONKEY
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last two centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol government acts as a United Front for humanity, powerful corporate \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best."
	num_alternate_languages = 2
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	min_age = 18
	max_age = 110
	remains_type = /obj/item/remains/human
	typical_skin_tones = list("#ffe0d1",
		"#fcccb3",
		"#e8b59b",
		"#d9ae96",
		"#c79b8b",
		"#ffdeb3",
		"#e3ba84",
		"#c4915e",
		"#b87840",
		"#a57a66",
		"#87563d",
		"#725547",
		"#866e63",
		"#754523",
		"#471c18")
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_TONE | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR

/datum/species/human/get_bodytype()
	return SPECIES_HUMAN


/datum/species/unathi
	name = SPECIES_UNATHI
	name_plural = "Unathi"
	icobase = 'icons/mob/human_races/r_lizard_vr.dmi'		//Eclipse edit.
	deform = 'icons/mob/human_races/r_def_lizard_vr.dmi'		//Eclipse edit.
	tail = "sogtail"
	tail_animation = 'icons/mob/species/unathi/tail_vr.dmi'		//Eclipse edit.
	tail_blend = ICON_MULTIPLY								//Eclipse edit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	primitive_form = SPECIES_MONKEY_UNATHI
	darksight = 3
//	ambiguous_genders = TRUE
	gluttonous = 1
	slowdown = 0.4
	total_health = 125
	brute_mod = 0.85
	burn_mod = 0.85
	color_mult = 1
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

	min_age = 25
	max_age = 260

//	economic_modifier = 7

	blurb = "A reptilian species from the Uuosa-Eso system that speaks the hissing Sinta'Unathi language. \
	Most Unathi are guided by a complex Ethnoreligion called the Unity,\
	which stresses honesty, bravery, and the perfection of one's craft. \
	Discovered less then a generation ago by SolGov,\
	an ensuring war against SolGov by the Unathi over the colony of Abel�s Rest has led to cross-migration between the two powers."

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

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#34AF10"
	blood_color = "#b3cbc3"
	base_color = "#066000"

	typical_skin_tones = list(
    "#7cfc00",  // Lawn Green
    "#32cd32",  // Lime Green
    "#228b22",  // Forest Green
    "#006400",  // Dark Green
    "#8b4513",  // Saddle Brown
    "#a0522d",  // Sienna
    "#d2691e",  // Chocolate
    "#8b0000",  // Dark Red
    "#556b2f",  // Dark Olive Green
    "#6b8e23",  // Olive Drab
    "#808000",  // Olive
    "#9acd32",  // Yellow Green
    "#2e8b57",  // Sea Green
    "#66cdaa",  // Medium Aquamarine
    "#20b2aa",  // Light Sea Green
    "#4682b4",  // Steel Blue
    "#5f9ea0",  // Cadet Blue
    "#8fbc8f"   // Dark Sea Green
	)

	reagent_tag = IS_UNATHI

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
	tail_blend = ICON_MULTIPLY								//Eclipse edit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 8
	slowdown = -0.3
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

	min_age = 18
	max_age = 80

//	economic_modifier = 7

	blurb = "The Tajaran are a feliform species from Meralar in the Rarkajar system. \
	They have a rich cultural history influenced by three predominant ethnic groups. \
	the Hharar who are the most populous and with noble lineages, The great explorers of the Njarir'Akhan, and the barbarians of the Zhan-Khazan. \
	Unlike many other species, the Tajaran homeworld is still not fully united and  \
	even now Tajara speak a variety of languages, including Siik and Akhani."

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

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"
	typical_skin_tones = list(
		"#8b4513",  // Saddle Brown
		"#a0522d",  // Sienna
		"#d2691e",  // Chocolate
		"#cd853f",  // Peru
		"#deb887",  // Burlywood
		"#f5deb3",  // Wheat
		"#ffe4c4",  // Bisque
		"#d2b48c",  // Tan
		"#a52a2a",  // Brown
		"#800000",  // Maroon
		"#000000",  // Black
		"#696969",  // Dim Gray
		"#808080",  // Gray
		"#a9a9a9",  // Dark Gray
		"#c0c0c0",  // Silver
		"#d3d3d3",  // Light Gray
		"#f0e68c",  // Khaki
		"#fff8dc"   // Cornsilk
	)
	reagent_tag = IS_TAJARA

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
	blurb = "An amphibious herbivore species, Skrell come from the Qerr'Vallis system, Skrell Society is very rigid and regimental \
	with a focus on knowlege and defined by an all encompassing caste system, with rulers, builders, scientists, artists and warriors. \
	The Skrell city-states are also close allies with humantiy and the Sol Central Government \
	though there remains a great tension over the regimented nature of Skrell society \
	and the refusal of the Skrell to reveal their secrets."
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

	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"
	base_color = "#006666"
	typical_skin_tones = list(
		"#8CD7A3",  // Light Matcha (as specified)
		"#5F9EA0",  // Cadet Blue
		"#20B2AA",  // Light Sea Green
		"#48D1CC",  // Medium Turquoise
		"#40E0D0",  // Turquoise
		"#7FFFD4",  // Aquamarine
		"#00CED1",  // Dark Turquoise
		"#4682B4",  // Steel Blue
		"#6495ED",  // Cornflower Blue
		"#00BFFF",  // Deep Sky Blue
		"#1E90FF",  // Dodger Blue
		"#98FB98",  // Pale Green
		"#90EE90",  // Light Green
		"#3CB371",  // Medium Sea Green
		"#2E8B57",  // Sea Green
		"#006400",  // Dark Green
		"#008080",  // Teal
		"#66CDAA",  // Medium Aquamarine
		"#7CFC00",  // Lawn Green
		"#00FA9A"   // Medium Spring Green
	)
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
*/
	reagent_tag = IS_SKRELL

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
