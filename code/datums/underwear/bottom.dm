/datum/category_item/underwear/bottom
	underwear_gender = PLURAL
	underwear_name = "underwear"
	underwear_type = /obj/item/underwear/bottom

/datum/category_item/underwear/bottom/none
	name = "None"
	always_last = TRUE
	underwear_type = null

/datum/category_item/underwear/bottom/boxers
	name = "boxers, white"
	icon_state = "underwear_m_1w"
	underwear_name = "boxers"

/datum/category_item/underwear/bottom/boxers/black
	is_default = TRUE
	name = "boxers, black"
	icon_state = "underwear_m_1b"

/datum/category_item/underwear/bottom/boxers/red
	name = "boxers, red"
	icon_state = "underwear_m_1r"

/datum/category_item/underwear/bottom/boxers/yellow
	name = "boxers, yellow"
	icon_state = "underwear_m_1y"

/datum/category_item/underwear/bottom/boxers/cyan
	name = "boxers, cyan"
	icon_state = "underwear_m_1c"

/datum/category_item/underwear/bottom/briefs
	name = "briefs, white"
	icon_state = "underwear_m_2w"
	underwear_name = "briefs"

/datum/category_item/underwear/bottom/briefs/black
	name = "briefs, black"
	icon_state = "underwear_m_2b"

/datum/category_item/underwear/bottom/briefs/red
	name = "briefs, red"
	icon_state = "underwear_m_2r"

/datum/category_item/underwear/bottom/briefs/yellow
	name = "briefs, yellow"
	icon_state = "underwear_m_2y"

/datum/category_item/underwear/bottom/briefs/cyan
	name = "briefs, cyan"
	icon_state = "underwear_m_2c"

/datum/category_item/underwear/bottom/panties
	name = "panties, white"
	icon_state = "underwear_f_1w"
	underwear_name = "panties"

/datum/category_item/underwear/bottom/panties_noback/is_default(var/gender)
	return gender == FEMALE

/datum/category_item/underwear/bottom/boxers_loveheart
	name = "Boxers, Loveheart"
	icon_state = "boxers_loveheart"

/datum/category_item/underwear/bottom/boxers
	name = "Boxers"
	icon_state = "boxers"
	has_color = TRUE

/datum/category_item/underwear/bottom/boxers_green_and_blue
	name = "Boxers, green & blue striped"
	icon_state = "boxers_green_and_blue"

/datum/category_item/underwear/bottom/panties
	name = "Panties"
	icon_state = "panties"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties/is_default(var/gender)
	return gender == FEMALE

/datum/category_item/underwear/bottom/lacy_thong
	name = "Lacy thong"
	icon_state = "lacy_thong"

/datum/category_item/underwear/bottom/lacy_thong_alt
	name = "Lacy thong, alt"
	icon_state = "lacy_thong_alt"
	has_color = TRUE

/datum/category_item/underwear/bottom/panties_alt
	name = "Panties, alt"
	icon_state = "panties_alt"
	has_color = TRUE

/datum/category_item/underwear/bottom/compression_shorts
	name = "Compression shorts"
	icon_state = "compression_shorts"
	has_color = TRUE

/datum/category_item/underwear/bottom/thong
	name = "Thong"
	icon_state = "thong"
	has_color = TRUE

/datum/category_item/underwear/bottom/fishnet_lower
	name = "Fishnets"
	icon_state = "fishnet_lower"

/datum/category_item/underwear/bottom/striped_panties
	name = "Striped Panties"
	icon_state = "striped_panties"
	has_color = TRUE

/datum/category_item/underwear/bottom/longjon
	name = "Long John Bottoms"
	icon_state = "ljonb"
	has_color = TRUE
	is_default = TRUE

/datum/category_item/underwear/bottom/panties/black
	name = "panties, black"
	icon_state = "underwear_f_1b"

/datum/category_item/underwear/bottom/panties/red
	name = "panties, red"
	icon_state = "underwear_f_1r"

/datum/category_item/underwear/bottom/panties/yellow
	name = "panties, yellow"
	icon_state = "underwear_f_1y"

/datum/category_item/underwear/bottom/panties/cyan
	name = "panties, cyan"
	icon_state = "underwear_f_1c"

/datum/category_item/underwear/bottom/sportpanties
	name = "sport panties, white"
	icon_state = "underwear_f_2w"
	underwear_name = "sport panties"

/datum/category_item/underwear/bottom/sportpanties/black
	name = "sport panties, black"
	icon_state = "underwear_f_2b"

/datum/category_item/underwear/bottom/sportpanties/red
	name = "sport panties, red"
	icon_state = "underwear_f_2r"

/datum/category_item/underwear/bottom/sportpanties/yellow
	name = "sport panties, yellow"
	icon_state = "underwear_f_2y"

/datum/category_item/underwear/bottom/sportpanties/cyan
	name = "sport panties, cyan"
	icon_state = "underwear_f_2c"

/datum/category_item/underwear/bottom/boxers/black/is_default(var/gender)
	return gender != FEMALE

/datum/category_item/underwear/bottom/panties/black/is_default(var/gender)
	return gender == FEMALE
