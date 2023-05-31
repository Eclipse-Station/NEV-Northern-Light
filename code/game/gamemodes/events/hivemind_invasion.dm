//Hivemind is rogue AI that uses unknown nanotech to follow some strange objective
//In fact, it's just hostile structures, wireweeds spreading event with some mobs
//Requires hard teamwork at late stages, but easily can be handled at the beginning

//All code stored in modules/hivemind


/datum/storyevent/hivemind
	id = "hivemind"
	name = "Hivemind Invasion"
	req_crew = 14

	event_type = /datum/event/hivemind
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR*0.9) //bit more common
	tags = list(TAG_COMMUNAL, TAG_DESTRUCTIVE, TAG_NEGATIVE, TAG_SCARY)
//============================================

/datum/event/hivemind
	announceWhen = 60

// // // BEGIN ECLIPSE EDITS // // //
//Hivemind should only start when there's more than 3 players total, or more than 6 if none of the players are command, engineering, or security.
//This code is called in /datum/storyevent/.../can_trigger(), so we're safe putting this here.
/datum/event/hivemind/can_trigger(forced)
	if(forced)
		return TRUE
	var/crew = 0
	var/engis = 0
	var/sec = 0
	var/command = 0
	
	//Let's get a list of active players first, and run through that.
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind && M.stat != DEAD && (ishuman(M) || isrobot(M) || isAI(M)))
			var/datum/job/job = SSjob.GetJob(M.mind.assigned_role)
			if(job)
				crew++
				if(job in list(JOBS_ENGINEERING))		//Engi?
					engis++
				if(job in list(JOBS_SECURITY))		//Sec?
					sec++
				if(job in list(JOBS_COMMAND))		//Head of staff?
					command++
	if(crew < 3)			//Because one's not enough, and two's too few.
		return FALSE
	else if(crew >= 3 && crew < 6)		//Debatable...
		if(!engis && !sec && !command)
			return FALSE		//Without someone who can actually deal with the threat, it's too difficult for the crew.

	//We have enough to be able to start, so we'll call the other stuff.
	return TRUE
	

// We'll tie this into the Dispatcher code so we can ping around the horn when the hivemind is defeated.
/datum/event/hivemind/announce()
	if(config.ntdad_enabled)		//Send a ping to the Discord if the Dispatcher is enabled and the criteria are met
		if((SSdispatcher.tracked_players_all.len < config.ntdad_maximum_hivemind) || SSdispatcher.bypass_hivemind_ping_requirements)
			if(config.ntdad_level8_ping_sec)		//Set to ping only Security.
				SSdispatcher.push_to_discord("[config.ntdad_role_security] Confirmed outbreak of Level-8 bio-mechanical infestation aboard [station_name()]. All personnel must contain the outbreak.")
			if(config.ntdad_level8_ping_all)		//Shit, let's get everyone in here.
				SSdispatcher.push_to_discord("[ config.ntdad_role_command] [config.ntdad_role_security] [config.ntdad_role_research] [config.ntdad_role_medical] [config.ntdad_role_supply] [config.ntdad_role_service] [config.ntdad_role_church] [config.ntdad_role_engineering] Confirmed outbreak of Level-8 bio-mechanical infestation aboard [station_name()]. All personnel must contain the outbreak.")
	level_eight_announcement() //Different announcement than blob or plants, so the crew doesn't need to struggle trying to figure out if it's blob, plants or hive
	// // // END ECLIPSE EDITS // // //

/datum/event/hivemind/start()
	var/turf/start_location
	for(var/i=1 to 100)
		var/area/A = random_ship_area(filter_players = TRUE, filter_maintenance = TRUE, filter_critical = TRUE, need_apc = TRUE)
		start_location = A.random_space()
		if(!start_location && i == 100)
			log_and_message_admins("Hivemind failed to find a viable turf.")
			kill()
			return
		if(start_location)
			break

	message_admins("Hivemind spawned at \the [jumplink(start_location)]")
	new /obj/machinery/hivemind_machine/node(start_location)
