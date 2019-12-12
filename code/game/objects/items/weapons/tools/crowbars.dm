/obj/item/weapon/tool/crowbar
	name = "crowbar"
	desc = "Used to remove floors and to pry open doors."
	icon_state = "crowbar"
	item_state = "crowbar"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	worksound = WORKSOUND_EASY_CROWBAR
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 4)
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked")
	tool_qualities = list(QUALITY_PRYING = 25, QUALITY_DIGGING = 10)

/obj/item/weapon/tool/crowbar/improvised
	name = "rebar"
	desc = "A pair of metal rods laboriously twisted into a useful shape"
	icon_state = "impro_crowbar"
	item_state = "crowbar"
	tool_qualities = list(QUALITY_PRYING = 10, QUALITY_DIGGING = 10)
	degradation = 5 //This one breaks REALLY fast

/obj/item/weapon/tool/crowbar/onestar
	name = "One Star crowbar"
	desc = "Looks like a classic one, but more durable."
	icon_state = "one_star_crowbar"
	item_state = "crowbar"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLATINUM = 1)
	tool_qualities = list(QUALITY_PRYING = 25, QUALITY_DIGGING = 10)
	origin_tech = list(TECH_ENGINEERING = 1, TECH_MATERIAL = 2)
	degradation = 0.6
	workspeed = 1.2
	max_upgrades = 2

/obj/item/weapon/tool/crowbar/pneumatic
	name = "pneumatic crowbar"
	desc = "When you really need to crack open something."
	icon_state = "pneumo_crowbar"
	item_state = "jackhammer"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 2)
	tool_qualities = list(QUALITY_PRYING = 40, QUALITY_DIGGING = 35)
	degradation = 0.7
	use_power_cost = 0.8
	max_upgrades = 4
	suitable_cell = /obj/item/weapon/cell/medium
