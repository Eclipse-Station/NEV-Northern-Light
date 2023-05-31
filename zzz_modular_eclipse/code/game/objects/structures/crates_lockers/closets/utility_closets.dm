//A basic closet with some simple cleaning supplies to help keep the ship clean if there are no custodians
/obj/structure/closet/mopcloset
	name = "\improper janitorial closet"
	desc = "A storage unit for basic cleaning supplies."
	icon = 'zzz_modular_eclipse/icons/obj/closet.dmi'
	icon_state = "mop"
	rarity_value = 10
	spawn_tags = SPAWN_TAG_CLOSET


/obj/structure/closet/bombcloset/populate_contents()
	new /obj/structure/mopbucket(src)
	new /obj/item/reagent_containers/glass/bucket(src)
	new /obj/item/mop(src)
	new /obj/item/soap/nanotrasen(src)
	new /obj/item/caution(src)
	new /obj/item/device/lightreplacer(src)
	new /obj/item/storage/bag/trash(src)
