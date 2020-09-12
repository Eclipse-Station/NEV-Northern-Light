//////////////////////////////////////////////
//											//
//	Balance changes for Syzygy goes here	//
//											//
//////////////////////////////////////////////

/mob/living/simple_animal/hostile/scarybat	//modular override to nerf bats a bit
	melee_damage_lower = 5
	melee_damage_upper = 8

/mob/living/simple_animal/bullet_act(var/obj/item/projectile/Proj)
	..()	//makes the regular bullet_act apply
	adjustBruteLoss(Proj.agony)	//applies pain damage as brute damage to simplemobs

// Makes it so that you can carry much more biomatter in a single stack so you don't need to send 5 lockers full of stacks to medical

/obj/item/stack/material/biomatter
	max_amount = 300

/obj/item/stack/material/biomatter/random
	rand_min = 25
	rand_max = 100

/obj/item/stack/material/biomatter/full
	amount = 300

///////////////////////////////// ANTAG SPECIFIC NERFS	//////////////////////////////////////////////////////////////////////////////

// Hivemind Core nerf

/datum/hivemind_sdp/shockwave
	cooldown = 15 SECONDS	//3 times longer to actually let you escape

// The following are the TRULY hugbox nerfs that were designed based on community feedback. Not to be uncommented without extensive discussion, testing and preferably voting.

/*
/datum/hivemind_sdp/shockwave/execute()		//fairly wonky override with no callback
	master.visible_message("[master] emmits an energy wave!")
	playsound(master, 'sound/effects/EMPulse.ogg', 90, 1)
	var/list/targets = mobs_in_view(attack_range, master)
	for(var/mob/living/victim in targets)
		if(victim.stat == CONSCIOUS && victim.faction != HIVE_FACTION)
			victim.Weaken(5)
			step_away(victim, master)

	set_cooldown()

// Hivemind Turret nerf

/obj/item/projectile/goo
	damage_types = list(BURN = 5)	// the real risk is gonna come from the toxin damage rather than the burn

// Hivemind Wire nerf

/obj/effect/plant/hivemind
	health = 		40
	max_health = 	40	//half health so you can just unga chop it if your ROB isn't high enough to insta delete it

/obj/structure/burrow/spread_plants()
	return	// haha fuck your spreading kudzu and wires

// Hivemind stun nerf

/obj/machinery/hivemind_machine/screamer/use_ability(mob/living/target)

	var/mob/living/carbon/human/H = target
	if(istype(H))
		if(prob(100 - H.stats.getStat(STAT_VIG)))
			H.Weaken(2)
			to_chat(H, SPAN_WARNING("A terrible howl tears through your mind, the voice senseless, soulless."))
		else
			to_chat(H, SPAN_NOTICE("A terrible howl tears through your mind, but you refuse to listen to it!"))
	else
		target.Weaken(2)
		to_chat(target, SPAN_WARNING("A terrible howl tears through your mind, the voice senseless, soulless."))
*/
