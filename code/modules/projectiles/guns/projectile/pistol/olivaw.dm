/obj/item/weapon/gun/projectile/olivaw
	name = "FS MP .35 Auto \"Olivaw\""
	desc = "A popular \"Frozen Star\" machine pistol. This one has a two-round burst-fire mode and is chambered for .35 auto. It can use normal and high capacity magazines."
	icon = 'icons/obj/guns/projectile/olivawcivil.dmi'
	icon_state = "olivawcivil"
	item_state = "pistol"
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	can_dual = 1
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 800
	damage_multiplier = 1.1
	penetration_multiplier = 1.1
	recoil_buildup = 6
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35)
	init_firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=1.2, move_delay=null, 				icon="semi"),
		list(mode_name="2-round bursts", burst=2, fire_delay=0.2, move_delay=4,    	icon="burst"),
		)

/obj/item/weapon/gun/projectile/olivaw/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "olivawcivil"
	else
		icon_state = "olivawcivil_empty"
