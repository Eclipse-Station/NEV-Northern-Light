/datum/storyevent/fire_alarm
	id = "fire_alarm"
	name = "Fire alarm malfunction"


	event_type = /datum/event/fire_alarm
	event_pools = list(EVENT_LEVEL_MUNDANE = POOL_THRESHOLD_MUNDANE,
	EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE)

	tags = list(TAG_SCARY, TAG_TARGETED, TAG_NEGATIVE)



////////////////////////////////////////////////

/datum/event/fire_alarm
	startWhen = 20		//Roughly 40 seconds from event trigger. This will allow us enough time to set up.
	endWhen = 25		//10 seconds is more than enough time.

	var/obj/machinery/firealarm/selected_alarm
	var/eligible_alarms = list()

/*			//No announcement for a fire alarm. Up to the crew to determine if the alarm is real.
/datum/event/fire_alarm/announce()
	return
*/

/datum/event/fire_alarm/can_trigger()
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

		return TRUE		//We have at least one eligible fire alarm, so that's good enough for this check/

	return FALSE		//If we get this far, then we've gone through all the fire alarms already and there's none eligible.



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

		eligible_alarms += fa

	if(!eligible_alarms)
		src.kill()

	selected_alarm = pick(eligible_alarms)

/datum/event/fire_alarm/start()
	selected_alarm.alarm()
	log_and_message_admins("Fire alarm malfunction at [jumplink(selected_alarm)].")

