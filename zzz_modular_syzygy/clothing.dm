// Syzygy's snowflake clothing goes here

/obj/item/clothing/under/yogapants
	name = "form-fitting athletic outfit"
	desc = "It's got skintight yoga pants and a fashionable, yet lightweight tank top."
	icon = 'zzz_modular_syzygy/icons/uniform_icons.dmi'
	icon_state = "yogapants"
	item_state = "yogapants"
	icon_override = 'zzz_modular_syzygy/icons/mob/uniform.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/uniform_fem.dmi'
	sensor_mode = 3

/obj/item/clothing/under/yogapants/topless
	name = "yoga pants"
	desc = "Perfect for showing off all your curves."
	icon_state = "yogapantstrue"
	item_state = "yogapantstrue"

/obj/item/clothing/suit/storage/captains_coat
	name = "captain's greatcoat"
	desc = "It's a swanky blue greatcoat with gold epaulettes and trimmings denoting the rank of \"Captain\"."
	icon = 'zzz_modular_syzygy/icons/suit_icons.dmi'
	icon_state = "captains_coat"
	item_state = "captains_coat"
	icon_override = 'zzz_modular_syzygy/icons/mob/suit.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/suit_fem.dmi'
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	armor = list(
		melee = 30,
		bullet = 35,
		energy = 30,
		bomb = 15,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8

/obj/item/clothing/head/space/capspace
	name = "captain's voidsuit helmet"
	icon = 'zzz_modular_syzygy/icons/head_icons.dmi'
	icon_state = "captains_voidhelmet"
	item_state = "captains_voidhelmet"
	icon_override = 'zzz_modular_syzygy/icons/mob/head.dmi'
	desc = "A special helmet designed for hazardous, low-pressure environments. Only for the most fashionable of corporate figureheads."
	armor = list(
		melee = 50,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7

/obj/item/clothing/suit/space/void/captain
	name = "captain's voidsuit"
	desc = "A bulky, heavy-duty voidsuit for hazardous, low-pressure environments. Only for the most fashionable of corporate figureheads."
	icon = 'zzz_modular_syzygy/icons/suit_icons.dmi'
	icon_state = "captains_voidsuit"
	item_state = "captains_voidsuit"
	icon_override = 'zzz_modular_syzygy/icons/mob/suit.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/suit_fem.dmi'
	slowdown = 0.3
	armor = list(
		melee = 50,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.7
	helmet = /obj/item/clothing/head/space/capspace

/obj/item/clothing/suit/space/void/captain/equipped
	tank = /obj/item/weapon/tank/jetpack/oxygen
	boots = /obj/item/clothing/shoes/magboots

/obj/item/clothing/under/rank/captain
	desc = "It's a blue jumpsuit with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpsuit"
	icon = 'zzz_modular_syzygy/icons/uniform_icons.dmi'
	icon_state = "captain"
	item_state = "captain"
	icon_override = 'zzz_modular_syzygy/icons/mob/uniform.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/uniform_fem.dmi'

/obj/item/clothing/under/rank/captain_jumpskirt
	desc = "It's a blue jumpskirt with some gold markings denoting the rank of \"Captain\"."
	name = "captain's jumpskirt"
	icon = 'zzz_modular_syzygy/icons/uniform_icons.dmi'
	icon_state = "captain_skirt"
	item_state = "captain_skirt"
	icon_override = 'zzz_modular_syzygy/icons/mob/uniform.dmi'
	icon_override_female = 'zzz_modular_syzygy/icons/mob/uniform_fem.dmi'