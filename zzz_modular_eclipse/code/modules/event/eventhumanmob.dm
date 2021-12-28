/mob/living/carbon/human/event
	name = "Ol\'Kramp"
	icon = 'zzz_modular_eclipse/icons/mob/him.dmi'
	desc = "Nefarious festive horror of the deep space!"
	icon_state = "krampus"
	var/points = 1000 //mischief limit
	universal_understand = TRUE
	status_flags = GODMODE

/mob/living/carbon/human/event/examine(mob/user)//Have to write a snowflakey one because human overrides
	var/msg = "<span class='info'>*---------*\nThis is [name] *---------*</span>"
	msg += "\n"
	if(icon)
		msg += "\icon[icon] "
	msg += desc

	to_chat(user, msg)


/mob/living/carbon/human/event/update_icons() //Ditto
	return


/mob/living/carbon/human/event/verb/bstwalk()
	set name = "Ruin Everything"
	set desc = "Uses festive powers to phase through solid matter and move quickly."
	set category = "Event"
	set popup_menu = 0

	if(!HasMovementHandler(/datum/movement_handler/mob/incorporeal))
		if(points > 50)
			points = points - 50
			to_chat(src, SPAN_NOTICE("You will now phase through solid matter."))
			incorporeal_move = TRUE
			ReplaceMovementHandler(/datum/movement_handler/mob/incorporeal)
		else
			to_chat(src, SPAN_NOTICE("No points!"))
	else
		to_chat(src, SPAN_NOTICE("You will no-longer phase through solid matter."))
		incorporeal_move = FALSE
		RemoveMovementHandler(/datum/movement_handler/mob/incorporeal)

/mob/living/carbon/human/event/verb/bstrecover()
	set name = "Rejuv"
	set desc = "Use the festive magics within you to restore your health"
	set category = "Event"
	set popup_menu = FALSE

	src.revive()