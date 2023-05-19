/*
Vermin are rapidly reproducing energy-sucking menace
That is capable of causing hull breaches and blackouts
Physically harmless to the crew, but still dangerous to the ship itself
*/


/datum/storyevent/vermin
	id = "vermin"
	name = "Vermin"


	event_type = /datum/event/vermin
	event_pools = list(EVENT_LEVEL_MUNDANE = POOL_THRESHOLD_MUNDANE*1.2,
	EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE*1.2,
	EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR*1.2)
	tags = list(TAG_COMBAT, TAG_DESTRUCTIVE, TAG_NEGATIVE)



/datum/event/vermin
	startWhen = 1
	announceWhen = 10
	endWhen = 90
	var/list/affected_areas = list()
	var/list/spawnpoints = list()
	var/num_areas = 1


/datum/event/vermin/can_trigger(forced)		//Add in crew requirements, etc
/* Make sure we're not over the maximum allowable limit for mobs. If we're above
 * that limit, it'll mean bad times for the players (lag, etc).
 *
 * Because of that, regardless of whether it's forced, we don't want the event
 * to happen.
 */
	if(SSmobs.mob_list.len >= GLOBAL_MOB_WARNING_LIMIT)
		return FALSE

//This is literally copy-pasted from Hivemind code.
	var/crew = 0
	var/engis = 0
	var/sec = 0
	var/command = 0
	var/player_check = TRUE
	
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
		player_check = FALSE
	else if(crew >= 3 && crew < 6)		//Debatable...
		if(!engis && !sec && !command)
			player_check = FALSE		//Security and command should have access; Engineers can get anywhere they need to go because **hacking**

	if(!player_check && !forced)		//We don't have enough players, and an admin is not forcing this. Abort.
		return FALSE
	//We have enough players to be able to start, so we'll check that we're not about to crash the server.
	
/* Since the player check code is already done, we'll reuse it down here to verify
 * that we can still reproduce with the number of players we have online, since
 * the Vermin's maximum count is influenced by the number of active players.
 */
	var/mob_count_sanity_checks = TRUE		//Verify that we can actually spawn more.
	var/_count = SSmobs.all_vermin.len
	var/_limit = clamp(100 + (50 * (crew - 3)), 5, config.maximum_vermin)		//Variable limit, based on player count.

	if(_count >= (config.maximum_vermin - 25))
		mob_count_sanity_checks = FALSE		//We're too close to the absolute limit; another infestation has likely gone unchecked.

	if(_count >= (_limit - 25))
		mob_count_sanity_checks = FALSE		//We're too close to going over our maximum allowable limit based on player count.

	if(!mob_count_sanity_checks && !forced)
		return FALSE		//it's not safe to spawn Vermin in right now . . .
	
	return TRUE

/datum/event/vermin/setup()
	announceWhen = rand(20,80) //Very large random window for announcement,
	num_areas = 1
	switch(severity)
		if (EVENT_LEVEL_MODERATE)
			num_areas = 2
		if (EVENT_LEVEL_MAJOR)
			num_areas = 3
	choose_area()



/datum/event/vermin/announce()
	command_announcement.Announce("Bioscans indicate that aberrant lifeforms have emerged in [english_list(affected_areas)]. Crew are advised to contain the infestation.", "Aberrant Flesh Infestation", new_sound = 'sound/AI/vermin.ogg')

/datum/event/vermin/start()
	for (var/turf/spawnpoint in spawnpoints)
		var/mob/living/simple_animal/vermin/baby = new /mob/living/simple_animal/vermin(spawnpoint)
		baby.power_nutrition = 100 //Give them a little headstart



/datum/event/vermin/proc/choose_area()
	for (var/i = 1; i <= num_areas; i++)
		var/area/A
		A = random_ship_area(filter_players = TRUE, filter_maintenance = TRUE, filter_critical = TRUE, need_apc = TRUE)		//we need to have power to be able to reproduce, and we don't want them to spawn in the engine room - as much fun as that is.
		var/turf/T = A.random_space()
		if(!T)
			//We somehow failed to find a turf, decrement i so we get another go
			i--
			continue
		affected_areas.Add(A)
		spawnpoints.Add(T)

