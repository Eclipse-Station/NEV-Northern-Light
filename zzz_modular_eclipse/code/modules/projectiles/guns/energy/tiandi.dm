//Laser weapons produced by the nation of Tiandi

/obj/item/gun/energy/guanyu
	name = "\improper HM LR M \"Guan Yu\""
	icon = 'zzz_modular_eclipse/icons/obj/guns/energy/guanyu.dmi'
	icon_state = "guanyu"
	item_state = "guanyu"
	desc = "A laser rifle reverse engineered from the venerable Cog. Trades power for an increased rate of fire and a much higher cell capacity. Issued standard to all Tiandi conscripts."
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	can_dual = TRUE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 5)
	projectile_type = /obj/item/projectile/beam
	fire_delay = 6
	zoom_factor = 0
	damage_multiplier = 0.53
	penetration_multiplier = 0.9
	charge_cost = 25
	price_tag = 750
	init_firemodes = list(
		BURST_3_ROUND,
		SEMI_AUTO_NODELAY
	)
	twohanded = TRUE
	saw_off = TRUE
	sawn = /obj/item/gun/energy/guanyu/sawn


/obj/item/gun/energy/guanyu/sawn
	name = "sawn down HM LR M \"Guan Yu\""
	icon = 'zzz_modular_eclipse/icons/obj/guns/energy/sawn_guanyu.dmi'
	desc = "A modified laser rifle reverse engineered from the venerable Cog. Trades power for an increased rate of fire and a much higher cell capacity."
	icon_state = "guanyu_short"
	item_state = "guanyu_short"
	slot_flags = SLOT_BACK|SLOT_HOLSTER
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	damage_multiplier = 0.33
	penetration_multiplier = 0.8
	charge_cost = 25
	price_tag = 400
	init_firemodes = list(
		SEMI_AUTO_NODELAY
	)
	twohanded = FALSE
	saw_off = FALSE
	spawn_blacklisted = TRUE

/obj/item/gun/energy/gun/mao
	name = "\improper HM LHG M \"Mao\""
	desc = "The Mao is the standard sidearm of the Tiandi nation, capable of firing in single shot, or burst fire."
	icon = 'zzz_modular_eclipse/icons/obj/guns/energy/mao.dmi'
	icon_state = "mao"
	item_state = "mao"
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/midlaser
	zoom_factor = 0
	damage_multiplier = 1.2
	charge_cost = 100
	price_tag = 4500
	init_firemodes = list(
		WEAPON_NORMAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE

/obj/item/gun/energy/gun/mao/update_icon()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(cell)
		overlays += "on_mao"

	icon_state = iconstring
	set_item_state(itemstring)
