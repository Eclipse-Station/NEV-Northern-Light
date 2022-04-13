/datum/reagent/medicine/ausgiftrol
	name = "Ausgiftrol"
	id = "ausgiftrol"
	description = "Ausgiftrol is a specialized antivenin, used to purge spider and roach venom from the body far more quickly and effectively than dylovene, but is not quite as effective as an antitoxin. Administer via injection."
	taste_description = "bleach"
	reagent_state = LIQUID
	color = "#4e1b1e"
	scannable = 1

/datum/reagent/medicine/ausgiftrol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	if(alien == IS_SLIME)		//Slime people are inherently toxic. This is a mild antitoxin.
		if(prob(5))
			M.vomit()
	M.adjustToxLoss(-((0.3 + (M.getToxLoss() * 0.05)) * effect_multiplier))		//75% as effective as an antitoxin compared to dylo
	holder.remove_reagent("pararein", 0.8 )		//400% as effective as an antivenin compared to dylo
	holder.remove_reagent("blattedin", 0.8 )	//Same.

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
