/datum/category_item/underwear/top
	underwear_name = "bra"
	underwear_type = /obj/item/underwear/top
	underwear_gender = FEMALE

/datum/category_item/underwear/top/none
	name = "None"
	always_last = TRUE
	underwear_type = null
	underwear_gender = MALE

/datum/category_item/underwear/top/bra
	name = "bra, white"
	icon_state = "top_1w"

/datum/category_item/underwear/top/bra/black
	is_default = TRUE
	name = "bra, black"
	icon_state = "top_1b"

/datum/category_item/underwear/top/bra/red
	name = "bra, red"
	icon_state = "top_1r"

/datum/category_item/underwear/top/bra/yellow
	name = "bra, yellow"
	icon_state = "top_1y"

/datum/category_item/underwear/top/bra/cyan
	name = "bra, cyan"
	icon_state = "top_1c"

/datum/category_item/underwear/top/sportbra
	name = "sport bra, white"
	icon_state = "top_2w"

/datum/category_item/underwear/top/sports_bra_white
	name = "Sports bra, white"
	icon_state = "f8"


/datum/category_item/underwear/top/bra
	is_default = TRUE
	name = "Bra"
	icon_state = "bra"
	has_color = TRUE

/datum/category_item/underwear/top/bra/is_default(var/gender)
	return gender == FEMALE

/datum/category_item/underwear/top/sports_bra
	name = "Sports bra"
	icon_state = "sports_bra"
	has_color = TRUE

/datum/category_item/underwear/top/sports_bra_alt
	name = "Sports bra, alt"
	icon_state = "sports_bra_alt"
	has_color = TRUE

/datum/category_item/underwear/top/lacy_bra
	name = "Lacy bra"
	icon_state = "lacy_bra"

/datum/category_item/underwear/top/lacy_bra_alt
	name = "Lacy bra, alt"
	icon_state = "lacy_bra_alt"
	has_color = TRUE

/datum/category_item/underwear/top/lacy_bra_alt_stripe
	name = "Lacy bra, alt, stripe"
	icon_state = "lacy_bra_alt_stripe"

/datum/category_item/underwear/top/halterneck_bra
	name = "Halterneck bra"
	icon_state = "halterneck_bra"
	has_color = TRUE

/datum/category_item/underwear/top/tubetop
	name = "Tube Top"
	icon_state = "tubetop"
	has_color = TRUE

/datum/category_item/underwear/top/fishnet_base
	name = "Fishnet top"
	icon_state = "fishnet_body"

/datum/category_item/underwear/top/fishnet_sleeves
	name = "Fishnet with sleeves"
	icon_state = "fishnet_sleeves"

/datum/category_item/underwear/top/fishnet_gloves
	name = "Fishnet with gloves"
	icon_state = "fishnet_gloves"

/datum/category_item/underwear/top/striped_bra
	name = "Striped Bra"
	icon_state = "striped_bra"
	has_color = TRUE
/datum/category_item/underwear/top/sportbra/black
	name = "sport bra, black"
	icon_state = "top_2b"

/datum/category_item/underwear/top/sportbra/red
	name = "sport bra, red"
	icon_state = "top_2r"

/datum/category_item/underwear/top/sportbra/yellow
	name = "sport bra, yellow"
	icon_state = "top_2y"

/datum/category_item/underwear/top/sportbra/cyan
	name = "sport bra, cyan"
	icon_state = "top_2c"

/datum/category_item/underwear/top/none/is_default(var/gender)
	return gender != FEMALE

/datum/category_item/underwear/top/bra/black/is_default(var/gender)
	return gender == FEMALE