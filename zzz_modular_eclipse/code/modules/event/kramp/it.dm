

ADMIN_VERB_ADD(/client/proc/cmd_dev_sacks, R_ADMIN|R_DEBUG, TRUE)

/client/proc/cmd_dev_sacks()
	set category = "Debug"
	set name = "Spawn Mr Sacks"
	set desc = "Spawns Mr Sacks to mess with crew"


	if(!check_rights(R_ADMIN|R_DEBUG))
		return

	var/T = get_turf(usr)
	var/mob/living/carbon/human/event/sacks/bst = new(T)
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
	id.assignment = "Stolen ID"
	id.name = "[id.assignment]"
	bst.equip_to_slot_or_del(id, slot_wear_id)
	bst.equip_to_slot_or_del(new /obj/item/device/radio/headset/ert/bst(bst), slot_l_ear)


/mob/living/carbon/human/event/sacks
	name = "Mr Sacks"
	icon = 'zzz_modular_eclipse/icons/mob/curator.dmi'
	desc = "A grand figure draped in crimson robes."
	icon_state = "sacks"
	universal_understand = TRUE
	status_flags = GODMODE


/mob/living/carbon/human/event/sacks/New()
	..()
	name = "Mr Sacks"
	real_name = "Mr Sacks"
	voice_name = "squeaky voice"
	faction = "sacks"
	update_icons()

/mob/living/carbon/human/event/sacks/update_icons()
	icon_state = "sacks"
	overlays.Cut()
	var/image/sack = image(icon, "sack")
	overlays += sack
	return