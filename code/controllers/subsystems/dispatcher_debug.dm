// Debugging code relating to player tracking system (dispatcher.dm)

ADMIN_VERB_ADD(/client/proc/dump_tracking, R_DEBUG, FALSE)
	set category = "Debug"
	set name = "Dump tracking data"
	set desc = "Dumps debugging information from the player tracking subsystem to a file."
	
	if(SSdispatcher.ptrack_dump_in_progress)
		to_chat(usr, "<span class='danger'> A player tracking dump is already in progress. You should wait until it is completed before you start another.</span>")
		return

	var/supersecretpasscode = rand(1000,9999)
	
	var/codecheck = input(usr,"WARNING - READ CAREFULLY BEFORE PROCEEDING! \n\n You are about to dump the player tracking data to a file. Because most of this is rate limited to reduce performance costs, this operation could take some time to complete (iterations that are not are marked \"NRL\"). If you don't know what need you would have for this, you probably should not continue. If you know what you are doing or you have been asked to do this, enter the code \"[supersecretpasscode]\" to begin this operation. Leave blank to cancel. Dump files are saved in the same directory as this round's logs.","Confirm tracking data dump?") as null|num
	
	if(!codecheck)		//blank entry
		to_chat(usr, "<span class='warning'>Confirmation check failed - no entry. Tracking data dump canceled.</span>")
		return

	if(codecheck != supersecretpasscode)		//wrong number
		to_chat(usr, "<span class='warning'>Confirmation check failed - entry mismatch. Tracking data dump canceled.</span>")
		return

	message_admins("[key_name(src)] began a player tracking data dump.")
	log_admin("[key_name(src)] began a player tracking data dump.")
	
	SSdispatcher.ptrack_dump_in_progress = TRUE
	
	var/dump_log = file("data/logs/ptrack.[time2text(world.realtime, "YYYYMMDDhhmmss")].log")		//let's one logfile per dump
	sleep(10)		//one second delay to make sure it worked.
	try
		ASSERT(dump_log)		//if it don't exist, well, shit's fucked anyway and this isn't going to work.
	catch
		to_chat(usr, "<span class='danger'>PTrack dump failed: the dump file could not be assigned to a variable for writing.</span>")
		CRASH("Could not assign logfile to variable for writing")
	WRITE_LOG(dump_log, " Player Tracking Dump")
	WRITE_LOG(dump_log, "   Tracking dump initialized at [time2text(world.realtime, "YYYY-MM-DD T hh:mm:ss")] by [usr.ckey].")
	WRITE_LOG(dump_log, " ---")
	WRITE_LOG(dump_log, " Tracking statistics (as of start of dump):")		//begin with printing statistics
	WRITE_LOG(dump_log, "   TOTAL:[SSdispatcher.tracked_players_all.len]")
	WRITE_LOG(dump_log, "   HEADS [SSdispatcher.tracked_players_cmd.len]")
	WRITE_LOG(dump_log, "   ENGIS [SSdispatcher.tracked_players_eng.len]")
	WRITE_LOG(dump_log, "   SECUR [SSdispatcher.tracked_players_sec.len]")
	WRITE_LOG(dump_log, "   MEDIC [SSdispatcher.tracked_players_med.len]")
	WRITE_LOG(dump_log, "   RSRCH [SSdispatcher.tracked_players_sci.len]")
	WRITE_LOG(dump_log, "   CARGO [SSdispatcher.tracked_players_crg.len]")
	WRITE_LOG(dump_log, "   OTHER [SSdispatcher.tracked_players_svc.len]")
	WRITE_LOG(dump_log, " ################################################################################")
	
	sleep(10)
	var/stopwatch = world.time		//tick.
	var/stopwatch2 = world.time		//tock.
	
	to_chat(usr, "<span class='danger'>Beginning PTrack dump - iteration 1 (all connected mobs with associated ckey)...</span>")
	WRITE_LOG(dump_log, " Beginning iteration 1 (all connected mobs with associated ckey)")
	WRITE_LOG(dump_log, " keyname - Type (NP = lobby, OB = observer, SI = silicon, HU = humanoid, SA = simpleanimal)")
	
	var/iterations = 0		//rate limiting.
	for(var/mob/M in world)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		if(!M.ckey)
			continue

		var/mob_assoc = ""
		if(isnewplayer(M))
			mob_assoc += "NP "
		if(isobserver(M))
			mob_assoc += "OB "
		if(issilicon(M))
			mob_assoc += "SI "
		if(ishuman(M))
			mob_assoc += "HU "
		if(isanimal(M))
			mob_assoc += "SA "
		
		WRITE_LOG(dump_log, " [key_name(M)] - [mob_assoc]")
		continue
	var/timer2 = round((world.time - stopwatch2) / 10,0.1)		//seconds
	WRITE_LOG(dump_log, " First iteration complete in [timer2] seconds.")
	sleep(5)
	iterations = 0					//reset our concurrent operations,
	stopwatch2 = world.time			//reset our secondary stopwatch.
	
	WRITE_LOG(dump_log, " ---------------")
	WRITE_LOG(dump_log, " Beginning iteration 2 (player list dump)")
	WRITE_LOG(dump_log, " keyname - Type (NP = lobby, OB = observer, SI = silicon, HU = humanoid, SA = simpleanimal)")
	to_chat(usr, "<span class='danger'>Beginning PTrack dump - iteration 2 (player_list dump)...</span>")
	
	for(var/mob/M in GLOB.player_list)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		var/mob_assoc = ""
		if(isnewplayer(M))
			mob_assoc += "NP "
		if(isobserver(M))
			mob_assoc += "OB "
		if(issilicon(M))
			mob_assoc += "SI "
		if(ishuman(M))
			mob_assoc += "HU "
		if(isanimal(M))
			mob_assoc += "SA "
		
		WRITE_LOG(dump_log, " [key_name(M)] - [mob_assoc]")
		continue
	timer2 = round((world.time - stopwatch2) / 10,0.1)		//seconds
	WRITE_LOG(dump_log, " Iteration 2 complete in [timer2] seconds.")
	sleep(5)
	
	iterations = 0					//reset our concurrent operations,
	stopwatch2 = world.time			//reset our secondary stopwatch.
	
	WRITE_LOG(dump_log, " ---------------")
	WRITE_LOG(dump_log, " Beginning iteration 3 (PTrack master list dump)")
	WRITE_LOG(dump_log, " keyname - Assignment ")
	to_chat(usr, "<span class='danger'>Beginning PTrack dump - iteration 3 (PTrack primary list dump)...</span>")
	for(var/mob/M in SSdispatcher.tracked_players_all)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, " [key_name(M)] - [M.mind.assigned_role]")
		continue
	timer2 = round((world.time - stopwatch2) / 10,0.1)		//seconds
	WRITE_LOG(dump_log, " Iteration 3 complete in [timer2] seconds.")
	sleep(5)
	
	iterations = 0					//reset our concurrent operations,
	stopwatch2 = world.time			//reset our secondary stopwatch.
	
	WRITE_LOG(dump_log, " ---------------")
	WRITE_LOG(dump_log, " Beginning iteration 4 (Individual lists)")
	WRITE_LOG(dump_log, " keyname - Assignment ")
	to_chat(usr, "<span class='danger'>Beginning PTrack dump - iteration 4 (PTrack auxiliary list dump)...</span>")
	
	WRITE_LOG(dump_log, " -- Command --")
	for(var/mob/M in SSdispatcher.tracked_players_cmd)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
		
	WRITE_LOG(dump_log, " -- Engineering --")
	for(var/mob/M in SSdispatcher.tracked_players_eng)
		iterations++				//we do NOT reset our iterations between each auxiliary list.
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
		
	WRITE_LOG(dump_log, " -- Security --")
	for(var/mob/M in SSdispatcher.tracked_players_sec)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
		
	WRITE_LOG(dump_log, " -- Medical --")
	for(var/mob/M in SSdispatcher.tracked_players_med)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
		
	WRITE_LOG(dump_log, " -- Research --")
	for(var/mob/M in SSdispatcher.tracked_players_sci)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
		
	WRITE_LOG(dump_log, " -- Cargo --")
	for(var/mob/M in SSdispatcher.tracked_players_crg)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
	
	WRITE_LOG(dump_log, " -- Other --")
	for(var/mob/M in SSdispatcher.tracked_players_svc)
		iterations++
		if(!(iterations % config.ntdad_max_oper))
			sleep(1)
		WRITE_LOG(dump_log, "   [key_name(M)] - [M.mind.assigned_role]")
		continue
	
	
	timer2 = round((world.time - stopwatch2) / 10,0.1)		//seconds
	WRITE_LOG(dump_log, " Iteration 4 complete in [timer2] seconds.")
	sleep(5)
	WRITE_LOG(dump_log, " ---------------")
	to_chat(usr, "<span class='danger'>Finishing PTrack dump...</span>")

	WRITE_LOG(dump_log, " ################################################################################")
	var/timer = (world.time - stopwatch) / 10		//seconds
	WRITE_LOG(dump_log, " Tracking dump completed [time2text(world.realtime, "YYYY-MM-DD T hh:mm:ss")] in [timer] seconds.")
	WRITE_LOG(dump_log, " # END OF CONTENT")
	
	SSdispatcher.ptrack_dump_in_progress = FALSE
	to_chat(usr, "<span class='danger'>PTrack dump completed in [timer] seconds. Saved to server as '[dump_log]'.</span>")
	message_admins("Player tracking data dump completed in [timer] seconds. Saved as '[dump_log]'.")
	log_admin("Player tracking data dump completed.")