/datum/species/slime
	name = SPECIES_PROMETHEAN
	name_plural = "Prometheans"
	mob_size = MOB_SMALL

	icobase = 'icons/mob/human_races/r_human_vr.dmi' //Eclipse edit
	deform = 'icons/mob/human_races/r_human_vr.dmi'	//Eclipse edit

	blurb = "Prometheans (Macrolimus artificialis) are a species of artificially-created gelatinous humanoids, \
	chiefly characterized by their primarily liquid bodies and ability to change their bodily shape and color in order to  \
	mimic many forms of life. Derived from the Aetolian giant slime (Macrolimus vulgaris) inhabiting the warm, tropical planet \
	of Aetolus, they are a relatively new lab-created sapient species, and as such many things about them have yet to be comprehensively studied. \
	What has Science done?"

	language = null //todo?
	unarmed_types = list(/datum/unarmed_attack/slime_glomp)
	inherent_verbs = list(/mob/living/carbon/human/proc/regenerate_organs, /mob/living/carbon/human/proc/promethean_morph) //Eclipse edit
	flags = NO_SCAN | NO_SLIP | NO_BREATHE | NO_MINOR_CUT
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_SKIN_COLOR | HAS_EYE_COLOR //Eclipse edit
	total_health = 200
	brute_mod = 1.2
	burn_mod = 0.7
	spawn_flags = SPECIES_CAN_JOIN
	siemens_coefficient = 3 //conductive
	darksight = 3

	blood_color = "#03bafc" //Eclipse edit
	flesh_color = "#03bafc" //Eclipse edit

	remains_type = /obj/effect/decal/cleanable/ash
	death_message = "rapidly loses cohesion, splattering across the ground..."

	has_process = list(
		BP_BRAIN = /obj/item/organ/internal/brain/slime
		)

	var/original = TRUE //Eclipse edit -- used to determine if this is the "base" species used by global lists or a "local" version used for shapeshifting

	breath_type = null
	poison_type = null

	bump_flag = SLIME
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/slime,
		BP_GROIN =  new /datum/organ_description/groin/slime,
		BP_HEAD =   new /datum/organ_description/head/slime,
		BP_L_ARM =  new /datum/organ_description/arm/left/slime,
		BP_R_ARM =  new /datum/organ_description/arm/right/slime,
		BP_L_LEG =  new /datum/organ_description/leg/left/slime,
		BP_R_LEG =  new /datum/organ_description/leg/right/slime,
		BP_L_HAND = new /datum/organ_description/hand/left/slime,
		BP_R_HAND = new /datum/organ_description/hand/right/slime,
		BP_L_FOOT = new /datum/organ_description/foot/left/slime,
		BP_R_FOOT = new /datum/organ_description/foot/right/slime
	)

	reagent_tag = IS_SLIME		//Eclipse edit.


	var/heal_rate = 0.5 // Temp. Regen per tick.


/datum/species/slime/handle_death(var/mob/living/carbon/human/H)
	spawn(1)
		if(H)
			H.gib()

//Eclipse edits from here to EoF

/mob/living/carbon/human/proc/regenerate_organs()
	set name = "Regenerate missing limb"
	set desc = "Regenerate a missing limb at the cost of nutrition"
	set category = "Abilities"
	var/mob/living/carbon/human/user = usr
	var/missing_limb_tag
	if(!user || !species)
		return
	if(user.stat)
		return
	for(var/limb_tag in BP_ALL_LIMBS)
		var/obj/item/organ/external/organ_to_check = organs_by_name[limb_tag]
		if(!organ_to_check || istype(organ_to_check , /obj/item/organ/external/stump))
			missing_limb_tag = limb_tag
			break
	if(!missing_limb_tag)
		to_chat(user, "You don't have any limbs to replace!")
		return
	if(nutrition < 100)
		to_chat(user, "You do not have enough nutrition to regenerate a limb")
		return

	if(user.species.has_limbs.Find(missing_limb_tag))
		var/stump_to_delete = organs_by_name[missing_limb_tag]
		if(stump_to_delete)
			qdel(stump_to_delete)
		user.adjustNutrition(-100)
		var/datum/organ_description/OD = species.has_limbs[missing_limb_tag]
		OD.create_organ(src)
		to_chat(user, "You regenerate your [missing_limb_tag]")


/datum/species/slime/handle_environment_special(var/mob/living/carbon/human/H)
	if((H.getBruteLoss() + H.getFireLoss()) > H.maxHealth*0.5 && isturf(H.loc)) //So, only if we're not a blob (we're in nullspace)
		H.blobify()
		return ..() //Any instakill shot runtimes since there are no organs after this. No point to not skip these checks, going to nullspace anyway.

	var/turf/T = H.loc
	if(istype(T))
		var/obj/effect/decal/cleanable/C = locate() in T
		if(C && !(H.shoes || (H.wear_suit && (H.wear_suit.body_parts_covered & FEET))))
			qdel(C)

			H.nutrition = min(500, max(0, H.nutrition + rand(15, 22)))

	// Heal remaining damage.
	if(H.fire_stacks >= 0)
		if(H.getBruteLoss() || H.getFireLoss() || H.getOxyLoss() || H.getToxLoss())
			var/nutrition_cost = 0
			var/nutrition_debt = H.getBruteLoss()
			var/starve_mod = 1
			if(H.nutrition <= 25)
				starve_mod = 0.75
			H.adjustBruteLoss(-heal_rate * starve_mod)
			nutrition_cost += nutrition_debt - H.getBruteLoss()

			nutrition_debt = H.getFireLoss()
			H.adjustFireLoss(-heal_rate * starve_mod)
			nutrition_cost += nutrition_debt - H.getFireLoss()

			nutrition_debt = H.getOxyLoss()
			H.adjustOxyLoss(-heal_rate * starve_mod)
			nutrition_cost += nutrition_debt - H.getOxyLoss()

			nutrition_debt = H.getToxLoss()
			H.adjustToxLoss(-heal_rate * starve_mod)
			nutrition_cost += nutrition_debt - H.getToxLoss()
			H.nutrition -= (2 * nutrition_cost) //Costs Nutrition when damage is being repaired, corresponding to the amount of damage being repaired.
			H.nutrition = max(0, H.nutrition) //Ensure it's not below 0.
	else
		H.adjustToxLoss(2*heal_rate)	// Doubled because 0.5 is miniscule, and fire_stacks are capped in both directions

/mob/living/simple_animal/promethean_blob
	name = "promethean blob"
	desc = "It's so small and adorable!"
	icon = 'icons/mob/slimes.dmi'
	icon_state = "grey baby slime"
	icon_living = "grey baby slime"
	icon_dead = "grey baby slime dead"
	pass_flags = PASSTABLE
	faction = "slime"
	speed = 1
	maxHealth = 75
	health = 60
	speed = 1

	show_stat_health = FALSE //We will do it ourselves

	response_help = "pats the"
	response_disarm = "gently pushes aside the"
	response_harm = "hits the"

	harm_intent_damage = 2
	melee_damage_lower = 5
	melee_damage_upper = 12
	attacktext = list("bonked", "chomped", "thunked", "angrily glomped", "pounced")

	var/obj/item/clothing/head/hat = null // The hat the slime may be wearing.

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0
	maxbodytemp = 900

	speak_chance = 1
	speak = list("Blrb?","Sqrsh.","Glrsh!")
	speak_emote = list("chirps")
	emote_hear = list("squishes softly","spluts quietly","makes wet noises")
	emote_see = list("jiggles", "bounces in place")
	var/target_nutrition = 9999
	var/list/moods = list(":33", "pout", "angry", "sad", ":3", "mischevous")

	var/mood = ":33"

	var/mob/living/carbon/human/humanform
	var/mob/living/victim
	var/power_charge

	//player_msg = "You are a small soft jelly thing. Smoothly rounded, with no limbs, with pulsing core your torso used to be. "


//Constructor allows passing the human to sync damages
/mob/living/simple_animal/promethean_blob/New(var/newloc, var/mob/living/carbon/human/H)
	..()
	overlays.Cut()
	if(H)
		maxHealth = H.getMaxHealth()
		nutrition = H.health/1.2
		target_nutrition = H.maxHealth * 1.5
		humanform = H
		updatehealth()
		verbs |= /mob/living/proc/ventcrawl
		verbs |= /mob/living/proc/hide
		verbs |= /mob/living/simple_animal/promethean_blob/proc/evolve
		verbs |= /mob/living/simple_animal/promethean_blob/proc/set_mood
		color = rgb(rand(1,220),rand(1,220),rand(1,220))
		if(H.health > (H.maxHealth - H.maxHealth/1.25))
			overlays += "aslime-:33"
		else
			overlays += "aslime-pout"
			mood = "pout"
	else
		overlays += "aslime-:33"
	if(name == initial(name))
		name = "[name] ([rand(1, 1000)])"
	real_name = name



/mob/living/simple_animal/promethean_blob/Destroy()
	humanform = null
	if(hat)
		drop_hat()
	return ..()



/mob/living/simple_animal/promethean_blob/updatehealth()
	if(humanform)
		//Set the max
		//Set us to their health, but, human health ignores robolimbs so we do it 'the hard way'
		health = maxHealth - humanform.getOxyLoss() - humanform.getToxLoss() - humanform.getCloneLoss() - humanform.getFireLoss() - humanform.getBruteLoss()

		//Alive, becoming dead
		if((stat < DEAD) && (health <= 0))
			death()

		//Overhealth
		if(health > getMaxHealth())
			health = getMaxHealth()

	else
		..()

/mob/living/simple_animal/promethean_blob/adjustBruteLoss(var/amount)
	if(humanform)
		humanform.adjustBruteLoss(amount)
		updatehealth()
	else
		..()

/mob/living/simple_animal/promethean_blob/adjustFireLoss(var/amount)
	if(humanform)
		humanform.adjustFireLoss(amount)
		updatehealth()
	else
		..()

/mob/living/simple_animal/promethean_blob/death(gibbed, deathmessage = "splatters, leaving only its core!")
	if(humanform)
		sleep(2)
		humanform.ckey = ckey
		for(var/obj/item/organ/internal/brain/slime/core in humanform.internal_organs)
			core.transfer_identity(humanform)
			core.removed()
			core.forceMove(drop_location())
	sleep(2 SECONDS)
	qdel(src)

	..(gibbed, deathmessage)


/mob/living/simple_animal/promethean_blob/Life()
	var/turf/T = src.loc
	if(istype(T))
		var/obj/effect/decal/cleanable/C = locate() in T
		if(C)
			qdel(C)
			adjust_nutrition(10)
	..()



/mob/living/simple_animal/promethean_blob/MouseEntered(location,control,params)
	if(resting)
		return
	..()

// Helpers - Unsafe, WILL perform change.
/mob/living/carbon/human/proc/blobify()
	handle_grasp() //It's possible to blob out before some key parts of the life loop. This results in things getting dropped at null. TODO: Fix the code so this can be done better.
	if(pulledby)
		pulledby.stop_pulling()
	stop_pulling()

	//Record where they should go
	var/atom/creation_spot = drop_location()

	//Create our new blob
	var/mob/living/simple_animal/promethean_blob/blob = new(creation_spot,src)

	//Drop all our things
	var/list/things_to_drop = contents.Copy()
	var/list/things_to_not_drop = list(wear_id,l_ear,r_ear) //And whatever else we decide for balancing.


	things_to_drop -= things_to_not_drop //Crunch the lists
	things_to_drop -= organs //Mah armbs
	things_to_drop -= internal_organs //Mah sqeedily spooch

	for(var/obj/item/I in things_to_drop) //rip hoarders
		drop_from_inventory(I)

	if(w_uniform && istype(w_uniform,/obj/item/clothing)) //No webbings tho. We do this after in case a suit was in the way
		var/obj/item/clothing/uniform = w_uniform
		if(LAZYLEN(uniform.accessories))
			for(var/obj/item/clothing/accessory/A in uniform.accessories)
				uniform.remove_accessory(null,A) //First param is user, but adds fingerprints and messages

	//Size update
	blob.transform = matrix()*size_multiplier
	blob.size_multiplier = size_multiplier

	//Put our owner in it (don't transfer var/mind)
	blob.ckey = ckey
	temporary_form = blob

	//Mail them to nullspace
	forceMove(null)

	//Message
	blob.visible_message("<b>[src.name]</b> collapses into a gooey blob!")

	//Return our blob in case someone wants it
	return blob


/mob/living/carbon/human/proc/unblobify(var/mob/living/simple_animal/promethean_blob/blob)
	if(!istype(blob))
		return
	if(pulledby)
		pulledby.stop_pulling()
	stop_pulling()


	//Play the animation
	blob.icon_state = "from_puddle"

	//Message
	blob.visible_message("<b>[src.name]</b> reshapes into a humanoid appearance!")

	//Duration of above animation
	sleep(8)

	//Record where they should go
	var/atom/reform_spot = blob.drop_location()

	//Size update
	resize(blob.size_multiplier, FALSE)

	//Move them back where the blob was
	forceMove(reform_spot)

	//Put our owner in it (don't transfer var/mind)
	ckey = blob.ckey
	temporary_form = null



	Life(1)

	//Get rid of friend blob
	qdel(blob)

	//Return ourselves in case someone wants it
	return src


/mob/living/simple_animal/promethean_blob/proc/evolve()
	set name = "evolve"
	set desc = "This will let you evolve from a slime into a promethean."
	set category = "Abilities"

	if(stat)
		to_chat(usr, "<span class='notice'>You must be conscious to do this.</span>")
		return

	if(nutrition >= target_nutrition)
		to_chat(src, "<span class='notice'>You begin to reform...</span>")
		if(do_after(src, 50))
			for(var/obj/item/organ/I in humanform.internal_organs)
				if(I.damage > 0)
					I.damage = max(I.damage - 30, 0) //Repair functionally half of a dead internal organ.
			// Replace completely missing limbs.
			for(var/limb_type in humanform.species.has_limbs)
				var/obj/item/organ/external/E = humanform.organs_by_name[limb_type]
				if(E && E.disfigured)
					E.disfigured = 0
				if(E && (E.is_stump() || (E.status & (ORGAN_DESTROYED|ORGAN_DEAD|ORGAN_MUTATED))))
					E.removed()
					qdel(E)
					E = null
				if(!E)
					var/list/organ_data = humanform.species.has_limbs[limb_type]
					var/limb_path = organ_data["path"]
					var/obj/item/organ/O = new limb_path(humanform)
					organ_data["descriptor"] = O.name
			humanform.regenerate_icons()
			humanform.unblobify(src)
		else
			to_chat(src, "<span class='notice'>Your evolution is interrupted!</span>")
	else
		to_chat(src, "<span class='notice'>You're too hungry to evolve!</span>")
	return

/mob/living/simple_animal/promethean_blob/proc/set_mood()
	set category = "Abilities"
	set name = "Set Mood"
	set desc = "the mood will be big."

	var/chosen_mood = input(usr, "Choose a mood (to be displayed as your face)","Big Mood") as null|anything in moods
	if(!chosen_mood)
		return
	else
		mood = chosen_mood
		update_icon()
		return

/mob/living/simple_animal/promethean_blob/proc/can_consume(var/mob/living/L)
	if(!L || !istype(L))
		to_chat(src, "This subject is incomparable.")
		return FALSE
	if(L.isSynthetic())
		to_chat(src, "This subject is not biological.")
		return FALSE
	if((L.getarmor(null, "bio") >= 75))
		to_chat(src, "You can't reach this subject's biological matter.")
		return FALSE
	if(istype(L, /mob/living/simple_animal/slime))
		to_chat(src, "You cannot feed on other slimes.")
		return FALSE
	if(istype(L, /mob/living/simple_animal/promethean_blob))
		to_chat(src, "You cannot feed on other slimes.")
		return FALSE
	if(!Adjacent(L))
		to_chat(src, "This subject is too far away.")
		return FALSE
	if(istype(L, /mob/living/carbon) && L.getCloneLoss() >= L.getMaxHealth() * 1.2 || istype(L, /mob/living/simple_animal) && L.stat == DEAD)
		to_chat(src, "This subject does not have an edible life energy.")
		return FALSE
	return TRUE

/mob/living/simple_animal/promethean_blob/proc/start_consuming(var/mob/living/L)
	if(!can_consume(L))
		return
	if(!Adjacent(L))
		return
	step_towards(src, L) // Get on top of them to feed.
	if(loc != L.loc)
		return
	if(L.buckle_mob(src))
		victim = L
		update_icon()
		victim.visible_message("<span class='danger'>\The [src] latches onto [victim]!</span>",
		"<span class='danger'>\The [src] latches onto you!</span>")

/mob/living/simple_animal/promethean_blob/proc/stop_consumption()
	if(!victim)
		return
	victim.unbuckle_mob()
	victim.visible_message("<span class='notice'>\The [src] slides off of [victim]!</span>",
	"<span class='notice'>\The [src] slides off of you!</span>")
	victim = null
	update_icon()

/mob/living/simple_animal/promethean_blob/update_icon()
	if(stat == DEAD)
		icon_state = icon_dead
		set_light(0)
	overlays.Cut()

	if(stat != DEAD)
		var/image/I
		I = image(icon, src, "aslime-[mood]")
		overlays += I

	if(hat)
		var/hat_state = hat.item_state ? hat.item_state : hat.icon_state
		var/image/I = image('icons/mob/head.dmi', src, hat_state)
		I.pixel_y = -7 // Slimes are small.
		I.appearance_flags = RESET_COLOR
		overlays += I


/mob/living/simple_animal/promethean_blob/proc/handle_consumption()
	if(victim && can_consume(victim) && !stat)

		var/armor_modifier = abs((victim.getarmor(null, "bio") / 100) - 1)
		if(istype(victim, /mob/living/carbon))
			victim.adjustCloneLoss(rand(2,4) * armor_modifier)
			victim.adjustToxLoss(rand(1,2) * armor_modifier)
			if(victim.health <= 0)
				victim.adjustToxLoss(rand(1,3) * armor_modifier)
			adjust_nutrition(2.3 * armor_modifier)

		else
			to_chat(src, "<span class='warning'>[pick("This subject is incompatable", \
			"This subject does not have a life energy", "This subject is empty", \
			"I can not feed from this subject", "This subject is not food")]...</span>")
			stop_consumption()


		adjustOxyLoss(-2)
		adjustBruteLoss(-2)
		adjustFireLoss(-2)
		adjustCloneLoss(-2)
		updatehealth()
		if(victim)
			victim.updatehealth()
	else
		stop_consumption()

/mob/living/simple_animal/promethean_blob/proc/adjust_nutrition(input)
	nutrition = between(0, nutrition + input, get_max_nutrition())

	if(input > 0)
		if(prob(input * 2)) // Gain around one level per 50 nutrition
			power_charge = min(power_charge++, 10)
			if(power_charge == 10)
				adjustToxLoss(-10)
				power_charge--


/mob/living/simple_animal/promethean_blob/proc/get_max_nutrition() // Can't go above it
	return target_nutrition * 1.2

/mob/living/simple_animal/promethean_blob/proc/get_grow_nutrition() // Above it we grow, below it we can eat
	return 800

/mob/living/simple_animal/promethean_blob/proc/get_hunger_nutrition() // Below it we will always eat
	return 500

/mob/living/simple_animal/promethean_blob/proc/get_starve_nutrition() // Below it we will eat before everything else
	return 200


/*
/mob/living/simple_animal/promethean_blob/UnarmedAttack(var/mob/living/L)
	if(!Adjacent(L)) // Might've moved away in the meantime.
		return

	if(istype(L))

		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			// Slime attacks can be blocked with shields.
			if(H.check_shields(damage = 0, damage_source = null, attacker = src, def_zone = null, attack_text = "the attack"))
				return

		switch(a_intent)
			if(I_HELP)
				L.visible_message("<span class='notice'>[src] gently pokes [L]!</span>",
				"<span class='notice'>[src] gently pokes you!</span>")
			//	do_attack_animation(L) -

			if(I_DISARM)
				var/stun_power = between(0, power_charge + rand(0, 3), 10)

				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					stun_power *= max(H.species.siemens_coefficient,0)


				if(prob(stun_power * 10))
					power_charge = max(0, power_charge - 3)
					L.visible_message("<span class='danger'>[src] has shocked [L]!</span>", "<span class='danger'>[src] has shocked you!</span>")
					playsound(src, 'sound/weapons/Egloves.ogg', 75, 1)
					L.Weaken(3)
					L.Stun(3)
					do_attack_animation(L)
					if(L.buckled)
						L.buckled.unbuckle_mob() // To prevent an exploit where being buckled prevents slimes from jumping on you.
					L.stuttering = max(L.stuttering, stun_power)

					var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
					s.set_up(5, 1, L)
					s.start()

					if(prob(stun_power * 10) && stun_power >= 8)
						L.adjustFireLoss(power_charge / rand(1, 1.5))

				else if(prob(40))
					L.visible_message("<span class='danger'>[src] has pounced at [L]!</span>", "<span class='danger'>[src] has pounced at you!</span>")
					playsound(src, 'sound/weapons/thudswoosh.ogg', 75, 1)
					L.Weaken(2)
					do_attack_animation(L)
					if(L.buckled)
						L.buckled.unbuckle_mob() // To prevent an exploit where being buckled prevents slimes from jumping on you.
				else
					L.visible_message("<span class='danger'>[src] has tried to pounce at [L]!</span>", "<span class='danger'>[src] has tried to pounce at you!</span>")
					playsound(src, 'sound/weapons/punchmiss.ogg', 75, 1)
					do_attack_animation(L)
				L.updatehealth()
				return L

			if(I_GRAB)
				start_consuming(L)

			if(I_HURT)
				var/damage_to_do = rand(melee_damage_lower, melee_damage_upper)
				var/armor_modifier = abs((L.getarmor(null, "bio") / 100) - 1)

				L.attack_generic(src, damage_to_do, pick(attacktext))
				playsound(src, 'sound/weapons/bite.ogg', 75, 1)

				// Give the slime some nutrition, if applicable.
				if(!L.isSynthetic())
					if(ishuman(L))
						if(L.getCloneLoss() < L.getMaxHealth() * 1.5)
							adjust_nutrition(damage_to_do * armor_modifier)

					else if(istype(L, /mob/living/simple_animal))
						if(!isslime(L))
							var/mob/living/simple_animal/SA = L
							if(!SA.stat)
								if(SA.health > 0)
									adjust_nutrition(damage_to_do)
	update_icon()
*/
/mob/living/simple_animal/promethean_blob/handle_regular_status_updates()
	if(stat != DEAD)

		if(prob(5))
			adjustOxyLoss(-1)
			adjustToxLoss(-1)
			adjustFireLoss(-1)
			adjustCloneLoss(-1)
			adjustBruteLoss(-1)

		if(victim)
			handle_consumption()

		handle_stuttering()

	..()

/mob/living/simple_animal/promethean_blob/proc/give_hat(var/obj/item/clothing/head/new_hat, var/mob/living/user)
	if(!istype(new_hat))
		to_chat(user, "<span class='warning'>\The [new_hat] isn't a hat.</span>")
		return
	if(hat)
		to_chat(user, "<span class='warning'>\The [src] is already wearing \a [hat].</span>")
		return
	else
		user.drop_item(new_hat)
		hat = new_hat
		new_hat.forceMove(src)
		to_chat(user, "<span class='notice'>You place \a [new_hat] on \the [src]. How adorable!</span>")
		update_icon()
		return

/mob/living/simple_animal/promethean_blob/proc/remove_hat(var/mob/living/user)
	if(!hat)
		to_chat(user, "<span class='warning'>\The [src] doesn't have a hat to remove.</span>")
	else
		hat.forceMove(get_turf(src))
		user.put_in_hands(hat)
		to_chat(user, "<span class='warning'>You take away \the [src]'s [hat.name]. How mean.</span>")
		hat = null
		update_icon()

/mob/living/simple_animal/promethean_blob/proc/drop_hat()
	if(!hat)
		return
	hat.forceMove(get_turf(src))
	hat = null
	update_icon()

/mob/living/simple_animal/promethean_blob/proc/wear_hat(var/obj/item/new_hat)
	if(hat)
		return
	hat = new_hat
	new_hat.loc = src
	updateicon()

/mob/living/simple_animal/promethean_blob/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/clothing/head)) // Handle hat simulator.
		give_hat(W, user)
		return

	// Otherwise they're probably fighting the slime.
	if(prob(25))
		visible_message("<span class='danger'>\The [user]'s [W] passes right through [src]!</span>")
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		return
	..()


/mob/living/simple_animal/promethean_blob/attack_hand(mob/living/carbon/human/M as mob)
	if(victim) // Are we eating someone?
		var/fail_odds = 30
		if(victim == M) // Harder to get the slime off if its eating you right now.....
			fail_odds = 60

		if(prob(fail_odds))
			visible_message("<span class='warning'>[M] attempts to wrestle \the [name] off!</span>")
			playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

		else
			visible_message("<span class='warning'> [M] manages to wrestle \the [name] off!</span>")
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)

			stop_consumption()
			step_away(src,M)
	else
		if(M.a_intent == I_HELP)
			if(hat)
				remove_hat(M)
			else
				..()
		else
			..()




/mob/living/carbon/human/proc/promethean_morph()
	set name = "Morph"
	set category = "Abilities"

	if(stat != CONSCIOUS)
		reset_view(0)
		remoteview_target = null
		return

	var/new_species = input("Please select species icon base.") as null|anything in playable_species
	var/datum/species/newicon_s = all_species[new_species]
	if(new_species)
		if(!newicon_s.humaniform)
			to_chat(usr, "<span class='warning'>You can't morph into this species!</span>")
		else
			var/datum/species/slime/my_species = species
			if(my_species.original)
				var/datum/species/slime/special_species = new /datum/species/slime //Can't use global one or all prommies will be affected, no need to rebuild, because same type
				special_species.original = FALSE
				species = special_species

			species.color_mult = newicon_s.color_mult
			species.race_key = newicon_s.race_key
			species.tail = newicon_s.tail
			species.tail_animation = newicon_s.tail_animation
			species.icobase = newicon_s.icobase
			species.deform = newicon_s.icobase //also icobase because slimes don't really bleed or get deformed

	var/new_skin = input(usr, "Please select your character's skin color: ", "Skin Color", skin_color) as color|null
	if(new_skin)
		skin_color = new_skin
		change_skin_color(skin_color)

	var/new_facial = input("Please select facial hair color.", "Character Generation", facial_color) as color
	if(new_facial)
		facial_color = new_facial

	var/new_hair = input("Please select hair color.", "Character Generation", hair_color) as color
	if(new_hair)
		hair_color = new_hair

	var/new_eyes = input("Please select eye color.", "Character Generation", eyes_color) as color
	if(new_eyes)
		eyes_color = new_eyes
		update_eyes()


	// hair
	var/list/all_hairs = typesof(/datum/sprite_accessory/hair) - /datum/sprite_accessory/hair
	var/list/hairs = list()

	// loop through potential hairs
	for(var/x in all_hairs)
		var/datum/sprite_accessory/hair/H = new x // create new hair datum based on type x
		hairs.Add(H.name) // add hair name to hairs
		qdel(H) // delete the hair after it's all done

	var/new_style = input("Please select hair style", "Character Generation", h_style) as null|anything in hairs

	// if new style selected (not cancel)
	if (new_style)
		h_style = new_style

	// facial hair
	var/list/all_fhairs = typesof(/datum/sprite_accessory/facial_hair) - /datum/sprite_accessory/facial_hair
	var/list/fhairs = list()

	for(var/x in all_fhairs)
		var/datum/sprite_accessory/facial_hair/H = new x
		fhairs.Add(H.name)
		qdel(H)

	new_style = input("Please select facial style", "Character Generation", f_style) as null|anything in fhairs

	if(new_style)
		f_style = new_style

	var/new_gender = alert(usr, "Please select gender.", "Character Generation", "Male", "Female", "Neutral")
	if (new_gender)
		if(new_gender == "Male")
			gender = MALE
		if(new_gender == "Neutral")
			gender = PLURAL
		else
			gender = FEMALE
	regenerate_icons()


	visible_message("<span class='notice'>\The [src] morphs and changes [get_visible_gender() == MALE ? "his" : get_visible_gender() == FEMALE ? "her" : "their"] appearance!</span>", "<span class='notice'>You change your appearance!</span>", "<span class='warning'>Oh, god! What the hell was that?  It sounded like something goopy shifting and squelching!</span>")
