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



/mob/living/carbon/superior_animal/roach/nitro/death()
	..()
	explosion(get_turf(src), -1, -1, 2, 3) //explosion weaker than a welding tank, DO NOT TRY TO GIB THE ROACH

