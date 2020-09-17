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