#define WELCOME_SERBS "You are one of the Serbians. A team of professional, highly trained, and well equipped soldiers of fortune. You have been selected for a dangerous, potentially suicidal mission aboard the NEV Northern Light.<br>\
	<br>\
	You are currently aboard your base preparing for your mission. In the armoury you will find a wide variety of weapons and tools to use to complete your mission. Take a pistol, a rifle, a knife, and a SCAF suit as your basic loadout.<br>\
	Once you have your basic gear, you may select a specialist weapon, like an RPG, or the Pulemyot Kalashnikova. These are powerful, but bulky weapons, so choose wisely. Discuss your specialties with your team, and develop a strategy to achieve your objectives.<br>\
	<br>\
	Remember to take everything you think you may need on board your ship with you. You will not be able to return to the base once you have departed for your mission. You do have an uplink on your ship to supply any extra equipment you might need. <br>\
	Once you are ready, use the console on the shuttle’s bridge to begin your mission. The Northern Light’s sensors will detect your approach before you arrive, so stealth is not an option. Once you arrive, you will have a strict limit to achieve your objective and return to base."

/datum/faction/mercenary
	id = FACTION_SERBS
	name = "Serbians"
	antag = "soldier"
	antag_plural = "soldiers"
	welcome_text = WELCOME_SERBS

	hud_indicator = "mercenary"

	possible_antags = list(ROLE_MERCENARY)

	faction_invisible = FALSE

	var/objectives_num
	var/list/possible_objectives = list(
	/datum/objective/harm = 15,
	/datum/objective/steal = 55,
	/datum/objective/assassinate = 35,
	/datum/objective/abduct = 15)
	var/objective_quantity = 6

	//How long the mercenaries get to do their mission



/datum/faction/mercenary/create_objectives()
	objectives.Cut()
	pick_objectives(src, possible_objectives, objective_quantity)

	new /datum/objective/timed/merc(src)

	..()


/datum/faction/mercenary/add_leader(var/datum/antagonist/member, var/announce = TRUE)
	.=..()
	if (.)
		//put the commander outfit on
		var/decl/hierarchy/outfit/O = outfit_by_type(/decl/hierarchy/outfit/antagonist/mercenary/commander)
		O.equip(member.owner.current, OUTFIT_ADJUSTMENT_NO_RESET)

		//The commander can speak english
		member.owner.current.add_language(LANGUAGE_COMMON)

		member.create_id("Commander")


/* Special inventory proc for mercenaries. Includes the content of their base and ship. So any loot that they haul
back to their ship counts for objectives.
This could potentially return a list of thousands of atoms, but thats fine. Its not as much work as it sounds */
/datum/faction/mercenary/get_inventory()
	var/list/contents = ..()
	var/list/search_areas = list(/area/shuttle/mercenary, /area/centcom/merc_base)
	for (var/a in search_areas)
		contents |= get_area_contents(a)

	return contents
