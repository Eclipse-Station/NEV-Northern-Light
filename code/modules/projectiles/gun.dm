//Parent gun type. Guns are weapons that can be aimed at mobs and act over a distance
/obj/item/weapon/gun
	name = "gun"
	desc = "It's a gun. It's pretty terrible, though."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "giskard_old"
	item_state = "gun"
	item_state_slots = list(
		slot_l_hand_str = "lefthand",
		slot_r_hand_str = "righthand",
		slot_back_str   = "back",
		slot_s_store_str= "onsuit",
		)
	flags =  CONDUCT
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	matter = list(MATERIAL_STEEL = 6)
	w_class = ITEM_SIZE_NORMAL
	throwforce = 5
	throw_speed = 4
	throw_range = 5
	force = WEAPON_FORCE_WEAK
	origin_tech = list(TECH_COMBAT = 1)
	attack_verb = list("struck", "hit", "bashed")
	zoomdevicename = "scope"
	hud_actions = list()

	var/damage_multiplier = 1 //Multiplies damage of projectiles fired from this gun
	var/penetration_multiplier = 1 //Multiplies armor penetration of projectiles fired from this gun
	var/burst = 1
	var/fire_delay = 6 	//delay after shooting before the gun can be used again
	var/burst_delay = 2	//delay between shots, if firing in bursts
	var/move_delay = 1
	var/fire_sound = 'sound/weapons/Gunshot.ogg'

	var/fire_sound_text = "gunshot"
	var/recoil_buildup = 2 //How quickly recoil builds up

	var/muzzle_flash = 3
	var/requires_two_hands
	var/dual_wielding
	var/can_dual = 0 // Controls whether guns can be dual-wielded (firing two at once).
	var/wielded_icon = "gun_wielded"
	var/zoom_factor = 0 //How much to scope in when using weapon

	var/suppress_delay_warning = FALSE

	var/safety = TRUE//is safety will be toggled on spawn() or not
	var/restrict_safety = FALSE//if gun don't need safety in all - toggle to TRUE

	var/next_fire_time = 0

	var/sel_mode = 1 //index of the currently selected mode
	var/list/firemodes = list()

	var/mouthshoot = FALSE //To stop people from suiciding twice... >.>

	/*	SILENCER HANDLING */
	var/obj/item/weapon/silencer/silenced = null //The installed silencer, if any
	var/silencer_type = null //The type of silencer that could be installed in us, if we don't have one
	var/fire_sound_silenced = 'sound/weapons/Gunshot_silenced.wav' //Firing sound used when silenced

	var/icon_contained = TRUE
	var/static/list/item_icons_cache = list()

/obj/item/weapon/gun/get_item_cost(export)
	if(export)
		return ..() * 0.5 //Guns should be sold in the player market.
	..()

/obj/item/weapon/gun/Initialize()
	. = ..()
	for(var/i in 1 to firemodes.len)
		var/list/L = firemodes[i]

		//If this var is set, it means spawn a specific subclass of firemode
		if (L["mode_type"])
			var/newtype = L["mode_type"]
			firemodes[i] = new newtype(src, firemodes[i])
		else
			firemodes[i] = new /datum/firemode(src, firemodes[i])

	//Properly initialize the default firing mode
	if (firemodes.len)
		var/datum/firemode/F = firemodes[sel_mode]
		F.apply_to(src)

	if(!restrict_safety)
		verbs += /obj/item/weapon/gun/proc/toggle_safety_verb//addint it to all guns

		var/obj/screen/item_action/action = new /obj/screen/item_action/top_bar/gun/safety
		action.owner = src
		hud_actions += action

	if(firemodes.len > 1)
		var/obj/screen/item_action/action = new /obj/screen/item_action/top_bar/gun/fire_mode
		action.owner = src
		hud_actions += action

	if(zoom_factor)
		var/obj/screen/item_action/action = new /obj/screen/item_action/top_bar/gun/scope
		action.owner = src
		hud_actions += action

	if(icon_contained)
		if(!item_icons_cache[type])
			item_icons_cache[type] = list(
				slot_l_hand_str = icon,
				slot_r_hand_str = icon,
				slot_back_str = icon,
				slot_s_store_str = icon,
			)
		item_icons = item_icons_cache[type]


/obj/item/weapon/gun/Destroy()
	for(var/i in firemodes)
		if(!islist(i))
			qdel(i)
	firemodes = null
	return ..()

/obj/item/weapon/gun/proc/set_item_state(state, hands = FALSE, back = FALSE, onsuit = FALSE)
	if(!(hands || back || onsuit))
		hands = back = onsuit = TRUE
	if(hands)
		item_state_slots[slot_l_hand_str] = "lefthand"  + state
		item_state_slots[slot_r_hand_str] = "righthand" + state
	if(back)
		item_state_slots[slot_back_str]   = "back"      + state
	if(onsuit)
		item_state_slots[slot_s_store_str]= "onsuit"    + state

/obj/item/weapon/gun/update_wear_icon()
	if(requires_two_hands)
		var/mob/living/M = loc
		if(istype(M))
			if((M.l_hand == src && !M.r_hand) || (M.r_hand == src && !M.l_hand))
				name = "[initial(name)] (wielded)"
				item_state = wielded_icon
			else
				name = initial(name)
				item_state = initial(item_state)
				update_icon(ignore_inhands=1) // In case item_state is set somewhere else.
	..()

//Checks whether a given mob can use the gun
//Any checks that shouldn't result in handle_click_empty() being called if they fail should go here.
//Otherwise, if you want handle_click_empty() to be called, check in consume_next_projectile() and return null there.
/obj/item/weapon/gun/proc/special_check(var/mob/user)

	if(!isliving(user))
		return FALSE
	if(!user.IsAdvancedToolUser())
		return FALSE

	var/mob/living/M = user
	if(HULK in M.mutations)
		to_chat(user, SPAN_DANGER("Your fingers are much too large for the trigger guard!"))
		return FALSE
	if((CLUMSY in M.mutations) && prob(40)) //Clumsy handling
		var/obj/P = consume_next_projectile()
		if(P)
			if(process_projectile(P, user, user, pick(BP_L_FOOT, BP_R_FOOT)))
				handle_post_fire(user, user)
				user.visible_message(
					SPAN_DANGER("\The [user] shoots \himself in the foot with \the [src]!"),
					SPAN_DANGER("You shoot yourself in the foot with \the [src]!")
					)
				M.drop_item()
		else
			handle_click_empty(user)
		return FALSE
	if(!restrict_safety)
		if(safety)
			to_chat(user, SPAN_DANGER("The gun's safety is on!"))
			handle_click_empty(user)
			return FALSE
	return TRUE

/obj/item/weapon/gun/emp_act(severity)
	for(var/obj/O in contents)
		O.emp_act(severity)

/obj/item/weapon/gun/afterattack(atom/A, mob/living/user, adjacent, params)
	if(adjacent) return //A is adjacent, is the user, or is on the user's person

	var/obj/item/weapon/gun/off_hand   //DUAL WIELDING
	if(ishuman(user) && user.a_intent == "harm")
		var/mob/living/carbon/human/H = user

		if(H.r_hand == src && istype(H.l_hand, /obj/item/weapon/gun))
			off_hand = H.l_hand
			dual_wielding = TRUE

		else if(H.l_hand == src && istype(H.r_hand, /obj/item/weapon/gun))
			off_hand = H.r_hand
			dual_wielding = TRUE
		else
			dual_wielding = FALSE

		if(!can_dual)
			dual_wielding = FALSE
		else if(off_hand && off_hand.can_hit(user))
			spawn(1)
			off_hand.Fire(A,user,params)
	else
		dual_wielding = FALSE

	Fire(A,user,params) //Otherwise, fire normally.

/obj/item/weapon/gun/attack(atom/A, mob/living/user, def_zone)
	if (A == user && user.targeted_organ == BP_MOUTH && !mouthshoot)
		handle_suicide(user)
	else if(user.a_intent == I_HURT) //point blank shooting
		Fire(A, user, pointblank=1)
	else
		return ..() //Pistolwhippin'


/obj/item/weapon/gun/projectile/attackby(var/obj/item/A as obj, mob/user as mob)
	.=..()
	if (!.)
		if (silencer_type && istype(A, silencer_type))
			apply_silencer(A, user)


/obj/item/weapon/gun/proc/Fire(atom/target, mob/living/user, clickparams, pointblank=0, reflex=0)
	if(!user || !target) return

	if(world.time < next_fire_time)
		if (!suppress_delay_warning && world.time % 3) //to prevent spam
			to_chat(user, SPAN_WARNING("[src] is not ready to fire again!"))
		return


	add_fingerprint(user)

	if(!special_check(user))
		return

	user.stats.getPerk(/datum/perk/timeismoney)?.deactivate()

	var/shoot_time = (burst - 1)* burst_delay
	user.setClickCooldown(shoot_time) //no clicking on things while shooting
	next_fire_time = world.time + shoot_time

	//actually attempt to shoot
	var/turf/targloc = get_turf(target) //cache this in case target gets deleted during shooting, e.g. if it was a securitron that got destroyed.
	for(var/i in 1 to burst)
		var/obj/projectile = consume_next_projectile(user)
		if(!projectile)
			handle_click_empty(user)
			break

		projectile.multiply_projectile_damage(damage_multiplier)

		projectile.multiply_projectile_penetration(penetration_multiplier)

		if(pointblank)
			process_point_blank(projectile, user, target)

		if(process_projectile(projectile, user, target, user.targeted_organ, clickparams))
			handle_post_fire(user, target, pointblank, reflex)
			update_icon()

		if(i < burst)
			sleep(burst_delay)

		if(!(target && target.loc))
			target = targloc
			pointblank = 0

	//update timing
	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.set_move_cooldown(move_delay)
	next_fire_time = world.time + fire_delay

	if(muzzle_flash)
		set_light(0)

//obtains the next projectile to fire
/obj/item/weapon/gun/proc/consume_next_projectile()
	return null

//used by aiming code
/obj/item/weapon/gun/proc/can_hit(atom/target as mob, var/mob/living/user as mob)
	if(!special_check(user))
		return 2
	//just assume we can shoot through glass and stuff. No big deal, the player can just choose to not target someone
	//on the other side of a window if it makes a difference. Or if they run behind a window, too bad.
	return check_trajectory(target, user)

//called if there was no projectile to shoot
/obj/item/weapon/gun/proc/handle_click_empty(mob/user)
	if (user)
		user.visible_message("*click click*", SPAN_DANGER("*click*"))
	else
		src.visible_message("*click click*")
	playsound(src.loc, 'sound/weapons/guns/misc/gun_empty.ogg', 100, 1)
	update_firemode() //Stops automatic weapons spamming this shit endlessly

//called after successfully firing
/obj/item/weapon/gun/proc/handle_post_fire(mob/living/user, atom/target, var/pointblank=0, var/reflex=0)
	if(silenced)
		//Silenced shots have a lower range and volume
		playsound(user, fire_sound_silenced, 15, 1, -3)
	else
		playsound(user, fire_sound, 60, 1)

		if(reflex)
			user.visible_message(
				"<span class='reflex_shoot'><b>\The [user] fires \the [src][pointblank ? " point blank at \the [target]":""] by reflex!</b></span>",
				"<span class='reflex_shoot'>You fire \the [src] by reflex!</span>",
				"You hear a [fire_sound_text]!"
			)
		else
			user.visible_message(
				SPAN_WARNING("\The [user] fires \the [src][pointblank ? " point blank at \the [target]":""]!"),
				SPAN_WARNING("You fire \the [src]!"),
				"You hear a [fire_sound_text]!"
				)

		if(muzzle_flash)
			set_light(muzzle_flash)
	user.handle_recoil(src)
	update_icon()

/obj/item/weapon/gun/proc/process_point_blank(obj/projectile, mob/user, atom/target)
	var/obj/item/projectile/P = projectile

	if(!istype(P))
		return //default behaviour only applies to true projectiles

	if(dual_wielding)
		return //dual wielding deal too much damage as it is, so no point blank for it

	//default point blank multiplier
	var/damage_mult = 1.3

	//determine multiplier due to the target being grabbed
	if(ismob(target))
		var/mob/M = target
		if(M.grabbed_by.len)
			var/grabstate = 0
			for(var/obj/item/weapon/grab/G in M.grabbed_by)
				grabstate = max(grabstate, G.state)
			if(grabstate >= GRAB_NECK)
				damage_mult = 2.5
			else if(grabstate >= GRAB_AGGRESSIVE)
				damage_mult = 1.5
	P.damage *= damage_mult


//does the actual launching of the projectile
/obj/item/weapon/gun/proc/process_projectile(obj/projectile, mob/living/user, atom/target, var/target_zone, var/params=null)
	var/obj/item/projectile/P = projectile
	if(!istype(P))
		return FALSE //default behaviour only applies to true projectiles

	if(params)
		P.set_clickpoint(params)
	var/offset = 0
	if(user.calc_recoil())
		offset += user.recoil
	offset = min(offset, MAX_ACCURACY_OFFSET)
	offset = rand(-offset, offset)

	return !P.launch_from_gun(target, user, src, target_zone, angle_offset = offset)

//Suicide handling.
/obj/item/weapon/gun/proc/handle_suicide(mob/living/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/M = user

	mouthshoot = TRUE
	M.visible_message(SPAN_DANGER("[user] points their gun at their head, ready to pull the trigger..."))
	if(!do_after(user, 40, progress=0))
		M.visible_message(SPAN_NOTICE("[user] decided life was worth living"))
		mouthshoot = FALSE
		return

	if(!restrict_safety)
		if(safety)
			handle_click_empty(user)
			mouthshoot = FALSE
			return
	var/obj/item/projectile/in_chamber = consume_next_projectile()
	if (istype(in_chamber))
		user.visible_message(SPAN_WARNING("[user] pulls the trigger."))
		if(silenced)
			playsound(user, fire_sound, 10, 1)
		else
			playsound(user, fire_sound, 60, 1)
		if(istype(in_chamber, /obj/item/projectile/beam/lastertag))
			user.show_message(SPAN_WARNING("You feel rather silly, trying to commit suicide with a toy."))
			mouthshoot = FALSE
			return

		in_chamber.on_hit(M)
		if (in_chamber.damage_type != HALLOSS)
			log_and_message_admins("[key_name(user)] commited suicide using \a [src]")
			user.apply_damage(in_chamber.damage*2.5, in_chamber.damage_type, BP_HEAD, used_weapon = "Point blank shot in the head with \a [in_chamber]", sharp=1)
			user.death()
		else
			to_chat(user, SPAN_NOTICE("Ow..."))
			user.apply_effect(110,AGONY,0)
		qdel(in_chamber)
		mouthshoot = FALSE
		return
	else
		handle_click_empty(user)
		mouthshoot = FALSE
		return

/obj/item/weapon/gun/proc/toggle_scope(mob/living/user)
	//looking through a scope limits your periphereal vision
	//still, increase the view size by a tiny amount so that sniping isn't too restricted to NSEW
	if(!zoom_factor)
		zoom = FALSE
		return
	var/zoom_offset = round(world.view * zoom_factor)
	var/view_size = round(world.view + zoom_factor)

	zoom(zoom_offset, view_size)
	update_cursor(user)
	update_hud_actions()

/obj/item/weapon/gun/examine(mob/user)
	..()
	if(firemodes.len > 1)
		var/datum/firemode/current_mode = firemodes[sel_mode]
		to_chat(user, SPAN_NOTICE("The fire selector is set to [current_mode.name]."))

	if(!restrict_safety)
		if(safety)
			to_chat(user, SPAN_NOTICE("The safety is on."))
		else
			to_chat(user, SPAN_NOTICE("The safety is off."))

	//Tell the user if they could fit a silencer on
	if (silencer_type && !silenced)
		to_chat(user, SPAN_NOTICE("You could attach a silencer to this."))

/obj/item/weapon/gun/proc/switch_firemodes()
	if(firemodes.len <= 1)
		return null
	update_firemode(FALSE) //Disable the old firing mode before we switch away from it
	sel_mode++
	if(sel_mode > firemodes.len)
		sel_mode = 1
	var/datum/firemode/new_mode = firemodes[sel_mode]
	new_mode.apply_to(src)
	new_mode.update()
	update_hud_actions()
	return new_mode

/obj/item/weapon/gun/attack_self(mob/user)
	if(zoom)
		toggle_scope(user)
		return

	toggle_firemode(user)

/obj/item/weapon/gun/ui_action_click(mob/living/user, action_name)
	switch(action_name)
		if("fire mode")
			toggle_firemode(user)
		if("scope")
			toggle_scope(user)
		if("safety")
			toggle_safety(user)

/obj/item/weapon/gun/proc/toggle_firemode(mob/living/user)
	var/datum/firemode/new_mode = switch_firemodes()
	if(new_mode)
		playsound(src.loc, 'sound/weapons/guns/interact/selector.ogg', 100, 1)
		to_chat(user, SPAN_NOTICE("\The [src] is now set to [new_mode.name]."))

/obj/item/weapon/gun/proc/toggle_safety(mob/living/user)
	if(restrict_safety || src != user.get_active_hand())
		return

	safety = !safety
	playsound(user, 'sound/weapons/selector.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You toggle the safety [safety ? "on":"off"]."))
	//Update firemode when safeties are toggled
	update_firemode()
	update_hud_actions()
	update_cursor(user)


//Finds the current firemode and calls update on it. This is called from a few places:
//When firemode is changed
//When safety is toggled
//When gun is picked up
//When gun is readied
/obj/item/weapon/gun/proc/update_firemode(var/force_state = null)
	if (sel_mode && firemodes && firemodes.len)
		var/datum/firemode/new_mode = firemodes[sel_mode]
		new_mode.update(force_state)

/obj/item/weapon/gun/AltClick(mob/user)
	if(!restrict_safety)
		if(user.incapacitated())
			to_chat(user, SPAN_WARNING("You can't do that right now!"))
			return

		toggle_safety(user)


//Updating firing modes at appropriate times
/obj/item/weapon/gun/pickup(mob/user)
	.=..()
	update_firemode()

/obj/item/weapon/gun/dropped(mob/user)
	.=..()
	update_firemode(FALSE)

/obj/item/weapon/gun/swapped_from()
	.=..()
	update_firemode(FALSE)

/obj/item/weapon/gun/swapped_to()
	.=..()
	update_firemode()

/obj/item/weapon/gun/proc/toggle_safety_verb()
	set name = "Toggle gun's safety"
	set category = "Object"
	set src in view(1)

	toggle_safety(usr)

/*
	Gun Modding
*/
/obj/item/weapon/gun/proc/apply_silencer(var/obj/item/weapon/silencer/A, var/mob/user)
	if (silenced)
		to_chat(user, "\The [src] already has a silencer installed!")
		return

	if (istype(A, silencer_type))

		if (user)
			playsound(src, WORKSOUND_SCREW_DRIVING, 50, 1)
			if (!do_after(user, 40, src))
				return
			if (!user.unEquip(A))
				return
			to_chat(user, SPAN_NOTICE("You install \the [A] in \the [src]"))

		//Here's the code where we actually install it
		A.forceMove(src)//Silencer goes inside us
		silenced = A
		damage_multiplier -= A.damage_mod //Silencers make the weapon slightly weaker
		update_icon() //Guns that support silencers are responsible for setting their own icon appropriately
		if (silenced.can_remove)
			verbs += /obj/item/weapon/gun/proc/remove_silencer //Give us a verb to remove it


/obj/item/weapon/gun/proc/remove_silencer(var/mob/user)
	set category = "Object"

	if (!silenced || !silenced.can_remove)
		to_chat(user, "No silencer is installed on \the [src]")
		verbs -= /obj/item/weapon/gun/proc/remove_silencer
		return

	if (user)
		playsound(src, WORKSOUND_SCREW_DRIVING, 50, 1)
		if (!do_after(user, 40, src))
			return
		//Drop it in their hands
		user.put_in_hands(silenced)
	.=silenced //Set return value to the silencer incase caller wants to do something with it
	if (silenced.loc == src)
		silenced.forceMove(loc) //Move it out if a user didn't take it

	damage_multiplier += silenced.damage_mod
	silenced = null
	update_icon()
