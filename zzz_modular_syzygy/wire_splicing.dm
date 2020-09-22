///// MODULAR OVERRIDE TO ADD BEAR TRAP STYLE AWARENESS /////

/obj/structure/wire_splicing
	var/list/aware_mobs = list() //List of refs of mobs that examined this trap. Won't trigger it when walking. //Syzygy Edit.

/obj/structure/wire_splicing/examine(mob/user)
	..()

	if(isliving(user) && !("\ref[user]" in aware_mobs))	//Syzygy Edit.
		to_chat(user, SPAN_NOTICE("You're aware of this wire splicing, now. You won't clumsily step on it when walking carefully."))
		aware_mobs |= "\ref[user]"

/obj/structure/wire_splicing/Crossed(AM as mob|obj)
	if(isliving(AM))
		var/mob/living/L = AM
		if(("\ref[L]" in aware_mobs) && MOVING_DELIBERATELY(L))	//Syzygy Edit.
			return
	..()
