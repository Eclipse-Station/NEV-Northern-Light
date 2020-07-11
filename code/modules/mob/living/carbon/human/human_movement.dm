/mob/living/carbon/human/movement_delay()

	var/tally = ..()
	if(species.slowdown)
		tally += species.slowdown
	if (istype(loc, /turf/space)) // It's hard to be slowed down in space by... anything
		return tally

	if(embedded_flag)
		handle_embedded_objects() //Moving with objects stuck in you can cause bad times.
	if(CE_SPEEDBOOST in chem_effects)
		tally -= chem_effects[CE_SPEEDBOOST]
	if(isturf(loc))
		var/turf/T = loc
		if(T.get_lumcount() < 0.6)
			if(stats.getPerk(PERK_NIGHTCRAWLER))
				tally -= 0.5
			else if(see_invisible != SEE_INVISIBLE_NOLIGHTING)
				tally += 0.5
	if(stats.getPerk(PERK_FAST_WALKER))
		tally -= 0.5

	var/health_deficiency = (maxHealth - health)
	var/hunger_deficiency = (max_nutrition - nutrition) //400 = max for humans.
	if(hunger_deficiency >= 200) tally += (hunger_deficiency / 100) //If youre starving, movement slowdown can be anything up to 4.
	if(health_deficiency >= 40) tally += (health_deficiency / 25)

	if (!(species && (species.flags & NO_PAIN)))
		if(halloss >= 10) tally += (halloss / 20) //halloss shouldn't slow you down if you can't even feel it
	if(istype(buckled, /obj/structure/bed/chair/wheelchair))
		for(var/organ_name in list(BP_L_HAND, BP_R_HAND, BP_L_ARM, BP_R_ARM))
			var/obj/item/organ/external/E = get_organ(organ_name)
			if(!E)
				tally += 4
			else
				tally += E.get_tally()
	else
		if(wear_suit)
			tally += wear_suit.slowdown
		if(shoes)
			tally += shoes.slowdown

	if(shock_stage >= 10) tally += 3

	if (bodytemperature < 283.222)
		tally += (283.222 - bodytemperature) / 10 * 1.75
	tally += stance_damage // missing/damaged legs or augs affect speed

	return tally


/mob/living/carbon/human/allow_spacemove()
	//Can we act?
	if(restrained())	return 0

	//Do we have a working jetpack?
	var/obj/item/weapon/tank/jetpack/thrust = get_jetpack()

	if(thrust)
		if(thrust.allow_thrust(JETPACK_MOVE_COST, src))
			if (thrust.stabilization_on)
				return TRUE
			return -1

	//If no working jetpack then use the other checks
	return ..()

/mob/living/carbon/human/slip_chance(var/prob_slip = 5)
	if(!..())
		return 0

	//Check hands and mod slip
	if(!l_hand)
		prob_slip -= 2
	else if(l_hand.w_class <= ITEM_SIZE_SMALL)
		prob_slip -= 1
	if (!r_hand)
		prob_slip -= 2
	else if(r_hand.w_class <= ITEM_SIZE_SMALL)
		prob_slip -= 1

	return prob_slip

/mob/living/carbon/human/check_shoegrip()
	if(species.flags & NO_SLIP)
		return 1
	if(shoes && (shoes.item_flags & NOSLIP) && istype(shoes, /obj/item/clothing/shoes/magboots))  //magboots + dense_object = no floating
		return 1
	return 0
/*
/mob/living/carbon/human/handle_footstep(atom/T)
	if(..())

		if(m_intent == "run")
			if(!(step_count % 2)) //every other turf makes a sound
				return

		if(istype(shoes, /obj/item/clothing/shoes))
			var/obj/item/clothing/shoes/footwear = shoes
			if(footwear.silence_steps)
				return //silent

		if(!has_organ(BP_L_FOOT) && !has_organ(BP_R_FOOT))
			return //no feet no footsteps

		if(buckled || lying || throwing)
			return //people flying, lying down or sitting do not step

		if(!has_gravity(src))
			if(step_count % 3) //this basically says, every three moves make a noise
				return //1st - none, 1%3==1, 2nd - none, 2%3==2, 3rd - noise, 3%3==0

		if(species.silent_steps)
			return //species is silent


		var/S = T.get_footstep_sound("human")
		if(S)
			var/range = -(world.view - 2)
			if(m_intent == "walk")
				range -= 0.333
			if(!shoes)
				range -= 0.333

			var/volume = 90
			if(m_intent == "walk")
				volume -= 55
			if(!shoes)
				volume -= 70

			playsound(T, S, volume, 1, range)
			return
*/
