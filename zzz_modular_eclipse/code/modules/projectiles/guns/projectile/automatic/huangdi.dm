/obj/item/gun/projectile/huangdi
	name = "\improper HM CAR .20 \"Huang Di\""
	desc = "A short rifle used by the Tiandi military as a parade rifle and issued to civil defense forces. Has a built in bayonet."
	icon = 'zzz_modular_eclipse/icons/obj/guns/projectile/huangdi.dmi'
	icon_state = "huangdi"
	item_state = "huangdi"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_ROBUST
	armor_divisor = ARMOR_PEN_DEEP
	caliber = CAL_SRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|SPEEDLOADER
	max_shells = 10
	magazine_type = /obj/item/ammo_magazine/srifle
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 3500
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut") // Considering attached bayonet
	sharp = TRUE
	init_recoil = RIFLE_RECOIL(1.5)
	init_offset = 4 //bayonet's effect on aim, reduced from 4
	damage_multiplier = 1.15
	gun_tags = list(GUN_SILENCABLE)
	spawn_tags = SPAWN_TAG_FS_PROJECTILE
	init_firemodes = list(SEMI_AUTO_300)

	gun_parts = list(/obj/item/part/gun/frame/huangdi = 1, /obj/item/part/gun/modular/grip/wood = 1, /obj/item/part/gun/modular/mechanism/autorifle/determined = 1, /obj/item/part/gun/modular/barrel/srifle/steel = 1)

	simplemob_bonus_damage_multiplier = 0.05 //Eclipse edit: Balancing.

/obj/item/part/gun/frame/huangdi
	name = "huangdi rifle frame"
	desc = "A huangdi rifle frame. A parade and civil defense rifle."
	icon_state = "frame_serbrifle"
	result = /obj/item/gun/projectile/huangdi
	gripvars = /obj/item/part/gun/modular/grip/wood
	resultvars = /obj/item/gun/projectile/huangdi
	mechanismvar = /obj/item/part/gun/modular/mechanism/autorifle/determined
	barrelvars = list(/obj/item/part/gun/modular/barrel/srifle/steel)

/obj/item/gun/projectile/huangdi/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/huangdi/Initialize()
	. = ..()
	update_icon()
