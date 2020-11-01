/obj/item/laser_pointer
	name = "laser pointer"
	desc = "Don't shine it in your eyes!"
	icon = 'zzz_modular_syzygy/icons/obj/toys.dmi'
	icon_state = "pointer"
	item_state = "pen"
	var/pointer_icon_state
	item_flags = NOBLUDGEON
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1)
	w_class = ITEM_SIZE_SMALL
	var/turf/pointer_loc
	var/max_energy = 5
	var/effectchance = 33
	var/obj/item/weapon/stock_parts/micro_laser/diode //used for upgrading!
	var/obj/item/weapon/cell/cell
	var/suitable_cell = /obj/item/weapon/cell/small

/obj/item/laser_pointer/Initialize()
	. = ..()
	if(!cell && suitable_cell)
		cell = new suitable_cell(src)

/obj/item/laser_pointer/get_cell()
	return cell

/obj/item/laser_pointer/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/laser_pointer/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null
	else
		return ..()

/obj/item/laser_pointer/red
	pointer_icon_state = "red_laser"
/obj/item/laser_pointer/green
	pointer_icon_state = "green_laser"
/obj/item/laser_pointer/blue
	pointer_icon_state = "blue_laser"
/obj/item/laser_pointer/purple
	pointer_icon_state = "purple_laser"

/obj/item/laser_pointer/blue/handmade
	diode = null

/obj/item/laser_pointer/New()
	..()
	diode = new(src)
	if(!pointer_icon_state)
		pointer_icon_state = pick("red_laser","green_laser","blue_laser","purple_laser")

/obj/item/laser_pointer/upgraded/New()
	..()
	diode = new /obj/item/weapon/stock_parts/micro_laser/ultra

/obj/item/laser_pointer/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/weapon/stock_parts/micro_laser))
		if(!diode && insert_item(W, user))
			diode = W
			to_chat(user, "<span class='notice'>You install a [diode.name] in [src].</span>")
		else
			to_chat(user, "<span class='notice'>[src] already has a diode installed.</span>")

	else if(istype(W, suitable_cell) && !cell && insert_item(W, user))
		src.cell = W

	else if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		if(diode)
			if(W.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_COG))
				to_chat(user, "<span class='notice'>You remove the [diode.name] from \the [src].</span>")
				diode.forceMove(drop_location())
				diode = null
		else
			to_chat(user, "<span class='notice'>[src] lacks a diode!</span>")
		return ..()

/obj/item/laser_pointer/examine(mob/user)
	. = ..()
	if(in_range(user, src) || isobserver(user))
		if(!diode)
			. += "<span class='notice'>The diode is missing.<span>"
		else
			. += "<span class='notice'>A class <b>[diode.rating]</b> laser diode is installed. It is <i>screwed</i> in place.<span>"

/obj/item/laser_pointer/afterattack(atom/target, mob/living/user, flag, params)
	. = ..()
	if(!cell)
		to_chat(user, "<span class='notice'>[src] lacks a cell!</span>")
		return
	if(cell.charge < 10)
		to_chat(user, "<span class='notice'>[src] is out of charge!</span>")
		return
	laser_act(target, user, params)

/obj/item/laser_pointer/proc/laser_act(atom/target, mob/living/user, params)
	if( !(user in (viewers(7,target))) )
		return
	if (!diode)
		to_chat(user, "<span class='notice'>You point [src] at [target], but nothing happens!</span>")
		return
	if (!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	add_fingerprint(user)


	var/outmsg
	var/turf/targloc = get_turf(target)

	//human/alien mobs
	if(iscarbon(target))
		var/mob/living/carbon/C = target

		if(user.targeted_organ == BP_EYES)
			//logging
			C.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been flashed (attempt) with [src.name]  by [user.name] ([user.ckey])</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Used the [src.name] to flash [C.name] ([C.ckey])</font>")
			msg_admin_attack("[user.name] ([user.ckey]) Used the [src.name] to flash [C.name] ([C.ckey]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")
	/*		var/severity = 1 //not used currently. In the near future may have it deal eye damage.
			if(prob(33))
				severity = 2
			else if(prob(50))
				severity = 0
*/
			//chance to actually hit the eyes depends on internal component
			if(prob(effectchance * diode.rating) && C.HUDtech.Find("flash"))
				flick("flash", C.HUDtech["flash"])
				outmsg = "<span class='notice'>You blind [C] by shining [src] in their eyes.</span>"
			else
				outmsg = "<span class='warning'>You fail to blind [C] by shining [src] at their eyes!</span>"

	//robots
	else if(isrobot(target))
		var/mob/living/silicon/S = target
		//logging
		S.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been flashed (attempt) with [src.name]  by [user.name] ([user.ckey])</font>")
		user.attack_log += text("\[[time_stamp()]\] <font color='red'>Used the [src.name] to flash [S.name] ([S.ckey])</font>")
		msg_admin_attack("[user.name] ([user.ckey]) Used the [src.name] to flash [S.name] ([S.ckey]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)")

		//chance to actually hit the eyes depends on internal component
		if(prob(effectchance * diode.rating))
			S.Weaken(rand(5,10))
			if (S.HUDtech.Find("flash"))
				flick("e_flash", S.HUDtech["flash"])
			to_chat(S, "<span class='danger'>Your sensors were overloaded by a laser!</span>")
			outmsg = "<span class='notice'>You overload [S] by shining [src] at their sensors.</span>"
		else
			outmsg = "<span class='warning'>You fail to overload [S] by shining [src] at their sensors!</span>"

	//laser pointer image
	icon_state = "pointer_[pointer_icon_state]"
	var/image/I = image('zzz_modular_syzygy/icons/obj/toys.dmi',targloc,pointer_icon_state,10)
	var/list/click_params = params2list(params)
	if(click_params)
		if(click_params["icon-x"])
			I.pixel_x = (text2num(click_params["icon-x"]) - 16)
		if(click_params["icon-y"])
			I.pixel_y = (text2num(click_params["icon-y"]) - 16)
	else
		I.pixel_x = target.pixel_x + rand(-5,5)
		I.pixel_y = target.pixel_y + rand(-5,5)

	if(outmsg)
		to_chat(user, outmsg)
	else
		to_chat(user, "<span class='info'>You point [src] at [target].</span>")

	cell.charge -= 10
	cell.update_icon()
	if(cell.charge < 10)
		to_chat(user, "<span class='warning'>[src]'s battery is drained.</span>")

	flick_overlay_view(I, targloc, 10)
	icon_state = "pointer"
