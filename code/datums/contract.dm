GLOBAL_LIST_EMPTY(all_antag_contracts)

/datum/antag_contract
	var/name
	var/desc
	var/reward = 0
	var/completed = FALSE
	var/unique = FALSE

/datum/antag_contract/proc/can_place()
	if(unique)
		for(var/datum/antag_contract/C in GLOB.all_antag_contracts)
			if(istype(C, type) && !C.completed)
				return FALSE
	return !!name

/datum/antag_contract/proc/place()
	GLOB.all_antag_contracts += src

/datum/antag_contract/proc/complete(datum/mind/M)
	if(completed)
		warning("Contract completed twice: [name] [desc]")
	completed = TRUE
	for(var/obj/item/device/uplink/U in world_uplinks)
		if(U.uplink_owner != M)
			continue
		U.uses += reward
		break


/datum/antag_contract/item

/datum/antag_contract/item/proc/on_container(obj/item/weapon/storage/bsdm/container)
	if(check(container))
		complete(container.owner)

/datum/antag_contract/item/proc/check(obj/item/weapon/storage/container)
	warning("Item contract does not implement check(): [name] [desc]")
	return FALSE



/datum/antag_contract/implant
	name = "Implant"
	reward = 14
	var/mob/living/carbon/human/target

/datum/antag_contract/implant/New()
	var/list/candidates = SSticker.minds.Copy()
	for(var/datum/antag_contract/implant/C in GLOB.all_antag_contracts)
		candidates -= C.target.mind
	while(candidates.len)
		var/datum/mind/target_mind = pick(candidates)
		var/mob/living/carbon/human/H = target_mind.current
		if(!istype(H) || H.stat == DEAD)
			candidates -= target_mind
			continue
		target = H
		desc = "Implant [target.real_name] with a spying implant."
		break
	..()

/datum/antag_contract/implant/can_place()
	return ..() && target

/datum/antag_contract/implant/proc/check(obj/item/weapon/implant/spying/implant)
	if(completed)
		return
	if(implant.wearer == target)
		complete(implant.owner)


#define CONTRACT_RECON_TARGET_COUNT 3

/datum/antag_contract/recon
	name = "Recon"
	reward = 12
	var/list/area/targets = list()

/datum/antag_contract/recon/New()
	var/list/candidates = ship_areas.Copy()
	for(var/datum/antag_contract/recon/C in GLOB.all_antag_contracts)
		if(C.completed)
			continue
		candidates -= C.targets
	while(candidates.len && targets.len < CONTRACT_RECON_TARGET_COUNT)
		var/area/target = pick(candidates)
		if(target.is_maintenance)
			candidates -= target
			continue
		targets += target
	desc = "Activate 3 spying sensors in [english_list(targets, and_text = " or ")] and let them work without interruption for 10 minutes."
	..()

/datum/antag_contract/recon/can_place()
	return ..() && targets.len

/datum/antag_contract/recon/proc/check(obj/item/device/spy_sensor/sensor)
	if(completed)
		return
	if(get_area(sensor) in targets)
		complete(sensor.owner)


/datum/antag_contract/derail
	name = "Derail"
	unique = TRUE
	reward = 14
	var/count

/datum/antag_contract/derail/New()
	count = rand(3,5)
	desc = "Break minds of [count] people with your mind fryer."
	..()

/datum/antag_contract/derail/proc/report(obj/item/device/mind_fryer/mindfryer)
	if(completed)
		return
	complete(mindfryer.owner)


/datum/antag_contract/item/assasinate
	name = "Assasinate"
	reward = 12
	var/obj/item/target
	var/datum/mind/target_mind

/datum/antag_contract/item/assasinate/New()
	..()
	var/list/candidates = SSticker.minds.Copy()
	for(var/datum/antag_contract/item/assasinate/C in GLOB.all_antag_contracts)
		candidates -= C.target_mind
	while(candidates.len)
		target_mind = pick(candidates)
		var/mob/living/carbon/human/H = target_mind.current
		if(!istype(H) || H.stat == DEAD)
			candidates -= target_mind
			continue
		target = H.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)
		if(!target)
			target = H.organs_by_name[BP_HEAD]
		desc = "Assasinate [target_mind.current.real_name] and send [gender_datums[target_mind.current.gender].his] [target.name] via BSDM as a proof."
		break

/datum/antag_contract/item/assasinate/can_place()
	return ..() && target

/datum/antag_contract/item/assasinate/check(obj/item/weapon/storage/container)
	return target in container


/datum/antag_contract/item/steal
	name = "Steal"
	reward = 10
	var/target_desc
	var/target_type

	var/static/list/possible_items = list(
		"the captain's antique laser gun" = /obj/item/weapon/gun/energy/captain,
		"a hand teleporter" = /obj/item/weapon/hand_tele,
		"an RCD" = /obj/item/weapon/rcd,
		"a jetpack" = /obj/item/weapon/tank/jetpack,
		"a captain's jumpsuit" = /obj/item/clothing/under/rank/captain,
		"a functional AI" = /obj/item/device/aicard,
		"the Technomancer Exultant's advanced voidsuit control module" = /obj/item/weapon/rig/ce,
		"the station blueprints" = /obj/item/blueprints,
		"a nasa voidsuit" = /obj/item/clothing/suit/space/void,
		"a sample of slime extract" = /obj/item/slime_extract,
		"a piece of corgi meat" = /obj/item/weapon/reagent_containers/food/snacks/meat/corgi,
		"a Moebius expedition overseer's jumpsuit" = /obj/item/clothing/under/rank/expedition_overseer,
		"a exultant's jumpsuit" = /obj/item/clothing/under/rank/exultant,
		"a Moebius biolab officer's jumpsuit" = /obj/item/clothing/under/rank/moebius_biolab_officer,
		"a Ironhammer commander's jumpsuit" = /obj/item/clothing/under/rank/ih_commander,
		"a First Officer's jumpsuit" = /obj/item/clothing/under/rank/first_officer,
		"the hypospray" = /obj/item/weapon/reagent_containers/hypospray,
		"the captain's pinpointer" = /obj/item/weapon/pinpointer,
		"an ablative armor vest" = /obj/item/clothing/suit/armor/laserproof,
		"an Ironhammer hardsuit control module" = /obj/item/weapon/rig/combat/ironhammer
	)

/datum/antag_contract/item/steal/New()
	..()
	if(!target_type)
		var/list/candidates = possible_items.Copy()
		for(var/datum/antag_contract/item/steal/C in GLOB.all_antag_contracts)
			candidates.Remove(C.target_desc)
		if(candidates.len)
			target_desc = pick(candidates)
			target_type = possible_items[target_desc]
			desc = "Steal [target_desc] and send it via BSDM."

/datum/antag_contract/item/steal/can_place()
	return ..() && target_type

/datum/antag_contract/item/steal/check(obj/item/weapon/storage/container)
	return locate(target_type) in container


/datum/antag_contract/item/steal/docs
	unique = TRUE
	reward = 12
	target_type = /obj/item/weapon/oddity/secdocs
	desc = "Steal the secret documents and send them via BSDM."


/datum/antag_contract/item/dump
	name = "Dump"
	unique = TRUE
	reward = 8
	var/sum

/datum/antag_contract/item/dump/New()
	..()
	sum = rand(30, 40) * 500
	desc = "Extract a sum of [sum] credits from Eris economy and send it via BSDM."

/datum/antag_contract/item/dump/check(obj/item/weapon/storage/container)
	var/received = 0
	for(var/obj/item/weapon/spacecash/cash in container)
		received += cash.worth
	return received >= sum


/datum/antag_contract/item/blood
	name = "Steal blood samples"
	unique = TRUE
	reward = 10
	var/count

/datum/antag_contract/item/blood/New()
	..()
	count = rand(3, 6)
	desc = "Send blood samples of [count] different people in separate containers via BSDM."

/datum/antag_contract/item/blood/check(obj/item/weapon/storage/container)
	var/list/samples = list()
	for(var/obj/item/weapon/reagent_containers/C in container)
		var/list/data = C.reagents?.get_data("blood")
		if(!data || data["species"] != "Human" || data["blood_DNA"] in samples)
			continue
		samples += data["blood_DNA"]
		if(samples.len >= count)
			return TRUE
	return FALSE


/datum/antag_contract/item/research
	name = "Steal research"
	unique = TRUE
	reward = 6
	var/list/targets = list()
	var/static/counter = 0

/datum/antag_contract/item/research/New()
	..()
	var/list/candidates = SSresearch.all_designs.Copy()
	for(var/datum/antag_contract/item/research/C in GLOB.all_antag_contracts)
		candidates -= C.targets
	while(candidates.len && targets.len < 8)
		var/datum/design/D = pick(candidates)
		targets += D
		candidates -= D
	desc = "Send a disk with one of the following designs via BSDM: [english_list(targets, and_text = " or ")]."

/datum/antag_contract/item/research/can_place()
	return ..() && targets.len && counter < 3

/datum/antag_contract/item/research/place()
	..()
	++counter

/datum/antag_contract/item/research/check(obj/item/weapon/storage/container)
	for(var/obj/item/weapon/computer_hardware/hard_drive/H in container)
		for(var/datum/computer_file/binary/design/D in H.stored_files)
			if(D.design in targets)
				return TRUE
	return FALSE
