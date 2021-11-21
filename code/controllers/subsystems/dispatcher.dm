/*
 * Nanotrasen Department Alarm Dispatcher
 * This handles out-of-server calls for players, using the request console. We
 * have this set up as a subsystem so we can handle it with global lists.
 */

#define DEBUGLEVEL_FATAL_ONLY 0
#define DEBUGLEVEL_SEVERE 1
#define DEBUGLEVEL_WARNING 2
#define DEBUGLEVEL_VERBOSE 3

/*
 * Debug levels:
 *
 * Fatal: Problems which will terminate the dispatcher system. Fatal errors are
 * sent to administrators regardless of debug level.
 *
 * Severe: Errors and runtimes which should be reported to a developer, but will
 * not necessarily shut down the dispatcher system. Severe errors are sent to
 * administrators regardless of debug level.
 *
 * Warning: Minor errors and miscellaneous which aren't serious enough to need
 * developer oversight, but are useful to know, e.g. why a message didn't get
 * pushed.
 *
 * Verbose: Full debugging information.
 */

SUBSYSTEM_DEF(dispatcher)
	name = "Dispatcher"
	init_order = INIT_ORDER_DISPATCHER
	flags = SS_BACKGROUND
	var/static/dispatcher_initialized = FALSE		//American spelling, for consistency.
	var/debug_level = DEBUGLEVEL_SEVERE
	var/bot_token = ""
	var/cooldown = 0
	var/first_run = TRUE

	var/ptrack_dump_in_progress = FALSE		//used in debugging
	var/flush_in_progress = FALSE		//stat thing.
	var/update_in_progress = FALSE		//stat thing
	
	// Bypass switches for personnel requirements to ping Discord.
	var/bypass_command_ping_requirements = FALSE
	var/bypass_noncommand_ping_requirements = FALSE

	//used in player tracking system
	var/list/tracked_players_all = list()		//All tracked players
	var/list/tracked_players_sec = list()		//Security
	var/list/tracked_players_med = list()		//Medical
	var/list/tracked_players_sci = list()		//Science
	var/list/tracked_players_cmd = list()		//Command
	var/list/tracked_players_crg = list()		//Supply
	var/list/tracked_players_eng = list()		//Engineering
	var/list/tracked_players_svc = list()		//Service
	var/list/tracked_players_chr = list()		//Church

/datum/controller/subsystem/dispatcher/Initialize()
	log_debug("DISPATCHER: Initializing.")
//	dispatcher = src
	debug_level = config.ntdad_debug
	log_debug("DISPATCHER: Debug level set: [debug_level]")

//Config checks.
	if(!config.ntdad_maximum_command && !config.ntdad_maximum_noncommand && config.ntdad_enabled)
		message_admins("DISPATCHER/FATAL: CONFIGURATION WARNING: Dispatcher enabled via config, but maximum non-command AND command players to ping for is zero. Dispatcher will not ping for any players due to configuration settings.")
		throw EXCEPTION("Dispatcher enabled via configuration file, but cannot ping due to config options DISPATCHER_MAXIMUM_COMMAND_PING and DISPATCHER_MAXIMUM_NONCOMMAND_PING.")
		config.ntdad_enabled = FALSE

//Check command role config opts to see if we need to disable role pings or role ping checks.
	if(config.ntdad_maximum_command < 0)								//Command role limit bypass
		bypass_command_ping_requirements = TRUE
		message_admins("DISPATCHER/SEVERE: Playercount checks for command role pings is disabled by config. This may open a route for exploits...")
		if(DEBUGLEVEL_SEVERE <= debug_level)
			log_debug("DISPATCHER: Playercount checks for command roles disabled by config.")
	else if(!config.ntdad_maximum_command && config.ntdad_enabled)		//Command disabled via role limit.
		message_admins("DISPATCHER/SEVERE: CONFIGURATION WARNING: Dispatcher enabled via config, but maximum command players to ping for is zero. This will cause the dispatcher to not ping for command roles.")
		if(DEBUGLEVEL_SEVERE <= debug_level)
			log_debug("DISPATCHER: Dispatcher for command roles disabled by config: DISPATCHER_MAXIMUM_COMMAND_PING value.")

//Same for the non-command roles.
	if(config.ntdad_maximum_noncommand < 0)								//Non-command role limit bypass
		bypass_noncommand_ping_requirements = TRUE
		message_admins("DISPATCHER/SEVERE: Playercount checks for non-command role pings is disabled by config. This may open a route for exploits...")
		if(DEBUGLEVEL_SEVERE <= debug_level)
			log_debug("DISPATCHER: Playercount checks for non-command roles disabled by config.")
	else if(!config.ntdad_maximum_noncommand && config.ntdad_enabled)		//Command disabled via role limit.
		message_admins("DISPATCHER/SEVERE: CONFIGURATION WARNING: Dispatcher enabled via config, but maximum non-command players to ping for is zero. This will cause the dispatcher to not ping for non-command roles.")
		if(DEBUGLEVEL_SEVERE <= debug_level)
			log_debug("DISPATCHER: Dispatcher for command roles disabled by config:  value.")

	if(tracked_players_all.len || tracked_players_sec.len || tracked_players_med.len || tracked_players_sci.len || tracked_players_cmd.len || tracked_players_crg.len || tracked_players_eng.len || tracked_players_svc.len || tracked_players_chr.len)
		message_admins("DISPATCHER/SEVERE: One or more lists still had data. Lists will be flushed to attempt to clear lists...")
		if(DEBUGLEVEL_SEVERE <= debug_level)
			log_debug("DISPATCHER: One or more lists still had data, flushing...")
		flush_tracking()
	if(!config.ntdad_enabled)
		log_debug("DISPATCHER/FATAL: System disabled by config. Only the tracking system will be in use.")
	if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Initialized!")
	..()

/datum/controller/subsystem/dispatcher/fire(resumed = FALSE)
	if(first_run)
		//Initial flush.
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Standing by for initial flush...")
		if(Master.current_runlevel < RUNLEVEL_SETUP)
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Holding off, runlevel: [Master.current_runlevel], waiting for greater than [RUNLEVEL_SETUP]...")
			return		//eh, it'll fire again.

		sleep(2 SECONDS)
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Game is running (well, running enough for our standards). Beginning initial flush.")
		flush_tracking()		//roundstart shenanigans will prevent it from flushing properly.
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Initial flush completed.")
		first_run = FALSE
		return		//We're done with the initial flush.

/*		//Scheduled updates aren't really necessary; the "spawn at dorms, not in tracking" bit works fine.
	//Periodic list maintenance.
	if(!(times_fired % 150))	//Every 5 minutes or so, update the tracking data.
		if(update_in_progress || flush_in_progress)
			if(DEBUGLEVEL_WARNING <= debug_level)
				log_debug("DISPATCHER: Attempted to update tracking, but another update or flush was already in progress. Aborting.")
			return
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Beginning scheduled update.")
		
		//We don't want to call flush_tracking() here because we don't want to delete anyone, just add anyone missed by a failed proc.
		update_in_progress = TRUE
		var/iterations = 0
		
		for(var/mob/living/M in GLOB.player_list)
			iterations++
			if(!M)
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: Master list update failure: No players on.")
				return		//Nobody's home.
			if(!M.mind)
				if(!(iterations % config.ntdad_max_oper))
					sleep(1)
				continue	//Mindless body.
			if(!M.mind.assigned_role)
				if(!(iterations % config.ntdad_max_oper))
					sleep(1)
				continue	//No assigned role.

			tracked_players_all |= M		//Add them to the master list if they're not already on the list.
			
			//Now we add them to the sub-lists
			if(M.mind.assigned_role in security_positions)
				tracked_players_sec |= M
			if(M.mind.assigned_role in medical_positions)
				tracked_players_med |= M
			if(M.mind.assigned_role in science_positions)
				tracked_players_sci |= M
			if(M.mind.assigned_role in command_positions)
				tracked_players_cmd |= M
			if(M.mind.assigned_role in cargo_positions)
				tracked_players_crg |= M
			if(M.mind.assigned_role in engineering_positions)
				tracked_players_eng |= M
			if(M.mind.assigned_role in church_positions)
				tracked_players_chr |= M
			if(M.mind.assigned_role in civilian_positions)
				if(M.mind.assigned_role != (ASSISTANT_TITLE))		//vagabonds are not staff
					tracked_players_svc |= M
					
		update_in_progress = FALSE

		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Finished scheduled update.")
*/

/datum/controller/subsystem/dispatcher/Recover()
	flush_tracking()

/datum/controller/subsystem/dispatcher/proc/flush_tracking()
	if(update_in_progress || flush_in_progress)
		if(DEBUGLEVEL_WARNING <= debug_level)
			log_debug("DISPATCHER: Attempted to flush tracking, but another update or flush was already in progress. Aborting.")
		return
	flush_in_progress = TRUE
	
	//First, we reset all the lists.
	if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Flushing lists.")
	tracked_players_all = list()		//All tracked players
	tracked_players_sec = list()		//Security
	tracked_players_med = list()		//Medical
	tracked_players_sci = list()		//Science
	tracked_players_cmd = list()		//Command
	tracked_players_crg = list()		//Supply
	tracked_players_eng = list()		//Engineering
	tracked_players_svc = list()		//Service
	tracked_players_chr = list()		//Church

	//make sure they're clear
	if(tracked_players_all.len || tracked_players_sec.len || tracked_players_med.len || tracked_players_sci.len || tracked_players_cmd.len || tracked_players_crg.len || tracked_players_eng.len || tracked_players_svc.len || tracked_players_chr.len)
		world.Error("DISPATCHER: Attempted to flush player lists, but lists still had data. Falling back to list.Cut()...")
		if(DEBUGLEVEL_WARNING <= debug_level)
			log_debug("DISPATCHER: Attempted to flush player lists, but lists still had data. Reverting to list.Cut() method...")
		tracked_players_all.Cut()		//All tracked players
		tracked_players_sec.Cut()		//Security
		tracked_players_med.Cut()		//Medical
		tracked_players_sci.Cut()		//Science
		tracked_players_cmd.Cut()		//Command
		tracked_players_crg.Cut()		//Supply
		tracked_players_eng.Cut()		//Engineering
		tracked_players_svc.Cut()		//Service
		tracked_players_chr.Cut()		//Church

		if(tracked_players_all.len || tracked_players_sec.len || tracked_players_med.len || tracked_players_sci.len || tracked_players_cmd.len || tracked_players_crg.len || tracked_players_eng.len || tracked_players_svc.len || tracked_players_chr.len)
			throw EXCEPTION("DISPATCHER: Attempted to flush player lists twice, but lists still had data. Aborting - abnormalities may occur!")
			message_admins("DISPATCHER/SEVERE: Attempted to flush player lists twice, but lists still had data. Please generate a tracking dump (Debug > Dump tracking data) and send it to a developer.")
			if(DEBUGLEVEL_SEVERE <= debug_level)
				log_debug("DISPATCHER: Attempted to flush player lists twice, but lists still had data. Aborting - abnormalities may occur!")


	else if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Lists flushed.")

	var/iterations = 0		//used in rate limiting to know how many concurrent operations we have running. We don't want to do everything all at once, after all.

	//let's start by rebuilding the master list...
	for(var/mob/living/M in GLOB.player_list)
		iterations++
		if(!M)
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Master list population failure: No players on.")
			flush_in_progress = FALSE
			return		//Nobody's home. Go back to sleep.
		if(!M.mind)
			if(!(iterations % config.ntdad_max_oper))
				sleep(1)
			continue	//Mindless body.
		if(!M.mind.assigned_role)
			if(!(iterations % config.ntdad_max_oper))
				sleep(1)
			continue	//No assigned role.

		tracked_players_all += M
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Master list population: [tracked_players_all.len] players.")

	//reset our operations counter
	iterations = 0

	//...and now we rebuild the department lists.
	for(var/mob/M in tracked_players_all)
		iterations++
		if(!M)
			if(DEBUGLEVEL_SEVERE <= debug_level)
				log_debug("DISPATCHER: Sub-list population failure: No players in master list. This indicates that a 'return' is failing to end the flush proc.")
		if(!M.mind)
			if(!(iterations % config.ntdad_max_oper))
				sleep(1)
			continue		//Mindless body.
		if(!M.mind.assigned_role)
			tracked_players_all -= M		//Don't track a role-less man.
			if(!(iterations % config.ntdad_max_oper))
				sleep(1)
			continue
		else		//We add them to all positions that we need, in case someone's a head of staff (which has two position flags)
			add_to_tracking(M)
			if(!(iterations % config.ntdad_max_oper))
				sleep(1)
			continue		//We're done adding here.
			
	flush_in_progress = FALSE

/datum/controller/subsystem/dispatcher/proc/add_to_tracking(mob/M)
	if(!M)
		CRASH("no mob specified.")
	if(!M.mind)
		return 0	//Mindless body.
	if(!M.mind.assigned_role)
		return 0	//No assigned role.

	sleep(5)		//wait a sec

	tracked_players_all |= M		//add 'em if you got 'em

	if(M.mind.assigned_role in security_positions)
		tracked_players_sec |= M
	if(M.mind.assigned_role in medical_positions)
		tracked_players_med |= M
	if(M.mind.assigned_role in science_positions)
		tracked_players_sci |= M
	if(M.mind.assigned_role in command_positions)
		tracked_players_cmd |= M
	if(M.mind.assigned_role in cargo_positions)
		tracked_players_crg |= M
	if(M.mind.assigned_role in engineering_positions)
		tracked_players_eng |= M
	if(M.mind.assigned_role in church_positions)
		tracked_players_chr |= M
	if(M.mind.assigned_role in civilian_positions)
		if(M.mind.assigned_role != (ASSISTANT_TITLE))		//vagabonds are not staff
			tracked_players_svc |= M

	if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Added [M.name] to tracked players.")
	return 1

/datum/controller/subsystem/dispatcher/proc/remove_from_tracking(mob/M)		//we don't need the precision here, since we may be removing dead players
	if(!M)
		CRASH("no mob specified.")
	if(!M.mind)
		return 0	//Mindless body.
	if(!M.mind.assigned_role)
		return 0	//No assigned role.

	//...departments first...
	if(tracked_players_sec & M)
		tracked_players_sec.Remove(M)		//I'm not a coder without emotions
	if(tracked_players_med & M)				//I'm not what you see
		tracked_players_med.Remove(M)		//I've come to help you with your problems
	if(tracked_players_sci & M)				//So we can be free
		tracked_players_sci.Remove(M)		//I'm not a hero! I'm not some saviour!
	if(tracked_players_cmd & M)				//Forget what you know
		tracked_players_cmd.Remove(M)		//I'm just a man whose circumstances
	if(tracked_players_crg & M)				//Went byond his control.
		tracked_players_crg.Remove(M)
	if(tracked_players_eng & M)
		tracked_players_eng.Remove(M)
	if(tracked_players_svc & M)
		tracked_players_svc.Remove(M)
	if(tracked_players_chr & M)
		tracked_players_chr.Remove(M)

	//...then the final list.
	if(tracked_players_all & M)
		tracked_players_all.Remove(M)

	if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Removed [M] from tracked players.")
	return 1

/datum/controller/subsystem/dispatcher/proc/handle_request(department = "", priority = FALSE, message, sender = "Unknown", sender_role = "Unassigned", stamped)
//return statement should be whether or not the handler handled it.
//0 if it is kicking it back to the RC due to players being on,
//1 if it sent to Discord.
	if(!config.ntdad_enabled)		//don't do shit if it's not enabled
		if(DEBUGLEVEL_WARNING <= debug_level)
			log_debug("DISPATCHER: Request received while dispatcher disabled. Aborting.")
		return 0


	if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Received request for department [department], priority of [priority], message '[message]', sender '[sender]', role '[sender_role]', stamp '[stamped]'.")

	if(!priority)		//priority of zero means it's a reply message.
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Discarding request as reply message.")
		return 0		//discard it

	if((!sender || !sender_role) && !stamped)
		if(DEBUGLEVEL_WARNING <= debug_level)
			log_debug("DISPATCHER: Sender data missing sender or sender role, and unstamped. Aborting.")
			return 0

	department = lowertext(department)
	switch(department)
		if("engineering", "atmospherics")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Engineering.")
			if(bypass_noncommand_ping_requirements || (tracked_players_eng.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("engineering",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("science", "research", "research department","robotics")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Science.")
			if(bypass_noncommand_ping_requirements || (tracked_players_sci.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("research",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("security")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Security.")
			if(bypass_noncommand_ping_requirements || (tracked_players_sec.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("security",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("supply", "cargo", "cargo bay", "freetradeunion")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Supply.")
			if(bypass_noncommand_ping_requirements || (tracked_players_crg.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("supply",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("church", "janitorial")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Church.")
			if(bypass_noncommand_ping_requirements || (tracked_players_chr.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("church",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("service")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Service.")
			if(bypass_noncommand_ping_requirements || (tracked_players_svc.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("service",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("medical", "medical department","medbay","virology")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Medical.")
			if(bypass_noncommand_ping_requirements || (tracked_players_med.len < config.ntdad_maximum_noncommand))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("medical",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		if("command", "bridge")
			if(DEBUGLEVEL_VERBOSE <= debug_level)
				log_debug("DISPATCHER: Request sent to Command.")
			if(bypass_command_ping_requirements || (tracked_players_cmd.len < config.ntdad_maximum_command))
				if(DEBUGLEVEL_VERBOSE <= debug_level)
					log_debug("DISPATCHER: No players in [department], calling send_discord_request...")
				send_discord_request("command",priority, message, sender, sender_role, stamped)
				return 1
			else
				return 0
		else
			if(DEBUGLEVEL_WARNING <= debug_level)
				log_debug("DISPATCHER: Unimplemented department [department].")
			return 0

/datum/controller/subsystem/dispatcher/proc/send_discord_request(department = "", priority = FALSE, message, sender, sender_role, stamped)
	if(!config.ntdad_enabled)		//don't do shit if it's not enabled
		return 0
	message = sanitizeSafe(message)
	if(!message)
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: No message entered, aborting.")
		return 0

/*				//Handled in request console code.
	if(cooldown > world.time)		//not done with the cooldown yet.
		if(DEBUGLEVEL_VERBOSE <= debug_level)
			log_debug("DISPATCHER: Cooldown still in progress. [round(cooldown - world.time,1)] ticks left.")
		return 0
*/

	var/department_ping = ""
	switch(department)
		if("command")
			department_ping = config.ntdad_role_command
		if("engineering")
			department_ping = config.ntdad_role_engineering
		if("research")
			department_ping = config.ntdad_role_research
		if("security")
			department_ping = config.ntdad_role_security
		if("supply")
			department_ping = config.ntdad_role_supply
		if("service")
			department_ping = config.ntdad_role_service
		if("medical")
			department_ping = config.ntdad_role_medical
		if("church")
			department_ping = config.ntdad_role_church
		else
			message_admins("DISPATCHER/SEVERE: Attempted to prepare a discord request for undefined department '[department]'.")
			if(DEBUGLEVEL_SEVERE <= debug_level)
				log_debug("DISPATCHER: Undefined department '[department]'.")

	var/msg = ""		//This is the string intended to be sent to the bot.
	if(stamped)
		msg = "[priority > 1 ? "**HIGH PRIORITY** a" : "A"]ssistance request for [department_ping], stamped by [stamped][sender ? ", from [sender] ([sender_role])" : "" ]: '[message]'"
	else
		msg = "[priority > 1 ? "**HIGH PRIORITY** a" : "A"]ssistance request for [department_ping], from [sender] ([sender_role]): '[message]'"

	cooldown = (world.time + config.ntdad_cooldown)
	if(DEBUGLEVEL_VERBOSE <= debug_level)
		log_debug("DISPATCHER: Message prints as follows:")
		log_debug("DISPATCHER: [msg]")

	push_to_discord(msg)

/datum/controller/subsystem/dispatcher/proc/send_discord_test()
	var/msg = "This is a test of the Nanotrasen Department Alarm Dispatcher. This is only a test."
	push_to_discord(msg)

/datum/controller/subsystem/dispatcher/proc/push_to_discord(var/msg = "" as text)
	if(!msg)
		if(DEBUGLEVEL_WARNING <= debug_level)
			log_debug("DISPATCHER: No message to push.")
		return		//We need a message to pass along, damnit!

	send2dispatcher(msg)



/datum/controller/subsystem/dispatcher/Shutdown()
	//clear all lists
	tracked_players_all = list()		//The time has come at last
	tracked_players_sec = list()		//To throw away this mask
	tracked_players_med = list()		//Now everyone can see
	tracked_players_sci = list()		//My true identity!
	tracked_players_cmd = list()
	tracked_players_crg = list()
	tracked_players_eng = list()		//I'm SPITZER! Spitzer! Spitzer. Spitzer...
	tracked_players_svc = list()
	tracked_players_chr = list()

/datum/controller/subsystem/dispatcher/stat_entry(msg_prefix)
	var/list/msg = list(msg_prefix)
	msg += "T:[tracked_players_all.len]"		//Total
	msg += "{"
	msg += "C [tracked_players_cmd.len] | "		//Heads
	msg += "E [tracked_players_eng.len] | "		//Engi
	msg += "S [tracked_players_sec.len] | "		//Sec
	msg += "M [tracked_players_med.len] | "		//Med
	msg += "N [tracked_players_sci.len] | "		//Research
	msg += "U [tracked_players_crg.len] | "		//Cargo
	msg += "R [tracked_players_chr.len] | "		//Church ("Religion")
	msg += "? [tracked_players_svc.len]"		//Other
	msg += "}"
	if(flush_in_progress)
		msg += " FLUSHING"
	if(update_in_progress)
		msg += " AUTO-UPDATING"
	..(msg.Join())

	//sample T:28{C 6|E 3|S 4|M 4|N 5|U 5|R 0|? 12}

#undef DEBUGLEVEL_FATAL_ONLY
#undef DEBUGLEVEL_SEVERE
#undef DEBUGLEVEL_WARNING
#undef DEBUGLEVEL_VERBOSE
