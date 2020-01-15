/obj/structure/closet/syndicate
	name = "armory closet"
	desc = "Why is this here?"
	icon_state = "syndicate"


/obj/structure/closet/syndicate/personal
	desc = "It's a storage unit for operative gear."

/obj/structure/closet/syndicate/personal/populate_contents()
	new /obj/item/weapon/tank/jetpack/oxygen(src)
	new /obj/item/clothing/mask/gas/syndicate(src)
	new /obj/item/clothing/under/syndicate(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/weapon/tool/crowbar(src)
	new /obj/item/weapon/cell/large/high(src)
	new /obj/item/weapon/card/id/syndicate(src)
	new /obj/item/weapon/tool/multitool(src)
	new /obj/item/weapon/shield/energy(src)
	new /obj/item/clothing/shoes/magboots(src)
	new /obj/item/weapon/storage/pouch/pistol_holster(src) // Perhaps this may encourage actually buying pistols.
	new /obj/item/weapon/storage/pouch/ammo(src)


/obj/structure/closet/syndicate/suit
	desc = "It's a storage unit for voidsuits."

/obj/structure/closet/syndicate/suit/populate_contents()
	new /obj/item/weapon/tank/jetpack/oxygen(src)
	new /obj/item/clothing/shoes/magboots(src)
	new /obj/item/clothing/suit/space/void/merc(src)
	new /obj/item/clothing/mask/gas/syndicate(src)


/obj/structure/closet/syndicate/nuclear
	desc = "It's a storage unit for nuclear-operative gear."

/obj/structure/closet/syndicate/nuclear/populate_contents()
	new /obj/item/ammo_magazine/smg(src)
	new /obj/item/ammo_magazine/smg(src)
	new /obj/item/ammo_magazine/smg(src)
	new /obj/item/ammo_magazine/smg(src)
	new /obj/item/ammo_magazine/smg(src)
	new /obj/item/weapon/storage/box/handcuffs(src)
	new /obj/item/weapon/storage/box/flashbangs(src)
	new /obj/item/weapon/gun/energy/gun(src)
	new /obj/item/weapon/gun/energy/gun(src)
	new /obj/item/weapon/gun/energy/gun(src)
	new /obj/item/weapon/gun/energy/gun(src)
	new /obj/item/weapon/gun/energy/gun(src)
	new /obj/item/weapon/pinpointer/nukeop(src)
	new /obj/item/weapon/pinpointer/nukeop(src)
	new /obj/item/weapon/pinpointer/nukeop(src)
	new /obj/item/weapon/pinpointer/nukeop(src)
	new /obj/item/weapon/pinpointer/nukeop(src)
	var/obj/item/device/radio/uplink/U = new(src)
	U.hidden_uplink.uses = 40
	return
