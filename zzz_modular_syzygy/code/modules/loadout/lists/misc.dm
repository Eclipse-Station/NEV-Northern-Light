/datum/gear/laser_pointer
	display_name = "Laser Pointer"
	path = /obj/item/laser_pointer
	cost = 4

/datum/gear/box
	display_name = "A box"
	path = /obj/item/weapon/storage/box
	cost = 2

/datum/gear/baton_holster
	display_name = "baton sheath"
	path = /obj/item/weapon/storage/pouch/baton_holster
	cost = 2
	allowed_roles = list("Aegis Operative","Aegis Commander","Aegis Gunnery Sergeant","Captain","Head of Personnel","Quartermaster","Aegis Inspector","Aegis Medical Specialist")	//SYZYGY EDIT - Added medspec to list

/datum/gear/tennis/color_presets
	display_name = "tennis ball, color presets"
	path = /obj/item/toy/tennis
	cost = 1

/datum/gear/tennis/color_presets/New()
	..()
	var/balls = list(
		"Red"			=	/obj/item/toy/tennis/red,
		"Yellow"		=	/obj/item/toy/tennis/yellow,
		"Green"			=	/obj/item/toy/tennis/green,
		"Cyan"			=	/obj/item/toy/tennis/cyan,
		"Blue"			=	/obj/item/toy/tennis/blue,
		"Purple"		=	/obj/item/toy/tennis/purple
	)
	gear_tweaks += new /datum/gear_tweak/path(balls)
