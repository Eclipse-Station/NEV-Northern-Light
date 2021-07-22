/obj/machinery/portable_atmospherics/canister/trichloramine
	name = "Canister \[Trichloramine\]"
	icon_state = "purple"		//placeholder
	canister_color = "purple"
	can_label = 0

/obj/machinery/portable_atmospherics/canister/trichloramine/New()
	..()
	src.air_contents.adjust_gas("trichloramine", MolesForPressure())
	src.update_icon()
	return 1 
	
/obj/machinery/portable_atmospherics/canister/monochloramine
	name = "Canister \[Monochloramine\]"
	icon_state = "purple"		//placeholder
	canister_color = "purple"
	can_label = 0

/obj/machinery/portable_atmospherics/canister/monochloramine/New()
	..()
	src.air_contents.adjust_gas("monochloramine", MolesForPressure())
	src.update_icon()
	return 1 