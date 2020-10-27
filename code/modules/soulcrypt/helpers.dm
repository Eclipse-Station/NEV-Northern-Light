/mob/living/proc/get_soulcrypt()
	for(var/obj/item/weapon/implant/core_implant/soulcrypt/I in src)
		if(I.wearer != src)
			continue

		return I

	return null