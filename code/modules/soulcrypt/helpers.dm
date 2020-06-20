/mob/living/proc/get_soulcrypt()
	RETURN_TYPE(/obj/item/weapon/implant/core_implant)
	for(var/obj/item/weapon/implant/soulcrypt/I in src)
		if(I.wearer != src)
			continue

		return I

	return null