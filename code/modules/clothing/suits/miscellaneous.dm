/*
 * Contains:
 *		Lasertag
 *		Costume
 *		Misc
 */

/*
 * Lasertag
 */
/obj/item/clothing/suit/bluetag
	name = "blue laser tag armour"
	desc = "Blue Pride, Station Wide."
	icon_state = "bluetag"
	item_state = "bluetag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/weapon/gun/energy/lasertag/blue)
	siemens_coefficient = 3

/obj/item/clothing/suit/redtag
	name = "red laser tag armour"
	desc = "Reputed to go faster."
	icon_state = "redtag"
	item_state = "redtag"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO
	allowed = list (/obj/item/weapon/gun/energy/lasertag/red)
	siemens_coefficient = 3

/*
 * Costume
 */
/obj/item/clothing/suit/pirate
	name = "pirate coat"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	body_parts_covered = UPPER_TORSO|ARMS


/obj/item/clothing/suit/judgerobe
	name = "judge's robe"
	desc = "This robe commands authority."
	icon_state = "judge"
	item_state = "judge"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	allowed = list(/obj/item/weapon/storage/fancy/cigarettes,/obj/item/weapon/spacecash)
	flags_inv = HIDEJUMPSUIT


/obj/item/clothing/suit/wcoat
	name = "waistcoat"
	desc = "For some classy, murderous fun."
	icon_state = "vest"
	item_state = "wcoat"
	blood_overlay_type = "armor"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO


/obj/item/clothing/suit/syndicatefake
	name = "red space suit replica"
	icon_state = "syndicate"
	item_state = "space_suit_syndicate"
	desc = "A plastic replica of the syndicate space suit, you'll look just like a real murderous syndicate agent in this! This is a toy, it is not made for use in space!"
	w_class = ITEM_SIZE_NORMAL
	allowed = list(/obj/item/device/lighting/toggleable/flashlight,/obj/item/weapon/tank,/obj/item/toy)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	item_flags = COVER_PREVENT_MANIPULATION


/obj/item/clothing/suit/chickensuit
	name = "Chicken Suit"
	desc = "A suit made long ago by the ancient empire KFC."
	icon_state = "chickensuit"
	item_state = "chickensuit"
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2


/obj/item/clothing/suit/monkeysuit
	name = "Monkey Suit"
	desc = "A suit that looks like a primate"
	icon_state = "monkeysuit"
	item_state = "monkeysuit"
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2


/obj/item/clothing/suit/cardborg
	name = "cardborg suit"
	desc = "An ordinary cardboard box with holes cut in the sides."
	icon_state = "cardborg"
	item_state = "cardborg"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	flags_inv = HIDEJUMPSUIT

/*
 * Misc
 */

/obj/item/clothing/suit/straight_jacket
	name = "straight jacket"
	desc = "A suit that completely restrains the wearer."
	icon_state = "straight_jacket"
	item_state = "straight_jacket"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	allowed = list(/obj/item/weapon/tank)


//pyjamas
//originally intended to be pinstripes >.>

/obj/item/clothing/under/bluepyjamas
	name = "blue pyjamas"
	desc = "Slightly old-fashioned sleepwear."
	icon_state = "blue_pyjamas"
	item_state = "blue_pyjamas"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/under/redpyjamas
	name = "red pyjamas"
	desc = "Slightly old-fashioned sleepwear."
	icon_state = "red_pyjamas"
	item_state = "red_pyjamas"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS


/obj/item/clothing/suit/xenos
	name = "xenos suit"
	desc = "A suit made out of chitinous alien hide."
	icon_state = "xenos"
	item_state = "xenos_helm"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	siemens_coefficient = 2


//swimsuit
/obj/item/clothing/under/swimsuit/
	siemens_coefficient = 1
	body_parts_covered = 0

/obj/item/clothing/under/swimsuit/black
	name = "black swimsuit"
	desc = "An oldfashioned black swimsuit."
	icon_state = "swim_black"

/obj/item/clothing/under/swimsuit/blue
	name = "blue swimsuit"
	desc = "An oldfashioned blue swimsuit."
	icon_state = "swim_blue"

/obj/item/clothing/under/swimsuit/purple
	name = "purple swimsuit"
	desc = "An oldfashioned purple swimsuit."
	icon_state = "swim_purp"

/obj/item/clothing/under/swimsuit/green
	name = "green swimsuit"
	desc = "An oldfashioned green swimsuit."
	icon_state = "swim_green"

/obj/item/clothing/under/swimsuit/red
	name = "red swimsuit"
	desc = "An oldfashioned red swimsuit."
	icon_state = "swim_red"

/obj/item/clothing/suit/poncho
	name = "poncho"
	desc = "A simple, comfortable poncho."
	icon_state = "classicponcho"
	item_state = "classicponcho"

/obj/item/clothing/suit/storage/toggle/bomber
	name = "bomber jacket"
	desc = "A thick, well-worn WW2 leather bomber jacket."
	icon_state = "bomber"
	item_state = "bomber"
	icon_open = "bomber_open"
	icon_closed = "bomber"
	body_parts_covered = UPPER_TORSO|ARMS
	cold_protection = UPPER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7

/obj/item/clothing/suit/storage/leather_jacket
	name = "leather jacket"
	desc = "A sturdy, synthetic leather jacket with a high collar. It is able to protect you from a knife slice or a bite, but don't expect too much. More importantly, it makes you look like a really bad boy or girl. And remember, Tunnel Snakes rule!"
	icon_state = "leather_jacket"
	item_state = "leather_jacket"
	armor = list(
		melee = 10,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = T0C - 20
	siemens_coefficient = 0.7


/obj/item/clothing/suit/storage/toggle/hoodie
	name = "grey hoodie"
	desc = "A warm, grey sweatshirt."
	icon_state = "grey_hoodie"
	item_state = "grey_hoodie"
	icon_open = "grey_hoodie_open"
	icon_closed = "grey_hoodie"
	min_cold_protection_temperature = T0C - 20
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/toggle/hoodie/black
	name = "black hoodie"
	desc = "A warm, black sweatshirt."
	icon_state = "black_hoodie"
	item_state = "black_hoodie"
	icon_open = "black_hoodie_open"
	icon_closed = "black_hoodie"

/obj/item/clothing/suit/storage/cyberpunksleek
	name = "\improper Enforcer's Overcoat"
	desc = "A sleek overcoat made of neo-laminated fabric. Has a reasonably sized pocket on the inside."
	icon_state = "cyberpunksleek"
	item_state = "brown_jacket"
	armor = list(
		melee = 5,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/suit/storage/cyberpunksleek_long
	name = "\improper Enforcer's long Overcoat"
	desc = "A sleek long overcoat made of neo-laminated fabric. Has a reasonably sized pocket on the inside."
	icon_state = "cyberpunksleek_long"
	item_state = "cyberpunksleek_long"
	armor = list(
		melee = 10,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
