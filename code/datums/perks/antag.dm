/datum/perk/kurolesovsyndrome
	name = "Kurolesov\'s Syndrome"
	desc = "Mischief courses through your veins."
	icon_state = "grab"

	var/cured = FALSE

	gain_text = "You feel a surge of ambition, anger and purpose course through you."
	lose_text = "You feel in control of your emotions again."

/datum/perk/kurolesovsyndrome/assign(mob/living/carbon/human/H)
	..()
	if(holder)
		holder.stats.addTempStat(STAT_ROB, 15, INFINITY, "Kurolesov")
		holder.stats.addTempStat(STAT_TGH, 15, INFINITY, "Kurolesov")
		holder.stats.addTempStat(STAT_BIO, 10, INFINITY, "Kurolesov")
		holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Kurolesov")
		holder.stats.addTempStat(STAT_VIG, 15, INFINITY, "Kurolesov")
		holder.stats.addTempStat(STAT_COG, 10, INFINITY, "Kurolesov")

/datum/perk/kurolesovsyndrome/proc/cure(mob/living/carbon/human/H)
	if(holder)
		holder.stats.removeTempStat(STAT_ROB, "Kurolesov")
		holder.stats.removeTempStat(STAT_TGH, "Kurolesov")
		holder.stats.removeTempStat(STAT_BIO, "Kurolesov")
		holder.stats.removeTempStat(STAT_MEC, "Kurolesov")
		holder.stats.removeTempStat(STAT_VIG, "Kurolesov")
		holder.stats.removeTempStat(STAT_COG, "Kurolesov")
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		name = "Cured Kurolesov\'s Syndrome"
		desc = "You are cured and immune (at least temporarily) to contracting the Syndrome again."
		cured = TRUE

		for(var/datum/individual_objective/objective in H.mind.individual_objectives)
			if(objective.limited_antag)
				H.mind.individual_objectives -= objective


/datum/perk/kurolesovsyndrome/remove()
	if(holder)
		holder.stats.removeTempStat(STAT_ROB, "Kurolesov")
		holder.stats.removeTempStat(STAT_TGH, "Kurolesov")
		holder.stats.removeTempStat(STAT_BIO, "Kurolesov")
		holder.stats.removeTempStat(STAT_MEC, "Kurolesov")
		holder.stats.removeTempStat(STAT_VIG, "Kurolesov")
		holder.stats.removeTempStat(STAT_COG, "Kurolesov")
	..()
