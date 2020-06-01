//BIG CELLS - for APC, borgs and machinery.

/obj/item/weapon/cell/large
	name = "\"Robustcell 1000L\""
	desc = "A Rechargeable L-standardized power cell. This one is the cheapest you can find."
	icon_state = "b_st"
	maxcharge = 1000
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3)
	price_tag = 200

/obj/item/weapon/cell/large/high
	name = "\"Robustcell 5000L\""
	desc = "A Rechargeable L-standardized power cell. The Popular and reliable version."
	icon_state = "b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 5000

/obj/item/weapon/cell/large/super
	name = "\"Robustcell 15000L\""
	desc = "A Rechargeable L-standardized power cell. This advanced version can store even more energy."
	icon_state = "b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 15000

/obj/item/weapon/cell/large/hyper
	name = "\"Robustcell-X 20000L\""
	desc = "A Rechargeable L-standardized power cell. Looks like this is a rare and powerful prototype."
	icon_state = "b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 20000

/obj/item/weapon/cell/large/moebius
	name = "\"Power-Geyser 2000L\""
	desc = "An Experimental rechargeable L-standardized power cell. This one is cheap, yet better than the normal model for same price."
	icon_state = "meb_b_st"
	maxcharge = 2000

/obj/item/weapon/cell/large/moebius/high
	name = "\"Power-Geyser 7000L\""
	desc = "An experimental rechargeable L-standardized power cell. Popular and reliable version."
	icon_state = "meb_b_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 7000

/obj/item/weapon/cell/large/moebius/super
	name = "\"Power-Geyser 13000L\""
	desc = "An experimental L-standardized power cell. This advanced version can store even more energy."
	icon_state = "meb_b_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 13000

/obj/item/weapon/cell/large/moebius/hyper
	name = "\"Power-Geyser 18000L\""
	desc = "An Experimental rechargeable L-standardized power cell. Looks like this is rare and powerful prototype."
	icon_state = "meb_b_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 18000

/obj/item/weapon/cell/large/moebius/nuclear
	name = "\"Atomcell 13000L\""
	desc = "An Experimental rechargeable L-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_b_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 6)
	maxcharge = 13000

/obj/item/weapon/cell/large/excelsior
	name = "\"Zarya 8000L\""
	desc = "An Rechargeable L-standardized power cell. Power to the people!"
	icon_state = "exs_l"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 3)
	maxcharge = 11000

//Meme cells - for fun and cancer

/obj/item/weapon/cell/large/potato
	name = "potato battery"
	desc = "A rechargable starch based power cell."
	origin_tech = list(TECH_POWER = 1)
	icon = 'icons/obj/power.dmi'
	icon_state = "potato_cell"
	charge = 100
	maxcharge = 300
	minor_fault = 1

/obj/item/weapon/cell/large/slime
	name = "charged slime core"
	desc = "A yellow slime core infused with phoron, it crackles with power."
	origin_tech = list(TECH_POWER = 2, TECH_BIO = 4)
	icon = 'icons/mob/slimes.dmi'
	icon_state = "yellow slime extract"
	maxcharge = 10000
	matter = null

//MEDIUM CELLS - for energy weapons and large devices

/obj/item/weapon/cell/medium
	name = "\"Robustcell 600M\""
	desc = "A rechargeable M-standardized power cell. This one is the cheapest you can find."
	icon_state = "m_st"
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 600
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2)
	price_tag = 100

/obj/item/weapon/cell/medium/high
	name = "\"Robustcell 800M\""
	desc = "A rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 800

/obj/item/weapon/cell/medium/super
	name = "\"Robustcell 1000M\""
	desc = "A rechargeable M-standardized power cell. This advanced version can store even more energy."
	icon_state = "m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000

/obj/item/weapon/cell/medium/hyper
	name = "\"Robustcell-X 1500M\""
	desc = "A rechargeable M-standardized power cell. Looks like this is a rare and powerful prototype."
	icon_state = "m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1500

/obj/item/weapon/cell/medium/moebius
	name = "\"Power-Geyser 700M\""
	desc = "An Experimental rechargeable M-standardized power cell. This one is cheap, yet better than the normal model for the same price."
	icon_state = "meb_m_st"
	maxcharge = 700

/obj/item/weapon/cell/medium/moebius/high
	name = "\"Power-Geyser 900M\""
	desc = "An Experimental rechargeable M-standardized power cell. Popular and reliable version."
	icon_state = "meb_m_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 900

/obj/item/weapon/cell/medium/moebius/super
	name = "\"Power-Geyser 1000M\""
	desc = "An experimental rechargeable M-standardized power cell. This advanced version can store even more energy."
	icon_state = "meb_m_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 1000

/obj/item/weapon/cell/medium/moebius/hyper
	name = "\"Power-Geyser 1300M\""
	desc = "An experimental rechargeable M-standardized power cell. Looks like this is rare and powerful prototype."
	icon_state = "meb_m_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1300

/obj/item/weapon/cell/medium/moebius/nuclear
	name = "\"Atomcell 1000M\""
	desc = "An experimental rechargeable M-standardized power cell. This version able to recharge itself over time."
	icon_state = "meb_m_nu"
	autorecharging = TRUE
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 4)
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 1000

/obj/item/weapon/cell/medium/excelsior
	name = "\"Zarya 800M\""
	desc = "A rechargeable M-standardized power cell. Power to the people!"
	icon_state = "exs_m"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 2)
	maxcharge = 1000

//SMALL CELLS - for small devices, such as flashlights, analyzers and HUDs.

/obj/item/weapon/cell/small
	name = "\"Robustcell 100S\""
	desc = "A rechargeable S-standardized power cell. This one is the cheapest you can find."
	icon_state = "s_st"
	w_class = ITEM_SIZE_TINY
	force = WEAPON_FORCE_HARMLESS
	throw_speed = 5
	throw_range = 7
	maxcharge = 100
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	price_tag = 50

/obj/item/weapon/cell/small/high
	name = "\"Robustcell 200S\""
	desc = "A rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 200

/obj/item/weapon/cell/small/super
	name = "\"Robustcell 300S\""
	desc = "A rechargeable S-standardized power cell. This advanced version can store even more energy."
	icon_state = "s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300

/obj/item/weapon/cell/small/hyper
	name = "\"Robustcell-X 500S\""
	desc = "A rechargeable S-standardized power cell. Looks like this is a rare and powerful prototype."
	icon_state = "s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 500

/obj/item/weapon/cell/small/moebius
	name = "NanoTrasen \"Power-Geyser 120S\""
	desc = "NanoTrasen Laboratories branded rechargeable S-standardized power cell. This one is cheap, yet better than Aster model for same price."
	icon_state = "meb_s_st"
	maxcharge = 120

/obj/item/weapon/cell/small/moebius/high
	name = "\"Power-Geyser 250S\""
	desc = "An experimental rechargeable S-standardized power cell. Popular and reliable version."
	icon_state = "meb_s_hi"
	origin_tech = list(TECH_POWER = 2)
	maxcharge = 250

/obj/item/weapon/cell/small/moebius/super
	name = "\"Power-Geyser 300S\""
	desc = "An experimental rechargeable S-standardized power cell. This advanced version can store even more energy."
	icon_state = "meb_s_sup"
	origin_tech = list(TECH_POWER = 5)
	maxcharge = 300

/obj/item/weapon/cell/small/moebius/hyper
	name = "\"Power-Geyser 400S\""
	desc = "An experimental rechargeable S-standardized power cell. Looks like this is rare and powerful prototype."
	icon_state = "meb_s_hy"
	origin_tech = list(TECH_POWER = 6)
	maxcharge = 400

/obj/item/weapon/cell/small/moebius/nuclear
	name = "\"Atomcell 300S\""
	desc = "An experimental rechargeable S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_s_nu"
	autorecharging = TRUE
	origin_tech = list(TECH_POWER = 6)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1, MATERIAL_URANIUM = 2)
	maxcharge = 300

/obj/item/weapon/cell/small/moebius/pda
	name = "\"Atomcell 50S\""
	desc = "An experimental branded S-standardized microreactor cell. Recharges itself over time."
	icon_state = "meb_pda"
	origin_tech = list(TECH_POWER = 4)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_URANIUM = 1)
	maxcharge = 50
	// Autorecharge rate is calculated for PDA power consumption: enough to offset it, unless PDA light is on.
	autorecharging = TRUE
	autorecharge_rate = 0.0007
	recharge_time = 1

/obj/item/weapon/cell/small/excelsior
	name = "\"Zarya 250S\""
	desc = "A rechargeable S-standardized power cell. Power to the people!"
	icon_state = "exs_s"
	origin_tech = list(TECH_POWER = 3)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1)
	maxcharge = 300
