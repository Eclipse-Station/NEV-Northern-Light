/datum/gear/uniform/shorts/color_presets
	display_name = "shorts, color presets"
	path = /obj/item/clothing/under/shorts/black
	cost = 1

/datum/gear/uniform/shorts/color_presets/New()
	..()
	var/shorts = list(
		"Black"			=	/obj/item/clothing/under/color/black,
		"Blue"			=	/obj/item/clothing/under/color/blue,
		"Green"			=	/obj/item/clothing/under/color/green,
		"Grey"			=	/obj/item/clothing/under/color/grey,
		"Red"			=	/obj/item/clothing/under/color/red
	)
	gear_tweaks += new /datum/gear_tweak/path(shorts)

/datum/gear/uniform/church_sport
	display_name = "Mekhane sports vestiment"
	path = /obj/item/clothing/under/rank/church/sport
	cost = 1
	allowed_roles = list("Chaplain","Mekhane Acolyte","Mekhane Agrolyte","Mekhane Custodian")

/datum/gear/uniform/turtleneck
	display_name = "black turtleneck"
	path = /obj/item/clothing/under/syndicate/civilian
	
