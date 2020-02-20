/proc/alien_queen_exists(var/ignore_self,var/mob/living/carbon/human/self)
	for(var/mob/living/carbon/human/Q in GLOB.living_mob_list)
		if(self && ignore_self && self == Q)
			continue
		if(Q.species.name != "Xenomorph Queen")
			continue
		if(!Q.key || !Q.client || Q.stat)
			continue
		return TRUE
	return FALSE

/mob/living/carbon/human/proc/gain_phoron(var/amount)

	var/obj/item/organ/internal/xenos/phoronvessel/I = internal_organs_by_name[BP_PHORON]
	if(!istype(I)) return

	if(amount)
		I.stored_phoron += amount
	I.stored_phoron = max(0,min(I.stored_phoron,I.max_phoron))
