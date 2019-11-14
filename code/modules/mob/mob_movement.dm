/client/Move(n, direction)
	if(!mob)
		return // Moved here to avoid nullrefs below
	return mob.SelfMove(direction)

/mob/proc/SelfMove(var/direction)
	if(DoMove(direction, src) & MOVEMENT_HANDLED)
		return TRUE // Doesn't necessarily mean the mob physically moved


/mob
	var/moving           = FALSE


/mob/proc/set_move_cooldown(var/timeout)
	var/datum/movement_handler/mob/delay/delay = GetMovementHandler(/datum/movement_handler/mob/delay)
	if(delay)
		delay.SetDelay(timeout)

/mob/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1

	if(ismob(mover))
		var/mob/moving_mob = mover
		if ((other_mobs && moving_mob.other_mobs))
			return 1
		return (!mover.density || !density || lying)
	else
		return (!mover.density || !density || lying)
	return

/mob/proc/add_move_cooldown(var/timeout)
	var/datum/movement_handler/mob/delay/delay = GetMovementHandler(/datum/movement_handler/mob/delay)
	if(delay)
		delay.AddDelay(timeout)

/client/proc/client_dir(input, direction=-1)
	return turn(input, direction*dir2angle(dir))

/client/Northeast()
	diagonal_action(NORTHEAST)
/client/Northwest()
	diagonal_action(NORTHWEST)
/client/Southeast()
	diagonal_action(SOUTHEAST)
/client/Southwest()
	diagonal_action(SOUTHWEST)

/client/proc/diagonal_action(direction)
	switch(client_dir(direction, 1))
		if(NORTHEAST)
			swap_hand()
			return
		if(SOUTHEAST)
			attack_self()
			return
		if(SOUTHWEST)
			if(iscarbon(usr))
				var/mob/living/carbon/C = usr
				C.toggle_throw_mode()
			else
				to_chat(usr, SPAN_WARNING("This mob type cannot throw items."))
			return
		if(NORTHWEST)
			mob.hotkey_drop()

/mob/proc/hotkey_drop()
	to_chat(usr, SPAN_WARNING("This mob type cannot drop items."))

/mob/living/carbon/hotkey_drop()
	if(!get_active_hand())
		to_chat(usr, SPAN_WARNING("You have nothing to drop in your hand."))
	if (!isturf(loc))
		return
	else
		unEquip(get_active_hand(), loc)

//This gets called when you press the delete button.
/client/verb/delete_key_pressed()
	set hidden = 1

	if(!usr.pulling)
		to_chat(usr, SPAN_NOTICE("You are not pulling anything."))
		return
	usr.stop_pulling()

/client/verb/swap_hand()
	set hidden = 1

	if(isrobot(mob))
		var/mob/living/silicon/robot/R = mob
		R.cycle_modules()
	else
		mob.swap_hand()
	return



/client/verb/attack_self()
	set hidden = 1
	if(mob)
		mob.mode()
	return


/client/verb/toggle_throw_mode()
	set hidden = 1
	if(!istype(mob, /mob/living/carbon))
		return
	if (!mob.stat && isturf(mob.loc) && !mob.restrained())
		mob:toggle_throw_mode()
	else
		return


/client/verb/drop_item()
	set hidden = 1
	if(!isrobot(mob) && mob.stat == CONSCIOUS && isturf(mob.loc))
		return mob.drop_item()
	return


//Called from space movement handler
//Return true for safe movement
//Return -1 for movement with possibility of slipping
//Return false for no movement
/mob/proc/allow_spacemove()
	//First up, check for magboots or other gripping capability
	//If we have some, then check the ground under us
	if (incorporeal_move)
		return TRUE
	if (check_shoegrip() && check_solid_ground())
		return TRUE
	if (check_dense_object())
		return -1
	return FALSE

//return 1 if slipped, 0 otherwise
/mob/proc/handle_spaceslipping()
	if(prob(5)) //Todo: Factor in future agility stat here
		to_chat(src, SPAN_WARNING("You slipped!"))
		src.inertia_dir = src.last_move
		step(src, src.inertia_dir)
		return 1
	return 0

		var/olddir = dir //we can't override this without sacrificing the rest of movable/New()
		. = ..()
		if(direct != olddir)
			dir = olddir
			set_dir(direct)

		src.move_speed = world.time - src.l_move_time
		src.l_move_time = world.time
		src.m_flag = 1
		if ((A != src.loc && A && A.z == src.z))
			src.last_move = get_dir(A, src.loc)
	return

/client/proc/Move_object(direct)
	if(mob && mob.control_object)
		if(mob.control_object.density)
			step(mob.control_object,direct)
			if(!mob.control_object)	return
			mob.control_object.dir = direct
		else
			mob.control_object.forceMove(get_step(mob.control_object,direct))
	return


/client/Move(n, direct)
	if(!mob)
		return // Moved here to avoid nullrefs below

	if(mob.control_object)	Move_object(direct)

	if(mob.incorporeal_move && isobserver(mob))
		Process_Incorpmove(direct)
		return

	if(moving)	return 0

	if(world.time < move_delay)	return

	if(locate(/obj/effect/stop/, mob.loc))
		for(var/obj/effect/stop/S in mob.loc)
			if(S.victim == mob)
				return

	if(mob.stat==DEAD && isliving(mob))
		mob.ghostize()
		return

	if(isAI(mob))
		var/mob/living/silicon/ai/AI = mob
		if(AI.controlled_mech)
			return AI.controlled_mech.relaymove(mob, direct)

	// handle possible Eye movement
	if(mob.eyeobj)
		return mob.EyeMove(n,direct)

	if(mob.transforming)	return//This is sota the goto stop mobs from moving var

	if(isliving(mob))
		var/mob/living/L = mob
		if(L.incorporeal_move)//Move though walls
			Process_Incorpmove(direct)
			return
		if(mob.client)
			if(mob.client.view != world.view) // If mob moves while zoomed in with device, unzoom them.
				for(var/obj/item/item in mob.contents)
					if(item.zoom)
						item.zoom()
						break
				/*
				if(locate(/obj/item/weapon/gun/energy/sniperrifle, mob.contents))		// If mob moves while zoomed in with sniper rifle, unzoom them.
					var/obj/item/weapon/gun/energy/sniperrifle/s = locate() in mob
					if(s.zoom)
						s.zoom()
				if(locate(/obj/item/device/binoculars, mob.contents))		// If mob moves while zoomed in with binoculars, unzoom them.
					var/obj/item/device/binoculars/b = locate() in mob
					if(b.zoom)
						b.zoom()
				*/

	if(Process_Grab())	return

	if(!mob.canmove)
		return

	//if(istype(mob.loc, /turf/space) || (mob.flags & NOGRAV))
	//	if(!mob.Process_Spacemove(0))	return 0

	if(!mob.lastarea)
		mob.lastarea = get_area(mob.loc)

	if((istype(mob.loc, /turf/space)) || (mob.lastarea.has_gravity == 0))
		if(!mob.Process_Spacemove(0))	return 0

	if(isobj(mob.loc) || ismob(mob.loc))//Inside an object, tell it we moved
		var/atom/O = mob.loc
		return O.relaymove(mob, direct)

	if(isturf(mob.loc))

		if(mob.restrained())//Why being pulled while cuffed prevents you from moving
			for(var/mob/M in range(mob, 1))
				if(M.pulling == mob)
					if(!M.restrained() && M.stat == 0 && M.canmove && mob.Adjacent(M))
						src << "\blue You're restrained! You can't move!"
						return 0
					else
						M.stop_pulling()

		if(mob.pinned.len)
			src << "\blue You're pinned to a wall by [mob.pinned[1]]!"
			return 0

		move_delay = world.time//set move delay

		switch(mob.m_intent)
			if("run")
				if(mob.drowsyness > 0)
					move_delay += 6
				move_delay += 1+config.run_speed
			if("walk")
				move_delay += 7+config.walk_speed
		move_delay += mob.movement_delay()

		var/tickcomp = 0 //moved this out here so we can use it for vehicles
		if(config.Tickcomp)
			// move_delay -= 1.3 //~added to the tickcomp calculation below
			tickcomp = ((1/(world.tick_lag))*1.3) - 1.3
			move_delay = move_delay + tickcomp

		if(istype(mob.buckled, /obj/vehicle))
			//manually set move_delay for vehicles so we don't inherit any mob movement penalties
			//specific vehicle move delays are set in code\modules\vehicles\vehicle.dm
			move_delay = world.time + tickcomp
			//drunk driving
			if(mob.confused)
				direct = pick(cardinal)
			return mob.buckled.relaymove(mob,direct)

		if(istype(mob.machine, /obj/machinery))
			if(mob.machine.relaymove(mob,direct))
				return

		if(mob.pulledby || mob.buckled) // Wheelchair driving!
			if(istype(mob.loc, /turf/space))
				return // No wheelchair driving in space
			if(istype(mob.pulledby, /obj/structure/bed/chair/wheelchair))
				return mob.pulledby.relaymove(mob, direct)
			else if(istype(mob.buckled, /obj/structure/bed/chair/wheelchair))
				if(ishuman(mob))
					var/mob/living/carbon/human/driver = mob
					var/obj/item/organ/external/l_hand = driver.get_organ(BP_L_HAND)
					var/obj/item/organ/external/r_hand = driver.get_organ(BP_R_HAND)
					if((!l_hand || l_hand.is_stump()) && (!r_hand || r_hand.is_stump()))
						return // No hands to drive your chair? Tough luck!
				//drunk wheelchair driving
				if(mob.confused)
					direct = pick(cardinal)
				move_delay += 2
				return mob.buckled.relaymove(mob,direct)

		//We are now going to move
		moving = 1
		//Something with pulling things
		if(locate(/obj/item/weapon/grab, mob))
			move_delay = max(move_delay, world.time + 7)
			var/list/L = mob.ret_grab()
			if(istype(L, /list))
				if(L.len == 2)
					L -= mob
					var/mob/M = L[1]
					if(M)
						if ((get_dist(mob, M) <= 1 || M.loc == mob.loc))
							var/turf/T = mob.loc
							. = ..()
							if (isturf(M.loc))
								var/diag = get_dir(mob, M)
								if ((diag - 1) & diag)
								else
									diag = null
								if ((get_dist(mob, M) > 1 || diag))
									step(M, get_dir(M.loc, T))
				else
					for(var/mob/M in L)
						M.other_mobs = 1
						if(mob != M)
							M.animate_movement = 3
					for(var/mob/M in L)
						spawn( 0 )
							step(M, direct)
							return
						spawn( 1 )
							M.other_mobs = null
							M.animate_movement = 2
							return

		else if(mob.confused)
			step(mob, pick(cardinal))
		else
			. = mob.SelfMove(n, direct)

		for (var/obj/item/weapon/grab/G in mob)
			if (G.state == GRAB_NECK)
				mob.set_dir(reverse_dir[direct])
			G.adjust_position()
		for (var/obj/item/weapon/grab/G in mob.grabbed_by)
			G.adjust_position()

		moving = 0

		return .

	return

/mob/proc/SelfMove(turf/n, direct)
	return Move(n, direct)


///Process_Incorpmove
///Called by client/Move()
///Allows mobs to run though walls
/client/proc/Process_Incorpmove(direct)
	var/turf/mobloc = get_turf(mob)

	switch(mob.incorporeal_move)
		if(1)
			var/turf/T = get_step(mob, direct)
			if(mob.check_holy(T))
				mob << SPAN_WARNING("You cannot get past holy grounds while you are in this plane of existence!")
				return
			else
				mob.forceMove(get_step(mob, direct))
				mob.dir = direct
		if(2)
			if(prob(50))
				var/locx
				var/locy
				switch(direct)
					if(NORTH)
						locx = mobloc.x
						locy = (mobloc.y+2)
						if(locy>world.maxy)
							return
					if(SOUTH)
						locx = mobloc.x
						locy = (mobloc.y-2)
						if(locy<1)
							return
					if(EAST)
						locy = mobloc.y
						locx = (mobloc.x+2)
						if(locx>world.maxx)
							return
					if(WEST)
						locy = mobloc.y
						locx = (mobloc.x-2)
						if(locx<1)
							return
					else
						return
				mob.forceMove(locate(locx,locy,mobloc.z))
				spawn(0)
					var/limit = 2//For only two trailing shadows.
					for(var/turf/T in getline(mobloc, mob.loc))
						spawn(0)
							anim(T,mob,'icons/mob/mob.dmi',,"shadow",,mob.dir)
						limit--
						if(limit<=0)	break
			else
				spawn(0)
					anim(mobloc,mob,'icons/mob/mob.dmi',,"shadow",,mob.dir)
				mob.forceMove(get_step(mob, direct))
			mob.dir = direct
	// Crossed is always a bit iffy
	for(var/obj/S in mob.loc)
		if(istype(S,/obj/effect/step_trigger) || istype(S,/obj/effect/beam))
			S.Crossed(mob)

	var/area/A = get_area_master(mob)
	if(A)
		A.Entered(mob)
	if(isturf(mob.loc))
		var/turf/T = mob.loc
		T.Entered(mob)
	mob.Post_Incorpmove()
	return 1

/mob/proc/Post_Incorpmove()
	return

///Process_Spacemove
///Called by /client/Move()
///For moving in space
///Return 1 for movement 0 for none
/mob/proc/Process_Spacemove(var/check_drift = 0)

	if(!Check_Dense_Object()) //Nothing to push off of so end here
		update_floating(0)
		return 0

	lastarea = get_area(src)
	if(!lastarea || !lastarea.has_gravity)
		return 0

	return 1


//This proc specifically checks the floor under us. Both floor turfs and walkable objects like catwalk
//This proc is only called if we have grip, ie magboots
/mob/proc/check_solid_ground()
	if (istype(loc, /turf/simulated))
		if(istype(loc, /turf/simulated/open))
			return FALSE //open spess was fogotten
		return TRUE //We're standing on a simulated floor
	else
		//We're probably in space
		for(var/obj/O in loc)
			if(istype(O, /obj/structure/lattice))
				return TRUE
			if(istype(O, /obj/structure/catwalk))
				return TRUE
	return FALSE

//This proc checks for dense, anchored atoms, or walls.
//It checks all the adjacent tiles
/mob/proc/check_dense_object()

	for(var/turf/simulated/T in trange(1,src)) //we only care for non-space turfs
		if(T.density)	//walls work when you're adjacent
			return TRUE


	for(var/obj/O in orange(1, src))
		if(O.density && O.anchored)
			return TRUE

	return FALSE

/mob/proc/check_shoegrip()
	return 0

/mob/proc/slip_chance(var/prob_slip = 5)
	if(stat)
		return 0
	if(check_shoegrip())
		return 0
	return prob_slip

#define DO_MOVE(this_dir) var/final_dir = turn(this_dir, -dir2angle(dir)); Move(get_step(mob, final_dir), final_dir);

/client/verb/moveup()
	set name = ".moveup"
	set instant = 1
	DO_MOVE(NORTH)

/client/verb/movedown()
	set name = ".movedown"
	set instant = 1
	DO_MOVE(SOUTH)

/client/verb/moveright()
	set name = ".moveright"
	set instant = 1
	DO_MOVE(EAST)

/client/verb/moveleft()
	set name = ".moveleft"
	set instant = 1
	DO_MOVE(WEST)

#undef DO_MOVE

//This is an atom proc for the sake of vehicles and mechas
//Attempts to return the expected total time in deciseconds, between this atom making moves
//TODO: Fix this shit
/atom/movable/proc/total_movement_delay()
	return 0

/mob/total_movement_delay()
	var/delay = 0

	if (MOVING_QUICKLY(src))
		if(drowsyness > 0)
			delay += 6
		delay += 1
	else
		delay += 7
	delay += movement_delay()

	if (speed_factor && speed_factor != 1.0)
		delay /= speed_factor

	return delay
