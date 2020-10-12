//haha gunbloat

/obj/item/weapon/gun/projectile/automatic/vector
	name = "VK-00b"
	desc = "The VK-00b is an innovative SMG that features a unique recoil reduction mechanism. \
			Its low stopping power is offset by its blistering firerate and ability to be held on target easily. \
			Takes both highcap pistol and SMG mags. Uses .35 Auto rounds."
	icon = 'zzz_modular_syzygy/icons/vector.dmi'
	icon_state = "vector"
	item_state = "vector"
	w_class = ITEM_SIZE_NORMAL
	can_dual = 1
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	ammo_type = "/obj/item/ammo_casing/pistol"
	load_method = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_SMG
	magazine_type = /obj/item/ammo_magazine/smg
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_DIAMOND = 1, MATERIAL_PLASTIC = 2)
	price_tag = 2000
	damage_multiplier = 0.65	//Lower than even the Molly
	penetration_multiplier = 0.75
	recoil_buildup = 2
	one_hand_penalty = 4
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE)

	init_firemodes = list(
		FULL_AUTO_800,
		SEMI_AUTO_NODELAY,
		)	//haha vector go BRRRRRT

/obj/item/weapon/gun/projectile/automatic/vector/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/vector/Initialize()
	. = ..()
	update_icon()

/datum/design/research/item/weapon/vk00b
	name = "VK-00b"
	build_path = /obj/item/weapon/gun/projectile/automatic/vector

/datum/design/research/item/ammo/rubber35
	name = "35 Auto Rubber SMG Magazine"
	build_path = /obj/item/ammo_magazine/smg/rubber

/datum/technology/adv_lethal	//modular override to add the vector and rubber mags
	unlocks_designs = list(
							/datum/design/research/item/weapon/c20r,
							/datum/design/research/item/ammo/c20r_ammo,
							/datum/design/research/item/weapon/vk00b,
							/datum/design/research/item/ammo/rubber35,
							/datum/design/research/item/weapon/katana
						)
