//Eclipse Edit - BO Sidearm
/obj/item/gun/energy/serenity
	name = "NT LP SC \"Serenity\""
	icon = 'zzz_modular_eclipse/icons/obj/guns/energy/serenity.dmi'
	icon_state = "serenity"
	item_state = "serenity"
	item_charge_meter = FALSE
	cell_type = /obj/item/cell/medium
	desc = "This self-charging laser pistol was originally developed as a custom sidearm for a now-deceased Free Trader captain. NanoTrasen reverse-engineered the design, and put the “Serenity” into production as an option for those requiring a heavy hitting laser pistol that weren’t afraid to sacrifice a bit of punch for a lot of style."
	force = WEAPON_FORCE_PAINFUL
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_NORMAL
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/midlaser
	zoom_factors = list(0)
	damage_multiplier = 1.4
	origin_tech = null
	self_recharge = TRUE
	charge_cost = 100
	price_tag = 4300
	init_firemodes = list(
		STUNBOLT,
		LETHAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	spawn_blacklisted = TRUE

/obj/item/gun/energy/serenity/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stun")
		overlays += "tazer_serenity"
	else
		overlays += "laser_serenity"

/obj/item/gun/energy/serenity/update_icon()
	cut_overlays()
	if(cell && cell.charge >= charge_cost) //no overlay if we dont have any power
		update_mode()