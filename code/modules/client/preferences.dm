#define SAVE_RESET -1

/datum/preferences
	//doohickeys for savefiles
	var/path
	var/default_slot = 1				//Holder so it doesn't default to slot 1, rather the last one used
	var/savefile_version = 0

	//non-preference stuff
	var/warns = 0
	var/muted = 0
	var/last_ip
	var/last_id

	var/custom_species = null

	var/save_load_cooldown

	//game-preferences
	var/lastchangelog = ""				//Saved changlog filesize to detect if there was a change

	var/list/time_of_death = list()//This is a list of last times of death for various things with different respawn timers

	var/list/crew_respawn_bonuses = list()
	//This is a list of bonuses that are subtracted from your crew respawn time
	//This is used to make certain ingame actions allow a dead player to respawn faster
	//It uses an associative list to prevent exploits, so the same bonus cannot be gained repeatedly.
	//It will just overwrite the value

	var/client/client = null
	var/client_ckey = null

	var/savefile/loaded_preferences
	var/savefile/loaded_character
	var/datum/category_collection/player_setup_collection/player_setup
	var/datum/browser/panel

/datum/preferences/New(client/C)
	if(istype(C))
		client = C
		client_ckey = C.ckey
		SScharacter_setup.preferences_datums += src
		if(SScharacter_setup.initialized)
			setup()
		else
			SScharacter_setup.prefs_awaiting_setup += src
	..()

/datum/preferences/proc/setup()
//	if(!length(GLOB.skills))
//		decls_repository.get_decl(/decl/hierarchy/skill)
	player_setup = new(src)
	gender = pick(MALE, FEMALE, PLURAL)
	family_name = random_last_name(species)									//Eclipse Edit
	real_name = random_first_name(gender,species) + " " + family_name		//Re-work surname into clanname
	b_type = RANDOM_BLOOD_TYPE

	if(client && !IsGuestKey(client.key))
		load_path(client.ckey)
		load_preferences()
		load_and_update_character()

	sanitize_preferences()
	if(client && istype(client.mob, /mob/new_player))
		var/mob/new_player/np = client.mob
		np.new_player_panel(TRUE)

/datum/preferences/proc/load_and_update_character(var/slot)
	load_character(slot)
	if(update_setup(loaded_preferences, loaded_character))
		save_preferences()
		save_character()

/datum/preferences/proc/ShowChoices(mob/user)
	if(!SScharacter_setup.initialized)
		return
	if(!user || !user.client)
		return

	if(!get_mob_by_key(client_ckey))
		to_chat(user, SPAN_DANGER("No mob exists for the given client!"))
		close_load_dialog(user)
		return

	if(!path && !IsGuestKey(user.client.key))
		error("Prefs failed to setup (datum): [user.client.ckey]")
		load_path(user.client.ckey)
		load_preferences()
		load_and_update_character()

	var/dat = "<html><body><center>"

	if(path)
		dat += "Slot - "
		dat += "<a href='?src=\ref[src];load=1'>Load slot</a> - "
		dat += "<a href='?src=\ref[src];save=1'>Save slot</a> - "
		dat += "<a href='?src=\ref[src];resetslot=1'>Reset slot</a> - "
		dat += "<a href='?src=\ref[src];reload=1'>Reload slot</a> - "		//Eclipse edit.
		dat += "<a href='?src=\ref[src];copy=1'>Copy slot</a> "				//Eclipse edit.

	else
		dat += "Please create an account to save your preferences."

	dat += "<br>"
	dat += player_setup.header()
	dat += "<br><HR></center>"
	dat += player_setup.content(user)

	dat += "</html></body>"
	var/datum/browser/popup = new(user, "Character Setup","Character Setup", 1200, 800, src)
	popup.set_content(dat)
	popup.open()

/datum/preferences/proc/process_link(mob/user, list/href_list)

	if(!user)	return
	if(isliving(user)) return

	if(href_list["preference"] == "open_whitelist_forum")
		if(config.forumurl)
			user << link(config.forumurl)
		else
			to_chat(user, SPAN_DANGER("The forum URL is not set in the server configuration."))
			return
	ShowChoices(usr)
	return 1

/datum/preferences/proc/check_cooldown()
	if(save_load_cooldown != world.time && (save_load_cooldown + PREF_SAVELOAD_COOLDOWN > world.time))
		return FALSE

	save_load_cooldown = world.time
	return TRUE


/datum/preferences/Topic(href, list/href_list)
	if(..())
		return 1

	if(href_list["save"])
		save_preferences()
		save_character()
	else if(href_list["reload"])
		load_preferences()
		load_character()
		sanitize_preferences()
	else if(href_list["load"])
		if(!IsGuestKey(usr.key))
			open_load_dialog(usr)
			return 1
	else if(href_list["changeslot"])
		load_character(text2num(href_list["changeslot"]))
		sanitize_preferences()
		close_load_dialog(usr)
	else if(href_list["resetslot"])
		if(real_name != input("This will reset the current slot. Enter the character's full name to confirm."))
			return FALSE
		load_character(SAVE_RESET)
		sanitize_preferences()
	else if(href_list["copy"])			//Eclipse edit.
		if(!IsGuestKey(usr.key))
			open_copy_dialog(usr)
			return 1
	else if(href_list["overwrite"])		//Eclipse edit.
		overwrite_character(text2num(href_list["overwrite"]))
		sanitize_preferences()
		close_load_dialog(usr)
	else
		return 0

	ShowChoices(usr)
	return 1

/datum/preferences/proc/copy_to(mob/living/carbon/human/character, is_preview_copy = FALSE)
	// Sanitizing rather than saving as someone might still be editing when copy_to occurs.
	player_setup.sanitize_setup()
	character.set_species(species)
	var/random_first = random_first_name(gender, species)
	var/random_last = random_last_name(gender, species)
	var/random_full = random_first + " " + random_last

// // // BEGIN ECLIPSE EDITS // // //
// Refactor full name system into family name system.
	if(be_random_name)
		family_name = random_last_name(gender, species)
		real_name = random_first_name(gender,species) + " " + family_name

	if(GLOB.in_character_filter.len) //This does not always work correctly but is here as a backup in case the first two attempts to catch bad names fail.
		if(findtext(real_name, config.ic_filter_regex))
			family_name = random_last
			real_name = random_full

	if(config.humans_need_surnames)
		if(!family_name)	//we need a surname
			family_name = "[pick(GLOB.last_names)]"
			real_name += " [family_name]"
	character.fully_replace_character_name(newname = real_name)
	character.family_name = family_name

// // // END ECLIPSE EDITS // // //

	character.gender = gender
	character.age = age
	character.b_type = b_type

	character.h_style = h_style
	character.f_style = f_style

	// Build mob body from prefs
	character.rebuild_organs(src)


	character.r_eyes = r_eyes
	character.g_eyes = g_eyes
	character.b_eyes = b_eyes

	character.h_style = h_style
	character.r_hair = r_hair
	character.g_hair = g_hair
	character.b_hair = b_hair

	character.f_style = f_style
	character.r_facial = r_facial
	character.g_facial = g_facial
	character.b_facial = b_facial
	character.r_skin = r_skin
	character.g_skin = g_skin
	character.b_skin = b_skin

	character.s_tone = s_tone

	character.ear_style			= ear_styles_list[ear_style]
	character.r_ears			= r_ears
	character.b_ears			= b_ears
	character.g_ears			= g_ears
	character.r_ears2			= r_ears2
	character.b_ears2			= b_ears2
	character.g_ears2			= g_ears2
	character.tail_style		= tail_styles_list[tail_style]
	character.r_tail			= r_tail
	character.b_tail			= b_tail
	character.g_tail			= g_tail
	character.r_tail2			= r_tail2
	character.b_tail2			= b_tail2
	character.g_tail2			= g_tail2
	character.wing_style		= wing_styles_list[wing_style]
	character.r_wing			= r_wing
	character.b_wing			= b_wing
	character.g_wing			= g_wing
	character.resize(size_multiplier, animate = FALSE)
	character.custom_species	= custom_species
	character.fuzzy				= fuzzy
	character.appearance_flags	-= fuzzy*PIXEL_SCALE

	character.body_markings = body_markings

	QDEL_NULL_LIST(character.worn_underwear)
	character.worn_underwear = list()

	for(var/underwear_category_name in all_underwear)
		var/datum/category_group/underwear/underwear_category = GLOB.underwear.categories_by_name[underwear_category_name]
		if(underwear_category)
			var/underwear_item_name = all_underwear[underwear_category_name]
			var/datum/category_item/underwear/UWD = underwear_category.items_by_name[underwear_item_name]
			var/metadata = all_underwear_metadata[underwear_category_name]
			var/obj/item/underwear/UW = UWD.create_underwear(character, metadata, 'icons/inventory/underwear/mob.dmi')
			if(UW)
				UW.ForceEquipUnderwear(character, FALSE)
		else
			all_underwear -= underwear_category_name

	for(var/N in character.organs_by_name)
		var/obj/item/organ/external/O = character.organs_by_name[N]
		O.markings.Cut()


	for(var/M in body_markings)
		var/datum/sprite_accessory/marking/mark_datum = body_marking_styles_list[M]
		var/mark_color = "[body_markings[M]]"

		for(var/BP in mark_datum.body_parts)
			var/obj/item/organ/external/O = character.organs_by_name[BP]
			if(O)
				O.markings[M] = list("color" = mark_color, "datum" = mark_datum)

	character.backpack_setup = new(backpack, backpack_metadata["[backpack]"])

	character.force_update_limbs()
	character.update_mutations(0)
	character.update_implants(0)


	character.update_body(0)
	character.update_underwear(0)

	character.update_hair(0)

	character.update_icons()

	if(is_preview_copy)
		return

	for(var/lang in alternate_languages)
		character.add_language(lang)

	character.med_record = med_record
	character.sec_record = sec_record
	character.gen_record = gen_record
	character.exploit_record = exploit_record
	if(!character.isSynthetic())
		character.nutrition = rand(250, 450)

	for(var/options_name in setup_options)
		if(!get_option(options_name))
			continue
		get_option(options_name).apply(character)

	character.post_prefinit()


/datum/preferences/proc/open_load_dialog(mob/user)
	var/dat  = list()
	dat += "<body>"
	dat += "<tt><center>"

	var/savefile/S = new /savefile(path)
	if(S)
		dat += "<b>Select a character slot to load</b><hr>"
		var/name
		for(var/i=1, i<= config.character_slots, i++)
			S.cd = GLOB.maps_data.character_load_path(S, i)
			S["real_name"] >> name
			if(!name)	name = "Character[i]"
			if(i==default_slot)
				name = "<b>[name]</b>"
			dat += "<a href='?src=\ref[src];changeslot=[i]'>[name]</a><br>"

	dat += "<hr>"
	dat += "</center></tt>"
	panel = new(user, "Character Slots", "Character Slots", 300, 390, src)
	panel.set_content(jointext(dat,null))
	panel.open()

/datum/preferences/proc/close_load_dialog(mob/user)
	if(panel)
		panel.close()
		panel = null
	user << browse(null, "window=saves")

	var/mob/new_player/np = client.mob
	np.new_player_panel_proc()			//Eclipse edit. Automatic refresh for current character.

/datum/preferences/proc/open_copy_dialog(mob/user)		//Eclipse edit.
	var/dat = "<body>"
	dat += "<tt><center>"

	var/savefile/S = new /savefile(path)
	if(S)
		dat += "<b>Select a character slot to overwrite</b><br>"
		dat += "<b>Once selected, you need to SAVE to confirm</b><hr>"
		var/name
		for(var/i=1, i<= config.character_slots, i++)
			S.cd = GLOB.maps_data.character_load_path(S, i)
			S["real_name"] >> name
			if(!name)	name = "Character[i]"
			if(i==default_slot)
				name = "<b>[name]</b>"
			dat += "<a href='?src=\ref[src];overwrite=[i]'>[name]</a><br>"

	dat += "<hr>"
	dat += "</center></tt>"
	panel = new(user, "Character Slots", "Character Slots", 300, 390, src)
	panel.set_content(dat)
	panel.open()