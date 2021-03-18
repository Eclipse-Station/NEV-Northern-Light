/datum/antagonist/marshal
	id = ROLE_MARSHAL
	role_text = "Aegis Bounty Hunter"
	role_text_plural = "Aegis Bounty Hunters"
	bantype = ROLE_BANTYPE_CREW_SIDED
	protected_jobs = list(JOBS_COMMAND, JOBS_SECURITY)
	antaghud_indicator = "huddeathsquad"

	possible_objectives = list(
	/datum/objective/assassinate/marshal = 100,
	)

	survive_objective = /datum/objective/survive

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_VIG = 15
	)

	welcome_text = "You are a civilian contractor who has been hired in secret by Aegis to apprehend a fugitive that they\
aren’t able to pursue openly. You know that one of the crew aboard this vessel is your prey, but not\
which one. \n\n\
Identify the fugitive, and apprehend them. Dead or alive doesn’t matter, but quietly is non-negotiable.\
Local Aegis on ship might assist your mission by turning a blind eye to your work, or even help you\
quietly, but you are not an Aegis employee. If you are caught by the public, they will disavow any\
knowledge of you."

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
