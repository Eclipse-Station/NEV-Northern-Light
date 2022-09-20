/obj/item/gun/projectile/automatic/olympus
	name = "\improper FS AR .20 \"Olympus\""
	desc = "The Olympus was Initially set up as an alternative for wealthy planetary defense forces seeking a hard-hitting yet controllable primary weapon for their forces. It proved to be an initial commercial failure due to its egregious price tag, but found a second life within wealthy bodyguard units seeking a compact yet hard-hitting rifle."
	icon = 'zzz_modular_eclipse/icons/obj/guns/projectile/olympus.dmi'
	icon_state = "olympus"
	item_state = "olympus"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	magazine_type = /obj/item/ammo_magazine/srifle
	auto_eject = 1
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 10)
	price_tag = 4000
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	penetration_multiplier = 1.1
	recoil_buildup = 1
	one_hand_penalty = 15 //automatic rifle level
	damage_multiplier = 1.1
	rarity_value = 45

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

	simplemob_bonus_damage_multiplier = 0.1

	spawn_tags = SPAWN_TAG_FS_PROJECTILE

	gun_tags = list(GUN_SILENCABLE)

/obj/item/gun/projectile/automatic/olympus/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/olympus/Initialize()
	. = ..()
	update_icon()
