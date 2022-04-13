/datum/reagent/toxin/trichloramine
	name = "liquid chloramines"
	id = "liquid_chlor"
	description = "A byproduct of mixing chlorine and ammonia, chloramines are used as a cheap source of water sanitization. Production of this is generally described as 'violently explosive'."
	taste_description = "bleach"
	reagent_state = LIQUID
	color = "#9B8303"
	strength = 0.025			//Half that of toxins.
	
/datum/reagent/toxin/trichloramine/affect_touch(var/mob/living/carbon/M, var/alien, var/effect_multiplier)
	switch(alien)
		if(IS_VOX)
			M.heal_organ_damage(0.2 * effect_multiplier, 0.2 * effect_multiplier)		//very, very small healing effect.
		if(IS_SLIME)
			M.heal_organ_damage(0.4 * effect_multiplier, 0.4 * effect_multiplier)		//prommies get a little bit more of a healing effect
		else
			M.take_organ_damage(0, effect_multiplier * 0.2) //minor chemical burns; it is a skin irritant

/datum/reagent/toxin/trichloramine/affect_blood(var/mob/living/carbon/M, var/alien, var/effect_multiplier)

	switch(alien)
		if(IS_VOX)		//shitbirds heal from this crap. Somehow. Don't ask me I'm not a chemist.
			metabolism = REM		//gotta metabolise fast!
			var/effective_dose = dose

			//Bad effects: Drowsiness.
			if(effective_dose < 5)
				if(effective_dose == metabolism * 2 || prob(5))
					M.emote("yawn")
			else if(effective_dose < 10)
				M.eye_blurry = max(M.eye_blurry, 10)
			else if(effective_dose < 25)
				if(prob(50))
					M.Weaken(2)
				M.drowsyness = max(M.drowsyness, 20)
			else
				M.sleeping = max(M.sleeping, 20)
				M.drowsyness = max(M.drowsyness, 60)

			//Beneficial effects: Heals brute, burn, and toxins. 1 unit/tick each.
			M.adjustOxyLoss(-3 * effect_multiplier)
			M.heal_organ_damage(1 * effect_multiplier, 1 * effect_multiplier)
			M.adjustToxLoss(-1 * effect_multiplier)
			
		if(IS_SLIME)		//Slimes heal, too, doubly so compared to Vox.
			metabolism = REM
			var/effective_dose = dose
			
			//Harmful effects: Drowsiness.
			if(effective_dose < 10)
				if(effective_dose == metabolism * 2 || prob(5))
					M.emote("yawn")
			else if(effective_dose < 25)
				M.eye_blurry = max(M.eye_blurry, 10)
			else if(effective_dose < 40)
				if(prob(50))
					M.Weaken(2)
				M.drowsyness = max(M.drowsyness, 20)
			else
				M.sleeping = max(M.sleeping, 20)
				M.drowsyness = max(M.drowsyness, 60)

			//Beneficial effects: Heals brute and burn. 2 units/tick each.
			M.heal_organ_damage(2 * effect_multiplier, 2 * effect_multiplier)
			M.adjustOxyLoss(-6 * effect_multiplier)
		else
			..()
