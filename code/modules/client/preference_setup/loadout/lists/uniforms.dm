// Uniform slot
/datum/gear/uniform
	display_name = "blazer, blue"
	path = /obj/item/clothing/under/blazer
	slot = slot_w_uniform
	sort_category = "Uniforms and Casual Dress"

/datum/gear/uniform/kilt
	display_name = "kilt"
	path = /obj/item/clothing/under/kilt

/datum/gear/uniform/jumpsuit/rainbow
	display_name = "jumpsuit, rainbow"
	path = /obj/item/clothing/under/rainbow

/datum/gear/uniform/jumpsuit/color_presets
	display_name = "jumpsuit, color presets"
	path = /obj/item/clothing/under/aqua
	cost = 2

/datum/gear/uniform/jumpsuit/color_presets/New()
	..()
	var/jumpsuit = list(
		"Black"			=	/obj/item/clothing/under/color/black,
		"White"			=	/obj/item/clothing/under/color/white,
		"Blue"			=	/obj/item/clothing/under/color/blue,
		"Green"			=	/obj/item/clothing/under/color/green,
		"Grey"			=	/obj/item/clothing/under/color/grey,
		"Pink"			=	/obj/item/clothing/under/color/pink,
		"Yellow"		=	/obj/item/clothing/under/color/yellow,
		"Light-Blue"	=	/obj/item/clothing/under/lightblue,
		"Red"			=	/obj/item/clothing/under/color/red,
		"Aqua"			=	/obj/item/clothing/under/aqua,
		"Purple"		=	/obj/item/clothing/under/purple,
		"Light-Purple"	=	/obj/item/clothing/under/lightpurple,
		"Light-Green"	=	/obj/item/clothing/under/lightgreen,
		"Light-Brown"	=	/obj/item/clothing/under/lightbrown,
		"Brown"			=	/obj/item/clothing/under/brown,
		"Yellow-Green"	=	/obj/item/clothing/under/yellowgreen,
		"Dark-Blue"		=	/obj/item/clothing/under/darkblue,
		"Light-Red"		=	/obj/item/clothing/under/lightred,
		"Dark-Red"		=	/obj/item/clothing/under/darkred,
	)
	gear_tweaks += new /datum/gear_tweak/path(jumpsuit)

/datum/gear/uniform/jumpsuit/colorable
	display_name = "jumpsuit, colorable"
	flags = GEAR_HAS_COLOR_SELECTION
	path = /obj/item/clothing/under/color/white

/datum/gear/uniform/security_skirt
	display_name = "jumpskirt, operative"
	path = /obj/item/clothing/under/rank/security/skirt
	allowed_roles = list("Aegis Operative")

/datum/gear/uniform/medspec_skirt
	display_name = "jumpskirt, medical specialist"
	path = /obj/item/clothing/under/rank/medspec/skirt
	allowed_roles = list("Aegis Medical Specialist")

/datum/gear/uniform/warden_skirt
	display_name = "jumpskirt, warden"
	path = /obj/item/clothing/under/rank/warden/skirt
	allowed_roles = list("Gunnery Sergeant")

/datum/gear/uniform/hos_skirt
	display_name = "jumpskirt, commander"
	path = /obj/item/clothing/under/rank/ih_commander/skirt
	allowed_roles = list("Aegis Commander")

/*/datum/gear/uniform/skirt
	display_name = "plaid skirt, blue"
	path = /obj/item/clothing/under/dress/plaid_blue

/datum/gear/uniform/skirt/purple
	display_name = "plaid skirt, purple"
	path = /obj/item/clothing/under/dress/plaid_purple

/datum/gear/uniform/skirt/red
	display_name = "plaid skirt, red"
	path = /obj/item/clothing/under/dress/plaid_red*/

/*/datum/gear/uniform/suit  //amish
	display_name = "suit, amish"
	path = /obj/item/clothing/under/sl_suit*/

/datum/gear/uniform/scrubs/color_presets
	display_name = "scrubs, color presets"
	path = /obj/item/clothing/under/rank/medical/blue

/datum/gear/uniform/scrubs/color_presets/New()
	..()
	var/jumpsuit = list(
		"Blue"			=	/obj/item/clothing/under/rank/medical/blue,
		"Purple"		=	/obj/item/clothing/under/rank/medical/purple,
		"Green"			=	/obj/item/clothing/under/rank/medical/green,
	)
	gear_tweaks += new /datum/gear_tweak/path(jumpsuit)

/*/datum/gear/uniform/uniform_hop
	display_name = "uniform, HoP's dress"
	path = /obj/item/clothing/under/dress/dress_hop
	allowed_roles = list("Head of Personnel")*/
