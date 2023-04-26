/datum/storyevent/gas_leak
	id = "gas_leak"
	name = "gas leak"
	event_type =/datum/event/gas_leak
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE, EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_DESTRUCTIVE, TAG_NEGATIVE)


/datum/event/gas_leak	//NOTE: Times are measured in master controller ticks!
	name = "gas leak"
	startWhen		= 5	//When in the lifetime to call start().
	announceWhen	= 0	//When in the lifetime to call announce().

	var/gas_type
	var/gas_temp = T0C
	var/gas_amount = 12 * MOLES_CELLSTANDARD		//16% of the number of moles in Hydroponics at roundstart
	var/area/target_area
	var/turf/simulated/target_turf		//Technically not necessary, but we want to make sure we're not in an area with no floors.


// We need to ensure an engineer is present to deal with it. That's about it, really.
/datum/event/gas_leak/can_trigger(forced = FALSE)
	if(forced)		//If it's forced, then we assume the admin knows what they're doing...
		return TRUE
	for(var/mob/M in GLOB.player_list)
		if(M.client && M.mind && M.stat != DEAD && (ishuman(M) || isrobot(M) || isAI(M)))
			var/datum/job/job = M.mind.assigned_role
			if(job in list(JOBS_ENGINEERING))
				return TRUE
	return FALSE		

/datum/event/gas_leak/setup()
// Select our gas type and amount...
	var/_gas_choices = list("sleeping_agent")
	var/_gas_temperature = (T0C + 25)
	var/_gas_amount = 12 * MOLES_CELLSTANDARD		//moles.
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)		//It's not in the list for minor, but if it's added, it has native compatibility.
			_gas_choices = list("nitrogen", "oxygen")		//We only want Nitrogen and Oxygen for minor. No hazardous shit, outside of pressure and temp.
			_gas_temperature = (T0C + rand(60,120))
		if(EVENT_LEVEL_MODERATE)
			_gas_choices += list("carbon_dioxide")		//Nitrous oxide, and carbon dioxide. Knockout, and possible suffocation, but no other damage.
		if(EVENT_LEVEL_MAJOR)
			_gas_choices += list("monochloramine","trichloramine", "phoron")	//Phoron, trichloramine, and monochloramine... and possibly the less-dangerous nitrous, at a 25% chance.
			_gas_temperature = (T0C - rand(5,35))
			_gas_amount = (rand(15,225)/10) * MOLES_CELLSTANDARD		//Between 20 and 30% of Hydroponics' atmosphere at roundstart.
	gas_temp = _gas_temperature
	gas_type = pick(_gas_choices)
	gas_amount = _gas_amount

// Select out area...
	target_area = random_ship_area(filter_players = TRUE, filter_critical = TRUE, filter_maintenance = TRUE)
	var/possible_turfs = list()
	if(!target_area)
		log_debug("No target area was selected. Aborting!")
		kill()
		return
	var/iterations = 0
	for(var/turf/simulated/floor/F in target_area)
		iterations++
		possible_turfs += F
		if(iterations > 20)
			break		//we have enough turfs here.
	
	target_turf = pick(possible_turfs)

	//debugging code.
	message_admins("Gas leak: Selected [jumplink(target_turf,usr)] for a gas leak of [gas_type] with an amount of [gas_amount] moles at temperature [(gas_temp - T0C)] degrees Celsius.")


/datum/event/gas_leak/start()
	//RIGHT, let's get this party started!
	var/datum/gas_mixture/leak_contents = new
	leak_contents.temperature = gas_temp
	leak_contents.gas[gas_type] = gas_amount		//Roughly 25% of a room, though the ES13 build used 10 times the amount of a standard cell. We'll see how well it works, if at all.
	target_turf.assume_air(leak_contents)
	playsound(target_turf, 'sound/effects/spray.ogg', 10, 1, -3)		//Identical to the canister bursting for now.

//We don't want to give away what gas has been leaked, we just want to keep players out of it.
//If they ignore the risks, that's on them.
/datum/event/gas_leak/announce()
	command_announcement.Announce("A gas leak has been detected at [target_area]. All personnel are advised to evacuate the area until repairs can be completed.", "Hazard Alert")

