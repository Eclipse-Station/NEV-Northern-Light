#define VAT_FILL_FULL 240
#define VAT_FILL_HALF_FULL 160
#define VAT_FILL_ALMOST_EMPTY 80
#define VAT_FILL_EMPTY 0
#define VAT_FLUID_STEP 40

/obj/machinery/neotheology/clone_vat
	name = "cyto-revitalization basin" //APPARENTLY IT'S SPELLED CYTO INSTEAD OF CYTO GODDAMN
	desc = "One of the most coveted Mekhanite technologies, this device is capable of restoring one's body from a mere fragment."
	icon = 'icons/obj/machines/church_vat.dmi'
	icon_state = "vat_gold_base"
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

	var/obj/machinery/filler_object/clone_vat_dud/dud

	var/image/faucet1
	var/image/faucet2
	var/image/faucet3
	var/image/faucet4
	var/image/faucet5

/obj/machinery/neotheology/clone_vat/New()
	create_reagents(120)
	faucet1 = image(icon, src, "[fluid_type]_1")
	faucet2 = image(icon, src, "[fluid_type]_2")
	faucet3 = image(icon, src, "[fluid_type]_3")
	faucet4 = image(icon, src, "[fluid_type]_4")
	faucet5 = image(icon, src, "[fluid_type]_5")
	update_icon()

	dud = new/obj/machinery/filler_object/clone_vat_dud(get_step(loc, EAST))
	dud.myvat = src
	return ..()

/obj/machinery/neotheology/clone_vat/Destroy()
	qdel(dud)
	return ..()

/obj/machinery/neotheology/clone_vat/MouseDrop_T(mob/target, mob/user)

	var/mob/living/M = user
	if(user.stat || user.restrained() || !check_table(user) || !iscarbon(target))
		return
	if(istype(M))
		take_victim(target, user, FALSE)
	else
		return ..()

/obj/machinery/neotheology/clone_vat/proc/take_victim(mob/living/carbon/C, mob/living/carbon/user as mob, var/is_restored = FALSE)
	if (C == user)
		if(!is_restored)
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
	if (istype(buckled_mob,/mob/living/carbon/human))
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
	if(!fluid_level)
		return
	if(check_victim())
		var/corruption = calucalte_genetic_corruption(victim)
		if(corruption)
			if (corruption > victim.genetic_corruption)
				victim.genetic_corruption = corruption
				corrupt_dna(victim)

		if(victim.isSynthetic())
			return //No robits :<
		if(victim.vessel.total_volume < victim.species.blood_volume)
			adjust_fluid_level(- 1)
			victim.vessel.add_reagent("blood", (victim.species.blood_volume - victim.vessel.total_volume) * 0.07)

		var/bad_vital_organ = check_vital_organs(victim, TRUE)
		if(bad_vital_organ && istype(bad_vital_organ , /obj/item/organ))
			var/obj/item/organ/O = bad_vital_organ
			O.heal_damage(2 + O.damage * 0.07)
		else
			check_vital_organs(victim, FALSE)

		if(prob(20))//Feex organs
			var/list/bad_limbs = list()
			var/fixbase = FALSE
			if(victim.has_appendage(BP_GROIN))
				for(var/name in BP_BY_DEPTH)
					if(!victim.has_appendage(name))
						bad_limbs += name
						fixbase = TRUE
				if(!fixbase)
					for(var/name in BP_ALL_LIMBS)
						if(!victim.has_appendage(name))
							bad_limbs += name
				if(bad_limbs.len)
					var/luckyLimbName = pick(bad_limbs)

					var/obj/item/organ/O = victim.species.has_process[luckyLimbName]
					var/vital = initial(O.vital) //vital organs are handled separately
					if(!vital)
						restore_organ_by_tag(luckyLimbName)
			else
				restore_organ_by_tag(BP_GROIN)
			adjust_fluid_level(- 1)

		if(prob(10))//Feex bones
			var/list/brokenBP = list()
			for(var/obj/item/organ/external/E in victim.organs)
				if(E.is_broken())
					brokenBP += E
			if(brokenBP.len)
				var/obj/item/organ/external/E = pick(brokenBP)
				E.mend_fracture()
				victim.pain(E.name, 60, TRUE)
				adjust_fluid_level(- 1)

		var/heal_modifier = 0.5


		if(victim.stat == DEAD)
			heal_modifier = 1
			if(!bad_vital_organ && (victim.health - victim.getOxyLoss() >= HEALTH_THRESHOLD_DEAD))
				var/blood_volume = round((victim.vessel.get_reagent_amount("blood")/victim.species.blood_volume)*100)
				if(blood_volume > victim.total_blood_req + BLOOD_VOLUME_BAD_MODIFIER)
					adjust_fluid_level(-15)
					make_alive(victim)

		victim.adjustBruteLoss(- 2.5 * (fluid_level / VAT_FLUID_STEP) * heal_modifier)
		victim.adjustFireLoss(- 2  * (fluid_level / VAT_FLUID_STEP) * heal_modifier)
		victim.adjustOxyLoss(- 2  * (fluid_level / VAT_FLUID_STEP) * heal_modifier)
		victim.adjustToxLoss(- 1 * (fluid_level / VAT_FLUID_STEP) * heal_modifier)
		adjust_fluid_level(- 1)

		if(prob(10) && victim.UnHusk())
			adjust_fluid_level(- 5)
			victim.visible_message(SPAN_NOTICE("[victim]'s flesh reconstitutes!"), "Your flesh burns as it regenerates!", SPAN_DANGER("You hear wet squelching!"))

		if(victim.stat != DEAD && prob(10))
			adjust_fluid_level(-1)
			victim.reagents.add_reagent(reagent_injected, 1)
			if(prob(30))
				victim.reagents.add_reagent("kyphotorin", 1)
				victim.reagents.add_reagent("quickclot", 1)
		update_icon()

/obj/machinery/neotheology/clone_vat/proc/adjust_fluid_level(var/amount)
	if(amount >= (VAT_FILL_FULL - fluid_level))
		fluid_level = VAT_FILL_FULL
	else if((fluid_level + amount) < VAT_FILL_EMPTY)
		fluid_level = VAT_FILL_EMPTY
	else
		fluid_level += amount

/obj/machinery/neotheology/clone_vat/proc/check_vital_organs(mob/living/carbon/human/H, var/checkvital = FALSE)
	for(var/organ_tag in H.species.has_process)
		var/obj/item/organ/O = H.species.has_process[organ_tag]
		var/vital = TRUE
		if(checkvital)
			vital = initial(O.vital) //check for vital organs
		if(vital)
			O = H.random_organ_by_process(organ_tag)
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
	var/datum/organ_description/OD = victim.species.has_limbs[organ_tag]
	if(organ_tag in victim.species.has_limbs)
		var/obj/item/I = victim.organs_by_name[organ_tag]
		if(I)
			if(I.type == OD.default_type)
				return
			else
				qdel(I)

		victim.visible_message(SPAN_NOTICE("[victim]'s [OD.name] reforms with a wet squelchy noise!"), "Your [OD.name] reforms! Oh, god, the pain!", SPAN_DANGER("You hear wet squelching!"))
		OD.create_organ(victim)


	if(organ_tag in victim.species.has_process)
		var/organ_type = victim.species.has_process[organ_tag]
		var/obj/item/I = victim.random_organ_by_process(organ_tag)
		if(I && I.type == organ_type)
			return
		new organ_type(victim)

	victim.update_body()
	if(OD)
		victim.pain(OD.name, 100, TRUE)
	else
		victim.pain(organ_tag, 100, TRUE)




/obj/machinery/neotheology/clone_vat/proc/make_alive(mob/living/carbon/human/M) //This revives the mob
	var/deadtime = world.time - M.timeofdeath

	GLOB.dead_mob_list.Remove(M)
	GLOB.living_mob_list += M
	for(var/mob/observer/ghost/ghost in GLOB.player_list)
		if(ghost.mind == M.mind)
			to_chat(ghost, {"
				<font color = #330033 size = 3>
				<b>Your corpse has been placed into a cloning vat.
				Return to your body if you want to be resurrected/cloned!</b>
				(Verbs -> Ghost -> Re-enter corpse)
				</font>
			"})
			break
	M.timeofdeath = 0
	M.stat = UNCONSCIOUS //Life() can bring them back to consciousness if it needs to.
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.

	M.emote("gasp")
	var/obj/item/implant/core_implant/cruciform/I
	for(var/obj/item/implant/core_implant/cruciform/CR in M) //get_core_implant needs activated implants (and alive holder)
		if(CR)
			I = CR
			break
	if(I || M.stable_genes)
		if(I)
			I.activate()
		M.sanity.level = 30
		apply_brain_damage(M, deadtime/3)
		M.Weaken(rand(5, 10))
		M.updatehealth()
	else
		if(M.genetic_corruption < 28) //Even if you had no organs missing and just bled out, don't expect to wake up non-mutated
			M.genetic_corruption += 28
		M.Weaken(rand(10, 25))
		M.updatehealth()
		M.sanity.level = 0
		M.sanity.negative_prob += 5
		apply_brain_damage(M, deadtime)



/obj/machinery/neotheology/clone_vat/proc/apply_brain_damage(mob/living/carbon/human/H, var/deadtime)
	if(!H.should_have_process(BP_BRAIN)) return //no brain

	var/obj/item/organ/internal/brain/brain = H.random_organ_by_process(BP_BRAIN)
	if(!brain) return //no brain

	var/brain_damage = CLAMP((deadtime - 2 MINUTES)/8 * brain.max_damage, H.getBrainLoss(), brain.max_damage)
	H.setBrainLoss(brain_damage / 2)

/obj/machinery/neotheology/clone_vat/attack_hand(mob/user)
	if (user.incapacitated(INCAPACITATION_DEFAULT))
		return
	if (victim)
		user_unbuckle_mob(user)
		if(ishuman(victim))
			var/mob/living/carbon/human/H = victim
			H.stable_genes = FALSE
		return
/*	if(fluid_level < VAT_FILL_FULL)
		fluid_level += VAT_FLUID_STEP
	else
		fluid_level = VAT_FILL_EMPTY */
	update_icon()

/obj/machinery/neotheology/clone_vat/proc/calucalte_genetic_corruption(mob/living/carbon/human/H)
	var/corruption_counter = 0
	for(var/organ_tag in H.species.has_process)
		var/obj/item/organ/O = H.random_organ_by_process(organ_tag)
		if(!O)
			corruption_counter += 3.5
	for(var/organ_tag in H.species.has_limbs)
		var/obj/item/I = H.organs_by_name[organ_tag]
		if(!I)
			corruption_counter += 7

	return corruption_counter


/obj/machinery/neotheology/clone_vat/proc/corrupt_dna(mob/living/carbon/human/H)
	var/obj/item/implant/core_implant/cruciform/C
	for(var/obj/item/implant/core_implant/cruciform/CR in H) //get_core_implant needs activated implants (and alive holder)
		if(CR)
			C = CR
			break
	var/corruption_points = 0
	if(!C && !H.stable_genes)
		corruption_points = H.genetic_corruption/7
	else
		corruption_points = H.genetic_corruption/28 //CHURCH DISCOUNT YEEEEEEEEEEEEEEEEEEAH
		testing("CHURCH DISCOUNT")
	if(corruption_points <= 3) //Essentially, regenerating a head shall be safer
		return

	while(corruption_points > 0)
		scramble(TRUE, H, 20 + corruption_points * 2)
		corruption_points -= 1


/obj/machinery/neotheology/clone_vat/attackby(obj/item/O, mob/user)
	add_fingerprint(user)


	if(istype(O, /obj/item/organ))
		if(victim)
			to_chat(usr, SPAN_WARNING("\The [src] is already occupied!"))
			return
		if(fluid_level < VAT_FILL_HALF_FULL)
			to_chat(user, "The vat does not have enough fluids to restore the body!")
			return
		var/obj/item/organ/donor = O
		if(!donor.dna)
			to_chat(user, "\The [src] is rejected by the vat!")
			return
		var/mob/living/carbon/human/newbody = new/mob/living/carbon/human(loc)
		newbody.dna = donor.dna.Clone()
		newbody.set_species()
		newbody.real_name = donor.dna.real_name
		newbody.age = donor.dna.age
		newbody.flavor_text = donor.dna.flavor_text
		newbody.stats = donor.dna.stats
		newbody.UpdateAppearance()
		newbody.sync_organ_dna()
		newbody.stat = DEAD //So it doesn't display the "Seizes up" message
		sleep(1) //Game needs time to process all this or it gives you a weird wrong named character
		for(var/obj/item/organ/external/EO in newbody.organs)
			if(EO.organ_tag == BP_CHEST || EO.organ_tag == BP_GROIN)
				continue
			else
				EO.removed()
				qdel(EO)
		take_victim(newbody, newbody, TRUE)
		user.visible_message("[user.name] places \the [donor] into \the [src].", "You place \the [donor] into the vat.")
		qdel(O)
		return

	if(O.is_open_container())
		if(istype(O, /obj/item/reagent_containers))
			var/obj/item/reagent_containers/C = O
			//Containers with any reagents will get dumped in
			if(C.reagents.total_volume)
				var/wine_value = 0
				wine_value += C.reagents.get_reagent_amount("ntcahors")
				wine_value += C.reagents.get_reagent_amount("biomatter") * 0.5
				wine_value += C.reagents.get_reagent_amount("uncap nanites") * 0.7
				wine_value += C.reagents.get_reagent_amount("nanosymbiotes")
				wine_value += C.reagents.get_reagent_amount("bouncer") * 0.5
				var/message = ""
				if(!wine_value)													//The container has no water value, clear everything in it
					message = "The filtration process removes all reagents, leaving the fluid level unchanged."
					C.reagents.clear_reagents()
				else
					if(fluid_level == VAT_FILL_FULL)
						to_chat(usr, "[src] is already full!")
						return
					else
						message = "The filtration process purifies the reagents, raising the fluid level."
						fluid_level += wine_value
						if(fluid_level == VAT_FILL_FULL)
							message += " You filled \the [src] to the brim!"
						if(fluid_level > VAT_FILL_FULL)
							message += " You overfilled \the [src] and some of the fluid runs down the side, wasted."
							fluid_level = VAT_FILL_FULL
						C.reagents.clear_reagents()
				update_icon()
				user.visible_message("[user.name] pours the contents of [C.name] into \the [src].", "[message]")
				return

	if(istype(O, /obj/item/implant/core_implant/cruciform))
		if(victim)
			to_chat(usr, SPAN_WARNING("\The [src] is already occupied!"))
			return

		if(fluid_level < VAT_FILL_HALF_FULL)
			to_chat(user, "The vat does not have enough fluids to restore the body!")
			return

		var/obj/item/implant/core_implant/cruciform/I = O
		var/datum/core_module/cruciform/cloning/R = I.get_module(CRUCIFORM_CLONING)
		if(!R.dna)
			to_chat(user, "\The [src] is rejected by the vat!")
			return
		else
			user.drop_from_inventory(I)
			I.forceMove(loc)
			var/mob/living/carbon/human/newbody = new/mob/living/carbon/human(loc)
			newbody.dna = R.dna.Clone()
			newbody.set_species()
			newbody.real_name = R.dna.real_name
			newbody.age = R.age
			newbody.UpdateAppearance()
			newbody.sync_organ_dna()
			newbody.flavor_text = R.flavor
			newbody.stats = R.stats
			newbody.update_implants()
			newbody.stat = DEAD
			newbody.stable_genes = TRUE
			sleep(1) //Game needs time to process all this or it gives you a weird wrong named character
			for(var/obj/item/organ/external/EO in newbody.organs)
				if(EO.organ_tag == BP_CHEST || EO.organ_tag == BP_GROIN)
					continue
				else
					EO.removed()
					qdel(EO)
			take_victim(newbody, newbody, TRUE)
			user.visible_message("[user.name] places \the [I] into \the [src]. It starts releasing something into the fluid!", "You upload \the [I] into the vat.")
	return

/obj/machinery/neotheology/clone_vat/update_icon()
	overlays.Cut()
	if(fluid_level == VAT_FILL_EMPTY)
		return

	overlays += faucet1
	overlays += faucet5

	if(fluid_level > VAT_FILL_HALF_FULL)
		overlays += faucet2
		overlays += faucet4

	if(fluid_level >= VAT_FILL_FULL)
		overlays += faucet3

	var/image/juice = image(icon, src, fluid_type)
	overlays += juice

/obj/machinery/filler_object/clone_vat_dud
	icon_state = ""
	density = TRUE
	var/obj/machinery/neotheology/clone_vat/myvat


/obj/machinery/filler_object/clone_vat_dud/attack_hand(mob/user)
	if(myvat)
		myvat.attack_hand(user)
	else
		qdel(src)


/obj/machinery/filler_object/clone_vat_dud/attackby(obj/item/I, mob/user)
	if(myvat)
		myvat.attackby(I, user)
	else
		qdel(src)
