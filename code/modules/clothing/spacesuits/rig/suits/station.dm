/obj/item/clothing/head/helmet/space/rig/industrial
	camera_networks = list(NETWORK_MINE)

/obj/item/clothing/head/helmet/space/rig/ce
	camera_networks = list(NETWORK_ENGINEERING)

/obj/item/clothing/head/helmet/space/rig/eva
	light_overlay = "helmet_light_dual"
	camera_networks = list(NETWORK_ENGINEERING)

/obj/item/clothing/head/helmet/space/rig/hazmat
	light_overlay = "hardhat_light"
	camera_networks = list(NETWORK_RESEARCH)

/obj/item/clothing/head/helmet/space/rig/medical
	camera_networks = list(NETWORK_MEDICAL)

/obj/item/clothing/head/helmet/space/rig/hazard
	light_overlay = "helmet_light_dual"
	camera_networks = list(NETWORK_SECURITY)



/***************************************
	Industrial Suit: For Mining
****************************************/
/obj/item/weapon/rig/industrial
	name = "industrial suit control module"
	suit_type = "industrial hardsuit"
	desc = "A heavy, powerful rig used by construction crews and mining corporations."
	icon_state = "engineering_rig"
	armor = list(
		melee = 50,
		bullet = 50,
		energy = 10,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	slowdown = 3
	drain = 3
	offline_slowdown = 10
	offline_vision_restriction = 2
	emp_protection = -20

	helm_type = /obj/item/clothing/head/helmet/space/rig/industrial

	extra_allowed = list(
		/obj/item/device/t_scanner,
		/obj/item/weapon/storage/bag/ore,
		/obj/item/weapon/tool/pickaxe,
		/obj/item/weapon/rcd
	)

	req_access = list()
	req_one_access = list()

/obj/item/weapon/rig/industrial/equipped

	initial_modules = list(
		/obj/item/rig_module/device/drill,
		/obj/item/rig_module/device/orescanner,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson
		)


/***************************************
	EVA Suit
****************************************/
/obj/item/weapon/rig/eva
	name = "EVA suit control module"
	suit_type = "EVA hardsuit"
	desc = "A light rig for repairs and maintenance to the outside of habitats and vessels."
	icon_state = "eva_rig"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 100,
		rad = 100
	)
	slowdown = 0
	offline_slowdown = 1
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/eva

	extra_allowed = list(
		/obj/item/weapon/storage/toolbox,
		/obj/item/weapon/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/weapon/rcd
	)

	req_access = list()
	req_one_access = list()

/obj/item/weapon/rig/eva/equipped
	initial_modules = list(
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson
		)


/***************************************
Advanced Voidsuit: Technomancer Exultant
****************************************/
/obj/item/weapon/rig/ce
	name = "advanced voidsuit control module"
	suit_type = "advanced voidsuit"
	desc = "An advanced voidsuit that protects against hazardous, low pressure environments. Shines with a high polish."
	icon_state = "ce_rig"
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0
	drain = 2
	offline_slowdown = 0
	offline_vision_restriction = 0

	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE

	helm_type = /obj/item/clothing/head/helmet/space/rig/ce
	glove_type = /obj/item/clothing/gloves/rig/ce
	boot_type = /obj/item/clothing/shoes/magboots/rig/ce

	extra_allowed = list(
		/obj/item/weapon/storage/toolbox,
		/obj/item/weapon/storage/briefcase/inflatable,
		/obj/item/device/t_scanner,
		/obj/item/weapon/rcd
	)

	req_access = list(access_ce)
	req_one_access = list()

/obj/item/weapon/rig/ce/equipped
	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/rcd,
		/obj/item/rig_module/vision/meson,
		/obj/item/rig_module/storage
		)

/obj/item/clothing/gloves/rig/ce
	name = "insulated gloves"
	siemens_coefficient = 0

/obj/item/clothing/shoes/magboots/rig/ce
	name = "Advanced Magboots"
	desc = "Advanced magnetic boots that have a lighter magnetic pull, placing less burden on the wearer."
	mag_slow = 1

/***************************************
	Hazmat: Moebius Overseer
****************************************/
/obj/item/weapon/rig/hazmat
	name = "AMI control module"
	suit_type = "hazmat hardsuit"
	desc = "An Anomalous Material Interaction hardsuit that protects against the strangest energies the universe can throw at it."
	icon_state = "science_rig"
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 50,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 1
	drain = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/hazmat

	extra_allowed = list(
		/obj/item/stack/flag,
		/obj/item/weapon/tool,
		/obj/item/device/scanner/health,
		/obj/item/device/measuring_tape,
		/obj/item/device/ano_scanner,
		/obj/item/device/depth_scanner,
		/obj/item/device/core_sampler,
		/obj/item/device/gps,
		/obj/item/device/beacon_locator,
		/obj/item/device/radio/beacon,
		/obj/item/weapon/storage/bag/fossils
	)

	req_access = list()
	req_one_access = list()

/obj/item/weapon/rig/hazmat/equipped

	req_access = list(access_rd)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/anomaly_scanner
		)



/***************************************
	Medical
****************************************/
/obj/item/weapon/rig/medical
	name = "rescue suit control module"
	suit_type = "rescue hardsuit"
	desc = "A relatively lightweight and durable RIG suit designed for medical rescue in hazardous locations."
	icon_state = "medical_rig"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	slowdown = 0.75
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/medical

	extra_allowed = list(
		/obj/item/weapon/storage/firstaid,
		/obj/item/device/scanner/health,
		/obj/item/stack/medical,
		/obj/item/roller
	)

/obj/item/weapon/rig/medical/equipped
	req_access = list()
	req_one_access = list()

	initial_modules = list(
		/obj/item/rig_module/chem_dispenser/injector,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner,
		/obj/item/rig_module/vision/medhud
		)


/***************************************
	Hazard Suit
****************************************/
/obj/item/weapon/rig/hazard
	name = "hazard hardsuit control module"
	suit_type = "hazard hardsuit"
	desc = "A Security hardsuit designed for prolonged EVA in dangerous environments."
	icon_state = "hazard_rig"
	armor = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	slowdown = 1.35
	drain = 3.5
	offline_slowdown = 3
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/hazard

	req_access = list()
	req_one_access = list()


/obj/item/weapon/rig/hazard/equipped
	initial_modules = list(
		/obj/item/rig_module/vision/sechud,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/grenade_launcher,
		/obj/item/rig_module/mounted/taser
		)
