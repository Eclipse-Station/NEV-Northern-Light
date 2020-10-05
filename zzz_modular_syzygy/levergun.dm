/obj/item/weapon/gun/projectile/shotgun/leveraction
	name = "lever-action shotgun"
	desc = "A vintage Winchester design. Old, yet reliable."
	icon = 'zzz_modular_syzygy/icons/levergun.dmi'
	icon_state = "levergun"
	item_state = "levergun"
	max_shells = 4
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags =  CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = HOLD_CASINGS
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 1000
	recoil_buildup = 20
	one_hand_penalty = 15 //full sized shotgun level

/obj/item/weapon/gun/projectile/shotgun/leveraction/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/weapon/gun/projectile/shotgun/leveraction/attack_self(mob/living/user as mob)
	if(world.time >= recentpumpmsg + 10)
		pump(user)
		recentpumpmsg = world.time

/obj/item/weapon/gun/projectile/shotgun/leveraction/proc/pump(mob/M as mob)
	var/turf/newloc = get_turf(src)
	playsound(M, 'sound/weapons/shotgunpump.ogg', 60, 1)

	if(chambered)//We have a shell in the chamber
		chambered.forceMove(newloc) //Eject casing
		chambered = null

	if(loaded.len)
		var/obj/item/ammo_casing/AC = loaded[1] //load next casing.
		loaded -= AC //Remove casing from loaded list.
		chambered = AC

	update_icon()

/obj/item/weapon/gun/projectile/shotgun/leveraction/attackby(var/obj/item/A as obj, mob/user as mob)
	if(QUALITY_SAWING in A.tool_qualities)
		to_chat(user, SPAN_NOTICE("You begin to shorten the barrel of \the [src]."))
		if(A.use_tool(user, src, WORKTIME_FAST, QUALITY_SAWING, FAILCHANCE_NORMAL, required_stat = STAT_COG))
			qdel(src)
			new /obj/item/weapon/gun/projectile/shotgun/leveraction/sawn(usr.loc)
			to_chat(user, SPAN_WARNING("You shorten the barrel of \the [src]!"))
	else
		..()

/datum/design/autolathe/gun/leveraction
	name = "lever-action shotgun"
	build_path = /obj/item/weapon/gun/projectile/shotgun/leveraction

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/fs_leveraction
	disk_name = "Frozen Star - .50 Lever-Action Shotgun"
	icon_state = "frozenstar"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/leveraction = 3,
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)