/obj/item/gun/projectile/revolver/handmade
	name = "hand-tooled REV .40 Magnum \"Cartel\"" //Eclipse Edit - standardized gun names
	desc = "A handmade revolver built with junk, duct tape and dubious engineering skills. Will it even work?"
	icon = 'icons/obj/guns/projectile/handmade_revolver.dmi'
	icon_state = "handmade_revolver"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	max_shells = 6
	matter = list(MATERIAL_STEEL = 10, MATERIAL_WOOD = 5)
	price_tag = 250 //one of the cheapest revolvers here
	damage_multiplier = 1.25
	penetration_multiplier = 0.1
	init_recoil = HANDGUN_RECOIL(1.2)
	gun_parts = list(/obj/item/part/gun = 1 ,/obj/item/stack/material/steel = 15)
	spawn_blacklisted = FALSE
	spawn_tags = SPAWN_TAG_GUN_HANDMADE
	serial_type = ""
	gun_parts = list(/obj/item/part/gun/frame/revolver_handmade = 1, /obj/item/part/gun/modular/grip/wood = 1, /obj/item/part/gun/modular/mechanism/revolver/steel = 1, /obj/item/part/gun/modular/barrel/magnum/steel = 1)

/obj/item/gun/projectile/revolver/handmade/attackby(obj/item/W, mob/user)
	if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		if(loaded.len == 0 && W.use_tool(user, src, WORKTIME_NORMAL, QUALITY_SCREW_DRIVING, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You begin to rechamber \the [src]."))
			if(caliber == CAL_MAGNUM)
				caliber = CAL_PISTOL
				fire_sound = 'sound/weapons/guns/fire/cal/35revolver.ogg'
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .35 Caliber."))
			else if(caliber == CAL_PISTOL)
				caliber = CAL_CLRIFLE
				fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .25 Caseless."))
			else if(caliber == CAL_CLRIFLE)
				caliber = CAL_MAGNUM
				fire_sound = 'sound/weapons/guns/fire/revolver_fire.ogg'
				to_chat(user, SPAN_WARNING("You successfully rechamber \the [src] to .40 Magnum."))
		else
			to_chat(user, SPAN_WARNING("You cannot rechamber a loaded firearm!"))
			return
	..()
/obj/item/part/gun/frame/revolver_handmade
	name = "handmade revolver frame"
	desc = "A handmade revolver. The second most ancient gun design, made with scrap and spit."
	icon_state = "frame_revolver_hm"
	matter = list(MATERIAL_STEEL = 5)
	resultvars = list(/obj/item/gun/projectile/revolver/handmade)
	gripvars = list(/obj/item/part/gun/modular/grip/wood)
	mechanismvar = /obj/item/part/gun/modular/mechanism/revolver/steel
	barrelvars = list(/obj/item/part/gun/modular/barrel/magnum/steel, /obj/item/part/gun/modular/barrel/pistol/steel)
