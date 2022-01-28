/datum/reagent/medicine/oblomovin
	name = "Oblomovin"
	id = "oblomovin"
	description = "A highly toxic compound used to treat Kurolesov\'s syndrome. Needs a high body temperature to properly metabolize."
	taste_description = "battery acid"
	reagent_state = LIQUID
	color = "#fc0349"
	metabolism = REM * 0.5
	scannable = 1

/datum/reagent/medicine/oblomovin/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	var/datum/perk/kurolesovsyndrome/KS = M.stats.getPerk(/datum/perk/kurolesovsyndrome)
	if(prob(5))
		M.custom_emote(1,"twitches and gags.")
	if(M.bodytemperature > 330)
		if(!KS)
			M.take_organ_damage(effect_multiplier)
		else if(prob(10) && !KS.cured)
			M.custom_emote(1,"goes completely limp.")
			KS.cure()

	else
		M.take_organ_damage(3 * effect_multiplier)
