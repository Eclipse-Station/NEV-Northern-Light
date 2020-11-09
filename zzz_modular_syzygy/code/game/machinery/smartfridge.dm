/obj/machinery/smartfridge/disks
	name = "disk compartmentalizer"
	desc = "A machine capable of storing a variety of disks. Denoted by most as the DSU (disk storage unit)."
	icon = 'zzz_modular_syzygy/icons/obj/vending.dmi'
	icon_state = "disktoaster"
	icon_on = "disktoaster"
	icon_off = "disktoaster-off"
	icon_panel = "disktoaster-panel"
	pass_flags = PASSTABLE

/obj/machinery/smartfridge/disks/accept_check(var/obj/item/O as obj)
	if(istype(O, /obj/item/weapon/computer_hardware/hard_drive/portable/))
		return 1
	else
		return 0

/obj/machinery/smartfridge/disks/attackby(var/obj/item/O as obj, var/mob/user as mob)
	..()
	if(QUALITY_HAMMERING in O.tool_qualities)
		if(O.use_tool(user, src, WORKTIME_FAST, QUALITY_HAMMERING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You break down the [src]."))
			for(var/obj/S in contents)
				S.forceMove(src.loc)
			src.Destroy()

/datum/craft_recipe/furniture/diskfridge
	name = "disc compartmentalizer"
	result = /obj/machinery/smartfridge/disks
	time = 200
	flags = CRAFT_ON_FLOOR|CRAFT_ONE_PER_TURF
	steps = list(
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(QUALITY_CUTTING, 10, 20),
		list(QUALITY_HAMMERING, 10, 20)
	)