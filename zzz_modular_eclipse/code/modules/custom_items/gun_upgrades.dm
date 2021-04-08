/obj/item/weapon/gun/energy/modkit
	name = "laser tag gun"
	icon = 'icons/obj/guns/energy/bluetag.dmi'
	icon_state = "bluetag"
	item_state = "bluetag"
	desc = "A mock laser weapon with removeable cosmetic parts that can be attached to a real gun."
	origin_tech = list(TECH_COMBAT = 1, TECH_MAGNET = 2)
	self_recharge = TRUE
	matter = list(MATERIAL_PLASTIC = 6)
	fire_sound = 'sound/weapons/Laser.ogg'
	projectile_type = /obj/item/projectile/beam/lastertag/blue
	bad_type = /obj/item/weapon/gun/energy/modkit
	spawn_tags = SPAWN_TAG_TOY_WEAPON
	spawn_blacklisted = TRUE
	rarity_value = 30
	charge_meter = FALSE
	var/modtype
	var/spawn_new

/obj/item/weapon/gun/energy/modkit/attackby(var/obj/item/O, var/mob/user)
	if(istype(O, modtype))
		to_chat(user, "You set about applying [src]\'s parts onto the [O].")
		if(spawn_new)
			var/turf/T = get_turf(user)
			user.drop_from_inventory(src)
			var/obj/item/weapon/gun/newgun = new spawn_new(T)
			newgun.name = name
			newgun.desc = desc
			user.put_in_hands(newgun)
			qdel(O)
		else
			O.icon = icon
			O.name = name
			O.desc = desc
			O.icon_state = icon_state
			O.item_state = item_state
		qdel(src)

	return ..()