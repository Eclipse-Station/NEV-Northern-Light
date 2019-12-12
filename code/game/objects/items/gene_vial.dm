/obj/item/gene_vial
	name = "vial"
	desc = "A vial with genetic material."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bottle16" //paceholder
	var/empty = FALSE
	matter = list(MATERIAL_GLASS = 1)
	w_class = ITEM_SIZE_TINY

/obj/item/gene_vial/attack(mob/M, mob/living/user, def_zone)
	if(user != M || !istype(user))
		return ..()

	if(empty)
		to_chat(user, SPAN_WARNING("\The [src] is empty."))
		return

	var/mob/living/carbon/human/H = user
	if(istype(H))
		var/obj/item/blocked = H.check_mouth_coverage()
		if(blocked)
			to_chat(user, SPAN_WARNING("\The [blocked] is in the way!"))
			return

	to_chat(user, SPAN_NOTICE("You swallow the contents of \the [src]."))

	if(user.mind?.changeling)
		user.mind.changeling.geneticpoints += 3
	else
		user.adjustToxLoss(40)

	empty = TRUE
	desc += " There is none left."
