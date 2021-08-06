/datum/reagent/medicine/ausgiftrol
	name = "Ausgiftrol"
	id = "ausgiftrol"
	description = "Ausgiftrol is a specialized antivenin, used to purge spider and roach venom from the body far more quickly and effectively than dylovene, but is not quite as effective as an antitoxin. Administer via injection."
	taste_description = "bleach"
	reagent_state = LIQUID
	color = "#4e1b1e"
	scannable = 1

/datum/reagent/medicine/ausgiftrol/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.adjustToxLoss(-((0.3 + (M.getToxLoss() * 0.05)) * effect_multiplier))		//75% as effective as an antitoxin compared to dylo
	holder.remove_reagent("pararein", 0.8 )		//400% as effective as an antivenin compared to dylo
	holder.remove_reagent("blattedin", 0.8 )	//Same.