/datum/chemical_reaction/trichloramine
	result = "liquid_chlor"
	required_reagents = list("ammonia" = 1, "kelotane" = 1)		//Kelotaine, because for some reason there's no chlorine in the bloody menu!
	result_amount = 0.4

/*                        BIG FAT DISCLAIMER
 * I have never mixed this, intentionally or not. I do not know what sound it'll
 * make, if any. All I have to go off of is this is "violently explosive".
 * DO NOT ATTEMPT THIS FOR MY INFORMATION. JUST DON'T. I DON'T NEED TO KNOW.
 * I HAVE ENOUGH REFERENCE MATERIAL FROM THE UNIVERSITY OF BRISTOL SCHOOL OF
 * CHEMISTRY WITHOUT SOME MORON GOING OUT THERE KILLING THEMSELVES TO GET MORE.
 * DON'T BE THE MORON.
 * DON'T INTENTIONALLY MIX THIS.			^Spitzer
 */

	mix_message = "The solution makes a loud pop!"
	reaction_sound = 'sound/effects/snap.ogg'

/datum/chemical_reaction/trichloramine/on_reaction(var/datum/reagents/holder, var/created_volume)
	//deal humanoid damage first
	if(created_volume > 10)		//You can create less than 10u at a time safely. Not much more, though...
		var/datum/effect/effect/system/reagents_explosion/e = new()
		e.set_up(round (created_volume/2, 1), holder.my_atom, 0, 0)			//five times as strong as potassium per unit, but also a tenth of the units created.
		if(isliving(holder.my_atom))										//in reality, it's less of the explosion, but with added area denial.
			e.amount *= 0.5													//a 120 unit beaker will have an effective blast of 12.0, compared to potassium's 24
			var/mob/living/L = holder.my_atom
			if(L.stat != DEAD)
				e.amount *= 0.5
		e.start()

	//create toxic death cloud
	var/turf/location = get_turf(holder.my_atom.loc)
	for(var/turf/simulated/floor/target_tile in range(0,location))
		target_tile.assume_gas("trichloramine", created_volume*4, PHORON_MINIMUM_BURN_TEMPERATURE - 25)	//the remaining 80% of the reagent is turned into hot gas
	return

/datum/chemical_reaction/ausgiftrol
	result = "ausgiftrol"
	required_reagents = list("fuel" = 2, "liquid_chlor" = 5, "radium" = 1)		//8 units in
	result_amount = 4
	maximum_temperature = 253

/datum/chemical_reaction/oblomovin
	result = "oblomovin"
	required_reagents = list("clonexadone" = 1, "tungsten" = 1, "plasma" = 2, "ethanol" = 2)
	catalysts = list("plasma" = 5)
	result_amount = 1

