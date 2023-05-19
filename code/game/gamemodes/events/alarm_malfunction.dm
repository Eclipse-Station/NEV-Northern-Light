/datum/storyevent/fire_alarm
	id = "alarm_malf"
	name = "Alarm malfunction"


	event_type = /datum/event/fire_alarm
	event_pools = list(EVENT_LEVEL_MUNDANE = POOL_THRESHOLD_MUNDANE,
	EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)

	tags = list(TAG_SCARY, TAG_TARGETED, TAG_NEGATIVE)



////////////////////////////////////////////////

/datum/event/fire_alarm
	startWhen = 20		//Roughly 40 seconds from event trigger. This will allow us enough time to set up.
	endWhen = 25		//10 seconds is more than enough time.

	var/selected_alarm
	var/eligible_air_alarms = list()
	var/eligible_fire_alarms = list()

/*			//No announcement for a false alarm. Up to the crew to determine if the alarm is real.
/datum/event/fire_alarm/announce()
	return
*/

/datum/event/fire_alarm/can_trigger(forced = FALSE)		//Forcing it won't do anything.
	var/valid_ga		//Valid gas alarm
	var/valid_fa		//Valid fire alarm
	for(var/obj/machinery/firealarm/fa in world)
		if(!fa)
			return FALSE	//No fire alarms in the world.
		if(fa.stat & (NOPOWER|BROKEN))
			continue		//Alarm is inop.
		if(!isOnStationLevel(fa))
			continue		//Not on ship Z-level.

		var/area/alarm_area = get_area(fa)
		if(alarm_area.atmosalm || alarm_area.fire)
			continue		//Already in alarm
		if(!isnull(fa))		//Redundant code, but need to check for edge cases.
			valid_fa = fa
		if(valid_fa)
			break		//No need to continue on, we have a good fire alarm.
	
	//Alright, so we have a good fire alarm in the map.
	//Now we check for air alarms.
	for(var/obj/machinery/alarm/ga in GLOB.alarm_list)		//All air alarms in world.
		if(!ga)
			return FALSE		//No air alarms in the world.
		if((ga.stat & (NOPOWER|BROKEN)) || ga.shorted || ga.buildstage != 2)
			continue			//Not working, for one reason or another.
		if(!isOnStationLevel(ga))
			continue		//Not on the ship, we don't care.
		
		var/area/alarm_area = get_area(ga)
		if(alarm_area.atmosalm || alarm_area.fire)
			continue		//It's already in alarm.
		if(!isnull(ga))		//Redundant null-checking, again for edge cases.
			valid_ga = ga
		if(valid_ga)
			break		//We have at least one eligible fire alarm, so that's good enough for this check.
		
	return (valid_fa && valid_ga)


/datum/event/fire_alarm/setup()
	for(var/obj/machinery/firealarm/fa in world)
		if(!fa)
			return		//Not gonna work without any fire alarms in the world.
		if(fa.stat & (NOPOWER|BROKEN))
			continue		//The alarm is inop, it wouldn't make sense for it to go off.
		if(!isOnStationLevel(fa))
			continue		//Stick to ship Z-levels

		var/area/alarm_area = get_area(fa)
		if(alarm_area.atmosalm || alarm_area.fire)
			continue		//Don't go into an alarm if we're already in an alarm

		eligible_fire_alarms += fa
	for(var/obj/machinery/alarm/ga in GLOB.alarm_list)
		if(!ga)
			return FALSE		//No air alarms in the world.
		if((ga.stat & (NOPOWER|BROKEN)) || ga.shorted || ga.buildstage != 2)
			continue			//Not working, for one reason or another.
		if(!isOnStationLevel(ga))
			continue		//Not on the ship, we don't care.
		
		var/area/alarm_area = get_area(ga)
		if(alarm_area.atmosalm || alarm_area.fire)
			continue		//It's already in alarm.
		eligible_air_alarms += ga

//Using a list, we can remove an option between air alarms and fire alarms if one is unavailable for whatever reason.
	var/list/possibilities = list("air_alarm", "fire_alarm")
	if(!eligible_fire_alarms)
		possibilities -= "air_alarm"
	if(!eligible_air_alarms)
		possibilities -= "fire_alarm"
	
	//No air OR fire alarms on the map, so we can't do shit here.
	if(!possibilities)
		src.kill()
	
	var/selected_type = pick(possibilities)
	switch(selected_type)
		if("air_alarm")
			selected_alarm = pick(eligible_air_alarms)
		if("fire_alarm")
			selected_alarm = pick(eligible_fire_alarms)
		else				//Edge cases!
			EXCEPTION("Attempted to pick unexpected alarm type [selected_type].")
			message_admins("ALARM_MALF/FATAL: Attempted to pick unexpected alarm type [selected_type]. Event will now terminate.")
			src.kill()
	
	ASSERT(selected_alarm)

/*
 * Alright, coders, listen and listen well.
 *
 * I am flirting with disaster below by using selected_alarm:proc instead of
 * selected_alarm.proc (note the separators). Doing this tells the compiler, "I
 * know what I'm doing, leave me alone with that 'proc not found' bollocks".
 *
 * While I have included checks to ensure that the right type of machinery is
 * capable of using the proc, if you have to use a colon instead of a fullstop
 * to denote the proc of an atom, then I would very strongly encourage that you
 * re-evaluate the way it's coded in and ask yourself, "is it absolutely 100%
 * necessary to use this?"
 *
 * Odds are very likely that A.) there is a much better way to code it without 
 * needing the : separator, B.) you're flirting with disaster, and C.) that I am
 * absolutely going to nitpick the fact that you used the : separator instead of
 * the . separator.
 */

/datum/event/fire_alarm/start()
	if(istype(selected_alarm, /obj/machinery/firealarm))
		selected_alarm:alarm()
	else if(istype(selected_alarm, /obj/machinery/alarm))
		selected_alarm:apply_danger_level(2)
	else
		message_admins("ALARM_MALF/FATAL: Alarm selected for malfunction ([selected_alarm]) had unexpected type [selected_alarm:type]. Event will now terminate.")
		src.kill()
		CRASH("Alarm selected for malfunction ([selected_alarm]) had unexpected type [selected_alarm:type].")
	
	log_and_message_admins("Alarm malfunction at [jumplink(selected_alarm)].")

