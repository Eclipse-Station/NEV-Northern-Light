//Bridge Officer
/obj/item/clothing/suit/storage/boff
	name = "bridge officer's coat"
	desc = "A crisp, smart, dress coat. designed to make you look authoritative and professional, even if you aren't."
	icon_state = "boff_suit"
	item_state = "boff_suit"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	style_coverage = COVERS_TORSO|COVERS_UPPER_ARMS|COVERS_FOREARMS
	armor = list(
		melee = 30,
		bullet = 20,
		energy = 20,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8
	price_tag = 250
	style = STYLE_HIGH
	icon = 'zzz_modular_eclipse/icons/clothing/suit.dmi'
	icon_override = 'zzz_modular_eclipse/icons/clothing/onmob/male/suit.dmi'
	icon_override_female = 'zzz_modular_eclipse/icons/clothing/onmob/female/suit.dmi'

//Aegis Cadet
/obj/item/clothing/suit/storage/cadet_vest
	name = "stab vest"
	desc = "A light combat vest provided as standard protective gear to Aegis Cadets."
	icon_state = "cadet_vest"
	item_state = "cadet_vest"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 30,
		bomb = 20,
		bio = 0,
		rad = 0
	)
	style_coverage = COVERS_TORSO
	price_tag = 150
	icon = 'zzz_modular_eclipse/icons/clothing/suit.dmi'
	icon_override = 'zzz_modular_eclipse/icons/clothing/onmob/neutral/suit.dmi'
	icon_override_female = 'zzz_modular_eclipse/icons/clothing/onmob/neutral/suit.dmi'

//Miscellaneous
/obj/item/clothing/suit/storage/office_blazer
	name = "office blazer"
	desc = "A crisp, smart, dress coat, designed to be worn over a dress shirt or blouse."
	icon_state = "office_blazer"
	item_state = "office_blazer"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	style_coverage = COVERS_TORSO|COVERS_UPPER_ARMS|COVERS_FOREARMS
	style = STYLE_HIGH
	icon = 'zzz_modular_eclipse/icons/clothing/suit.dmi'
	icon_override = 'zzz_modular_eclipse/icons/clothing/onmob/neutral/suit.dmi'
	icon_override_female = 'zzz_modular_eclipse/icons/clothing/onmob/neutral/suit.dmi'