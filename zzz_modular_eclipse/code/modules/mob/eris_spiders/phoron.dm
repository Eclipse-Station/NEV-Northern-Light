/mob/living/carbon/superior_animal/giant_spider/phoron //Eclipse Edit: Eclipse-level port of Sojourn mob "plasma spider"
	name = "Hakai spider"
	desc = "A massive tarantula. This one is infused with plasma and has mutated spikes protruding from its chitin."
	icon = 'zzz_modular_eclipse/icons/mob/mob.dmi'
	icon_state = "phoron"
	icon_living = "phoron"
	maxHealth = 30
	health = 30
	melee_damage_lower = 5
	melee_damage_upper = 10
	poison_per_bite = 2
	poison_type = "plasma"
	move_to_delay = 4
	meat_type = /obj/item/reagent_containers/food/snacks/meat/spider
	meat_amount = 4
	emote_see = list("chitters.","rubs its legs.","vibrates.")
	armor_penetration = 50
	rarity_value = 90
	var/exploded = FALSE
	var/impending_explosion = FALSE

/mob/living/carbon/superior_animal/giant_spider/phoron/attackby(obj/item/I) //Eclipse Edit: Not a stab? Not a bullet? BOOM! Instead of rush up kerplode
	if(!I.sharp)
		kerplode()
	else
		. = ..()

/mob/living/carbon/superior_animal/giant_spider/phoron/proc/kerplode()
	impending_explosion = TRUE
	if(!exploded)
		exploded = TRUE
		visible_message(SPAN_DANGER("\the [src] violently explodes!"))
		explosion(src.loc, 0, 0, 2, 3)
		gib()

