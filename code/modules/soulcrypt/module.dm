/datum/soulcrypt_module
	var/name = "soulcrypt module"
	var/description = "A module for a soulcrypt."

	var/cooldown_time = 0 //Time in deciseconds
	var/cooldown_delay = 0 //Time in deciseconds.

	var/energy_cost = 0 //One time, or over time.
	var/wear_cause_amount = 0 //How much wear does this cause on the soulcrypt? Should be rather low - something like 0.02.

	var/has_cooldown = FALSE //Do we have a cooldown?
	var/uses_energy = FALSE //Do we use energy from the soulcrypt?
	var/active = FALSE //Are we even being used right now?
	var/has_energy_upkeep = FALSE //Do we use energy per tick to stay active?
	var/causes_wear = FALSE //Does this cause wear on the soulcrypt's systems?
	var/viewable_by_file_broswer = FALSE //Can the file broswer see us? Used ... for the file browser, ironically. And for programs that don't have a UI function.
	var/activates = FALSE

	var/deactivation_message = "Module deactivated."
	var/activation_message = "Module activated."

	var/list/req_access = list()
	var/list/req_one_access = list()

	var/obj/item/weapon/implant/soulcrypt/owner //The soulcrypt that owns us.

	var/obj/effect/crypt_stat/stat_line

/datum/soulcrypt_module/New()
	stat_line = new(src)

/datum/soulcrypt_module/Destroy()
	owner = null
	. = ..()

/datum/soulcrypt_module/proc/message_user(var/message, var/message_type = MESSAGE_NOTICE)
	owner.send_host_message(message, message_type)

/datum/soulcrypt_module/proc/check_can_activate() //Can we activate? Do we have enough energy, is our cooldown over, and does our user have access to this?

	if(has_cooldown && (cooldown_time > world.time + cooldown_delay))
		return FALSE

	if(req_access.len)
		if(!owner.check_access(req_access, req_one_access, owner.GetAccess()))
			return FALSE

	if(uses_energy && (owner.energy < energy_cost))
		return FALSE

	if(owner.wearer.incapacitated())
		return FALSE

	return TRUE

/datum/soulcrypt_module/proc/activate(var/mob/user)
	if(!check_can_activate())
		return
	active = TRUE
	var/activation_msg = "<b>[name]:</b> [activation_message]"
	owner.send_host_message(activation_msg, MESSAGE_NOTICE)

/datum/soulcrypt_module/proc/deactivate(var/force_close = FALSE)
	active = FALSE
	var/deactivation_msg = "<b>[name]:</b> [deactivation_message]"

	if(force_close)
		owner.send_host_message(deactivation_msg, MESSAGE_WARNING)
	else
		owner.send_host_message(deactivation_msg, MESSAGE_NOTICE)

/datum/soulcrypt_module/proc/handle_effects() //What do we do when the soulcrypt itself calls handle_modules()? This is run on a by tick basis, so this is for effects that should be handled in process().
	return

/datum/soulcrypt_module/proc/stat_text()
	if(activates)
		return "[active ? "Active" : "Disabled"]"

	return "Always On"

/datum/soulcrypt_module/proc/uninstall()
	qdel(stat_line)
	stat_line = null
	qdel(src)
