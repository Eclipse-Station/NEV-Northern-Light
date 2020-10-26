/obj/item/weapon/storage/case //created for future tweaks
	name = "Case"
	max_w_class = ITEM_SIZE_BULKY
	w_class = ITEM_SIZE_HUGE
	var/opened = FALSE //Checking opened case or not

/obj/item/weapon/storage/case/attack_hand(mob/user as mob)

	if ((loc != user) && opened)
		open(user)

	else
		close_all()
		..()

	update_icon()
	src.add_fingerprint(user)
	return

/obj/item/weapon/storage/case/open(var/mob/user)
	if(!opened)
		return
	..()

/obj/item/weapon/storage/case/attackby(obj/item/weapon/W as obj, mob/user as mob)
	update_icon()
	..()

/obj/item/weapon/storage/case/AltClick()
	if(!istype(loc, /turf/))
		to_chat(usr, "\The [src] has to be on a stable surface first!")
		return

	else
		opened = !opened
		anchored = !anchored
		close_all()
		update_icon()

/obj/item/weapon/storage/case/update_icon()
	..()

	icon_state = initial(icon_state)
	if(!anchored)
		overlays.Cut()
		icon_state += "-closed"

/obj/item/weapon/storage/case/donut
	name = "Special donut delivery case"
	desc = "Contains specially cooked donuts for donut connoisseurs."
	icon_state = "donutcase"
	item_state = "donutcase"
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff)
	max_storage_space = 12

/obj/item/weapon/storage/case/donut/New()
	..()
	new /obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/mec(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/cog(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/bio(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/tgh(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/rob(src)
	new /obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/vig(src)
	update_icon()

/obj/item/weapon/storage/case/donut/update_icon()
	..()
	if(opened)
		overlays.Cut()
		for(var/obj/item/weapon/reagent_containers/food/snacks/donut/stat_buff/D in contents)
			overlays += image('icons/obj/food.dmi', "[D.overlay_state]")
