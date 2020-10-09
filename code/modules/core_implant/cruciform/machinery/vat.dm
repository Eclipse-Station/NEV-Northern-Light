#define VAT_FILL_FULL 120
#define VAT_FILL_HALF_FULL 80
#define VAT_FILL_ALMOST_EMPTY 40
#define VAT_FILL_EMPTY 0
#define VAT_FLUID_STEP 40

/obj/machinery/neotheology/clone_vat
	name = "cito-revitalization basin"
	desc = "One of the most coveted Mekhanite technologies, this device is capable of restoring one's body from a mere fragment."
	icon = 'icons/obj/machines/church_vat.dmi'
	icon_state = "vat_gold_base"
	layer = TABLE_LAYER
	density = TRUE
	anchored = TRUE
	use_power = IDLE_POWER_USE
	idle_power_usage = 1
	active_power_usage = 5

	can_buckle = TRUE
	buckle_dir = SOUTH
	buckle_lying = TRUE //bed-like behavior, forces mob.lying = buckle_lying if != -1


	var/occupied = FALSE
	var/mob/living/carbon/human/victim
	var/obj/item/organ/inserted_organ

	var/y_offset = 10
	var/x_offset = 15

	var/fluid_type = "kahors"
	var/reagent_injected = "ntcahors_active"

	var/fluid_level = VAT_FILL_EMPTY

	var/image/faucet1
	var/image/faucet2
	var/image/faucet3
	var/image/faucet4
	var/image/faucet5

/obj/machinery/neotheology/clone_vat/New()
	faucet1 = image(icon, src, "[fluid_type]_1")
	faucet2 = image(icon, src, "[fluid_type]_2")
	faucet3 = image(icon, src, "[fluid_type]_3")
	faucet4 = image(icon, src, "[fluid_type]_4")
	faucet5 = image(icon, src, "[fluid_type]_5")
	update_icon()

	return ..()

/obj/machinery/neotheology/clone_vat/MouseDrop_T(mob/target, mob/user)

	var/mob/living/M = user
	if(user.stat || user.restrained() || !check_table(user) || !iscarbon(target))
		return
	if(istype(M))
		take_victim(target,user)
	else
		return ..()

/obj/machinery/neotheology/clone_vat/proc/take_victim(mob/living/carbon/C, mob/living/carbon/user as mob)
	if (C == user)
		user.visible_message("[user] climbs into \the [src].","You climb into \the [src].")
	else
		visible_message(SPAN_NOTICE("\The [C] has been put into \the [src] by [user]."), 3)
		if (user.pulling == C)
			user.stop_pulling() //Lets not drag your patient off the table after you just put them there
	if (C.client)
		C.client.perspective = EYE_PERSPECTIVE
		C.client.eye = src
	C.loc = loc
	for(var/obj/O in src)
		O.loc = loc
	add_fingerprint(user)
	buckle_mob(C)

/obj/machinery/neotheology/clone_vat/post_buckle_mob(mob/living/M as mob)
	if(M == buckled_mob)
		M.pixel_y = y_offset
		M.pixel_x = x_offset
	else
		M.pixel_y = 0
		M.pixel_x = 0

	occupied = TRUE
	check_victim()

/obj/machinery/neotheology/clone_vat/proc/check_victim()
	if (istype(buckled_mob,/mob/living/carbon))
		victim = buckled_mob
		occupied = TRUE
		return 1

	victim = null
	occupied = FALSE
	return 0

/obj/machinery/neotheology/clone_vat/proc/check_table(mob/living/carbon/patient as mob)
	check_victim()
	if(victim)
		to_chat(usr, SPAN_WARNING("\The [src] is already occupied!"))
		return 0
	if(patient.buckled)
		to_chat(usr, SPAN_NOTICE("Unbuckle \the [patient] first!"))
		return 0
	return 1

/obj/machinery/neotheology/clone_vat/Process()
	if(check_victim())
		if(victim.isSynthetic())
			return //No robits :<
		if(victim.vessel.total_volume < victim.species.blood_volume)
			victim.vessel.add_reagent("blood", (victim.species.blood_volume - victim.vessel.total_volume) * 0.07)

		var/bad_vital_organ = check_vital_organs(victim)
		if(bad_vital_organ && istype(bad_vital_organ , /obj/item/organ))
			var/obj/item/organ/O = bad_vital_organ
			O.heal_damage(2 + O.damage * 0.07)

		if(victim.stat == DEAD)
			victim.adjustBruteLoss(- 0.5 * (fluid_level / VAT_FLUID_STEP))
			victim.adjustFireLoss(- 0.5  * (fluid_level / VAT_FLUID_STEP))
			victim.adjustOxyLoss(- 0.5  * (fluid_level / VAT_FLUID_STEP))
			victim.adjustToxLoss(-0.3 * (fluid_level / VAT_FLUID_STEP))
			if(!bad_vital_organ && (victim.health - victim.getOxyLoss() >= HEALTH_THRESHOLD_DEAD))
				var/blood_volume = round((victim.vessel.get_reagent_amount("blood")/victim.species.blood_volume)*100)
				if(blood_volume > BLOOD_VOLUME_SURVIVE)
					make_alive(victim)

		if(victim.stat != DEAD && prob(30))
			victim.reagents.add_reagent(reagent_injected, 2)


/obj/machinery/neotheology/clone_vat/proc/check_vital_organs(mob/living/carbon/human/H)
	for(var/organ_tag in H.species.has_organ)
		var/obj/item/organ/O = H.species.has_organ[organ_tag]
		var/vital = initial(O.vital) //check for vital organs
		if(vital)
			O = H.internal_organs_by_name[organ_tag]
			if(!O)
				if(prob(10))
					if(organ_tag == BP_BRAIN)
						if(victim.organs_by_name[BP_HEAD])
							var/datum/organ_description/OD = victim.species.has_limbs[BP_HEAD]
							var/obj/item/I = victim.organs_by_name[BP_HEAD]
							if(I.type == OD.default_type)
								restore_organ_by_tag(organ_tag)
								return TRUE
							else
								qdel(I)
						restore_organ_by_tag(BP_HEAD)
						restore_organ_by_tag(BP_EYES)
					else
						restore_organ_by_tag(organ_tag)
				return TRUE
			if(O.damage > O.max_damage)
				return O
	return null

/obj/machinery/neotheology/clone_vat/proc/restore_organ_by_tag(var/organ_tag)
	if(organ_tag in victim.species.has_limbs)
		var/datum/organ_description/OD = victim.species.has_limbs[organ_tag]
		var/obj/item/I = victim.organs_by_name[organ_tag]
		if(I)
			if(I.type == OD.default_type)
				return
			else
				qdel(I)

		victim.visible_message(SPAN_NOTICE("[victim]'s [organ_tag] reforms with a wet squelchy noise!"), "Your [organ_tag] reforms! Oh, god, the pain!", SPAN_DANGER("You hear wet squelching!")))
		OD.create_organ(victim)


	if(organ_tag in victim.species.has_organ)
		var/organ_type = victim.species.has_organ[organ_tag]
		var/obj/item/I = victim.internal_organs_by_name[organ_tag]
		if(I && I.type == organ_type)
			return
		new organ_type(victim)

	victim.update_body()
	victim.pain(organ_tag, 100, TRUE)




/obj/machinery/neotheology/clone_vat/proc/make_alive(mob/living/carbon/human/M) //This revives the mob
	var/deadtime = world.time - M.timeofdeath

	GLOB.dead_mob_list.Remove(M)
	if((M in GLOB.living_mob_list) || (M in GLOB.dead_mob_list))
		WARNING("Mob [M] was defibbed but already in the living or dead list still!")
	GLOB.living_mob_list += M

	M.timeofdeath = 0
	M.stat = UNCONSCIOUS //Life() can bring them back to consciousness if it needs to.
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

	M.emote("gasp")
	M.Weaken(rand(10,25))
	M.updatehealth()
	apply_brain_damage(M, deadtime)



/obj/machinery/neotheology/clone_vat/proc/apply_brain_damage(mob/living/carbon/human/H, var/deadtime)
	if(!H.should_have_organ(BP_BRAIN)) return //no brain

	var/obj/item/organ/internal/brain/brain = H.internal_organs_by_name[BP_BRAIN]
	if(!brain) return //no brain

	var/brain_damage = CLAMP((deadtime - 2 MINUTES)/8 * brain.max_damage, H.getBrainLoss(), brain.max_damage)
	H.setBrainLoss(brain_damage)

/obj/machinery/neotheology/clone_vat/attack_hand(mob/user)
	if (user.incapacitated(INCAPACITATION_DEFAULT))
		return
	if (victim)
		user_unbuckle_mob(user)
		return
	if(fluid_level < VAT_FILL_FULL)
		fluid_level += VAT_FLUID_STEP
	else
		fluid_level = VAT_FILL_EMPTY
	update_icon()

/obj/machinery/neotheology/clone_vat/attackby(obj/item/I, mob/user)
	return

/obj/machinery/neotheology/clone_vat/update_icon()
	overlays.Cut()
	switch(fluid_level)
		if(VAT_FILL_EMPTY)
			return

		if(VAT_FILL_ALMOST_EMPTY)
			overlays += faucet1
			overlays += faucet5

		if(VAT_FILL_HALF_FULL)
			overlays += faucet1
			overlays += faucet2
			overlays += faucet4
			overlays += faucet5

		if(VAT_FILL_FULL)
			overlays += faucet1
			overlays += faucet2
			overlays += faucet3
			overlays += faucet4
			overlays += faucet5

	var/image/juice = image(icon, src, fluid_type)
	overlays += juice