#define MODE_RECEIVE 0
#define MODE_TRANSMIT 1

/obj/item/weapon/bluespace_harpoon
	name = "NT BSD \"Harpoon\""
	desc = "One of the last things developed by old Nanotrasen, this harpoon serves as a tool for short and accurate teleportation of cargo and personnel through bluespace."
	icon_state = "harpoon-1"
	icon = 'icons/obj/items.dmi'
	w_class = ITEM_SIZE_NORMAL
	throw_speed = 4
	throw_range = 20
	origin_tech = list(TECH_BLUESPACE = 5)
	price_tag = 4000
	matter = list(MATERIAL_SILVER = 10, MATERIAL_GOLD = 5, MATERIAL_PHORON = 20, MATERIAL_PLASTIC = 20)
	spawn_blacklisted = TRUE
	var/mode = MODE_TRANSMIT
	var/transforming = FALSE	// mode changing takes some time
	var/offset_chance = 5		//chance to teleport things in wrong place
	var/teleport_offset = 8		//radius of wrong place
	var/obj/item/weapon/cell/cell
	var/suitable_cell = /obj/item/weapon/cell/medium
	var/Using = FALSE				//If its being used

/obj/item/weapon/bluespace_harpoon/Initialize()
	. = ..()
	if(!cell && suitable_cell)
		cell = new suitable_cell(src)

/obj/item/weapon/bluespace_harpoon/get_cell()
	return cell

/obj/item/weapon/bluespace_harpoon/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/weapon/bluespace_harpoon/afterattack(atom/A, mob/user as mob)
	if(istype(A, /obj/item/weapon/storage/))
		return ..()
	else if(istype(A, /obj/structure/table/) && (get_dist(A, user) <= 1))
		return ..()
	if(!Using)
		Using = TRUE
		if(do_after(user, 4 SECONDS - user.stats.getMult(STAT_COG, STAT_LEVEL_GODLIKE/20, src)))
			Using = FALSE
			if(!cell || !cell.checked_use(100))
				to_chat(user, SPAN_WARNING("\The [src]'s battery is dead or missing."))
				return
			if(!user || !A || user.machine)
				return
			if(transforming)
				to_chat(user, SPAN_WARNING("You can't fire \the [src] while transforming!"))
				return

			playsound(user, 'sound/weapons/wave.ogg', 60, 1)

			user.visible_message(SPAN_WARNING("\The [user] fires \the [src]!"))
			to_chat(user,SPAN_WARNING("You fire from [src]"))
			var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
			s.set_up(4, 1, A)
			s.start()

			var/turf/AtomTurf = get_turf(A)
			var/turf/UserTurf = get_turf(user)

			if(mode)
				teleport(UserTurf, AtomTurf)
			else
				teleport(AtomTurf, UserTurf)
		else
			to_chat(user, SPAN_WARNING("Error, do not move!"))
			Using = FALSE
	else
		to_chat(user, SPAN_WARNING("Error, single destination only!"))


/obj/item/weapon/bluespace_harpoon/proc/teleport(var/turf/source, var/turf/target)
	for(var/atom/movable/AM in source)
		if(istype(AM, /mob/shadow))
			continue
		if(!AM.anchored)
			if(prob(offset_chance))
				AM.forceMove(get_turf(pick(orange(teleport_offset,source))))
			else
				AM.forceMove(target)

/obj/item/weapon/bluespace_harpoon/attack_self(mob/living/user as mob)
	return change_fire_mode(user)

/obj/item/weapon/bluespace_harpoon/verb/change_fire_mode(mob/user as mob)
	set name = "Change fire mode"
	set category = "Object"
	set src in oview(1)
	if(transforming)
		return
	mode = !mode
	transforming = TRUE
	to_chat(user, SPAN_NOTICE("You change [src] mode to [mode ? "transmiting" : "receiving"]."))
	update_icon()
	flick("harpoon-[mode]-change", src)
	spawn(13)	//Average length of transforming animation
		transforming = FALSE

/obj/item/weapon/bluespace_harpoon/update_icon()
	icon_state = "harpoon-[mode]"

/obj/item/weapon/bluespace_harpoon/examine(var/mob/user, var/dist = -1)
	..(user, dist)
	to_chat(user, SPAN_NOTICE("Mode set to [mode ? "transmiting" : "receiving"]."))

/obj/item/weapon/bluespace_harpoon/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null

/obj/item/weapon/bluespace_harpoon/attackby(obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		src.cell = C

/obj/item/weapon/bluespace_harpoon/mounted
	spawn_blacklisted = TRUE
	var/charge_cost = 100
	var/charge_tick = 0
	var/recharge_time = 4

/obj/item/weapon/bluespace_harpoon/mounted/Initialize()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/weapon/bluespace_harpoon/mounted/Process()
	charge_tick++
	if(charge_tick < recharge_time)
		return

	charge_tick = 0

	if(!cell || cell.charge >= cell.maxcharge)
		return

	var/obj/item/weapon/cell/large/external = get_external_cell()
	if(!external || !external.use(charge_cost))
		return

	cell.give(charge_cost)
	update_icon()

/obj/item/weapon/bluespace_harpoon/mounted/proc/get_external_cell()
	return loc.get_cell()

/obj/item/weapon/bluespace_harpoon/mounted/update_icon()
	icon_state = "harpoon-mounted-[mode]"

/obj/item/weapon/bluespace_harpoon/mounted/blitz
	name = "OR BSD \"Blauerraumharpune\""
	desc = "Reverse engineered version of harpoon developed by old Nanotrasen, remounted for robotic use only by Oberth Republic."
	icon_state = "harpoon-mounted-blitz-1"

/obj/item/weapon/bluespace_harpoon/mounted/blitz/update_icon()
	icon_state = "harpoon-mounted-blitz-[mode]"
