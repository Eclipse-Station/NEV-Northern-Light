/obj/item/weapon/gun/projectile/shotgun/pug
	name = "SA SG \"Bojevic\""
	desc = "Semi-auto, half polymer, all serbian. \
			It's magazine-fed shotgun designed for close quarters combat, nicknamed 'Striker' by boarding parties. \
			Robust and reliable design allows you to swap magazines on go and dump as many shells at your foes as you want... \
			if you could manage recoil, of course. Compatible only with special M12 8-round drum magazines."
	icon = 'icons/obj/guns/projectile/pug.dmi'
	icon_state = "pug"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = "shotgun"
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 5000
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound = 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 0.8
	recoil_buildup = 30
	fire_delay = 3 //basically slightly nerfed version of SEMIAUTO_NODELAY to counter autoclickers
				   //while also preserving ability to shoot as fast as you can click and maintain recoil good enough

/obj/item/weapon/gun/projectile/shotgun/pug/update_icon()
	overlays.Cut()
	icon_state = "[initial(icon_state)]"
	if(ammo_magazine)
		overlays += "m12[ammo_magazine.ammo_color]"
	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		overlays += "slide"

/obj/item/weapon/gun/projectile/shotgun/pug/Initialize()
	. = ..()
	update_icon()
