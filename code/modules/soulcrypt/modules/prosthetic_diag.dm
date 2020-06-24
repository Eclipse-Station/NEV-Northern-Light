/datum/soulcrypt_module/prosthetic_debug
	name = "prosthetic debugger"
	description = "A prosthetic debug and configuration tool."
	activation_message = "Debugger active."
	deactivation_message = "Debugger inactive."

/datum/soulcrypt_module/prosthetic_debug/activate(mob/user)
	message_user("Prosthetic debugger engaging...")

	//First loop through and check if they even have robotic organs.
	var/organ_count
	for(var/obj/item/organ/O in owner.wearer)
		if(BP_IS_ROBOTIC(O))
			organ_count++

	if(!organ_count)
		message_user("Error. No prosthetic organs detected!", MESSAGE_WARNING)
		return

	for(var/obj/item/organ/O in owner.wearer)
		if(O.owner != owner.wearer) //We really only give a crap about our owners organs. The ones that are attached to them, in particular.
			continue
		if(!BP_IS_ROBOTIC(O)) //We only care about robotic organs.
			continue
		var/dmg_message
		switch(O.damage)
			if(0 to 1)
				dmg_message = SPAN_NOTICE("No damage.")
			if(2 to 10)
				dmg_message = SPAN_NOTICE("Minor damage.")
			if(11 to 20)
				dmg_message = SPAN_WARNING("Significant damage.")
			if(21 to INFINITY)
				dmg_message = SPAN_DANGER("Critical damage.")
		var/orgname = O.name
		addtimer(CALLBACK(src, .proc/give_results, orgname, dmg_message), 0.5 SECONDS)

	active = FALSE

/datum/soulcrypt_module/prosthetic_debug/proc/give_results(var/organ_name, var/dmg_message)
	message_user("[organ_name]: [dmg_message]")