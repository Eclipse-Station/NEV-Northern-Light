/*
Soulcrypt base implant. All base functions are held here.
The module base code is held in module.dm
*/

/obj/item/implant/core_implant/soulcrypt
	name = "soulcrypt"
	desc = "A small, immensely complex biocompatible computer. Basic functions include DNA sequence storage, neural engram backups, access transciever functions, and an internal fuel cell using the host's nutrients."
	icon = 'icons/obj/soulcrypt.dmi'
	icon_state = "crypt_off"
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MATERIAL=2, TECH_BIO=7, TECH_DATA=5)


	var/host_dead = FALSE //Our host is dead. Or not? Binary doesn't care for philosphy.
	var/was_emp  = FALSE//Were we emp'd? This triggers the longer memory gap message.
	var/sent_revive_notice  = FALSE //We've sent the revive notice to our host, so we're not going to send it again. Until they die again, at least...
	var/has_stored_info = FALSE

	var/energy = 100 //How much energy do we have stored up from user nutrition?
	var/max_energy = 100 //The maximum amount of energy we can have stored.
	var/integrity = 100 //How much integrity we have - this is used pretty rarely, but certain modules might use it.
	var/max_integrity = 100 //Maximum integrity.
	var/next_energy_warning //In deciseconds.
	var/next_integrity_warning //In deciseconds.
	var/host_death_time //What time did our host die - if null, our host has not yet died, or the revive notice has been sent.
	var/max_programs = 5 //Maximum amount of programs a soulcrypt can have. add_programs ignores this, but it's only called when the soulcrypt is created.
	var/hacked_snatcher = FALSE //Can this override minds?

	var/nutrition_usage_setting = NUTRITION_USAGE_LOW //These can be found in soulcrypt.dm, under DEFINES.

	var/stat //Status.
	external = FALSE
	//Host variables, stored for cloning.
	var/datum/dna/host_dna
	var/datum/mind/host_mind
	var/host_age
	var/host_flavor_text
	var/datum/stat_holder/host_stats
	var/list/host_languages = list()
	var/host_name

	var/datum/soulcrypt_module/filemanager

	var/low_nutrition_message = "Host malnutrition detected; fuel cell disengaged. Running on internal reserves. Disengage modules to preserve reserves."
	var/low_energy_input_message = "Warning: Current energy usage exceeds fuel cell input. Reduce usage to avoid module shutdown."
	var/integrity_warning_message = "Warning: system integrity low. Service required soon."

	var/list/starting_modules = list(/datum/soulcrypt_module/prosthetic_debug)
//	var/list/modules = list()
//	var/list/access = list()

	var/good_sound = 'sound/machines/synth_yes.ogg'
	var/bad_sound = 'sound/machines/synth_no.ogg'
	var/very_bad_sound = 'sound/machines/warning-buzzer.ogg'

//Inherited procs

/obj/item/implant/core_implant/soulcrypt/Initialize()
	. = ..()
	add_modules(starting_modules)
	update_icon()

/obj/item/implant/core_implant/soulcrypt/update_icon()
	overlays.Cut()
	if(host_mind || host_dna)
		icon_state = "soulcrypt"
	else
		icon_state = "crypt_off"

/obj/item/implant/core_implant/soulcrypt/examine(mob/user)
	. = ..()
	if(host_name)
		to_chat(user, SPAN_NOTICE("This one appears to belong to [host_name]."))
	if(hacked_snatcher)
		to_chat(user, SPAN_DANGER("Debug mode light is on."))

/obj/item/implant/core_implant/soulcrypt/emag_act(mob/user)
	if(hacked_snatcher)
		to_chat(user, SPAN_NOTICE("You disable [src]'s debug mode."))
		hacked_snatcher = FALSE
		return 1
	else
		to_chat(user, SPAN_NOTICE("You enable [src]'s debug mode. It can now override minds."))
		hacked_snatcher = TRUE
		return 1

/obj/item/implant/core_implant/soulcrypt/on_install()
	activate()
	wearer.crypt = src

/obj/item/implant/core_implant/soulcrypt/on_uninstall()
	. = ..()
	wearer.crypt = null

/obj/item/implant/core_implant/soulcrypt/activate()
	if(!has_stored_info)
		host_mind = wearer.mind
		host_dna = wearer.dna.Clone()
		host_age = wearer.age
		host_flavor_text = wearer.flavor_text
		has_stored_info = TRUE
		host_name = wearer.dna.real_name
		host_stats = wearer.stats
		store_host_languages()
	stat = SOULCRYPT_ONLINE

	if(!wearer.mind || hacked_snatcher) //We're in a blank body. Or we're a bad person.

		if(!hacked_snatcher)
			for(var/mob/M in GLOB.player_list) //If they've respawned, we don't want to yoink them out of their current body.
				if(M.ckey == host_mind.key)
					if(M.stat != DEAD)
						return

		host_mind.transfer_to(wearer)
		wearer.ckey = host_mind.key
		send_revive_notice()
		for(var/L in host_languages)
			wearer.add_language(L)

	if(!is_processing)
		START_PROCESSING(SSobj, src)

	if(!hacked_snatcher)
		send_host_message("Soulcrypt online: neural backup completed. Welcome to SoulOS v1.71 rev 1.")
	else
		send_host_message("SOULCRYPT ONLINE. DEBUG MODE INITIATED. MIND TRANSFER COMPLETE. WELCOME TO SOULOS V1.71 REV 1 (DEBUG)")

/obj/item/implant/core_implant/soulcrypt/deactivate()
	deactivate_modules()
	STOP_PROCESSING(SSobj, src)

/obj/item/implant/core_implant/soulcrypt/GetAccess()
	return access

/obj/item/implant/core_implant/soulcrypt/emp_act()
	was_emp = TRUE
	deactivate_modules()

/obj/item/implant/core_implant/soulcrypt/Process()
	if(!wearer)
		return
	heartbeat()
	handle_energy()
	handle_integrity()
	handle_modules()


//Unique procs

/obj/item/implant/core_implant/soulcrypt/proc/heartbeat() //Pretty much just checks if the host is alive or dead and does things from there.
	if(wearer.stat == DEAD && !host_dead)
		host_death_time = world.time
		host_dead = TRUE
		send_death_message()

	if(wearer.stat != DEAD && host_dead)
		host_death_time = null
		host_dead = FALSE
//We use hostmind.current here because the odds are, whoever it is is a ghost.

/obj/item/implant/core_implant/soulcrypt/proc/send_death_message() //Sends the death message whenever the person who has this dies.
	to_chat(host_mind.current, SPAN_NOTICE("You are dead, whatever the cause, you are dead. With luck, someone will retrieve your soulcrypt and clone you - otherwise, welcome to purgatory."))
	switch(was_emp)
		if(TRUE)
			to_chat(host_mind.current, SPAN_WARNING("Your soulcrypt has been subjected to an electromagnetic pulse, and thus your neural engrams are unreliable. It's automatically pruning the unsalvagable memories, about five minutes worth. Perhaps more."))
		if(FALSE)
			to_chat(host_mind.current, SPAN_NOTICE("Luckily, your soulcrypt takes neural backups every thirty seconds. When you're cloned, you'll remember everything up to thirty seconds before your death."))

/obj/item/implant/core_implant/soulcrypt/proc/send_revive_notice() //Triggered by implantation into a mindless mob.
	to_chat(host_mind.current, SPAN_NOTICE("Congratulations on a new lease on life, you're being cloned."))
	switch(was_emp)
		if(TRUE)
			to_chat(host_mind.current, SPAN_WARNING("Your soulcrypt has been subjected to an electromagnetic pulse, and you're missing about five minutes of memory from before your death."))
		if(FALSE)
			to_chat(host_mind.current, SPAN_NOTICE("As your conciousness slowly emerges from the muck of resurrection, you remember everything that's occured up to about thirty seconds before your death."))

/obj/item/implant/core_implant/soulcrypt/proc/handle_modules() //Loops through the modules in the modules list, and handles their effects.
	for(var/datum/soulcrypt_module/M in modules)
		if(M.active)
			if(energy <= 0) //No energy, just deactivate all the modules.
				M.deactivate()
				continue
			M.handle_effects()

/obj/item/implant/core_implant/soulcrypt/proc/add_modules(var/starting_list) //Adds modules from a list.
	for(var/M in starting_list)
		add_module(M)

/obj/item/implant/core_implant/soulcrypt/add_module(var/module_path)
	for(var/datum/soulcrypt_module/M in modules)
		if(M.type == module_path)
			return //Prevent adding duplicates.
	var/datum/soulcrypt_module/module = new module_path
	modules += module
	module.owner = src

/obj/item/implant/core_implant/soulcrypt/remove_module(var/datum/soulcrypt_module/module) //Removes a module from the implant.
	module.owner = null
	qdel(module)

/obj/item/implant/core_implant/soulcrypt/proc/deactivate_modules() //Deactivates all active modules.
	for(var/datum/soulcrypt_module/M in modules)
		if(M.active)
			M.deactivate()

/obj/item/implant/core_implant/soulcrypt/proc/handle_energy() //Take some nutrition, provide energy. Remove the energy used by any active modules from this amount.
	var/energy_to_add = 0
	var/active_module_drain = 0
	var/nutrition_to_remove = 0
	var/user_starving = FALSE

	if(energy >= max_energy)
		return

	if(wearer.stat == DEAD)
		deactivate_modules()
		return

	for(var/datum/soulcrypt_module/M in modules) //Loop through modules that are active and have an upkeep cost, figure out how much the active drain will take from the energy we have.
		if(M.active && M.has_energy_upkeep)
			active_module_drain += M.energy_cost

	if(wearer.nutrition < (wearer.max_nutrition / 2))
		if(next_energy_warning < world.time + ENERGY_WARNING_DELAY)
			send_host_message(low_nutrition_message, MESSAGE_DANGER)
			next_energy_warning = world.time + ENERGY_WARNING_DELAY
		user_starving = TRUE

	switch(nutrition_usage_setting) //Get how much nutrition we use per tick.
		if(NUTRITION_USAGE_LOW)
			nutrition_to_remove = 1
		if(NUTRITION_USAGE_MEDIUM)
			nutrition_to_remove = 2
		if(NUTRITION_USAGE_HIGH)
			nutrition_to_remove = 3

	if(!user_starving)
		energy_to_add = nutrition_to_remove * SOULCRYPT_ENERGY_PER_NUTRITION //Simple maths to figure out what our energy budget is.

	energy_to_add -= active_module_drain

	if(active_module_drain > energy_to_add && (next_energy_warning < world.time + ENERGY_WARNING_DELAY) && !user_starving)
		send_host_message(low_energy_input_message, MESSAGE_WARNING)
		next_energy_warning = world.time + ENERGY_WARNING_DELAY

	energy += energy_to_add
	energy = CLAMP(energy, 0, 100)

	wearer.adjustNutrition(nutrition_to_remove)

/obj/item/implant/core_implant/soulcrypt/proc/handle_integrity()
	var/integrity_loss = 0

	for(var/datum/soulcrypt_module/M in modules)
		if(M.active && M.causes_wear)
			integrity_loss += M.wear_cause_amount

	if(integrity < (max_integrity / 2) && (next_integrity_warning < world.time + INTEGRITY_WARNING_DELAY))
		send_host_message(integrity_warning_message, MESSAGE_WARNING)
		next_integrity_warning = world.time + INTEGRITY_WARNING_DELAY

	integrity -= integrity_loss
	integrity = CLAMP(integrity, 0, 100)

/obj/item/implant/core_implant/soulcrypt/proc/send_host_message(var/message, var/message_type = MESSAGE_NOTICE)
	var/turf/T = get_turf(wearer)
	switch(message_type)
		if(MESSAGE_NOTICE)
			to_chat(wearer, SPAN_NOTICE("\icon[src] [src] transmits calmly, '[message]'"))
			wearer.playsound_local(T, good_sound, 30)
		if(MESSAGE_WARNING)
			to_chat(wearer, SPAN_WARNING("\icon[src] [src] transmits urgently, '[message]'"))
			wearer.playsound_local(T, bad_sound, 30)
		if(MESSAGE_DANGER)
			to_chat(wearer, SPAN_DANGER("\icon[src] [src] transmits urgently, '[message]'"))
			wearer.playsound_local(T, very_bad_sound, 30)

/obj/item/implant/core_implant/soulcrypt/proc/find_module_by_name(var/name)
	for(var/datum/soulcrypt_module/M in modules)
		if(M.name == name)
			return M

/obj/item/implant/core_implant/soulcrypt/proc/store_host_languages()
	for(var/datum/language/L in wearer.languages)
		host_languages += L.name
/*
/mob/living/carbon/human/verb/open_filemanager()
	set name = "Open Filemanager"
	set desc = "Opens the Soulcrypt's filemanager."
	set category = "Soulcrypt"

	var/obj/item/implant/core_implant/soulcrypt/SC = locate(/obj/item/implant/core_implant/soulcrypt) in src.contents

	if(!SC)
		to_chat(src, SPAN_WARNING("You don't have a soulcrypt, somehow."))

	if(SC.filemanager)
		SC.filemanager.activate(src)
	else
		SC.find_filemanager()
*/








