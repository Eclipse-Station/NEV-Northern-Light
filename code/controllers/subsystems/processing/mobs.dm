//Eclipse-added defines
#define GLOBAL_MOB_WARNING_LIMIT 3000

PROCESSING_SUBSYSTEM_DEF(mobs)
	name = "Mobs"
	priority = SS_PRIORITY_MOB
	flags = SS_KEEP_TIMING|SS_NO_INIT
	runlevels = RUNLEVEL_GAME|RUNLEVEL_POSTGAME
	wait = 2 SECONDS

	process_proc = /mob/proc/Life

	var/list/mob_list
	var/list/mob_living_by_zlevel[][]
	
	//ECLIPSE ADDED VARS
	var/alarm = FALSE
	var/alarm_time
	
	var/list/all_vermin = list()

/datum/controller/subsystem/processing/mobs/PreInit()
	mob_list = processing // Simply setups a more recognizable var name than "processing"
	MaxZChanged()

/datum/controller/subsystem/processing/mobs/proc/MaxZChanged()
	if(!islist(mob_living_by_zlevel))
		mob_living_by_zlevel = new/list(world.maxz, 0)

	while(mob_living_by_zlevel.len < world.maxz)
		mob_living_by_zlevel.len++
		mob_living_by_zlevel[mob_living_by_zlevel.len] = list()

//ECLIPSE ADDED SPAGHETTI BEYOND THIS POINT
//ABANDON ALL HOPE YE WHO ENTER HERE.
/datum/controller/subsystem/processing/mobs/fire(resumed = 0)
	..()		//Run everything else first.
	
	if(!alarm && mob_list.len > GLOBAL_MOB_WARNING_LIMIT)		//If we ever get this high, something has gone seriously wrong.
		alarm = TRUE
	if(alarm)		//If we're in alarm, notify everyone.
		if(mob_list.len > GLOBAL_MOB_WARNING_LIMIT)
			if(times_fired > alarm_time)
				alarm_time = times_fired + 60		//Once every 2 seconds, so warn us every 2 minutes.
				message_admins("MOB/SEVERE: !! DANGER !! Total number of mobs exceeds reasonable limits. Performance issues are imminent if left unchecked. Check the subsystem variables for any mobs that are spawning uncontrollably.")
				log_admin("MOB/SEVERE: !! DANGER !! Total number of mobs exceeds reasonable limits. Performance issues are imminent if left unchecked. Check the subsystem variables for any mobs that are spawning uncontrollably.")
				var/admins_online
				for(var/client/C in admins)
					if(R_ADMIN & C.holder.rights)		//Admins can fix this. Mods cannot.
						admins_online = TRUE
						break
				if(!admins_online)		//Nobody's on that can fix this. Yell at the players to call an admin.
					to_world(SPAN_DANGER("SUBSYSTEM WARNING: An issue has been detected with the Mobs subsystem and no administrators are online to correct it. Please notify administrators of this in Discord. Include the following debugging information: \" SUBST_MOBS/0x7D0 EXCESSIVE MOB COUNT\"."))
		else
			alarm = FALSE