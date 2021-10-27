/obj/item/access_update_tool
	name = "soulcrypt access updater"
	desc = "A device used to update access for someone's soulcrypt."
	icon = 'icons/obj/device.dmi'
	icon_state = "adv_spectrometer"

	var/obj/item/card/id/card //Our current ID card. We copy access from this.

/obj/item/access_update_tool/examine(mob/user)
	. = ..()
	if(card)
		to_chat(user, SPAN_NOTICE("It appears to have an ID card in it's ID card port."))


/obj/item/access_update_tool/attackby(obj/item/I, mob/user as mob)
	if(istype(I, /obj/item/card/id))
		to_chat(user, SPAN_NOTICE("You slot the [I] into [src]'s ID card port."))
		user.drop_item()
		I.forceMove(src)
		card = I

/obj/item/access_update_tool/attack_self(mob/user)
	if(card)
		to_chat(user, SPAN_NOTICE("You remove the ID card from [src]'s ID card port."))
		card.forceMove(get_turf(user))
		card = null

/obj/item/access_update_tool/afterattack(atom/A, mob/living/user)
	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/person = A
		var/obj/item/implant/core_implant/soulcrypt/crypt = person.crypt
		if(!crypt)
			to_chat(user, SPAN_WARNING("[person] doesn't have a Soulcrypt to modify."))
			return
		//Else, we overwrite the soulcrypt's current access with the access on the ID card.
		crypt.access.Cut()
		crypt.access = card.access
		to_chat(user, SPAN_NOTICE("Access upload completed!"))
		crypt.send_host_message("Access transponder code upload completed.")

