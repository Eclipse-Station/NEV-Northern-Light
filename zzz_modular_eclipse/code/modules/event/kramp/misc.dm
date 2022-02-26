ADMIN_VERB_ADD(/datum/admins/proc/call_fun_drop_pod, R_FUN, FALSE)
/datum/admins/proc/call_fun_drop_pod()
	set category = "Fun"
	set desc = "Call an immediate drop pod on your location."
	set name = "FESTIVE PODS"

	if(!check_rights(R_FUN)) return

	var/client/selected_player
	var/mob/living/spawned_mob
	var/list/spawned_mobs = list()

	var/spawn_path = input("Select a mob type.", "Drop Pod Selection", null) as null|anything in typesof(/mob/living)-/mob/living
	if(!spawn_path)
		return

	if(alert("Do you wish the mob to have a player?",,"No","Yes") == "No")
		var/spawn_count = input("How many mobs do you wish the pod to contain?", "Drop Pod Selection", null) as num
		if(spawn_count <= 0)
			return
		for(var/i=0;i<spawn_count;i++)
			var/mob/living/M = new spawn_path()
			M.tag = "awaiting drop"
			spawned_mobs |= M
			var/image/dozhdik = image('zzz_modular_eclipse/icons/obj/festive.dmi', src, "dozhdik_overlay")
			M.overlays += dozhdik
			M.faction = "krampus"
			M.desc = M.desc + "\nThis one seems to be infested with garland-like worms!"
	else
		var/list/candidates = list()
		for(var/client/player in clients)
			if(player.mob && isghost(player.mob))
				candidates |= player

		if(!candidates.len)
			to_chat(usr, "There are no candidates for a drop pod launch.")
			return

		// Get a player and a mob type.
		selected_player = input("Select a player.", "Drop Pod Selection", null) as null|anything in candidates
		if(!selected_player)
			return

		// Spawn the mob in nullspace for now.
		spawned_mob = new spawn_path()
		spawned_mob.tag = "awaiting drop"

		// Equip them, if they are human and it is desirable.
/*		if(ishuman(spawned_mob))
			var/antag_type = input("Select an equipment template to use or cancel for nude.", null) as null|anything in all_antag_types
			if(antag_type)
				var/datum/antagonist/A = all_antag_types[antag_type]
				A.equip(spawned_mob)
*/
	if(alert("Are you SURE you wish to deploy this drop pod? It will cause a sizable explosion and gib anyone underneath it.",,"No","Yes") == "No")
		if(spawned_mob)
			qdel(spawned_mob)
		if(spawned_mobs.len)
			for(var/mob/living/M in spawned_mobs)
				spawned_mobs -= M
				M.tag = null
				qdel(M)
			spawned_mobs.Cut()
		return

	// Chuck them into the pod.
	var/automatic_pod
	if(spawned_mob && selected_player)
		if(selected_player.mob.mind)
			selected_player.mob.mind.transfer_to(spawned_mob)
		else
			spawned_mob.ckey = selected_player.mob.ckey
		spawned_mobs = list(spawned_mob)
		message_admins("[key_name(usr)] dropped a pod containing \the [spawned_mob] ([spawned_mob.key]) at ([usr.x],[usr.y],[usr.z])")
		log_admin("[key_name(usr)] dropped a pod containing \the [spawned_mob] ([spawned_mob.key]) at ([usr.x],[usr.y],[usr.z])")
	else if(spawned_mobs.len)
		automatic_pod = 1
		message_admins("[key_name(usr)] dropped a pod containing [spawned_mobs.len] [spawned_mobs[1]] at ([usr.x],[usr.y],[usr.z])")
		log_admin("[key_name(usr)] dropped a pod containing [spawned_mobs.len] [spawned_mobs[1]] at ([usr.x],[usr.y],[usr.z])")
	else
		return

	new /datum/random_map/droppod(null, usr.x-1, usr.y-1, usr.z, supplied_drops = spawned_mobs, automated = automatic_pod)



/obj/effect/falling_effect/evil_gift_drop
	destructive = FALSE
	falling_type = /mob/living/simple_animal/hostile/foolbox/strong


/obj/item/storage/mrsacks
	name = "Mr Sacks\'s sack"
	icon_state = "sack"
	slot_flags = SLOT_BACK
	max_w_class = ITEM_SIZE_BULKY * 2
	max_storage_space = DEFAULT_HUGE_STORAGE * 3