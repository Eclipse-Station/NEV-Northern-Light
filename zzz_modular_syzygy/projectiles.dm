// Syzygy exclusive projectiles go here

/obj/item/projectile/bullet/pellet/shotgun/rubber
	name = "rubber pellet"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 0)	// proooobably wanna add a teeny weeny bit of damage here to be consistent
	agony = 15
	pellets = 8
	range_step = 2
	spread_step = 10
	knockback = 1

/obj/item/projectile/bullet/pellet/shotgun/rubber/stinger	//used for the stinger grenade
	agony = 20
	pellets = 4
	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 20
	silenced = 1 //embedding messages are still produced so it's kind of weird when enabled.
	no_attack_log = 1
	muzzle_type = null
