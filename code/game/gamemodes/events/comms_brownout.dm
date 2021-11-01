/datum/storyevent/comms_brownout
	id = "comms_brownout"
	name = "communication processor overload"

	event_type =/datum/event/comms_brownout
	event_pools = list(EVENT_LEVEL_MODERATE = POOL_THRESHOLD_MODERATE, EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_COMMUNAL, TAG_SCARY, TAG_NEGATIVE)
	var/severity_divisor = 1

/////////////////////////////////////////////////
/datum/event/comms_brownout/announce()
	var/alert = pick(	"Ionospheric anomalies detected. Temporary telecommunication failure imminent. Please contact you*%fj00)`5vc-BZZT", \
						"Ionospheric anomalies detected. Temporary telecommunication failu*3mga;b4;'1v¬-BZZZT", \
						"Ionospheric anomalies detected. Temporary telec#MCi46:5.;@63-BZZZZT", \
						"Ionospheric anomalies dete'fZ\\kg5_0-BZZZZZT", \
						"Ionospheri:%£ MCayj^j<.3-BZZZZZZT", \
						"#4nd%;f4y6,>£%-BZZZZZZZT")

	for(var/mob/living/silicon/ai/A in GLOB.player_list)	//AIs are always aware of communication blackouts.
		to_chat(A, "<br>")
		to_chat(A, SPAN_WARNING("<b>[alert]</b>"))
		to_chat(A, "<br>")

	if(prob(30))	//most of the time, we don't want an announcement, so as to allow AIs to fake blackouts.
		command_announcement.Announce(alert, new_sound = sound('sound/misc/interference.ogg', volume=25))


/datum/event/comms_brownout/start()
	log_and_message_admins("Communication processor overload event triggered,")
	switch(severity)
		if(EVENT_LEVEL_MUNDANE)		//Shouldn't happen, but if it does...
			severity_divisor = 3
		if(EVENT_LEVEL_MODERATE)
			severity_divisor = 2
		if(EVENT_LEVEL_MAJOR)
			severity_divisor = 1
		else		//Unexpected or undefined severity level.
			EXCEPTION("Severity level [severity] unexpected for [id]. Falling back to Major severity.")
			message_admins("COMMS_BROWNOUT/SEVERE: Severity level [severity] was requested but not supported. Falling back to Major severity. Please notify a developer of this.")
			severity_divisor = 1
	for(var/obj/machinery/telecomms/processor/P in world)
		P.emp_act(severity_divisor)


/proc/comms_brownout(var/silent = 1,var/severity_divisor = 1)

	if(!silent)
		command_announcement.Announce("Ionospheric anomalies detected. Temporary telecommunication failure imminent. Please contact you-BZZT", new_sound = 'sound/misc/interference.ogg')
	else // AIs will always know if there's a comm blackout, rogue AIs could then lie about comm blackouts in the future while they shutdown comms
		for(var/mob/living/silicon/ai/A in GLOB.player_list)
			to_chat(A, "<br>")
			to_chat(A, SPAN_WARNING("<b>Ionospheric anomalies detected. Temporary telecommunication failure imminent. Please contact you-BZZT</b>"))
			to_chat(A, "<br>")
	for(var/obj/machinery/telecomms/processor/P in world)
		P.emp_act(severity_divisor)
