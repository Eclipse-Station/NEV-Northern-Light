/obj/structure/defibcabinet
	name = "AED Cabinet"
	desc = "A shiny cabinet that holds an Automated External Defibrillator for emergency use"
	icon = 'zzz_modular_syzygy/icons/obj/ErisDefib.dmi'
	icon_state = "defiblocker"
	anchored = TRUE
	density = FALSE

	var/open = FALSE
	var/obj/item/device/defib_kit/defib

/obj/structure/defibcabinet/update_icon()
	icon_state = initial(icon_state)
	if(!open)
		icon_state = "[icon_state]"
	else if (defib)
		icon_state = "[icon_state]-open"
	else
		icon_state = "[icon_state]-empty"

/obj/structure/defibcabinet/New()
	..()
	defib = new /obj/item/device/defib_kit/loaded(src)
	update_icon()


/obj/structure/defibcabinet/attack_hand(var/mob/user)
	toggle_open(user)

/obj/structure/defibcabinet/MouseDrop(over_object, src_location, over_location)
	if(over_object == usr)
		var/mob/user = over_object
		if(!istype(user))
			return

		if(!open)
			to_chat(user, SPAN_WARNING("\The [src] is closed."))
			return

		if(!defib)
			to_chat(user, SPAN_WARNING("\The [src] is empty."))
			return

		defib.forceMove(get_turf(user))
		user.put_in_hands(defib)
		defib = null
		update_icon()

	return

/obj/structure/defibcabinet/Destroy()
	if(defib)
		defib.forceMove(get_turf(src))
		defib = null
	return ..()

/obj/structure/defibcabinet/attackby(var/obj/item/O, var/mob/user)

	if(istype(O, /obj/item/device/defib_kit))
		if(open)
			if(defib)
				to_chat(user, SPAN_WARNING("There is already \a [defib] inside \the [src]."))
			else if(user.unEquip(O))
				O.forceMove(src)
				defib = O
				to_chat(user, SPAN_NOTICE("You place \the [defib] into \the [src]."))
				update_icon()
			return

	if(O.force)
		user.setClickCooldown(10)
		attack_generic(user, O.force, "bashes")
		return

	return ..()

/obj/structure/defibcabinet/proc/toggle_open(var/mob/user)
	user.setClickCooldown(10)
	open = !open
	to_chat(user, "<span class='notice'>You [open ? "open" : "close"] \the [src].</span>")
	update_icon()
