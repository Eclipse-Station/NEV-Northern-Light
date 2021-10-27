/obj/item/storage/box/gunkits		//base define
	name = "gun kit"
	desc = "A small kit containing a handgun and two magazines. Extra ammunition not included."
	can_hold = list(/obj/item/gun/projectile, /obj/item/ammo_magazine/pistol)

/obj/item/storage/box/gunkits/mk58
	name = "mk58 gun kit"

/obj/item/storage/box/gunkits/mk58/populate_contents()
	if(prob(5))			//chance to get good shit.
		new /obj/item/gun/projectile/mk58/wood(src)
	else
		new /obj/item/gun/projectile/mk58(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)


/obj/item/storage/box/gunkits/mk58_wood
	name = "mk58 (wooden grip) gun kit"

/obj/item/storage/box/gunkits/mk58_wood/populate_contents()
	new /obj/item/gun/projectile/mk58/wood(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)


/obj/item/storage/box/gunkits/colt
	name = "colt gun kit"

/obj/item/storage/box/gunkits/colt/populate_contents()
	new /obj/item/gun/projectile/colt(src)
	new /obj/item/ammo_magazine/pistol(src)
	new /obj/item/ammo_magazine/pistol(src)