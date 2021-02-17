/mob/living/carbon/superior_animal/roach/nitro
	name = "Benzin Roach"
	desc = "A monstrous, dog-sized cockroach. This one smells like welding fuel."
	icon_state = "nitroroach"
	turns_per_move = 6
	maxHealth = 5
	health = 5
	melee_damage_upper = 3
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/roachmeat/seuche
	meat_amount = 3
	rarity_value = 5

/mob/living/carbon/superior_animal/roach/nitro/Life()
	. = ..()
	if(stat != CONSCIOUS)
		return

	if(stat != AI_inactive)
		return
/mob/living/carbon/superior_animal/roach/nitro/Initialize(mapload)
	. = ..()
	set_light(0.5)


/mob/living/carbon/superior_animal/roach/nitro/findTarget()
	. = ..()

/mob/living/carbon/superior_animal/roach/nitro/death()
	..()
	explosion(get_turf(src), -1, -1, 2, 3) //explosion weaker than a welding tank, DO NOT TRY TO GIB THE ROACH
	qdel(src)
