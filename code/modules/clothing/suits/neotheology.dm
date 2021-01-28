/obj/item/clothing/head/armor/acolyte
	name = "Acolyte hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	item_state = "acolyte"
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/armor/acolyte
	name = "Acolyte armor"
	desc = "Worn heavy, steadfast in the name of God."
	icon_state = "acolyte"
	item_state = "acolyte"
	slowdown = 0.3
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 25, MATERIAL_BIOMATTER = 40)
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	//helmet = /obj/item/clothing/head/space/void/acolyte
	spawn_blacklisted = TRUE

/obj/item/clothing/head/armor/agrolyte
	name = "Agrolyte hood"
	desc = "Don't want anything getting in your eyes."
	icon_state = "botanist"
	item_state = "botanist"
	armor = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/armor/agrolyte
	name = "Agrolyte armor"
	desc = "Every rose has its thorns."
	icon_state = "botanist"
	item_state = "botanist"
	slowdown = 0
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 40)
	armor = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	spawn_blacklisted = TRUE

/obj/item/clothing/head/armor/custodian
	name = "Custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	item_state = "custodian"
	armor = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 200,
		rad = 90
	)
	unacidable = TRUE
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/armor/custodian
	name = "Custodian armor"
	desc = "Someone's gotta clean this mess."
	icon_state = "custodian"
	item_state = "custodian"
	slowdown = 0.05
	matter = list(MATERIAL_PLASTIC = 40, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 40)
	armor = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 200,
		rad = 90
	)
	unacidable = TRUE
	spawn_blacklisted = TRUE
