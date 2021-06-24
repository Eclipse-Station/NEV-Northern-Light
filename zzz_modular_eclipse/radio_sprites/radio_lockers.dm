/*
 * Radio closets, which each hold three to six radios. You cannot put mobs in
 * the lockers, because that'd be where the chargers are.
 */
 
/obj/structure/closet/radiocloset
	name = "radio locker"
	desc = "A storage unit for handheld shortwave radios."
	icon_state = "special_lootcloset"
	var/radio_type = /obj/item/device/radio/color

/obj/structure/closet/radiocloset/populate_contents()
	for(var/i in 1 to rand(3,6))
		new radio_type(src)

/obj/structure/closet/radiocloset/red		//Sec
	radio_type = /obj/item/device/radio/color/red
	
/obj/structure/closet/radiocloset/brown		//Cargo
	radio_type = /obj/item/device/radio/color/brown
	
/obj/structure/closet/radiocloset/yellow		//Engi
	radio_type = /obj/item/device/radio/color/yellow
	
/obj/structure/closet/radiocloset/green		//Unused, intended originally as CentComm
	radio_type = /obj/item/device/radio/color/green
	
/obj/structure/closet/radiocloset/blue		//Command
	radio_type = /obj/item/device/radio/color/navyblue
	
/obj/structure/closet/radiocloset/blue_med		//Medical
	radio_type = /obj/item/device/radio/color/lightblue
	
/obj/structure/closet/radiocloset/purple		//Research
	radio_type = /obj/item/device/radio/color/purple