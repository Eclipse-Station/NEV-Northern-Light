/datum/antagonist/marshal
	id = ROLE_MARSHAL
	role_text = "Bounty Hunter" //syzygy edit
	role_text_plural = "Bounty Hunters" //syzygy edit
	bantype = ROLE_BANTYPE_CREW_SIDED
	protected_jobs = list(JOBS_COMMAND, JOBS_SECURITY)
	antaghud_indicator = "huddeathsquad"

	possible_objectives = list(
	/datum/objective/assassinate/marshal = 100,
	)

	survive_objective = /datum/objective/escape

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_VIG = 15
	)

	welcome_text = "You are a freelance bounty hunter, contracted to bring in a wanted fugitive, dead or alive.\n\
	You are NOT affiliated with the crew, and if you get caught, you will be prosecuted like any other criminal. Stay weary \
	and you just might make it out of this with a sizeable paycheck." //syzygy edit

/datum/antagonist/marshal/can_become_antag(datum/mind/M)
	if(!..())
		return FALSE
	return TRUE

/datum/antagonist/marshal/equip()
	var/mob/living/L = owner.current

	for(var/name in stat_modifiers)
		L.stats.changeStat(name, stat_modifiers[name])

	if(!owner.current)
		return FALSE

	spawn_uplink(owner.current)

	return TRUE
