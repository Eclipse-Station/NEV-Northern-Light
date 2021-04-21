//Not a child object of a normal cruciform due to several design decisions

/obj/item/weapon/implant/core_implant/lesser_cruciform
	name = "Cruciform Luminare"
	desc = "This implant signifies one's Faith in the Mekhane, but not necessarily devotion."
	icon = 'zzz_modular_eclipse/icons/obj/discount_cruciform.dmi'
	icon_state = "lesser_on"
	implant_type = /obj/item/weapon/implant/core_implant/lesser_cruciform
	type_override = /obj/item/weapon/implant/core_implant/cruciform
	layer = ABOVE_MOB_LAYER
	power = 15
	max_power = 15
	power_regen = 0.1
	price_tag = 100

/obj/item/weapon/implant/core_implant/lesser_cruciform/get_mob_overlay(gender)
	gender = (gender == MALE) ? "m" : "f"
	return image('zzz_modular_eclipse/icons/obj/discount_cruciform.dmi', "lesser_body_on")

