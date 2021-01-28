/datum/antagonist/carrion
	id = ROLE_CARRION
	role_text = "Carrion"
	role_text_plural = "Carrions"
	restricted_jobs = list("AI", "Robot")
	protected_jobs = list(JOBS_SECURITY, JOBS_COMMAND)
	bantype = ROLE_BANTYPE_CARRION
	welcome_text = "Every culture has a bogeyman, a terrifying, supernatural creature spoken about in hushed tones and used to scare children into misbehaving. The difference is that you actually exist. You are a Carrion, first created by Lazarus scientists trying to gain an edge in the Corporate Wars. The first of your kind broke free, and spread to the stars, now known space and beyond are full of terrifying stories of colonies that disappeared overnight, of ships whose crews died screaming. Fortunately for the Northern Light, you aren’t here to slaughter them all, not unless they push you to it. Your true masters have a plan, and you are the unstoppable instrument of their will. Your body is ever changing, you should start by evolving a chemical vessel to use your powers. A carrion maw can be a good way to earn evolution points. You can complete contracts to grow stronger until the entire ship is  your plaything. Be patient, a slow, methodical approach is recommended. Your enemies are many, and your disguise will not hold up to an in-depth scan. Beware of the Children of Mekhane in particular, who are protected from your infection spiders, and may be able to identify and out you before you are ready. You won’t find many friends here, but spiders are one of them. If you feel alone, you can always give birth to your own children, or search the ship for your brothers and sisters."

	antaghud_indicator = "hudchangeling"


	survive_objective = null
	allow_neotheology = FALSE

	stat_modifiers = list(
		STAT_TGH = 5,
		STAT_VIG = 15,
		STAT_BIO = 20 //Good at surgery
	)

/datum/antagonist/carrion/special_init()
	owner.current.make_carrion()

/datum/antagonist/carrion/can_become_antag(datum/mind/player)
	if(..() && ishuman(player.current))
		var/mob/living/carbon/human/H = player.current
		if(H.isSynthetic())
			return FALSE
		if(H.species.flags & NO_SCAN)
			return FALSE
		return TRUE
	return FALSE

/datum/antagonist/carrion/equip()
	var/mob/living/L = owner.current

	for(var/name in stat_modifiers)
		L.stats.changeStat(name, stat_modifiers[name])
		
	spawn_uplink(L, 5)
