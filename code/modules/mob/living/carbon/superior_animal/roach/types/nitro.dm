/mob/living/carbon/superior_animal/roach/nitro
	name = "Benzin Roach"
	desc = "A monstrous, dog-sized cockroach. This one smells like welding fuel."
	icon_state = "nitroroach"
	turns_per_move = 4
	maxHealth = 5
	health = 5
	melee_damage_upper = 3
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/roachmeat/nitro
	meat_amount = 3

	rarity_value = 40
	var/exploded = FALSE

/mob/living/carbon/superior_animal/roach/nitro/ex_act()
	if(!exploded)
		visible_message(SPAN_DANGER("\the [src] violently detonates!"))
		death()

/mob/living/carbon/superior_animal/roach/nitro/death()
	. = ..()
	if(src)
		if(!exploded)
			exploded = TRUE
			explosion(src.loc, -1, -1, 2, 3) //explosion weaker than a welding tank

