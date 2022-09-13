// Chiropteran Arms "Maverick" series rifle - design diskette and autolathe defines.
// R.A. Spitzer 2022-09-13

//Design diskette.
/obj/item/computer_hardware/hard_drive/portable/design/maverick
	disk_name = "Chiropteran Arms - Maverick Rifle E"
	icon_state = "frozenstar"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED_COMMON
	license = 12
	designs = list(
		/datum/design/autolathe/gun/maverick = 3,
		/datum/design/autolathe/cell/small/high,
	)

//Autolathe datum
/datum/design/autolathe/gun/maverick
	name = "CA ELAR \"Maverick\""
	build_path = /obj/item/gun/energy/lever_action
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 4)
