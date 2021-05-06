/datum/antagonist/borer
	id = ROLE_BORER
	landmark_id = "hidden-vent-antag"
	role_text = "Cortical Borer"
	role_text_plural = "Cortical Borers"
	mob_path = /mob/living/simple_animal/borer/roundstart
	bantype = ROLE_BANTYPE_BORER
	welcome_text = "The line between parasite and symbiote is fuzzy, but your slimy, slug-like body slithers across it. Your\
only goals are the same as every creature in this universe. Survive, and propagate your species.\n\n\
Use your infest power to crawl into the unprotected ear of a host and fuse with their brain. While you\
can force your will upon your host, doing so is difficult, taxing, and risks damaging it. Better to be clever\
and careful, why expend energy forcing them to do your bidding when you can convince them that it is\
in their best interests?\n\n\
Speak with your fellow borers with :x."
	antaghud_indicator = "hudborer"

	outer = TRUE
	only_human = FALSE

/datum/antagonist/borer/reproduced	//This antag datum will prevent all borers be roundstart
	id = ROLE_BORER_REPRODUCED
	selectable = FALSE
	outer = FALSE
	mob_path = /mob/living/simple_animal/borer

/datum/antagonist/borer/create_objectives(var/survive = FALSE)
	new /datum/objective/borer_survive (src)
	new /datum/objective/borer_reproduce (src)

/datum/antagonist/borer/create_survive_objective()
	return
