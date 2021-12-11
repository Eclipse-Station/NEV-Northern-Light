

ADMIN_VERB_ADD(/client/proc/cmd_dev_kramp, R_ADMIN|R_DEBUG, TRUE)

/client/proc/cmd_dev_kramp()
	set category = "Debug"
	set name = "Spawn Ol Kramp"
	set desc = "Spawns Krampus to mess with crew"


	if(!check_rights(R_ADMIN|R_DEBUG))
		return

	var/T = get_turf(usr)
	var/mob/living/carbon/human/kramp/bst = new(T)
	bst.ckey = usr.ckey
	var/list/stat_modifiers = list(
		STAT_ROB = 99,
		STAT_TGH = 99,
		STAT_BIO = 99,
		STAT_MEC = 99,
		STAT_VIG = 99,
		STAT_COG = 99
	)
	for(var/stat in stat_modifiers)
		bst.stats.changeStat(stat, stat_modifiers[stat])

	var/obj/item/card/id/bst/id = new/obj/item/card/id/bst(bst)
	id.registered_name = bst.real_name
	id.assignment = "Bluespace Technician"
	id.name = "[id.assignment]"
	bst.equip_to_slot_or_del(id, slot_wear_id)
	bst.equip_to_slot_or_del(new /obj/item/device/radio/headset/ert/bst(bst), slot_l_ear)

	spawn(1)
		kramp_post_spawn(bst)

/client/proc/kramp_post_spawn(mob/living/carbon/human/kramp/kramp)
	new /obj/effect/sparks/jpeg_boom(get_turf(kramp))
	kramp.anchored = FALSE



/mob/living/carbon/human/kramp
	name = "Ol\'Kramp"
	icon = 'zzz_modular_eclipse/icons/mob/him.dmi'
	desc = "Nefarious festive horror of the deep space!"
	icon_state = "krampus"
	universal_understand = TRUE
	status_flags = GODMODE
	var/points = 1000 //Kramp's mischief limit


/mob/living/carbon/human/kramp/New()
	..()
	name = "Ol\'Kramp"
	real_name = "Ol\'Kramp"
	voice_name = "screechy voice"
	faction = "krampus"

/mob/living/carbon/human/kramp/examine(mob/user)//Have to write a snowflakey one because human overrides
	var/msg = "<span class='info'>*---------*\nThis is [name] *---------*</span>"
	msg += "\n"
	if(icon)
		msg += "\icon[icon] "
	msg += desc

	to_chat(user, msg)


/mob/living/carbon/human/kramp/update_icons() //Ditto
	icon_state = "krampus"
	return

/mob/living/carbon/human/kramp/verb/bstwalk()
	set name = "Ruin Everything"
	set desc = "Uses festive powers to phase through solid matter and move quickly."
	set category = "Krampus"
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

/mob/living/carbon/human/kramp/verb/bstrecover()
	set name = "Rejuv"
	set desc = "Use the festive magics within you to restore your health"
	set category = "Krampus"
	set popup_menu = FALSE

	src.revive()

/mob/living/carbon/human/kramp/verb/givecone()
	set name = "Pinecone!"
	set desc = "Pinecone."
	set category = "Krampus"
	set popup_menu = 0

	if(points > 15)
		points = points - 15
		var/obj/item/grenade/pinade/P = new /obj/item/grenade/pinade(src)
		put_in_active_hand(P)
	else
		to_chat(src, SPAN_NOTICE("No points!"))



/mob/living/carbon/human/kramp/verb/givecake()
	set name = "Fruitcake!"
	set desc = "Fruitcake."
	set category = "Krampus"
	set popup_menu = 0

	if(points > 15)
		points = points - 15
		var/obj/item/grenade/fruitcake/P = new /obj/item/grenade/fruitcake(src)
		put_in_active_hand(P)
	else
		to_chat(src, SPAN_NOTICE("No points!"))


/mob/living/carbon/human/kramp/verb/giveshiv()
	set name = "Candy cane!"
	set desc = "Candy cane."
	set category = "Krampus"
	set popup_menu = 0

	if(points > 15)
		points = points - 15
		var/obj/item/tool/knife/switchblade/candy_cane/P = new /obj/item/tool/knife/switchblade/candy_cane(src)
		put_in_active_hand(P)
	else
		to_chat(src, SPAN_NOTICE("No points!"))


/mob/living/carbon/human/kramp/verb/giveft()
	set name = "Evil gift!"
	set desc = "Evil gift."
	set category = "Krampus"
	set popup_menu = 0

	if(points > 15)
		points = points - 15
		var/obj/item/grenade/evilgift/P = new /obj/item/grenade/evilgift(src)
		put_in_active_hand(P)
	else
		to_chat(src, SPAN_NOTICE("No points!"))

