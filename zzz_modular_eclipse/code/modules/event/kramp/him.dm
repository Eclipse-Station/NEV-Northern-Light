

ADMIN_VERB_ADD(/client/proc/cmd_dev_kramp, R_ADMIN|R_DEBUG, TRUE)

/client/proc/cmd_dev_kramp()
	set category = "Debug"
	set name = "Spawn Ol Kramp"
	set desc = "Spawns Krampus to mess with crew"


	if(!check_rights(R_ADMIN|R_DEBUG))
		return

	var/T = get_turf(usr)
	var/mob/living/carbon/human/event/kramp/bst = new(T)
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

/client/proc/kramp_post_spawn(mob/living/carbon/human/event/kramp/kramp)
	new /obj/effect/sparks/jpeg_boom(get_turf(kramp))
	kramp.anchored = FALSE



/mob/living/carbon/human/event/kramp
	name = "Ol\'Kramp"
	icon = 'zzz_modular_eclipse/icons/mob/him.dmi'
	desc = "Nefarious festive horror of the deep space!"
	icon_state = "krampus"
	universal_understand = TRUE
	status_flags = GODMODE



/mob/living/carbon/human/event/kramp/New()
	..()
	name = "Ol\'Kramp"
	real_name = "Ol\'Kramp"
	voice_name = "screechy voice"
	faction = "krampus"


/mob/living/carbon/human/event/update_icons() //Ditto
	icon_state = "krampus"
	return

/mob/living/carbon/human/event/kramp/verb/givecone()
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



/mob/living/carbon/human/event/kramp/verb/givecake()
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


/mob/living/carbon/human/event/kramp/verb/giveshiv()
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


/mob/living/carbon/human/event/kramp/verb/giveft()
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


/mob/living/carbon/human/event/kramp/verb/drop_gifts()
	set name = "Drop gifts!"
	set desc = "Evil gift."
	set category = "Krampus"
	var/counter = rand(4, 7)
	var/victims = list()
	while(counter > 0)
		if(GLOB.human_mob_list.len)
			var/mob/living/carbon/human/V = pick(GLOB.human_mob_list)
			if(V.isMonkey())
				continue
			else
				victims += V
				counter--
		else
			break
			return
	for(var/mob/living/carbon/human/H in victims)
		var/turfs = list()
		for(var/turf/T in oview(H , 5))
			turfs += T
		new /obj/effect/falling_effect/evil_gift_drop(pick(turfs), /mob/living/simple_animal/hostile/foolbox/strong)