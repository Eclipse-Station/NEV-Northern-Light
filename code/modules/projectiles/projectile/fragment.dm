/obj/item/projectile/bullet/pellet/fragment
	damage_types = list(BRUTE = 10)
	range_step = 2

	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 20

	silenced = TRUE //embedding messages are still produced so it's kind of weird when enabled.
	no_attack_log = 1
	muzzle_type = null
	ignition_source = FALSE		//Eclipse add. If it's that busted, it's probably far from the source of the muzzle and expended most of its energy.

/obj/item/projectile/bullet/pellet/fragment/strong
	damage_types = list(BRUTE = 15)

/obj/item/projectile/bullet/pellet/fragment/weak
	damage_types = list(BRUTE = 5)

/obj/item/projectile/bullet/pellet/fragment/invisible
	name = "explosion"
	icon_state = "invisible"
	embed = 0
	damage_types = list(BRUTE = 20)
	check_armour = ARMOR_BOMB
