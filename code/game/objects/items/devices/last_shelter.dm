/obj/item/device/last_shelter
	name = "Last Shelter"
	desc = "A curious Mekhanite device capable of retrieving core implants of those stranded in space."
	icon = 'icons/obj/faction_item.dmi'
	icon_state = "last_shelter"
	item_state = "last_shelter"
	price_tag = 20000
	origin_tech = list(TECH_MAGNET = 5, TECH_BLUESPACE = 9, TECH_BIO = 3)
	spawn_frequency = 0
	spawn_blacklisted = TRUE
	var/cooldown = 15 MINUTES
	var/last_teleport = -15 MINUTES
	var/scan = FALSE

/obj/item/device/last_shelter/attack_self(mob/user)
	if(world.time >= (last_teleport + cooldown))
		to_chat(user, SPAN_NOTICE("The [src] scans deep space for core implants, it will take a while..."))
		last_teleport = world.time
		scan = TRUE
		var/obj/item/weapon/implant/core_implant/soulcrypt/soulcrypt = get_cruciform()
		if(soulcrypt)
			scan = FALSE
			if(istype(src.loc, /mob/living/carbon/human))
				user.put_in_hands(soulcrypt)
<<<<<<< HEAD
				to_chat(user, SPAN_NOTICE("The [src] has found a stranded core implant! The fate of this Child is now in your hands."))
=======
				to_chat(user, SPAN_NOTICE("The [src] has found the lost cruciform in a deep space. Now this fate of the disciple rests in your hands."))
>>>>>>> 37f44aa... Merge pull request #215 from Michiyamenotehifunana/ChurchPort
			else
				visible_message(SPAN_NOTICE("[src] drops [soulcrypt]."))
				soulcrypt.forceMove(get_turf(src))
		else
			to_chat(user, SPAN_WARNING("The [src] couldn't find anything."))
			scan = FALSE

	else if(scan)
		to_chat(user, SPAN_WARNING("The [src] is still woking! Wait a minute!"))

	else
		to_chat(user, SPAN_WARNING("The [src] needs time to recharge!"))

/obj/item/device/last_shelter/proc/get_cruciform()
	var/datum/mind/MN = request_player()
	if(!MN)
		return FALSE
	var/mob/living/carbon/human/H = new /mob/living/carbon/human(src)
	for(var/stat in ALL_STATS)
		H.stats.changeStat(stat, rand(STAT_LEVEL_ADEPT, STAT_LEVEL_PROF))
	var/datum/perk/perk_random = pick(subtypesof(/datum/perk/oddity))
	H.stats.addPerk(perk_random)
	H.stats.addPerk(pick(/datum/perk/survivor, /datum/perk/selfmedicated, /datum/perk/vagabond, /datum/perk/merchant, /datum/perk/inspiration))
	var/obj/item/weapon/implant/core_implant/soulcrypt/soulcrypt = new /obj/item/weapon/implant/core_implant/soulcrypt(src)
	soulcrypt.install(H)
	qdel(H)
	return soulcrypt

/obj/item/device/last_shelter/proc/request_player()
	var/agree_time_out = FALSE
	var/request_timeout = 60 SECONDS
	var/datum/mind/MN

	for(var/mob/observer/ghost/O in GLOB.player_list)
		if(O.client)
			O << 'sound/effects/magic/blind.ogg' //Play this sound to a player whenever when he's chosen to decide.
			if(alert(O, "Do you want to be cloned as NT disciple? Hurry up, you have 60 seconds to make choice!","Player Request","OH YES","No, I'm autist") == "OH YES")
				if(!agree_time_out)
					if(MN)
						to_chat(O, SPAN_WARNING("Somebody already took this place."))
						return

					O.mind = new /datum/mind(O.ckey)
					MN = O.mind
				else
					to_chat(O, SPAN_WARNING("You are too slow. Try to be faster next time."))
					return

	sleep(request_timeout)
	agree_time_out = TRUE
	return MN
