/mob/living/carbon/superior_animal/giant_spider/spiceder //Eclipse Edit: Eclipse-level port of Sojourn mob "pepper spider"
	name = "Tsurai Spider"
	desc = "A massive tarantula. This peculiar arachnid reeks of spicy peppers."
	icon = 'zzz_modular_eclipse/icons/mob/mob.dmi'
	icon_state = "pepper"
	icon_living = "pepper"
	meat_type = /obj/item/reagent_containers/food/snacks/meat/spider/spiceder
	emote_see = list("chitters.","rubs its legs.","vibrates.","belches flames!")
	var/datum/reagents/gas_sac //Stores gas. Can't use the default reagents since that is now bloodstream
	/// How much we can hold in our gas sac.
	var/spray_max = 50
	/// What percentage chance per tick do we have to spray pepper spray at a valid target?
	var/spray_chance = 25 //arbitrary
	/// How much of the reagent is required to fire, how much is fired.
	var/amount_per_transfer_from_this = 10
	/// Minimum delay for spraying pepper in ticks
	var/spray_delay_minimum = 5
	/// Maximum delay for spraying pepper in ticks
	var/spray_delay_maximum = 10
	/// The message to be displayed when we spray
	var/spray_message = "suddenly sprays out a red-colored liquid at"
	/// Tracker var for our cooldown, will be set to cooldown_increment + world.time apon successful spray
	var/cooldown = 0
	/// How much cooldown will be incremented
	var/cooldown_increment = 10
	/// The amount of ticks between each movement of the spray
	var/spray_movement_delay = 5
	/// The amount of ticks the spray will exist for
	var/spray_lifespan = 10
	poison_per_bite = 2
	poison_type = "condensedcapsaicin"
	rarity_value = 70
/mob/living/carbon/superior_animal/giant_spider/spiceder/New()
	.=..()
	gas_sac = new /datum/reagents(spray_max, src)
	gas_sac.add_reagent("condensedcapsaicin", (spray_max*0.5))

/mob/living/carbon/superior_animal/giant_spider/spiceder/Destroy()
	gas_sac.my_atom = null
	QDEL_NULL(gas_sac)

	. = ..()

/mob/living/carbon/superior_animal/giant_spider/spiceder/Life()
	. = ..()

	gas_sac.add_reagent("condensedcapsaicin", 1)

/mob/living/carbon/superior_animal/giant_spider/spiceder/UnarmedAttack(atom/A, proximity)
	. = ..()

	var/spray_range = 2

	if (cooldown <= world.time)
		if (isliving(A))
			var/mob/living/target = A
			var/distance = (get_dist(src, target))
			if (distance <= spray_range)
				if (prob(spray_chance))
					if (gas_sac.has_reagent("condensedcapsaicin", amount_per_transfer_from_this))
						if (!((target.weakened) || (target.stunned))) //anti-stunlock
							var/delay = rand(spray_delay_minimum, spray_delay_maximum)
							addtimer(CALLBACK(src, .proc/sprayPepper, A), delay)
							cooldown = (world.time + cooldown_increment)




/mob/living/carbon/superior_animal/giant_spider/spiceder/proc/sprayPepper(var/atom/targetted_mob)
	visible_message(SPAN_WARNING("[src] [spray_message] [targetted_mob]!"))
	playsound(loc, 'sound/effects/spray2.ogg', 50, 1)
	var/obj/effect/effect/water/chempuff/D = new/obj/effect/effect/water/chempuff(get_turf(src))
	var/turf/my_target = get_turf(targetted_mob)
	D.create_reagents(amount_per_transfer_from_this)
	if(!gas_sac)
		return
	gas_sac.trans_to_obj(D, amount_per_transfer_from_this)
	D.set_color()
	var/distance = (get_dist(src, targetted_mob))
	D.set_up(my_target, (distance + 1), spray_movement_delay, spray_lifespan) //+1 because i found it was a little buggy



