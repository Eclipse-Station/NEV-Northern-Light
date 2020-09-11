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