/mob/living/simple_animal/hostile/foolbox
	name = "tainted present"
	desc = "A vile gift from an even more vile entitiy!"

	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "present_mimic"
	icon_living = "present_mimic"


	harm_intent_damage = 7
	melee_damage_lower = 10
	melee_damage_upper = 16
	attacktext = "attacked"
	attack_sound = 'sound/weapons/bite.ogg'

	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 0

	faction = "krampus"
	move_to_delay = 4

/mob/living/simple_animal/hostile/foolbox/death()
	..()
	new /obj/item/storage/box/tainted_gift(src.loc)
	qdel(src)


/mob/living/simple_animal/hostile/tree/xmas
	faction = "krampus"
	maxHealth = 120
	health = 120


/mob/living/simple_animal/hostile/foolbox/strong
	health = 75
	maxHealth = 75