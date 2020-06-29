/datum/soulcrypt_module/prosthetic_debug
	name = "prosthetic debugger"
	description = "A prosthetic debug and configuration tool."
	activation_message = "Debugger active."
	deactivation_message = "Debugger inactive."
	activates = TRUE

/datum/soulcrypt_module/prosthetic_debug/activate(mob/user)
	message_user("Prosthetic debugger engaging...")

	//First loop through and check if they even have robotic organs.
	var/delay = 0.5
	var/organ_count
	for(var/obj/item/organ/O in owner.wearer)
		if(BP_IS_ROBOTIC(O))
			organ_count++

	if(!organ_count)
		message_user("Error. No prosthetic organs detected!", MESSAGE_WARNING)
		return

	for(var/obj/item/organ/external/O in owner.wearer)
		if(O.owner != owner.wearer) //We really only give a crap about our owners organs. The ones that are attached to them, in particular.
			continue
		if(!BP_IS_ROBOTIC(O)) //We only care about robotic organs.
			continue
		var/burn_dmg_message
		var/brute_dmg_message
		var/has_damage = FALSE
		switch(O.burn_dam)
			if(0 to 1)
				burn_dmg_message = SPAN_NOTICE("No wiring fault detected.")
			if(2 to 10)
				burn_dmg_message = SPAN_NOTICE("Minor wiring fault detected.")
				has_damage = TRUE
			if(11 to 20)
				burn_dmg_message = SPAN_WARNING("Significant wiring fault detected.")
				has_damage = TRUE
			if(21 to INFINITY)
				burn_dmg_message = SPAN_DANGER("Critical short circuit detected.")
				has_damage = TRUE

		switch(O.brute_dam)
			if(0 to 1)
				brute_dmg_message = SPAN_NOTICE("No structural damage detected.")
			if(2 to 10)
				brute_dmg_message = SPAN_NOTICE("Minor structural damage detected.")
				has_damage = TRUE
			if(11 to 20)
				brute_dmg_message = SPAN_WARNING("Significant structural damage detected.")
				has_damage = TRUE
			if(21 to INFINITY)
				brute_dmg_message = SPAN_DANGER("Critical structural failure detected.")
				has_damage = TRUE
		var/orgname = O.name
		var/dmg_message = "Wiring Status - [burn_dmg_message]. Structural Status - [brute_dmg_message]"
		addtimer(CALLBACK(src, .proc/give_results, orgname, dmg_message, has_damage), delay SECONDS)
		delay += 0.5

	active = FALSE

/datum/soulcrypt_module/prosthetic_debug/proc/give_results(var/organ_name, var/dmg_message, var/has_damage)
	var/warning
	if(has_damage)
		warning = MESSAGE_WARNING
	message_user("[organ_name]: [dmg_message]", warning)

/datum/soulcrypt_module/prosthetic_debug/stat_text()
	return "Engage Diagnostics"