// Syzygy-exclusive grenades go here

/obj/item/weapon/grenade/frag/rubber
	name = "NT LLG \"Stinger\""
	desc = "A crowd control weapon intended to surpress massive riots with ease."
	icon = 'zzz_modular_syzygy/icons/grenades.dmi'
	icon_state = "stinger"
	item_state = "frggrenade"
	loadable = TRUE

	fragment_type = /obj/item/projectile/bullet/pellet/shotgun/rubber/stinger
	num_fragments = 100  //total number of fragments produced by the grenade
	fragment_damage = 0

	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_STEEL = 2)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 1)

/obj/item/weapon/storage/box/frag/rubber
	name = "box of Stinger grenades"
	desc = "A box containing 4 Stinger grenades. Designed for use on unruly crowds"
	icon_state = "box_security"
	illustration = "flashbang"

/obj/item/weapon/storage/box/frag/rubber/populate_contents()
	for(var/i in 1 to 4)
		new /obj/item/weapon/grenade/frag/rubber(src)

/datum/design/research/item/rubberfrag
	name = "stinger grenade"
	build_path = /obj/item/weapon/grenade/frag/rubber
	category = CAT_WEAPON

/datum/technology/basic_nonlethal	//modular override to add stinger grenades to the basic nonlethal node
	unlocks_designs = list(/datum/design/research/item/flash, /datum/design/research/item/rubberfrag)
