// Chiropteran Arms "Maverick" series rifle - procs and helpers.
// Lots of reinvention of the wheel going on here.
// R.A. Spitzer 2022-07-10


///////////////
// LOAD AND UNLOAD BEHAVIOUR
///////////////

//Mouse drag-and-drop-onto-hands behaviour.
/obj/item/gun/energy/lever_action/MouseDrop(over_object)
	to_chat(usr,SPAN_WARNING("You cannot take the batteries out of \the [src] without using the lever."))
	
//Reloading behaviour.
/obj/item/gun/energy/lever_action/attackby(obj/item/C, mob/living/user)
	if(QUALITY_SAWING in C.tool_qualities)
		to_chat(user, SPAN_NOTICE("Sawing down \the [src] will render it useless."))
		return

	if(magazine.len >= magazine_capacity)
		to_chat(usr, SPAN_WARNING("\The [src] cannot hold any more batteries."))
		return

	if(istype(C, suitable_cell) && insert_item(C, user))
		var/mag_temp = list(C)	//Add it to the front of the magazine.
		mag_temp += magazine
		magazine = mag_temp
		update_icon()

	..()

//Loading and cock behaviour.
/obj/item/gun/energy/lever_action/attack_self(mob/living/user)
	if(world.time >= recentpumpmsg + 10)
		cycle_action(user)
		recentpumpmsg = world.time

//Cycling the action.
/obj/item/gun/energy/lever_action/proc/cycle_action(mob/M)
	var/turf/newloc = get_turf(src)
	playsound(M, action_sound, 60, 1)

	if(cell)//We have a shell in the chamber
		cell.forceMove(newloc) //Eject casing
		cell = null

	if(magazine.len)
		var/obj/item/cell/C = magazine[1] //load next casing.
		magazine -= C //Remove casing from loaded list.
		cell = C

	//Update our next projectile's damage and type for the weapon stats panel.
	calculate_projectile_data()

	update_icon()

///////////////
// FIRING BEHAVIOUR
///////////////

// We want to recalculate damage and projectile type when we actually fire, due
// to the possibility that the player is firing self-charging cells.
/obj/item/gun/energy/lever_action/consume_next_projectile()
	calculate_projectile_data()
	..()

///////////////
// DAMAGE AND BEAM TYPE
///////////////

//Recalculates projectile type (taser or laser) and damage multiplier.
//Called in the firing proc as well as the action cycling proc.
/obj/item/gun/energy/lever_action/proc/calculate_projectile_data()
	if(cell)
		var/_chg = cell.charge
		var/_dmg = initial(damage_multiplier)

		//If we're below or equal to the maximum to turn it into a Taser, do that.
		if(_chg <= charge_taser_maximum)
			projectile_type = /obj/item/projectile/beam/stun
			_dmg = 1		//100% agony damage.
		else		//If we're above taser voltage, it turns it into deathbeam.
			projectile_type = /obj/item/projectile/beam/midlaser
			if(_chg > charge_maximum)
				_chg = charge_maximum		//No cheating by spawning in BSL cells.
			_dmg = _chg / charge_reference
			
		damage_multiplier = _dmg
	return


///////////////
// ICON BEHAVIOUR
///////////////

/obj/item/gun/energy/lever_action/update_icon()
	var/magwell = magazine.len
	if(magwell > 3)		//Somehow we're above our magazine capacity.
		magwell = 3

	//There are far more efficient ways to write this, but this is written like this for legibility.
	if(magwell)		//cell in magazine
		icon_state = "[initial(icon_state)]_[magwell]"
	else			//mag empty
		icon_state = "[initial(icon_state)]"
