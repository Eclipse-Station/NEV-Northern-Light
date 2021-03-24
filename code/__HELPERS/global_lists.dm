var/list/clients = list()							//list of all clients
var/list/admins = list()							//list of all clients whom are admins
var/list/directory = list()							//list of all ckeys with associated client

//Since it didn't really belong in any other category, I'm putting this here
//This is for procs to replace all the goddamn 'in world's that are chilling around the code

GLOBAL_LIST_EMPTY(mob_list)					//EVERY single mob, dead or alive
GLOBAL_LIST_EMPTY(player_list)				//List of all mobs **with clients attached**. Excludes /mob/new_player
GLOBAL_LIST_EMPTY(human_mob_list)				//List of all human mobs and sub-types, including clientless
GLOBAL_LIST_EMPTY(silicon_mob_list)			//List of all silicon mobs, including clientless
GLOBAL_LIST_EMPTY(living_mob_list)			//List of all alive mobs, including clientless. Excludes /mob/new_player
GLOBAL_LIST_EMPTY(dead_mob_list)				//List of all dead mobs, including clientless. Excludes /mob/new_player
GLOBAL_LIST_EMPTY(current_antags)
GLOBAL_LIST_EMPTY(current_factions)
GLOBAL_LIST_EMPTY(superior_animal_list)		//A list of all superior animals; for targeting each other

GLOBAL_LIST_EMPTY(cable_list)					//Index for all cables, so that powernets don't have to look through the entire world all the time
GLOBAL_LIST_EMPTY(chemical_reactions_list)				//list of all /datum/chemical_reaction datums. Used during chemical reactions
GLOBAL_LIST_EMPTY(chemical_reactions_list_by_result)					//list of all /datum/chemical_reaction datums. But this one indexed by chemical result instead of reagents
GLOBAL_LIST_EMPTY(chemical_reagents_list)				//list of all /datum/reagent datums indexed by reagent id. Used by chemistry stuff
GLOBAL_LIST_EMPTY(landmarks_list)				//list of all landmarks created
GLOBAL_LIST_EMPTY(shuttle_landmarks_list)		//list of all /obj/effect/shuttle_landmark.
GLOBAL_LIST_EMPTY(old_surgery_steps)			//list of all old-style (not bound to organs) surgery steps
GLOBAL_LIST_EMPTY(surgery_steps)					//list of all new organ-based surgery steps
GLOBAL_LIST_EMPTY(mechas_list)				//list of all mechs. Used by hostile mobs target tracking. Not sure this is used anymore



GLOBAL_LIST_EMPTY(hearing_objects)			//list of all objects, that can hear mob say

//Jobs and economy
GLOBAL_LIST_EMPTY(joblist)					//list of all jobstypes, minus borg and AI
GLOBAL_LIST_EMPTY(all_departments)			//List of all department datums
var/global/list/department_IDs = list(DEPARTMENT_COMMAND, DEPARTMENT_MEDICAL, DEPARTMENT_ENGINEERING,
 DEPARTMENT_SCIENCE, DEPARTMENT_SECURITY, DEPARTMENT_GUILD, DEPARTMENT_CHURCH, DEPARTMENT_CIVILIAN)
GLOBAL_LIST_EMPTY(global_corporations)


GLOBAL_LIST_EMPTY(HUDdatums)

#define all_genders_define_list list(MALE, FEMALE, PLURAL, NEUTER)

var/global/list/turfs = list()						//list of all turfs

var/list/mannequins_

//Languages/species/whitelist.
var/global/list/all_species[0]
var/global/list/all_languages[0]
var/global/list/language_keys[0]					// Table of say codes for all languages
var/global/list/whitelisted_species = list(SPECIES_HUMAN) // Species that require a whitelist check.
var/global/list/playable_species = list(SPECIES_HUMAN)    // A list of ALL playable species, whitelisted, latejoin or otherwise.

// Posters
GLOBAL_LIST_EMPTY(poster_designs)

// Uplinks
var/list/obj/item/device/uplink/world_uplinks = list()

// Loot stash datums
GLOBAL_LIST_EMPTY(stash_categories) //An associative list in the format category_type = weight

GLOBAL_LIST_EMPTY(all_stash_datums)
//An associative list of lists in the format:
/*
	category_type = list(
	datum = weight)
*/

//PERKS
GLOBAL_LIST_EMPTY(all_perks)

//individual_objectives
GLOBAL_LIST_EMPTY(all_faction_items)

//faction_items
GLOBAL_LIST_EMPTY(individual_objectives)

//NeoTheology
GLOBAL_LIST_EMPTY(all_rituals)//List of all rituals
GLOBAL_LIST_EMPTY(global_ritual_cooldowns) // internal lists. Use ritual's cooldown_category

//Preferences stuff
	//Hairstyles
GLOBAL_LIST_EMPTY(hair_styles_list)        //stores /datum/sprite_accessory/hair indexed by name
GLOBAL_LIST_EMPTY(facial_hair_styles_list) //stores /datum/sprite_accessory/facial_hair indexed by name

GLOBAL_DATUM_INIT(underwear, /datum/category_collection/underwear, new())

var/global/list/exclude_jobs = list(/datum/job/ai,/datum/job/cyborg)

var/global/list/organ_structure = list(
	torso = list(name= "Torso", children=list(BP_GROIN, BP_HEAD, BP_R_ARM, BP_L_ARM)),
	groin = list(name= "Groin",     parent=BP_CHEST, children=list(BP_L_LEG, BP_R_LEG)),
	head  = list(name= "Head",      parent=BP_CHEST, children=list()),
	r_arm = list(name= "Right arm", parent=BP_CHEST, children=list(BP_R_HAND)),
	l_arm = list(name= "Left arm",  parent=BP_CHEST, children=list(BP_L_HAND)),
	r_leg = list(name= "Right leg", parent=BP_GROIN, children=list(BP_R_FOOT)),
	l_leg = list(name= "Left leg",  parent=BP_GROIN, children=list(BP_L_FOOT)),
	l_foot = list(name= "Left Foot",  parent=BP_L_LEG, children=list()),
	r_foot = list(name= "Right Foot",  parent=BP_R_LEG, children=list()),
	r_hand = list(name= "Right Hand",  parent=BP_R_ARM, children=list()),
	l_hand = list(name= "Left Hand",  parent=BP_L_ARM, children=list()),
	)
/*
var/global/list/organ_tag_to_name = list(
	head  = "head", r_arm = "right arm",
	chest = "body", r_leg = "right leg",
	l_foot = "left foot", r_foot = "right foot",
	r_hand = "right hand", l_hand = "left hand",
	eyes  = "eyes", l_arm = "left arm",
	groin = "groin",l_leg = "left leg",
	chest2= "back", heart = "heart",
	lungs  = "lungs", liver = "liver"
	)
*/
var/global/list/organ_tag_to_name = list(
	head  = "head", r_arm = "right arm",r_hand = "right hand",
	torso = "torso", r_leg = "right Leg",r_foot = "right foot",
	eyes  = "eyes", l_arm = "left arm", l_hand = "left hand",
	groin = "groin",l_leg = "left leg", l_foot = "left foot",
	chest2= "back", heart = "heart",    lungs  = "lungs",
	liver = "liver", brain = "brain"
	)

// Visual nets
var/list/datum/visualnet/visual_nets = list()
var/datum/visualnet/camera/cameranet = new()

var/global/list/syndicate_access = list(access_maint_tunnels, access_syndicate, access_external_airlocks)

// Strings which corraspond to bodypart covering flags, useful for outputting what something covers.
var/global/list/string_part_flags = list(
	"head" = HEAD,
	"face" = FACE,
	"eyes" = EYES,
	"upper body" = UPPER_TORSO,
	"lower body" = LOWER_TORSO,
	"legs" = LEGS,
	"arms" = ARMS,
	"feet" = FEET,
	"hands" = HANDS
)

// Strings which corraspond to slot flags, useful for outputting what slot something is.
var/global/list/string_slot_flags = list(
	"back" = SLOT_BACK,
	"face" = SLOT_MASK,
	"waist" = SLOT_BELT,
	"ID slot" = SLOT_ID,
	"ears" = SLOT_EARS,
	"eyes" = SLOT_EYES,
	"hands" = SLOT_GLOVES,
	"head" = SLOT_HEAD,
	"feet" = SLOT_FEET,
	"exo slot" = SLOT_OCLOTHING,
	"body" = SLOT_ICLOTHING,
	"uniform" = SLOT_ACCESSORY_BUFFER,
	"holster" = SLOT_HOLSTER
)

//A list of slots where an item doesn't count as "worn" if it's in one of them
var/global/list/unworn_slots = list(slot_l_hand,slot_r_hand, slot_l_store, slot_r_store,slot_robot_equip_1,slot_robot_equip_2,slot_robot_equip_3)

//////////////////////////
/////Initial Building/////
//////////////////////////

/proc/makeDatumRefLists()

	var/list/paths

	//Hair - Initialise all /datum/sprite_accessory/hair into an list indexed by hair-style name
	paths = subtypesof(/datum/sprite_accessory/hair)
	for(var/path in paths)
		var/datum/sprite_accessory/hair/H = new path()
		GLOB.hair_styles_list[H.name] = H

	//Facial Hair - Initialise all /datum/sprite_accessory/facial_hair into an list indexed by facialhair-style name
	paths = subtypesof(/datum/sprite_accessory/facial_hair)
	for(var/path in paths)
		var/datum/sprite_accessory/facial_hair/H = new path()
		GLOB.facial_hair_styles_list[H.name] = H


	//Body markings - Initialise all /datum/sprite_accessory/marking into an list indexed by marking name
	paths = typesof(/datum/sprite_accessory/marking) - /datum/sprite_accessory/marking
	for(var/path in paths)
		var/datum/sprite_accessory/marking/M = new path()
		body_marking_styles_list[M.name] = M


	//Surgery Steps - Initialize all /datum/surgery_step into a list
	paths = subtypesof(/datum/surgery_step)
	for(var/path in paths)
		var/datum/surgery_step/S = new path
		GLOB.surgery_steps[path] = S

	//perks - Initialise all /datum/perks into a list
	paths = subtypesof(/datum/perk)
	for(var/path in paths)
		var/datum/perk/P = new path
		GLOB.all_perks[path] = P

	paths = subtypesof(/datum/old_surgery_step)
	for(var/T in paths)
		var/datum/old_surgery_step/S = new T
		GLOB.old_surgery_steps += S
	sort_surgeries()

	//List of job department datums
	paths = subtypesof(/datum/department)
	for(var/T in paths)
		var/datum/department/D = new T
		GLOB.all_departments[D.id] = D

	//List of job datums
	paths = subtypesof(/datum/job)
	paths -= exclude_jobs
	for(var/T in paths)
		var/datum/job/J = new T
		GLOB.joblist[J.title] = J

	paths = subtypesof(/datum/individual_objective)
	for(var/T in paths)
		var/datum/individual_objective/IO = new T
		GLOB.individual_objectives[T] = IO

	//Stashes
	paths = subtypesof(/datum/stash)
	for(var/T in paths)
		var/datum/stash/L = new T
		//First, make a sublist in the main list if we haven't already
		//And make a sublist in the main list if we haven't already
		if (!GLOB.all_stash_datums[L.base_type])
			GLOB.all_stash_datums[L.base_type] = list()

		if (L.type == L.base_type)
			//This is a base category. Add it to the categories list with a weighting
			GLOB.stash_categories[L.base_type] = L.weight

		else
			//This is a specific stash datum, add it to the appropriate sublist
			GLOB.all_stash_datums[L.base_type][L] = L.weight


	//Languages and species.
	paths = subtypesof(/datum/language)
	for(var/T in paths)
		var/datum/language/L = new T
		all_languages[L.name] = L

	for (var/language_name in all_languages)
		var/datum/language/L = all_languages[language_name]
		if(!(L.flags & NONGLOBAL))
			language_keys[lowertext(L.key)] = L

	var/rkey = 0
	paths = subtypesof(/datum/species)
	for(var/T in paths)
		rkey++
		var/datum/species/S = new T
		S.race_key = rkey //Used in mob icon caching.
		all_species[S.name] = S

		if(!(S.spawn_flags & IS_RESTRICTED))
			playable_species += S.name
		if(S.spawn_flags & IS_WHITELISTED)
			whitelisted_species += S.name

	//Posters
	paths = subtypesof(/datum/poster) - /datum/poster/wanted
	for(var/T in paths)
		var/datum/poster/P = new T
		GLOB.poster_designs += P

	//Corporations
	paths = subtypesof(/datum/corporation)
	for(var/T in paths)
		var/datum/corporation/C = new T
		global.GLOB.global_corporations[C.name] = C

	paths = subtypesof(/datum/hud)
	for(var/T in paths)
		var/datum/hud/C = new T
		GLOB.HUDdatums[C.name] = C

	//Rituals
	paths = typesof(/datum/ritual)
	for(var/T in paths)
		var/datum/ritual/R = new T

		//Rituals which are just categories for subclasses will have a null phrase
		if (R.phrase)
			GLOB.all_rituals[R.name] = R

	return 1

var/global/list/admin_permissions = list(
	"fun" = 0x1,
	"server" = 0x2,
	"debug" = 0x4,
	"permissions" = 0x8,
	"mentor" = 0x10,
	"moderator" = 0x20,
	"admin" = 0x40,
	"host" = 0x80
	)

/proc/get_mannequin(var/ckey)
	if(!mannequins_)
		mannequins_ = new()
	. = mannequins_[ckey]
	if(!.)
		. = new/mob/living/carbon/human/dummy/mannequin()
		mannequins_[ckey] = .

var/global/list/severity_to_string = list("[EVENT_LEVEL_MUNDANE]" = "Mundane", "[EVENT_LEVEL_MODERATE]" = "Moderate", "[EVENT_LEVEL_MAJOR]" = "Major", "[EVENT_LEVEL_ROLESET]" = "Roleset","[EVENT_LEVEL_ECONOMY]" = "Economy")



//*** params cache
/*
	Ported from bay12, this seems to be used to store and retrieve 2D vectors as strings, as well as
	decoding them into a number
*/
var/global/list/paramslist_cache = list()

#define cached_key_number_decode(key_number_data) cached_params_decode(key_number_data, /proc/key_number_decode)
#define cached_number_list_decode(number_list_data) cached_params_decode(number_list_data, /proc/number_list_decode)

/proc/cached_params_decode(var/params_data, var/decode_proc)
	. = paramslist_cache[params_data]
	if(!.)
		. = call(decode_proc)(params_data)
		paramslist_cache[params_data] = .

/proc/key_number_decode(var/key_number_data)
	var/list/L = params2list(key_number_data)
	for(var/key in L)
		L[key] = text2num(L[key])
	return L

/proc/number_list_decode(var/number_list_data)
	var/list/L = params2list(number_list_data)
	for(var/i in 1 to L.len)
		L[i] = text2num(L[i])
	return L


/*
	CUSTOMIZATION
	  BULLSHIT
	 			*/


var/global/list/ear_styles_list = list()	// Stores /datum/sprite_accessory/ears indexed by type
var/global/list/tail_styles_list = list()	// Stores /datum/sprite_accessory/tail indexed by type
var/global/list/wing_styles_list = list()	// Stores /datum/sprite_accessory/wing indexed by type
var/global/list/negative_traits = list()	// Negative custom species traits, indexed by path
var/global/list/neutral_traits = list()		// Neutral custom species traits, indexed by path
var/global/list/positive_traits = list()	// Positive custom species traits, indexed by path
var/global/list/traits_costs = list()		// Just path = cost list, saves time in char setup
var/global/list/all_traits = list()			// All of 'em at once (same instances)

var/global/list/custom_species_bases = list() // Species that can be used for a Custom Species icon base

//stores numeric player size options indexed by name  Eclipse edit - changed Macro to Giant
var/global/list/player_sizes_list = list(
		"Giant" 	= RESIZE_HUGE,
		"Big" 		= RESIZE_BIG,
		"Normal" 	= RESIZE_NORMAL,
		"Small" 	= RESIZE_SMALL,
		"Tiny" 		= RESIZE_TINY)



/hook/startup/proc/init_vore_datum_ref_lists()
	var/paths

	// Custom Ears
	paths = typesof(/datum/sprite_accessory/ears) - /datum/sprite_accessory/ears
	for(var/path in paths)
		var/obj/item/clothing/head/instance = new path()
		ear_styles_list[path] = instance

	// Custom Tails
	paths = typesof(/datum/sprite_accessory/tail) - /datum/sprite_accessory/tail - /datum/sprite_accessory/tail/taur
	for(var/path in paths)
		var/datum/sprite_accessory/tail/instance = new path()
		tail_styles_list[path] = instance

	// Custom Wings
	paths = typesof(/datum/sprite_accessory/wing) - /datum/sprite_accessory/wing
	for(var/path in paths)
		var/datum/sprite_accessory/wing/instance = new path()
		wing_styles_list[path] = instance

	// Custom species traits
/*	paths = typesof(/datum/trait) - /datum/trait
	for(var/path in paths)
		var/datum/trait/instance = new path()
		if(!instance.name)
			continue //A prototype or something
		var/cost = instance.cost
		traits_costs[path] = cost
		all_traits[path] = instance
		switch(cost)
			if(-INFINITY to -0.1)
				negative_traits[path] = instance
			if(0)
				neutral_traits[path] = instance
			if(0.1 to INFINITY)
				positive_traits[path] = instance*/

	// Custom species icon bases
	var/list/blacklisted_icons = list(SPECIES_CUSTOM,SPECIES_PROMETHEAN) //Just ones that won't work well.
	for(var/species_name in playable_species)
		if(species_name in blacklisted_icons)
			continue
		var/datum/species/S = all_species[species_name]
		if(S.spawn_flags & SPECIES_IS_WHITELISTED)
			continue
		custom_species_bases += species_name

	return 1 // Hooks must return 1

//Markings
var/global/list/body_marking_styles_list = list()
