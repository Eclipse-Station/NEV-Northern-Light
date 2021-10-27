// Excelsior
/obj/item/computer_hardware/hard_drive/portable/design/excelsior
	disk_name = "Excelsior Means of Production"
	desc = "The back has a machine etching: \"This struggle must be organised, according to \"all the rules of the art\", by people who are professionally engaged in revolutionary activity.\""
	icon_state = "excelsior"
	spawn_blacklisted = TRUE
	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,						//guns
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/gun/reclaimer,
		/datum/design/autolathe/ammo/magazine_pistol,				//makarov ammo
		/datum/design/autolathe/ammo/magazine_pistol/rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox/rubber,
		/datum/design/autolathe/ammo/msmg,							//drozd ammo
		/datum/design/autolathe/ammo/msmg/rubber,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox/rubber,
		/datum/design/autolathe/ammo/srifle,						//vintorez ammo
		/datum/design/autolathe/ammo/srifle/rubber,
		/datum/design/autolathe/ammo/srifle_ammobox,
		/datum/design/autolathe/ammo/srifle_ammobox/rubber,
		/datum/design/autolathe/ammo/sl_lrifle,						//boltgun ammo
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small/rubber,
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle/rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/circuit/autolathe_excelsior,		//circuits
		/datum/design/autolathe/circuit/shieldgen_excelsior,
		/datum/design/autolathe/circuit/reconstructor_excelsior,
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/excelsior_boombox,
		/datum/design/autolathe/circuit/turret_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/research/item/part/micro_mani,				//machine parts
		/datum/design/research/item/part/subspace_amplifier,
		/datum/design/research/item/part/subspace_crystal,
		/datum/design/research/item/part/subspace_transmitter,
		/datum/design/autolathe/part/igniter,						//regular parts
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/autolathe/cell/large/excelsior,				//power cells
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior,
		/datum/design/autolathe/device/excelsiormine,				//security
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/device/implanter,					//misc
		/datum/design/autolathe/device/propaganda_chip,
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/device/excelbaton,
	)

/obj/item/computer_hardware/hard_drive/portable/design/excelsior_weapons
	disk_name = "Excelsior Means of Revolution"
	desc = "The back has a machine etching: \"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\""
	icon_state = "excelsior"
	spawn_blacklisted = TRUE
	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/magazine_pistol,				//makarov ammo
		/datum/design/autolathe/ammo/magazine_pistol/rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox/rubber,
		/datum/design/autolathe/ammo/msmg,							//drozd ammo
		/datum/design/autolathe/ammo/msmg/rubber,
		/datum/design/autolathe/ammo/magnum_ammobox,
		/datum/design/autolathe/ammo/magnum_ammobox/rubber,
		/datum/design/autolathe/ammo/srifle,						//vintorez ammo
		/datum/design/autolathe/ammo/srifle/rubber,
		/datum/design/autolathe/ammo/srifle_ammobox,
		/datum/design/autolathe/ammo/srifle_ammobox/rubber,
		/datum/design/autolathe/ammo/sl_lrifle,						//boltgun ammo
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
		/datum/design/autolathe/ammo/lrifle_ammobox_small/rubber,
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle/rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/sec/silencer,						//misc
		/datum/design/autolathe/clothing/excelsior_armor,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/ex_drozd
	disk_name = "Excelsior - .40 Drozd SMG"
	desc = {"The back has a machine etching:\n \
	\"Nobody is to be blamed for being born a slave; \
	but a slave who not only eschews a striving for freedom but justifies and eulogies his slavery - \
	such a slave is a lickspittle and a boor, who arouses a legitimate feeling of indignation, contempt, and loathing.\""}
	icon_state = "excelsior"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 50
	license = -1
	designs = list(
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/ammo/msmg, //comes with both lethal and rubber like means of production
		/datum/design/autolathe/ammo/msmg/rubber
	)

//Serb

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_zoric
	disk_name = "Serbian Arms - .40 Zoric SMG"
	icon_state = "serbian"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	license = 12
	designs = list(
		/datum/design/autolathe/gun/zoric = 3, // "SA SMG .40 \"Zoric\""
		/datum/design/autolathe/ammo/msmg,
		/datum/design/autolathe/ammo/msmg/practice = 0,
		/datum/design/autolathe/ammo/msmg/rubber,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_boltgun
	disk_name = "Serbian Arms - .30  Novakovic Rifle"
	icon_state = "serbian"
	rarity_value = 5.5
	license = 12
	designs = list(
		/datum/design/autolathe/gun/boltgun_serbian = 3, // "SA BR .30 \"Novakovic\""
		/datum/design/autolathe/ammo/sl_lrifle,
		/datum/design/autolathe/ammo/lrifle_ammobox_small,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_heavysniper
	disk_name = "Serbian Arms - .60 Hristov AMR"
	icon_state = "serbian"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 90
	license = 12
	designs = list(
		/datum/design/autolathe/gun/heavysniper = 3, // "SA AMR .60 \"Hristov\""
		/datum/design/autolathe/ammo/antim,
		/datum/design/autolathe/ammo/box_antim,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_pk
	disk_name = "Serbian Arms - .30 Pulemyot Kalashnikova MG"
	icon_state = "serbian"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 90
	license = 12
	designs = list(
		/datum/design/autolathe/gun/mg_pk = 3, // "SA MG .30 \"Pulemyot Kalashnikova\""
		/datum/design/autolathe/ammo/lrifle_pk,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_ak
	disk_name = "Serbian Arms - .30 Krinkov Car"
	icon_state = "serbian"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 50
	license = 12
	designs = list(
		/datum/design/autolathe/gun/ak47_sa = 3, // "SA Car .30 \"Krinkov\""
		/datum/design/autolathe/ammo/lrifle,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/sa_br
	disk_name = "Serbian Arms - .20 Kovacs"
	icon_state = "serbian"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 80
	license = 12
	designs = list(
		/datum/design/autolathe/gun/kovacs = 3, // "SA BR .20 \"Kovacs\""
		/datum/design/autolathe/ammo/srifle
	)

//The Dallas
/obj/item/computer_hardware/hard_drive/portable/design/guns/dallas
	disk_name = "PAR - .25 Dallas"
	icon_state = "black"
	spawn_tags = SPAWN_TAG_DESIGN_ADVANCED
	rarity_value = 90
	license = 12
	designs = list(
		/datum/design/autolathe/gun/dallas = 3, // "PAR .25 CS \"Dallas\""
		/datum/design/autolathe/ammo/c10x24,
	)

//The Cog
/obj/item/computer_hardware/hard_drive/portable/design/guns/retro
	disk_name = "OS LG \"Cog\""
	icon_state = "onestar"
	rarity_value = 5.5
	license = 12
	designs = list(
		/datum/design/autolathe/gun/retro = 3, //"OS LG \"Cog\""
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/computer_hardware/hard_drive/portable/design/guns/scaramanga
	disk_name = "\"Scaramanga\" gold set"
	icon_state = "onestar"
	rarity_value = 40
	license = 15
	designs = list(
		/datum/design/autolathe/sec/gold = 3,
		/datum/design/autolathe/gun/colt = 3,
		/datum/design/autolathe/gun/atreides = 6,
		/datum/design/autolathe/gun/avasarala = 6
	)

// ARMOR
/obj/item/computer_hardware/hard_drive/portable/design/armor
	bad_type = /obj/item/computer_hardware/hard_drive/portable/design/armor

/obj/item/computer_hardware/hard_drive/portable/design/guns
	bad_type = /obj/item/computer_hardware/hard_drive/portable/design/guns
