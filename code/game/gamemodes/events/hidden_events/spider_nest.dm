/*
Will spawn a spider nest at a random place on the ship.
This event will provide plausible deniability to Carrions,
as the crew can no longer positively ID them from seeing a spider's nest.
*/

/datum/storyevent/spider_nest
	id = "spider_nest"
	name = "spider_nest"

	weight = 0.5

	event_type = /datum/event/spider_nest
	event_pools = list(
		EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE
	)
	tags = list(TAG_COMBAT, TAG_NEGATIVE)


/datum/event/spider_nest

    var/obj/structure/spider_nest

    var/area/event_area

/datum/event/spider_nest/setup()
	var/list/candidates = all_areas.Copy()
	var/area/candidate
	if(!prob(10))  // 10% chance not to spawn in maints.
		for(candidate in candidates)
			if(!candidate.is_maintenance)
				candidates -= candidate
	event_area = pick(candidates)

/datum/event/spider_nest/start()
	var/turf/start_location
	for(var/i=1 to 100)
		start_location = event_area.random_space()
		if (locate(/mob/living/carbon/human) in range(9,start_location))
			continue
		if(start_location)
			break
		if(!start_location && i == 100)
			log_and_message_admins("Spider nest failed to find a viable turf.")
			kill()
			return


	message_admins("Spider nest spawned at \the [jumplink(start_location)]")
	new /obj/structure/spider_nest(start_location)
