#define EMPTY 0
#define WIRED 1
#define READY 2

/obj/item/grenade/chem_grenade/warcrime
	name = "HM CG \"Yan\""
	desc = "Concentrated acid. Contents under pressure. Use with EXTREME caution."
	can_be_modified = FALSE
	icon = 'zzz_modular_eclipse/icons/obj/grenade/yan.dmi'
	icon_override = 'zzz_modular_eclipse/icons/obj/grenade/yan.dmi'
	icon_state = "yan"
	item_state = "yan"
	stage = READY
	path = 1

/obj/item/grenade/chem_grenade/warcrime/Initialize()
	. = ..()
	var/obj/item/reagent_containers/glass/beaker/large/B1 = new(src)
	var/obj/item/reagent_containers/glass/beaker/large/B2 = new(src)

	B1.reagents.add_reagent("phosphorus", 40)
	B1.reagents.add_reagent("potassium", 40)
	B1.reagents.add_reagent("pacid", 40)
	B2.reagents.add_reagent("sugar", 40)
	B2.reagents.add_reagent("pacid", 80)

	detonator = new/obj/item/device/assembly_holder/timer_igniter(src)

	beakers += B1
	beakers += B2

#undef EMPTY
#undef WIRED
#undef READY
