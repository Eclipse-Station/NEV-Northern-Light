/mob/living/proc/hands_are_full()
	return (r_hand && l_hand)

/mob/living/proc/item_is_in_hands(var/obj/item/I)
	return (I == r_hand || I == l_hand)

/mob/proc/put_in_any_hand_if_possible(obj/item/W as obj, del_on_fail = 0, disable_warning = 1, redraw_mob = 1)
	if(equip_to_slot_if_possible(W, slot_l_hand, del_on_fail, disable_warning, redraw_mob))
		return 1
	else if(equip_to_slot_if_possible(W, slot_r_hand, del_on_fail, disable_warning, redraw_mob))
		return 1
	return 0



//// GET GHOST FOR DEFIB REVIVE ////

/mob/proc/get_ghost(even_if_they_cant_reenter = 0)
	if(mind)
		return mind.get_ghost(even_if_they_cant_reenter)

/datum/mind/proc/get_ghost(even_if_they_cant_reenter)
	for(var/mob/observer/ghost/G in GLOB.player_list)
		if(G.mind == src)
			if(G.can_reenter_corpse || even_if_they_cant_reenter)
				return G
			break


//// PROC USER TO ENTER THEIR CORPSE FOR DEFIB REVIVE ////

/proc/window_flash(var/client_or_usr)
	if (!client_or_usr)
		return
	winset(client_or_usr, "mainwindow", "flash=5")

/mob/observer/ghost/proc/notify_revive(var/message, var/sound, flashwindow = TRUE, var/atom/source)
	if(message)
		to_chat(src, "<span class='ghostalert'><font size=4>[message]</font></span>")
	to_chat(src, "<span class='ghostalert'><A href='?src=\ref[src];reenter=1'>(Click to re-enter)</A></span>")
	if(sound)
		SEND_SOUND(src, sound(sound))


/mob/observer/ghost/Topic(href, href_list)
	..()
	if(href_list["reenter"])
		reenter_corpse()
	return