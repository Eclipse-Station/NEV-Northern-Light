//It's a good day to die

/obj/item/weapon/gun/projectile/automatic/dallas
	name = "PAR .25 CS \"Dallas\""
	desc = "Dallas is a pulse-action air-cooled automatic assault rifle made by unknown manufacturer. This weapon is very rare, but deadly efficient. \
		It's used by elite mercenaries, assassins or bald marines."
	icon = 'icons/obj/guns/projectile/dallas.dmi'
	icon_state = "dallas"
	item_state = "dallas"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = "clrifle"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	auto_eject = 1
	magazine_type = /obj/item/ammo_magazine/c10x24
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 15)
	price_tag = 5000 //99 rounds of pure pain and destruction served in auto-fire, so it basically an upgraded LMG
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/m41_reload.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/m41_cocked.ogg'
	damage_multiplier = 1.7
	recoil_buildup = 6

	firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/dallas/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
	else
		icon_state = initial(icon_state)
	return
