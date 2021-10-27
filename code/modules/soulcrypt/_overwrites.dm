/mob/living/carbon/human/
	var/obj/item/implant/core_implant/soulcrypt/crypt

/mob/living/carbon/human/Destroy()
	. = ..()

	if(crypt)
		crypt.wearer = null
		crypt = null

/mob/living/carbon/human/proc/create_soulcrypt()
	spawn(10) //I know spawn is bad, but a little bit of delay is required.
		var/obj/item/implant/core_implant/soulcrypt/crypt = new
		crypt.install(src)
		to_chat(src, SPAN_NOTICE("You feel a faint sense of vertigo as your soulcrypt boots up."))