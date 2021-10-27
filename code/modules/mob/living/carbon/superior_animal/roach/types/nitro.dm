/mob/living/carbon/superior_animal/roach/nitro
	name = "Benzin Roach"
	desc = "A monstrous, dog-sized cockroach. This one smells like welding fuel."
	icon = 'zzz_modular_eclipse/icons/mob/mob.dmi'
	icon_state = "nitroroach"
	turns_per_move = 4
	maxHealth = 25		//On par with Jaeger roaches
	health = 25
	melee_damage_upper = 3
	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat/nitro
	meat_amount = 3
	var/leaked = FALSE
	var/impending_explosion = FALSE

	rarity_value = 40
	var/exploded = FALSE

/mob/living/carbon/superior_animal/roach/nitro/ex_act()
	if(!exploded)
		kerplode()

/mob/living/carbon/superior_animal/roach/nitro/bullet_act(obj/item/projectile/slug)
	if(!exploded && slug.ignition_source)
		kerplode()
	else
		. = ..()

/mob/living/carbon/superior_animal/roach/nitro/fire_act()
	if(!exploded && !impending_explosion)
		impending_explosion = TRUE
		spawn(rand(30,150))
			kerplode()
	. = ..()

/mob/living/carbon/superior_animal/roach/nitro/proc/kerplode()
	impending_explosion = TRUE
	if(!exploded)
		exploded = TRUE
		visible_message(SPAN_DANGER("\the [src] violently explodes!"))
		explosion(src.loc, -1, -1, 2, 3) //explosion weaker than a welding tank
		gib()

/mob/living/carbon/superior_animal/roach/nitro/attackby(obj/item/I)
	if(isflamesource(I))
		kerplode()
	else
		. = ..()

/mob/living/carbon/superior_animal/roach/nitro/death()
	. = ..()
	if(src)
		if(!exploded && !leaked)
			new /obj/effect/decal/cleanable/liquid_fuel(src.loc, 50, 1)		//A welderfuel tank below 50 units makes the explosion above (with no flash), so we'll put 50 here to explain the higher flash range.
			leaked = TRUE