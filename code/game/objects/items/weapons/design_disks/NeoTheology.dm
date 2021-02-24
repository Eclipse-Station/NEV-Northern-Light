// NeoTheology

// Foodstuffs, fertilizers, medical and cleaning utilities
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter
	disk_name = "Mekhane Bioprinter Products and Utilities"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,
		/datum/design/bioprinter/soap,

		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,

		/datum/design/bioprinter/medical/bruise,
		/datum/design/bioprinter/medical/splints,
		/datum/design/bioprinter/medical/ointment,
		/datum/design/bioprinter/medical/advanced/bruise,
		/datum/design/bioprinter/medical/advanced/ointment,

		/datum/design/autolathe/gun/nt_sprayer,
		/datum/design/autolathe/gun/plasma/martyr,
		/datum/design/autolathe/device/grenade/nt_cleaner,
		/datum/design/autolathe/device/grenade/nt_weedkiller

	)

// Clothes, armor and accesories
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_clothes
	disk_name = "Mekhane Bio-Fabric Designs"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/nt_clothes/acolyte_armor,
		/datum/design/bioprinter/nt_clothes/agrolyte_armor,
		/datum/design/bioprinter/nt_clothes/custodian_armor,

		/datum/design/bioprinter/nt_clothes/preacher_coat,
		/datum/design/bioprinter/nt_clothes/acolyte_jacket,
		/datum/design/bioprinter/nt_clothes/sports_jacket,

		/datum/design/bioprinter/nt_clothes/acolyte_uniform,
		/datum/design/bioprinter/nt_clothes/sports_uniform,
		/datum/design/bioprinter/nt_clothes/church_uniform,

		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/belt/utility/neotheology,

		/datum/design/bioprinter/satchel,
		/datum/design/bioprinter/leather_jacket,
		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,

		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,

		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,

		/datum/design/bioprinter/small_generic,
		/datum/design/bioprinter/medium_generic,
		/datum/design/bioprinter/large_generic,
		/datum/design/bioprinter/medical_supply,
		/datum/design/bioprinter/engineering_tools,
		/datum/design/bioprinter/engineering_supply,
		/datum/design/bioprinter/ammo,
		/datum/design/bioprinter/tubular,
		/datum/design/bioprinter/tubular/vial,

   		/datum/design/autolathe/device/headset_church,
		/datum/design/bioprinter/leather/cash_bag
	)

// Kinda like the regular product NT disk, minus the grenades, soap and the cleaner carbine. Should spawn in public access bioprinters if they get added by any chance.
/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public
	disk_name = "Mekhane Bioprinter Pack"
	icon_state = "neotheology"

	license = -1
	designs = list(
		/datum/design/bioprinter/meat,
		/datum/design/bioprinter/milk,

		/datum/design/bioprinter/ez,
		/datum/design/bioprinter/l4z,
		/datum/design/bioprinter/rh,

		/datum/design/bioprinter/wallet,
		/datum/design/bioprinter/botanic_leather,
		/datum/design/bioprinter/satchel,
		/datum/design/bioprinter/leather_jacket,
		/datum/design/bioprinter/leather/cash_bag,
		/datum/design/bioprinter/belt/utility,
		/datum/design/bioprinter/belt/utility/neotheology,
		/datum/design/bioprinter/belt/medical,
		/datum/design/bioprinter/belt/security,
		/datum/design/bioprinter/belt/security/neotheology,
		/datum/design/bioprinter/belt/medical/emt,
		/datum/design/bioprinter/belt/misc/champion,

		/datum/design/bioprinter/leather/holster,
		/datum/design/bioprinter/leather/holster/armpit,
		/datum/design/bioprinter/leather/holster/waist,
		/datum/design/bioprinter/leather/holster/hip,

		/datum/design/autolathe/device/headset_church
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/crusader
	disk_name = "Mekhane Armory - Crusader Armor"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/helmet/crusader,
		/datum/design/autolathe/armor/crusader
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/excruciator
	disk_name = "NanoTrasen Armory - NT \"EXCRUCIATOR\" giga lens"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/excruciator
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt
	disk_name = "Mekhane Armory - Blank"
	rarity_value = 50
	license = -1
	spawn_blacklisted = TRUE
	price_tag = 1000
	bad_type = /obj/item/weapon/computer_hardware/hard_drive/portable/design/nt

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/melee
	disk_name = "Mekhane Armory - Basic Melee Weapons"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/sword/nt_sword,
		/datum/design/autolathe/sword/nt_dagger,
		/datum/design/bioprinter/storage/sheath,
		/datum/design/autolathe/tool_upgrade/sanctifier
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/longsword
	disk_name = "Mekhane Armory - Longsword"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/sword/nt_longsword,
		/datum/design/bioprinter/storage/sheath,
		/datum/design/autolathe/tool_upgrade/sanctifier
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/scourge
	disk_name = "Mekhane Armory - Scourge"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/sword/nt_scourge,
		/datum/design/bioprinter/storage/sheath,
		/datum/design/autolathe/tool_upgrade/sanctifier
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/halberd
	disk_name = "Mekhane Armory - Halberd"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/sword/nt_halberd,
		/datum/design/bioprinter/storage/sheath,
		/datum/design/autolathe/tool_upgrade/sanctifier
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/shield
	disk_name = "Mekhane Armory - Shield"
	icon_state = "neotheology"
	spawn_blacklisted = TRUE
	designs = list(
		/datum/design/autolathe/sword/nt_sword,
		/datum/design/autolathe/sword/nt_dagger,
		/datum/design/autolathe/shield/nt_shield,
		/datum/design/bioprinter/storage/sheath,
		/datum/design/autolathe/tool_upgrade/sanctifier
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/firstaid
	disk_name = "Mekhane Armory - Mekhanite Medkit"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/firstaid/nt
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_dominion
	disk_name = "NanoTrasen Armory - Dominion Plasma Rifle"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 50
	license = 12
	designs = list(
		/datum/design/autolathe/gun/plasma/dominion = 3, //"NT PR \"Dominion\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_purger
	disk_name = "NanoTrasen Armory - Purger Plasma Rifle"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 50
	license = 12
	designs = list(
		/datum/design/autolathe/gun/plasma/destroyer = 3, // "NT PR \"Purger\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt/grenades
	disk_name = "Mekhane Armory - Grenades Pack"
	icon_state = "neotheology"
	designs = list(
		/datum/design/autolathe/grenade/nt_explosive,
		/datum/design/autolathe/grenade/nt_flashbang,
		/datum/design/autolathe/grenade/nt_frag,
		/datum/design/autolathe/grenade/nt_smokebomb
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_nemesis
	disk_name = "NanoTrasen Armory - Nemesis Energy Crossbow"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 50
	license = 12
	designs = list(
		/datum/design/autolathe/gun/energy_crossbow = 3, // "NT EC \"Nemesis\"" - self charging, no cell needed
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_themis
	disk_name = "NanoTrasen Armory - Themis Energy Crossbow"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	license = 12
	designs = list(
		/datum/design/autolathe/gun/large_energy_crossbow = 3, // "NT EC \"Themis\"" - self charging, no cell needed
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_lightfall
	disk_name = "NanoTrasen Armory - Lightfall Laser Gun"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	license = 12
	designs = list(
		/datum/design/autolathe/gun/laser = 3, // "NT LG \"Lightfall\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_valkirye
	disk_name = "NanoTrasen Armory - Valkyrie Energy Rifle"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 50
	license = 12
	designs = list(
		/datum/design/autolathe/gun/sniperrifle = 3, //"NT MER \"Valkyrie\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_halicon
	disk_name = "NanoTrasen Armory - Halicon Ion Rifle"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 33.33
	license = 12
	designs = list(
		/datum/design/autolathe/gun/ionrifle = 3, // "NT IR \"Halicon\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_counselor
	disk_name = "NanoTrasen Armory - Counselor PDW E"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 17
	license = 12
	designs = list(
		/datum/design/autolathe/gun/taser = 3, // "NT SP \"Counselor\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_svalinn
	disk_name = "NanoTrasen Armory - NT LP \"Svalinn\""
	icon_state = "neotheology"

	license = 12
	designs = list(
		/datum/design/autolathe/gun/nt_svalinn = 3,
		/datum/design/autolathe/cell/small/high,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_protector
	disk_name = "NanoTrasen Armory - Protector Grenade Launcher"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 90
	license = 15
	designs = list(
		/datum/design/autolathe/gun/grenade_launcher = 3, // "NT GL \"Protector\""
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_heavysniper
	disk_name = "NanoTrasen Armory - .60 Penetrator AMR"
	icon_state = "neotheology"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 90
	license = 12
	designs = list(
		/datum/design/autolathe/gun/heavysniper = 3, // "NT AMR .60 \"Penetrator\""
		/datum/design/autolathe/ammo/antim,
		/datum/design/autolathe/ammo/box_antim,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_mk58
	disk_name = "NanoTrasen Armory - .35 MK58 Handgun Pack"
	icon_state = "neotheology"
	rarity_value = 9
	license = 12
	designs = list(
		/datum/design/autolathe/gun/mk58 = 3,
		/datum/design/autolathe/gun/mk58_wood = 3,
		/datum/design/autolathe/ammo/magazine_pistol,
		/datum/design/autolathe/ammo/magazine_pistol/practice = 0,
		/datum/design/autolathe/ammo/magazine_pistol/rubber,
	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/nt_regulator
	disk_name = "NanoTrasen Armory - .50 Regulator Shotgun"
	icon_state = "neotheology"
	rarity_value = 17
	license = 12
	designs = list(
		/datum/design/autolathe/gun/regulator = 3, // "NT SG \"Regulator 1000\""
		/datum/design/autolathe/ammo/shotgun_pellet,
		/datum/design/autolathe/ammo/shotgun,
		/datum/design/autolathe/ammo/shotgun_beanbag,
		/datum/design/autolathe/ammo/shotgun_blanks,
		/datum/design/autolathe/ammo/shotgun_flash,
		)
