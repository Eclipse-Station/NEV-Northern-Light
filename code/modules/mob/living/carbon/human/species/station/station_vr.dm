/datum/species/sergal
	name = SPECIES_SERGAL
	name_plural = "Sergals"
	icobase = 'icons/mob/human_races/r_sergal.dmi'
	deform = 'icons/mob/human_races/r_def_sergal.dmi'
	tail = "tail"
	tail_animation = 'icons/mob/human_races/r_sergal.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	//slowdown = -0.5
	//brute_mod = 1.15
	//burn_mod =  1.15
	//gluttonous = 1
	num_alternate_languages = 3
//	secondary_langs = list(LANGUAGE_SAGARU)
//	name_language = LANGUAGE_SAGARU
	color_mult = 1

	min_age = 18
	max_age = 80

	blurb = "There are two subspecies of Sergal; Southern and Northern. Northern sergals are a highly aggressive race \
	that lives in the plains and tundra of their homeworld. They are characterized by long, fluffy fur bodies with cold colors; \
	usually with white abdomens, somewhat short ears, and thick faces. Southern sergals are much more docile and live in the \
	Gold Ring City and are scattered around the outskirts in rural areas and small towns. They usually have short, brown or yellow \
	(or other 'earthy' colors) fur, long ears, and a long, thin face. They are smaller than their Northern relatives. Both have strong \
	racial tensions which has resulted in more than a number of wars and outright attempts at genocide. Sergals have an incredibly long \
	lifespan, but due to their lust for violence, only a handful have ever survived beyond the age of 80, such as the infamous and \
	legendary General Rain Silves who is claimed to have lived to 5000."

	primitive_form = "Saru"

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
//	//inherent_verbs = list(/mob/living/proc/shred_limb)

	flesh_color = "#AFA59E"
	base_color = "#777777"

	reagent_tag = IS_SERGAL

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/*	has_limbs = list(
		BP_TORSO =  list("path" = /obj/item/organ/external/chest),
		BP_GROIN =  list("path" = /obj/item/organ/external/groin),
		BP_HEAD =   list("path" = /obj/item/organ/external/head/vr/sergal),
		BP_L_ARM =  list("path" = /obj/item/organ/external/arm),
		BP_R_ARM =  list("path" = /obj/item/organ/external/arm/right),
		BP_L_LEG =  list("path" = /obj/item/organ/external/leg),
		BP_R_LEG =  list("path" = /obj/item/organ/external/leg/right),
		BP_L_HAND = list("path" = /obj/item/organ/external/hand),
		BP_R_HAND = list("path" = /obj/item/organ/external/hand/right),
		BP_L_FOOT = list("path" = /obj/item/organ/external/foot),
		BP_R_FOOT = list("path" = /obj/item/organ/external/foot/right)
		)
*/
/datum/species/akula
	name = SPECIES_AKULA
	name_plural = "Akula"
	icobase = 'icons/mob/human_races/r_akula.dmi'
	deform = 'icons/mob/human_races/r_def_akula.dmi'
	tail = "tail"
	tail_animation = 'icons/mob/human_races/r_akula.dmi'
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	//slowdown = -0.5
	//brute_mod = 1.15
	//burn_mod =  1.15
	//gluttonous = 1
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_SKRELLIAN)
	name_language = LANGUAGE_SKRELLIAN
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_TERMINUS, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)	//Eclipse edit: Removes Skrellian from assisted languages as a patch
	color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb)

	min_age = 18
	max_age = 80

	blurb = "The Akula are a species of amphibious humanoids like the Skrell, but have an appearance very similar to that of a shark. \
	They were first discovered as a primitive race of underwater dwelling tribal creatures by the Skrell. At first they were not believed \
	to be noteworthy, but the Akula proved to be such swift and clever learners that the Skrell reclassified them as sentients. Allegedly, \
	the Akula were also the first sentient life that the Skrell had ever encountered beside themselves, and thus the two species became swift \
	allies over the next few hundred years. With the help of Skrellean technology, the Akula had their genome modified to be capable of \
	surviving in open air for long periods of time. However, Akula even today still require a high humidity environment to avoid drying out \
	after a few days, which would make life on an arid world like Virgo-Prime nearly impossible if it were not for Skrellean technology to aid them."

	primitive_form = "Sobaka"

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#777777"
	blood_color = "#1D2CBF"

	reagent_tag = IS_AKULA
/*
/datum/species/akula/can_breathe_water()
	return TRUE // Surprise, SHERKS.
*/
/datum/species/nevrean
	name = SPECIES_NEVREAN
	name_plural = "Nevreans"
	icobase = 'icons/mob/human_races/r_nevrean.dmi'
	deform = 'icons/mob/human_races/r_def_nevrean.dmi'
	tail = "tail"
//	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	//darksight = 8
	//slowdown = -0.5
	//brute_mod = 1.15
	//burn_mod =  1.15
	//gluttonous = 1
	num_alternate_languages = 3
//	secondary_langs = list(LANGUAGE_BIRDSONG)
//	name_language = LANGUAGE_BIRDSONG
	color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb,/mob/living/proc/flying_toggle,/mob/living/proc/start_wings_hovering)

	min_age = 18
	max_age = 80

	blurb = "Nevreans are a race of avian and dinosaur-like creatures living on Tal. They belong to a group of races that hails from Eltus, \
	in the Vilous system. Unlike sergals whom they share a star system with, their species is a very peaceful one. They possess remarkable \
	intelligence and very skillful hands that are put use for constructing precision instruments, but tire-out fast when repeatedly working \
	over and over again. Consequently, they struggle to make copies of same things. Both genders have a voice that echoes a lot. Their natural \
	tone oscillates between tenor and soprano. They are excessively noisy when they quarrel in their native language."

	primitive_form = "Sparra"

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"

	reagent_tag = IS_NEVREAN

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/datum/species/hi_zoxxen
	name = SPECIES_ZORREN_HIGH
	name_plural = "Zorren"
	icobase = 'icons/mob/human_races/r_fox_vr.dmi'
	deform = 'icons/mob/human_races/r_def_fox.dmi'
	tail = "tail"
//	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_TERMINUS)
	name_language = LANGUAGE_TERMINUS
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)	//Eclipse edit: Zorren can speak Terminus unassisted.

	min_age = 18
	max_age = 80

	blurb = "The fox-like Zorren are native to Virgo-Prime, however there are two distinct varieties of Zorren one with large ears and shorter fur, \
	and the other with longer fur that is a bit more vibrant. The long-eared, short-furred Zorren have come to be known as Flatland Zorren as that \
	is where most of their settlements are located. The Flatland Zorren are somewhat tribal and shamanistic as they have only recently started to be \
	hired by the Trans-Stellar Corporations. The other variety of Zorren are known as Highland Zorren as they frequently settle in hilly and/or \
	mountainous areas, they have a differing societal structure than the Flatland Zorren having a more feudal social structure, like the Flatland Zorren, \
	the Highland Zorren have also only recently been hired by the Trans-Stellar Corporations, but thanks to the different social structure they seem to \
	have adjusted better to their new lives. Though similar fox-like beings have been seen they are different than the Zorren."

	//primitive_form = "" //We don't have fox-monkey sprites.

	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	flesh_color = "#AFA59E"
	base_color = "#333333"
	blood_color = "#240bc4"
	color_mult = 1

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
	//inherent_verbs = list(/mob/living/proc/shred_limb)

	reagent_tag = IS_ZORREN		//Eclipse edit.

/datum/species/fl_zorren
	name = SPECIES_ZORREN_FLAT
	name_plural = "Zorren"
	icobase = 'icons/mob/human_races/r_fennec_vr.dmi'
	deform = 'icons/mob/human_races/r_def_fennec.dmi'
	tail = "tail"
//	icobase_tail = 1
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	num_alternate_languages = 3
	secondary_langs = list(LANGUAGE_TERMINUS)
	name_language = LANGUAGE_TERMINUS
//	assisted_langs = list(LANGUAGE_EAL, LANGUAGE_SKRELLIAN, LANGUAGE_SKRELLIANFAR, LANGUAGE_ROOTLOCAL, LANGUAGE_ROOTGLOBAL, LANGUAGE_VOX)	//Eclipse edit: Zorren can speak Terminus unassisted.

	min_age = 18
	max_age = 80

	blurb = "The fox-like Zorren are native to Virgo-Prime, however there are two distinct varieties of Zorren one with large ears and shorter fur, \
	and the other with longer fur that is a bit more vibrant. The long-eared, short-furred Zorren have come to be known as Flatland Zorren as that is \
	where most of their settlements are located. The Flatland Zorren are somewhat tribal and shamanistic as they have only recently started to be \
	hired by the Trans-Stellar Corporations. The other variety of Zorren are known as Highland Zorren as they frequently settle in hilly and/or \
	mountainous areas, they have a differing societal structure than the Flatland Zorren having a more feudal social structure, like the Flatland Zorren, \
	the Highland Zorren have also only recently been hired by the Trans-Stellar Corporations, but thanks to the different social structure they \
	seem to have adjusted better to their new lives. Though similar fox-like beings have been seen they are different than the Zorren."

	//primitive_form = "" //We don't have fennec-monkey sprites.
	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#AFA59E"
	base_color = "#333333"
	blood_color = "#240bc4"
	color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb)

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

	reagent_tag = IS_ZORREN		//Eclipse edit.

/datum/species/vulpkanin
	name = SPECIES_VULPKANIN
	name_plural = "Vulpkanin"
	icobase = 'icons/mob/human_races/r_vulpkanin.dmi'
	deform = 'icons/mob/human_races/r_vulpkanin.dmi'
//	path = /mob/living/carbon/human/vulpkanin
//	default_language = "Sol Common"
	secondary_langs = list(LANGUAGE_YUELDISCH)
	name_language = LANGUAGE_YUELDISCH
	primitive_form = "Wolpin"
	tail = "vulptail"
	tail_animation = 'icons/mob/species/vulpkanin/tail.dmi' // probably need more than just one of each, but w/e
	tail_blend = ICON_MULTIPLY								//Eclipse edit.
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 5 //worse than cats, but better than lizards. -- Poojawa
//	gluttonous = 1
	num_alternate_languages = 3
	color_mult = 1
	//inherent_verbs = list(/mob/living/proc/shred_limb)

	blurb = "Vulpkanin are a race of Canid-likes from the Vazzend system with a long history of \
	religious and philosophical conflicts ended by the current unifying body, the Vulpkanin Nation. \
	Their nation is an isolationist and totalitarian state led by ideas similar to Utilitarianism and with harsh criminal policies,\
	including the generational exile of criminals and dissidents. Meaning there is a large exodus of Vulpkanins to foreign space \
	though there remains a small community of temporary expats, still loyal to their home."

	primitive_form = "Wolpin"

		/* ECLIPSE EDIT - Re-added and updated with new GOON CODE sounds. Check the License file for details.*/
/*	speech_sounds = list('sound/goonstation/voice/growl1.ogg','sound/goonstation/voice/growl2.ogg','sound/goonstation/voice/growl3.ogg')
	speech_chance = 20

	scream_verb = "howls"
	male_scream_sound = 'sound/goonstation/voice/howl.ogg'
	female_scream_sound = 'sound/goonstation/voice/howl.ogg'
*/


	spawn_flags = SPECIES_CAN_JOIN
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR

	flesh_color = "#966464"
	base_color = "#B43214"

	min_age = 18
	max_age = 80

	reagent_tag = IS_VULP		//Eclipse edit
/*
/datum/species/unathi
	spawn_flags = SPECIES_CAN_JOIN //Species_can_join is the only spawn flag all the races get, so that none of them will be whitelist only if whitelist is enabled.
	icobase = 'icons/mob/human_races/r_lizard_vr.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_vr.dmi'
	tail_animation = 'icons/mob/species/unathi/tail_vr.dmi'
	color_mult
	min_age = 18
	gluttonous = 0
//	//inherent_verbs = list(/mob/living/proc/shred_limb)
*/
/datum/species/tajaran
	spawn_flags = SPECIES_CAN_JOIN
	icobase = 'icons/mob/human_races/r_tajaran_vr.dmi'
	deform = 'icons/mob/human_races/r_def_tajaran_vr.dmi'
	tail_animation = 'icons/mob/species/tajaran/tail_vr.dmi'
	color_mult = 1
	min_age = 18
	gluttonous = 0 //Moving this here so I don't have to fix this conflict every time polaris glances at station.dm
	//inherent_verbs = list(/mob/living/proc/shred_limb)
	heat_discomfort_level = 294 //Prevents heat discomfort spam at 20c

/datum/species/skrell
	spawn_flags = SPECIES_CAN_JOIN
	icobase = 'icons/mob/human_races/r_skrell_vr.dmi'
	deform = 'icons/mob/human_races/r_def_skrell_vr.dmi'
	color_mult = 1
	min_age = 18
	reagent_tag = null

/datum/species/diona
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	min_age = 18

/datum/species/teshari
	mob_size = MOB_MEDIUM
	spawn_flags = SPECIES_CAN_JOIN
	icobase = 'icons/mob/human_races/r_seromi_vr.dmi'
	deform = 'icons/mob/human_races/r_seromi_vr.dmi'
	color_mult = 1
	min_age = 18

	blurb = "A race of feathered raptors who developed alongside the Skrell, inhabiting \
	the polar tundral regions outside of Skrell territory. Extremely fragile, they developed \
	hunting skills that emphasized taking out their prey without themselves getting hit. They \
	are only recently becoming known on human stations after reaching space with Skrell assistance."
	push_flags = ~HEAVY //Allows them to use micro step code.
	swap_flags = ~HEAVY

	/*inherent_verbs = list(
		/mob/living/carbon/human/proc/sonar_ping,
		/mob/living/proc/hide,
		/mob/living/proc/shred_limb,
		/mob/living/proc/toggle_pass_table
		)*/

	reagent_tag = IS_TESHARI

/datum/species/shapeshifter/promethean
	spawn_flags = SPECIES_CAN_JOIN

/datum/species/human
	color_mult = 1
	icobase = 'icons/mob/human_races/r_human_vr.dmi'
	deform = 'icons/mob/human_races/r_def_human_vr.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_SKIN_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR
	min_age = 18
	base_color = "#EECEB3"

/datum/species/vox
	gluttonous = 0
	spawn_flags = SPECIES_CAN_JOIN | SPECIES_IS_WHITELISTED
	min_age = 18
	icobase = 'icons/mob/human_races/r_vox_old.dmi'
	deform = 'icons/mob/human_races/r_def_vox_old.dmi'
	//inherent_verbs = list(/mob/living/proc/shred_limb, /mob/living/proc/eat_trash)

	blurb = "The Vox are the broken remnants of a once-proud race, now reduced to little more than \
	scavenging vermin who prey on isolated stations, ships or planets to keep their own ancient arkships \
	alive. They are four to five feet tall, reptillian, beaked, tailed and quilled; human crews often \
	refer to them as 'shitbirds' for their violent and offensive nature, as well as their horrible \
	smell.<br/><br/>Most humans will never meet a Vox raider, instead learning of this insular species through \
	dealing with their traders and merchants; those that do rarely enjoy the experience."


/datum/species/human/vatgrown
	spawn_flags = SPECIES_IS_RESTRICTED
