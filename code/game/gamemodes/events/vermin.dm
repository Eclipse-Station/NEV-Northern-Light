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


/datum/event/vermin/can_trigger(forced)		//Add in crew requirements
//This is literally copy-pasted from Hivemind code.
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
			return FALSE		//Security and command should have access; Engineers can get anywhere they need to go because **hacking**

	//We have enough to be able to start, so we'll call the other stuff.
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

