/mob/living/carbon/human/
	var/obj/item/weapon/implant/soulcrypt/crypt

/mob/living/carbon/human/Destroy()
	. = ..()

	if(crypt)
		crypt.wearer = null
		crypt = null