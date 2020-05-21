/obj/machinery/mech_recharger
	name = "mech recharger"
	desc = "A mech recharger, built into the floor."
	icon = 'icons/mechs/mech_bay.dmi'
	icon_state = "recharge_floor"
	density = 0
	layer = TURF_LAYER + 0.1
	anchored = 1
	circuit = /obj/item/weapon/circuitboard/mech_recharger

	var/mob/living/exosuit/charging = null
	var/charge = 45
	var/repair = 0

/obj/machinery/mech_recharger/Crossed(var/mob/living/exosuit/M)
	. = ..()
	if(istype(M) && charging != M)
		start_charging(M)

/obj/machinery/mech_recharger/Uncrossed(var/mob/living/exosuit/M)
	. = ..()
	if(M == charging)
		stop_charging()

/obj/machinery/mech_recharger/RefreshParts()
	..()
	charge = 0
	repair = -5
	for(var/obj/item/weapon/stock_parts/P in component_parts)
		if(istype(P, /obj/item/weapon/stock_parts/capacitor))
			charge += P.rating * 20
		if(istype(P, /obj/item/weapon/stock_parts/scanning_module))
			charge += P.rating * 5
			repair += P.rating
		if(istype(P, /obj/item/weapon/stock_parts/manipulator))
			repair += P.rating * 2

/obj/machinery/mech_recharger/Process()
	..()
	if(!charging)
		return
	if(charging.loc != loc) // Could be qdel or teleport or something
		stop_charging()
		return
	var/done = 1

	var/obj/item/weapon/cell/C = charging.get_cell()
	if(C)
		var/t = min(charge, C.maxcharge - C.charge)
		if(t > 0)
			charging.give_power(t)
			use_power(t * 150)
			done = 0
		else
			charging.occupant_message(SPAN_NOTICE("Fully charged."))
	if(repair && charging.health < initial(charging.health))
		charging.health = min(charging.health + repair, initial(charging.health))
		if(charging.health == initial(charging.health))
			charging.occupant_message(SPAN_NOTICE("Fully repaired."))

		else
			done = 0
	if(done)
		stop_charging()
	return

/obj/machinery/mech_recharger/attackby(var/obj/item/I, var/mob/user)
	. = ..()
	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

/obj/machinery/mech_recharger/proc/start_charging(var/mob/living/exosuit/M)
	if(stat & (NOPOWER | BROKEN))
		M.occupant_message(SPAN_WARNING("Power port not responding. Terminating."))

		return
	if(M.get_cell())
		M.occupant_message(SPAN_NOTICE("Now charging..."))
		charging = M
	return

/obj/machinery/mech_recharger/proc/stop_charging()
	if(!charging)

		return
	charging = null
