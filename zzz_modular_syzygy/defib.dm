#define DEFIB_TIME_LIMIT (10 MINUTES) //past this many seconds, defib is useless.
#define DEFIB_TIME_LOSS  (2 MINUTES) //past this many seconds, brain damage occurs.

// Adds defib timers to brain, and ensures it ticks down when its owner is dead
/obj/item/organ/internal/brain
	var/defib_timer = -1

/obj/item/organ/internal/brain/Process()
	..()
	if(owner && owner.stat != DEAD) // So there's a lower risk of ticking twice.
		tick_defib_timer()

// This is called by `process()` when the owner is alive, or brain is not in a body, and by `Life()` directly when dead.
/obj/item/organ/internal/brain/proc/tick_defib_timer()
// Commented out because Eris doesn't have functioning freezers.
/*
	if(preserved) // In an MMI/ice box/etc.
		return
*/

	if(!owner || owner.stat == DEAD)
		defib_timer = max(--defib_timer, 0)
	else
		defib_timer = min(++defib_timer, (15) / 2)


//backpack item
/obj/item/device/defib_kit
	name = "AED Unit"
	desc = "A device that delivers powerful shocks to detachable paddles in order to resuscitate incapacitated patients. This model comes with a built in audio tutorial for inexperienced users!"
	icon = 'zzz_modular_syzygy/icons/obj/ErisDefib.dmi'
	icon_state = "defibunit"
	item_state = "defibunit"
	slot_flags = SLOT_BACK
	item_flags = DRAG_AND_DROP_UNEQUIP
	force = 5
	throwforce = 6
//	preserve_item = 1		// Commented out because Eris doesn't have functioning freezers.
	w_class = ITEM_SIZE_BULKY		//Syzygy edit.
	origin_tech = list(TECH_BIO = 4, TECH_POWER = 2)
	action_button_name = "Remove/Replace Paddles"

	var/obj/item/weapon/shockpaddles/linked/paddles
	var/obj/item/weapon/cell/bcell = null
	var/cooldown = 45 SECONDS
	var/cooldown_timer

	item_icons = list(
		slot_l_hand_str = 'zzz_modular_syzygy/icons/mob/left_hand.dmi',
		slot_r_hand_str = 'zzz_modular_syzygy/icons/mob/right_hand.dmi',
		slot_back_str = 'zzz_modular_syzygy/icons/mob/back.dmi'
		)


/obj/item/device/defib_kit/proc/playaudiotutorial()
	var/turf/T = get_turf(src)

	if(world.time - cooldown_timer > cooldown)
		cooldown_timer = world.time
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"Before use of this Automated External Defibrillator unit, please ensure the shock area is cleared from any thick obstructions. Do not stop CPR until just before attaching the paddles. The process remains the same for any species.\"</font>")
		sleep(80)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"Step 1. Place the unit on your back. Ensure the unit is safely strapped on your back at all times during the procedure.\"</font>")
		sleep(60)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"Step 2. Retract the paddles from the unit. This will engage the unit and enable paddle charge up.\"</font>")
		sleep(70)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"Step 3. Hold the paddles in both hands. The placement locations of the paddles are on the patient's upper-right sternal border below the clavicle, and lateral to their left nipple on the upper body.\"</font>")
		sleep(80)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"Step 4. The paddles will automatically start charging once placed firmly against the patient's torso. Ensure that no one is touching the body before paddle charge up. Announce 'CLEAR' if there is another person performing CPR or standing close to the body.\"</font>")
		sleep(70)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"Step 5. Once the paddles have charged, the area is clear, and the position is correct, press the SHOCK button on the paddles to deliver an electrical shock to the patient's body.\"</font>")
		sleep(70)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"The AED unit will announce succession or failure in resuscitating the patient. If further attempts are potentially successful, continue CPR while the AED unit charges up again, then repeat from Step 3. Further attempts futile may require surgical action before becoming potentially successful.\"</font>")
		sleep(70)
		T = get_turf(src)
		T.audible_message("<font color = #00BA6E><B>AED Unit</B>: \"This unit's default battery allows up to 5 shocks before requiring manual removal via screwdriver and recharging at a cell charging port.\"</font>")

	else
		to_chat(usr, SPAN_DANGER("The tutorial hasn't ended. Please wait for it to end before starting it again."))

/obj/item/device/defib_kit/verb/tutorialbutton()
	set name = "Activate Verbal Guidance"
	set category = "Object"

	playaudiotutorial()

/obj/item/device/defib_kit/get_cell()
	return bcell

/obj/item/device/defib_kit/New() //starts without a cell for rnd
	..()
	if(ispath(paddles))
		paddles = new paddles(src, src)
	else
		paddles = new(src, src)

	if(ispath(bcell))
		bcell = new bcell(src)
	update_icon()

/obj/item/device/defib_kit/Destroy()
	. = ..()
	QDEL_NULL(paddles)
	QDEL_NULL(bcell)

/obj/item/device/defib_kit/loaded //starts with a cell
	bcell = /obj/item/weapon/cell/large/high


/obj/item/device/defib_kit/update_icon()
	var/list/new_overlays = list()

	if(paddles && paddles.loc == src) //in case paddles got destroyed somehow.
		new_overlays += "[initial(icon_state)]-paddles"
	if(bcell && paddles)
		if(bcell.check_charge(paddles.chargecost))
			if(paddles.combat)
				new_overlays += "[initial(icon_state)]-combat"
			else if(!paddles.safety)
				new_overlays += "[initial(icon_state)]-emagged"
			else
				new_overlays += "[initial(icon_state)]-powered"

		var/ratio = CEILING(bcell.percent()/25, 1) * 25
		new_overlays += "[initial(icon_state)]-charge[ratio]"
	else
		new_overlays += "[initial(icon_state)]-nocell"

	overlays = new_overlays

/obj/item/device/defib_kit/ui_action_click()
	toggle_paddles()

/obj/item/device/defib_kit/attack_hand(mob/user)
	if(loc == user)
		toggle_paddles()
	else
		..()

//MouseDrop commented out due to Eris code's use of item flag DRAG_AND_DROP_UNEQUIP to achieve the same thing.
/*
/obj/item/device/defib_kit/MouseDrop()
	if(ismob(src.loc))
		if(!CanMouseDrop(src))
			return
		var/mob/M = src.loc
		if(!M.unEquip(src))
			return
		src.add_fingerprint(usr)
//		M.put_in_any_hand_if_possible(src)
		M.put_in_hands(src)
*/

/obj/item/device/defib_kit/attackby(obj/item/I, mob/user, params)
	if(I == paddles)
		reattach_paddles(user)
	else if(istype(I, /obj/item/weapon/cell))
		if(bcell)
			to_chat(user, "<span class='notice'>\the [src] already has a cell.</span>")
		else
			if(!user.unEquip(I))
				return
			I.forceMove(src)
			bcell = I
			to_chat(user, "<span class='notice'>You install a cell in \the [src].</span>")
			update_icon()

	else if(QUALITY_SCREW_DRIVING in I.tool_qualities)
		if(bcell)
			bcell.update_icon()
			bcell.forceMove(get_turf(src.loc))
			bcell = null
			to_chat(user, "<span class='notice'>You remove the cell from \the [src].</span>")
			update_icon()

	else if(QUALITY_PULSING in I.tool_qualities)
		if (user.stat_check(STAT_COG, STAT_LEVEL_ADEPT))
			if(paddles.safety)
				paddles.safety = 0
				to_chat(user, "<span class='warning'>You disable \the [src]'s safety protocols.</span>")
				update_icon()
				return 1
			else
				paddles.safety = 1
				to_chat(user, "<span class='notice'>You enable \the [src]'s safety protocols.</span>")
				update_icon()
				return 1

		else
			to_chat(user, SPAN_WARNING("You aren't entirely sure what to pulse or where to pulse the AED unit. Smooth brain."))

	else
		return ..()


/obj/item/device/defib_kit/emag_act(var/remaining_charges, var/mob/user)
	if(paddles)
		. = paddles.emag_act(user)
		update_icon()
	return

//Paddle stuff

/obj/item/device/defib_kit/verb/toggle_paddles()
	set name = "Toggle Paddles"
	set category = "Object"

	var/mob/living/carbon/human/user = usr
	if(!paddles)
		to_chat(user, "<span class='warning'>The paddles are missing!</span>")
		return

	if(paddles.loc != src)
		reattach_paddles(user) //Remove from their hands and back onto the defib unit
		return

	if(!slot_check())
		to_chat(user, "<span class='warning'>You need to equip [src] before taking out [paddles].</span>")
	else
		if(!usr.put_in_hands(paddles)) //Detach the paddles into the user's hands
			to_chat(user, "<span class='warning'>You need a free hand to hold the paddles!</span>")
		update_icon() //success

//checks that the base unit is in the correct slot to be used
/obj/item/device/defib_kit/proc/slot_check()
	var/mob/M = loc
	if(!istype(M))
		return 0 //not equipped

	if((slot_flags & SLOT_BACK) && M.get_equipped_item(slot_back) == src)
		return 1
	if((slot_flags & SLOT_BELT) && M.get_equipped_item(slot_belt) == src)
		return 1

	return 0

/obj/item/device/defib_kit/dropped(mob/user)
	..()
	reattach_paddles(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/device/defib_kit/proc/reattach_paddles(mob/user)

	if(ismob(paddles.loc))
		var/mob/M = paddles.loc
		if(M.drop_from_inventory(paddles, src))
			to_chat(user, "<span class='notice'>\The [paddles] snap back into the main unit.</span>")
	else
		paddles.forceMove(src)
		attack_hand()

	update_icon()

/*
	Base Unit Subtypes
*/

/obj/item/device/defib_kit/compact
	name = "Defibrillator Belt"
	desc = "A belt-equipped defibrillator that can be rapidly deployed."
	icon = 'zzz_modular_syzygy/icons/obj/ErisDefib.dmi'
	icon_state = "defibcompact"
	item_state = "defibcompact"
	w_class = ITEM_SIZE_NORMAL		//Syzygy edit.
	slot_flags = SLOT_BELT
	origin_tech = list(TECH_BIO = 5, TECH_POWER = 3)

	icon_override = 'zzz_modular_syzygy/icons/mob/belt.dmi'

/obj/item/device/defib_kit/compact/loaded
	bcell = /obj/item/weapon/cell/large/high


/obj/item/device/defib_kit/compact/combat
	name = "Combat Defibrillator Belt"
	desc = "A belt-equipped blood-red defibrillator that can be rapidly deployed. Does not have the restrictions or safeties of conventional defibrillators and can revive through space suits."
	paddles = /obj/item/weapon/shockpaddles/linked/combat

/obj/item/device/defib_kit/compact/combat/loaded
	bcell = /obj/item/weapon/cell/large/high

/obj/item/weapon/shockpaddles/linked/combat
	combat = 1
	safety = 0
	chargetime = (10)


//paddles

/obj/item/weapon/shockpaddles
	name = "defibrillator paddles"
	desc = "A pair of plastic-gripped paddles with flat metal surfaces that are used to deliver powerful electric shocks."
	icon = 'zzz_modular_syzygy/icons/obj/ErisDefib.dmi'
	icon_state = "defibpaddles"
	item_state_slots = list(
		slot_l_hand_str = "defibpaddles",
		slot_r_hand_str = "defibpaddles",
		)
	wielded_icon = "wielded_defibpaddles"
	gender = PLURAL
	force = 2
	throwforce = 6
	w_class = ITEM_SIZE_BULKY		//Syzygy edit.

	item_icons = list(
		slot_l_hand_str = 'zzz_modular_syzygy/icons/mob/left_hand.dmi',
		slot_r_hand_str = 'zzz_modular_syzygy/icons/mob/right_hand.dmi',
		)

	var/safety = 1 //if you can zap people with the paddles on harm mode
	var/overcharge = FALSE // if you can overcharge the paddles when safety disabled.
	var/overchargecost = 6500 //bcell charge cost for overcharge shocking someone.
	var/overchargecooldown = 450 //Cooldown to prevent people spamming overcharge.
	var/combat = 0 //If it can be used to revive people wearing thick clothing (e.g. spacesuits)
	var/cooldowntime = (60) // How long in deciseconds until the defib is ready again after use.
	var/chargetime = (20)
	var/chargecost = 1000 //units of charge per zap	//With the default large cell, this allows 5 shocks
	var/burn_damage_amt = 5
	var/use_on_synthetic = 0 //If 1, this is only useful on FBPs, if 0, this is only useful on fleshies
	var/cooldown_timer

	var/held = 0
	var/cooldown = 0
	var/busy = 0

/obj/item/weapon/shockpaddles/attack_self(mob/user) //Toggle overcharge on and off.
	if(!safety) // Check if the safety has been disabled yet.
		if (check_overchargecell()) // Check if cell is good enough.
			if (!overcharge)
				overcharge = TRUE
				user.visible_message(
					SPAN_WARNING("[user] sets the charge value above the safety-locked limit."))
			else
				overcharge = FALSE
				user.visible_message(
					SPAN_WARNING("[user] sets the charge value back to the safety-locked limit."))
		else
			to_chat(user, SPAN_DANGER("The unit requires a larger cell capacity to be able to overcharge."))

	else
		to_chat(user, SPAN_NOTICE("The unit's safety features prevent you from setting the charge above the safety-locked limit."))


/obj/item/weapon/shockpaddles/update_wield_icon()
	..()
	if(wielded && wielded_icon)
		item_state_slots = list(
			slot_l_hand_str = "[wielded_icon]",
			slot_r_hand_str = "[wielded_icon]",
			)

/obj/item/weapon/shockpaddles/update_unwield_icon()
	..()
	if(!wielded && wielded_icon)
		item_state_slots = list(
			slot_l_hand_str = "defibpaddles",
			slot_r_hand_str = "defibpaddles",
			)

/obj/item/weapon/shockpaddles/proc/set_cooldown(var/delay)
	cooldown = 1
	update_icon()

	spawn(delay)
		if(cooldown)
			cooldown = 0
			update_icon()

			make_announcement("beeps, \"Unit is re-energized.\"", "notice")
			playsound(src, 'sound/machines/defib_ready.ogg', 50, 0)

/obj/item/weapon/shockpaddles/update_held_icon()
	var/mob/living/M = loc
	if(istype(M) && M.item_is_in_hands(src) && !M.hands_are_full())
		held = 1
		name = "[initial(name)] (held)"
	else
		held = 0
		name = initial(name)
	update_icon()
	..()

/obj/item/weapon/shockpaddles/update_icon()
	icon_state = "defibpaddles[held]"
	item_state = "defibpaddles[held]"
	if(cooldown)
		icon_state = "defibpaddles[held]_cooldown"

/obj/item/weapon/shockpaddles/proc/can_use(mob/user, mob/M)
	if(busy)
		return 0
	if(!wielded && !isrobot(user))
		to_chat(user, "<span class='warning'>You need to wield the paddles with both hands before you can use them on someone!</span>")
		return 0
	if(!check_charge(chargecost))
		to_chat(user, "<span class='warning'>\The [src] doesn't have enough charge left to do that.</span>")
		return 0
	if(cooldown)
		to_chat(user, "<span class='warning'>\The [src] are re-energizing!</span>")
		return 0
	return 1

//Checks for various conditions to see if the mob is revivable
/obj/item/weapon/shockpaddles/proc/can_defib(mob/living/carbon/human/H) //This is checked before doing the defib operation

//Syzygy edit. These are checks for Polaris snowflake species that can't be defibbed; disabled for now.
/*
	if((H.species.flags & NO_DEFIB))
		return "buzzes, \"Incompatible physiology. Operation aborted.\""
	else if(H.isSynthetic() && !use_on_synthetic)
		return "buzzes, \"Synthetic Body. Operation aborted.\""
	else if(!H.isSynthetic() && use_on_synthetic)
		return "buzzes, \"Organic Body. Operation aborted.\""
*/

	if(H.stat != DEAD)
		return "buzzes, \"Patient is not in a valid state. Operation aborted.\""

	if(!check_contact(H))
		return "buzzes, \"Patient's chest is obstructed. Operation aborted.\""

	return null

/obj/item/weapon/shockpaddles/proc/can_revive(mob/living/carbon/human/H) //This is checked right before attempting to revive
	var/obj/item/organ/internal/brain/brain = H.internal_organs_by_name[BP_BRAIN]
	if(H.should_have_organ(BP_BRAIN) && (!brain || brain.defib_timer <= 0 ) )
		return "buzzes, \"Resuscitation failed - Excessive neural degeneration. Further attempts futile.\""

	H.updatehealth()

	if(H.isSynthetic())
		if(H.health + H.getOxyLoss() + H.getToxLoss() <= -100)
			return "buzzes, \"Resuscitation failed - Severe damage detected. Begin manual repair before further attempts futile.\""

	else if(H.health + H.getOxyLoss() <= -100 || (HUSK in H.mutations))
		return "buzzes, \"Resuscitation failed - Severe tissue damage makes recovery of patient impossible via defibrillator. Further attempts futile.\""

	var/bad_vital_organ = check_vital_organs(H)
	if(bad_vital_organ)
		return bad_vital_organ

	//this needs to be last since if any of the 'other conditions are met their messages take precedence
	if(!H.client && !H.teleop)
		return "buzzes, \"Resuscitation failed - Mental interface error. Further attempts may be successful.\""

	return null

/obj/item/weapon/shockpaddles/proc/check_contact(mob/living/carbon/human/H)
	if(!combat)
		for(var/obj/item/clothing/cloth in list(H.wear_suit, H.w_uniform))
			if((cloth.body_parts_covered & UPPER_TORSO) && (cloth.item_flags & THICKMATERIAL))
				return FALSE
	return TRUE

/obj/item/weapon/shockpaddles/proc/check_vital_organs(mob/living/carbon/human/H)
	for(var/organ_tag in H.species.has_organ)
		var/obj/item/organ/O = H.species.has_organ[organ_tag]
		var/name = initial(O.name)
		var/vital = initial(O.vital) //check for vital organs
		if(vital)
			O = H.internal_organs_by_name[organ_tag]
			if(!O)
				return "buzzes, \"Resuscitation failed - Patient is missing vital organ ([name]). Further attempts futile.\""
			if(O.damage > O.max_damage)
				return "buzzes, \"Resuscitation failed - Excessive damage to vital organ ([name]). Further attempts futile.\""
	return null

/obj/item/weapon/shockpaddles/proc/check_blood_level(mob/living/carbon/human/H)
	if(!H.should_have_organ(BP_HEART))
		return FALSE

	var/obj/item/organ/internal/heart/heart = H.internal_organs_by_name[BP_HEART]
	if(!heart)
		return TRUE

	var/blood_volume = H.vessel.get_reagent_amount("blood")
	if(!heart || heart.is_broken())
		blood_volume *= 0.3
	else if(heart.is_bruised())
		blood_volume *= 0.7
	else if(heart.damage > 1)
		blood_volume *= 0.8
	return blood_volume < H.species.blood_volume * BLOOD_VOLUME_SURVIVE / 100

/obj/item/weapon/shockpaddles/linked/check_overchargecell() // Check if the cell is large enough to allow overcharge.
	return(base_unit.bcell.maxcharge >= overchargecost)

/obj/item/weapon/shockpaddles/proc/check_overchargecell()
	return 0

/obj/item/weapon/shockpaddles/linked/check_overchargecharge() // Check if the cell has enough charge to allow overcharge.
	return(base_unit.bcell.charge >= overchargecost)

/obj/item/weapon/shockpaddles/proc/check_overchargecharge()
	return 0

/obj/item/weapon/shockpaddles/linked/overchargedrain() // Drain the charge from the battery after an overcharge shock.
	base_unit.bcell.use(overchargecost)
	base_unit.update_icon()

/obj/item/weapon/shockpaddles/proc/overchargedrain()
	return 0

/obj/item/weapon/shockpaddles/proc/check_charge(var/charge_amt)
	return 0

/obj/item/weapon/shockpaddles/proc/checked_use(var/charge_amt)
	return 0

/obj/item/weapon/shockpaddles/examine(mob/user)
	..()
	if(world.time - cooldown_timer < overchargecooldown)
		to_chat(user, text(SPAN_WARNING("\The [src] are still scorching hot!")))

/obj/item/weapon/shockpaddles/attack(mob/living/M, mob/living/user, var/target_zone)
	var/mob/living/carbon/human/H = M
	var/obj/item/organ/internal/heart/L = H.internal_organs_by_name[BP_HEART]

	if(istype(H) && !safety)    //Did you target a human, and is the safety off?
		if(overcharge)  // If the paddles are set to overcharge
			if(check_overchargecharge())  //Check the battery charge
				if(world.time - cooldown_timer > overchargecooldown)  //Check that cooldown has ended
					cooldown_timer = world.time
					user.visible_message(
						SPAN_DANGER("[user] starts to overcharge \the [src], producing an increasingly loud sizzling and crackling noise!"),
						SPAN_DANGER("You begin overcharging \the [src], producing an increasingly loud sizzling and crackling noise!")
						)
					playsound(src, 'sound/machines/defib_overchargeSparks1.ogg', 50, 0)

					if (do_after(user, 100))	//Wait 10 seconds before proceeding
						user.visible_message(
							SPAN_DANGER("[user] overcharges \the [src] to the point where it glows red hot! The unit starts beeping frantically"),
							SPAN_DANGER("You overcharge \the [src] to the point where it glows red hot, feeling the heat around your hands! The unit starts beeping frantically.")
							)
						audible_message("<font color = #00BA6E><B>AED Unit</B>: \"WARNING! UNIT TEMPERATURE REACHING CRITICAL LEVELS!\"</font>")
						playsound(src, 'sound/machines/defib_overchargeSparks2.ogg', 50, 0)
						playsound(src, 'sound/machines/defib_overchargeWarning.ogg', 50, 0)

						if (do_after(user, 100))	//Wait ANOTHER 10 seconds before proceeding
							user.visible_message(
								SPAN_DANGER("[user] slams \the red hot [src] against [H]'s chest, producing a violent shower of sparks!"),
								SPAN_DANGER("You slam \the red hot [src] against [H]'s chest, producing a violent shower of sparks!")
								)
							playsound(src, 'sound/machines/defib_overchargeZap.ogg', 150, 0, 2)
							user.do_attack_animation(H)
							var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
							sparks.set_up(5, 0, get_turf(H))
							sparks.start()
							H.apply_damage(80, BURN, BP_CHEST)
							if (istype(L))
								L.take_damage(5, 0)
							overchargedrain()

						else
							user.visible_message(
								SPAN_DANGER("Smoke softly puffs out of \the [src] as [user] stops overcharging them, letting them cool down."),
								SPAN_DANGER("You stop overcharging \the [src], allowing them to cool down as they puff out smoke.")
								)
							return

					else
						user.visible_message(
							SPAN_DANGER("[user] stops overcharging \the [src] making the sizzling and crackling stop."),
							SPAN_DANGER("You stop overcharging \the [src] making the sizzling and crackling stop.")
							)
						return

				else
					to_chat(usr, SPAN_DANGER("\The [src] are still smoking hot! Give them a minute to cool down..."))

			else
				playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
				user.visible_message(
					SPAN_DANGER("[user] attempts to overcharge \the [src], but the unit beeps and flashes with a \"Low Charge\" symbol."),
					SPAN_DANGER("You attempt to overcharge \the [src], but the unit beeps and flashes with a \"Low Charge\" symbol.")
					)
			return

	if(!istype(H) || user.a_intent == I_HURT)
		return ..() //Do a regular attack. Harm intent shocking happens as a hit effect

	if(can_use(user, H))
		busy = 1
		update_icon()

		do_revive(H, user)

		busy = 0
		update_icon()

	return 1

//Since harm-intent now skips the delay for deliberate placement, you have to be able to hit them in combat in order to shock people.
/obj/item/weapon/shockpaddles/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(ishuman(target) && can_use(user, target))
		busy = 1
		update_icon()

		do_electrocute(target, user, hit_zone)

		busy = 0
		update_icon()

		return 1

	return ..()

// This proc is used so that we can return out of the revive process while ensuring that busy and update_icon() are handled
/obj/item/weapon/shockpaddles/proc/do_revive(mob/living/carbon/human/H, mob/user)
	var/mob/observer/ghost/ghost = H.get_ghost()
	if(ghost)
		ghost.notify_revive("Someone is trying to resuscitate you. Re-enter your body if you want to be revived!", 'sound/effects/genetics.ogg', source = src)

	//beginning to place the paddles on patient's chest to allow some time for people to move away to stop the process
	user.visible_message("<span class='warning'>\The [user] begins to place [src] on [H]'s chest.</span>", "<span class='warning'>You begin to place [src] on [H]'s chest...</span>")
	if(!do_after(user, 30, H))
		return
	user.visible_message("<span class='notice'>\The [user] places [src] on [H]'s chest.</span>", "<span class='warning'>You place [src] on [H]'s chest.</span>")
	playsound(src, 'sound/machines/defib_charge.ogg', 50, 0)

	var/error = can_defib(H)
	if(error)
		make_announcement(error, "warning")
		playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
		return

	if(check_blood_level(H))
		make_announcement("buzzes, \"Warning - Patient is in hypovolemic shock.\"", "warning") //also includes heart damage

	//placed on chest and short delay to shock for dramatic effect, revive time is 5sec total
	if(!do_after(user, chargetime, H))
		return

	//deduct charge here, in case the base unit was EMPed or something during the delay time
	if(!checked_use(chargecost))
		make_announcement("buzzes, \"Insufficient charge.\"", "warning")
		playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
		return

	H.visible_message("<span class='warning'>\The [H]'s body convulses a bit.</span>")
	playsound(src, "bodyfall", 50, 1)
	playsound(src, 'sound/machines/defib_zap.ogg', 50, 1, -1)
	set_cooldown(cooldowntime)

	error = can_revive(H)
	if(error)
		make_announcement(error, "warning")
		playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
		return

	H.apply_damage(burn_damage_amt, BURN, UPPER_TORSO)

	//set oxyloss so that the patient is just barely in crit, if possible
	var/barely_in_crit = 0 - 1
	var/adjust_health = barely_in_crit - H.health //need to increase health by this much
	H.adjustOxyLoss(-adjust_health)

	if(H.isSynthetic())
		H.adjustToxLoss(-H.getToxLoss())

	make_announcement("pings, \"Resuscitation successful.\"", "notice")
	playsound(src, 'sound/machines/defib_success.ogg', 50, 0)

	make_alive(H)

	log_and_message_admins("used \a [src] to revive [key_name(H)].")


/obj/item/weapon/shockpaddles/proc/do_electrocute(mob/living/carbon/human/H, mob/user, var/target_zone)
	var/obj/item/organ/external/affecting = H.get_organ(target_zone)
	if(!affecting)
		to_chat(user, "<span class='warning'>They are missing that body part!</span>")
		return

	//no need to spend time carefully placing the paddles, we're just trying to shock them
	user.visible_message("<span class='danger'>\The [user] slaps [src] onto [H]'s [affecting.name].</span>", "<span class='danger'>You overcharge [src] and slap them onto [H]'s [affecting.name].</span>")

	//Just stop at awkwardly slapping electrodes on people if the safety is enabled
	if(safety)
		to_chat(user, "<span class='warning'>You can't do that while the safety is enabled.</span>")
		return

	playsound(src, 'sound/machines/defib_charge.ogg', 50, 0)
	audible_message("<span class='warning'>\The [src] lets out a steadily rising hum...</span>")

	if(!do_after(user, chargetime, H))
		return

	//deduct charge here, in case the base unit was EMPed or something during the delay time
	if(!checked_use(chargecost))
		make_announcement("buzzes, \"Insufficient charge.\"", "warning")
		playsound(src, 'sound/machines/defib_failed.ogg', 50, 0)
		return

	user.visible_message("<span class='danger'><i>\The [user] shocks [H] with \the [src]!</i></span>", "<span class='warning'>You shock [H] with \the [src]!</span>")
	playsound(src, 'sound/machines/defib_zap.ogg', 100, 1, -1)
	playsound(src, 'sound/weapons/Egloves.ogg', 100, 1, -1)
	set_cooldown(cooldowntime)

	H.stun_effect_act(2, 120, target_zone)
	var/burn_damage = H.electrocute_act(burn_damage_amt*2, src, def_zone = target_zone)
	if(burn_damage > 15)
		H.emote("scream")
	H.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been shocked with [name] by [user.name] ([user.ckey])</font>")
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>Shocked [H.name] using [name] ([H.ckey])</font>")
	msg_admin_attack("[key_name(user)] shocked [key_name(H)]")

/obj/item/weapon/shockpaddles/proc/make_alive(mob/living/carbon/human/M) //This revives the mob
	GLOB.dead_mob_list.Remove(M)
	if((M in GLOB.living_mob_list) || (M in GLOB.dead_mob_list))
		WARNING("Mob [M] was defibbed but already in the living or dead list still!")
	GLOB.living_mob_list += M

	M.timeofdeath = 0
	M.set_stat(UNCONSCIOUS) //Life() can bring them back to consciousness if it needs to.
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.
	BITSET(M.hud_updateflag, HEALTH_HUD)
	BITSET(M.hud_updateflag, STATUS_HUD)
	BITSET(M.hud_updateflag, LIFE_HUD)

	M.emote("gasp")
	M.Weaken(rand(10,25))
	M.updatehealth()
	apply_brain_damage(M)

/obj/item/weapon/shockpaddles/proc/apply_brain_damage(mob/living/carbon/human/H)
	if(!H.should_have_organ(BP_BRAIN))
		return // No brain.

	var/obj/item/organ/internal/brain/brain = H.internal_organs_by_name[BP_BRAIN]
	if(!brain)
		return // Still no brain.

	// If the brain'd `defib_timer` var gets below this number, brain damage will happen at a linear rate.
	// This is measures in `Life()` ticks. E.g. 10 minute defib timer = 6000 world.time units = 3000 `Life()` ticks.
	var/brain_damage_timer = ((10) / 2) - ((2) / 2)

	if(brain.defib_timer > brain_damage_timer)
		return // They got revived before brain damage got a chance to set in.

	// As the brain decays, this will be between 0 and 1, with 1 being the most fresh.
	var/brain_death_scale = brain.defib_timer / brain_damage_timer

	// This is backwards from what you might expect, since 1 = fresh and 0 = rip.
	var/damage_calc = LERP(brain.max_damage, H.getBrainLoss(), brain_death_scale)

	// A bit of sanity.
	var/brain_damage = between(H.getBrainLoss(), damage_calc, brain.max_damage)

	H.setBrainLoss(brain_damage)

/obj/item/weapon/shockpaddles/proc/make_announcement(var/message, var/msg_class)
	audible_message("<b>\The [src]</b> [message]", "\The [src] vibrates slightly.")

/obj/item/weapon/shockpaddles/emag_act(mob/user)
	if(safety)
		safety = 0
		to_chat(user, "<span class='warning'>You silently disable \the [src]'s safety protocols with the cryptographic sequencer.</span>")
		update_icon()
		return 1
	else
		safety = 1
		to_chat(user, "<span class='notice'>You silently enable \the [src]'s safety protocols with the cryptographic sequencer.</span>")
		update_icon()
		return 1

/obj/item/weapon/shockpaddles/emp_act(severity)
	var/new_safety = rand(0, 1)
	if(safety != new_safety)
		safety = new_safety
		if(safety)
			make_announcement("beeps, \"Safety protocols enabled!\"", "notice")
			playsound(src, 'sound/machines/defib_safetyon.ogg', 50, 0)
		else
			make_announcement("beeps, \"Safety protocols disabled!\"", "warning")
			playsound(src, 'sound/machines/defib_safetyoff.ogg', 50, 0)
		update_icon()
	..()

/obj/item/weapon/shockpaddles/robot
	name = "defibrillator paddles"
	desc = "A pair of advanced shockpaddles powered by a robot's internal power cell, able to penetrate thick clothing."
	chargecost = 50
	combat = 1
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	cooldowntime = (30)

/obj/item/weapon/shockpaddles/robot/check_charge(var/charge_amt)
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return (R.cell && R.cell.check_charge(charge_amt))

/obj/item/weapon/shockpaddles/robot/checked_use(var/charge_amt)
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return (R.cell && R.cell.checked_use(charge_amt))

/obj/item/weapon/shockpaddles/robot/combat
	name = "combat defibrillator paddles"
	desc = "A pair of advanced shockpaddles powered by a robot's internal power cell, able to penetrate thick clothing.  This version \
	appears to be optimized for combat situations, foregoing the safety inhabitors in favor of a faster charging time."
	safety = 0
	chargetime = (10)


	//Shockpaddles that are linked to a base unit

/obj/item/weapon/shockpaddles/linked
	var/obj/item/device/defib_kit/base_unit
	canremove = FALSE

/obj/item/weapon/shockpaddles/linked/New(newloc, obj/item/device/defib_kit/defib)
	base_unit = defib
	..(newloc)

/obj/item/weapon/shockpaddles/linked/Destroy()
	if(base_unit)
		//ensure the base unit's icon updates
		if(base_unit.paddles == src)
			base_unit.paddles = null
			base_unit.update_icon()
		base_unit = null
	return ..()

/obj/item/weapon/shockpaddles/linked/dropped(mob/user)
	..() //update twohanding
	if(base_unit)
		base_unit.reattach_paddles(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/weapon/shockpaddles/linked/check_charge(var/charge_amt)
	return (base_unit.bcell && base_unit.bcell.check_charge(charge_amt))

/obj/item/weapon/shockpaddles/linked/checked_use(var/charge_amt)
	return (base_unit.bcell && base_unit.bcell.checked_use(charge_amt))

/obj/item/weapon/shockpaddles/linked/make_announcement(var/message, var/msg_class)
	base_unit.audible_message("<b>\The [base_unit]</b> [message]", "\The [base_unit] vibrates slightly.")

/*
	Standalone Shockpaddles
*/

/obj/item/weapon/shockpaddles/standalone
	desc = "A pair of shockpaddles powered by an experimental miniaturized reactor" //Inspired by the advanced e-gun
	var/fail_counter = 0

/obj/item/weapon/shockpaddles/standalone/Destroy()
	. = ..()
	if(fail_counter)
		STOP_PROCESSING(SSobj, src)

/obj/item/weapon/shockpaddles/standalone/check_charge(var/charge_amt)
	return 1

/obj/item/weapon/shockpaddles/standalone/checked_use(var/charge_amt)
// Radiation commented out until Eris adds working radiation.
/*
	SSradiation.radiate(src, charge_amt/12) //just a little bit of radiation. It's the price you pay for being powered by magic I guess
*/
	return 1

/obj/item/weapon/shockpaddles/standalone/Process()
	if(fail_counter > 0)
// Radiation commented out until Eris adds working radiation.
/*
		SSradiation.radiate(src, fail_counter--)
*/
	else
		STOP_PROCESSING(SSobj, src)

/obj/item/weapon/shockpaddles/standalone/emp_act(severity)
	..()
	var/new_fail = 0
	switch(severity)
		if(1)
			new_fail = max(fail_counter, 20)
			visible_message("\The [src]'s reactor overloads!")
		if(2)
			new_fail = max(fail_counter, 8)
			if(ismob(loc))
				to_chat(loc, "<span class='warning'>\The [src] feel pleasantly warm.</span>")

	if(new_fail && !fail_counter)
		START_PROCESSING(SSobj, src)
	fail_counter = new_fail

//From the Bay port, this doesn't seem to have a sprite.
/*
/obj/item/weapon/shockpaddles/standalone/traitor
	name = "defibrillator paddles"
	desc = "A pair of unusual looking paddles powered by an experimental miniaturized reactor. It possesses both the ability to penetrate armor and to deliver powerful shocks."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	combat = 1
	safety = 0
	chargetime = (1 SECONDS)
*/

///// FBP Defibs /////
/obj/item/device/defib_kit/jumper_kit
	name = "jumper cable kit"
	desc = "A device that delivers powerful shocks to detachable jumper cables that are capable of reviving full body prosthetics."
	icon_state = "jumperunit"
	item_state = "defibunit"
//	item_state = "jumperunit"
	paddles = /obj/item/weapon/shockpaddles/linked/jumper

/obj/item/device/defib_kit/jumper_kit/loaded
	bcell = /obj/item/weapon/cell/large/high

/obj/item/weapon/shockpaddles/linked/jumper
	name = "jumper cables"
	icon_state = "jumperpaddles"
	item_state = "jumperpaddles"
	use_on_synthetic = 1

/obj/item/weapon/shockpaddles/robot/jumper
	name = "jumper cables"
	desc = "A pair of advanced shockpaddles powered by a robot's internal power cell, able to penetrate thick clothing."
	icon_state = "jumperpaddles0"
	item_state = "jumperpaddles0"
	use_on_synthetic = 1

#undef DEFIB_TIME_LIMIT
#undef DEFIB_TIME_LOSS

