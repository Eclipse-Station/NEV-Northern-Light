var/global/datum/controller/occupations/job_master
var/global/list/whitelisted_jobs = ()	//Eclipse var - used in debug proc

//OR AT LEAST IT WOULD BE IF THIS FILE WERE INCLUDED! AH HAHAHAHAHA
//THERE GOES TWO FUCKING HOURS DEBUGGING THE JOB CONTROLLER
//AH HAHAHAHAHAHA I DON'T KNOW IF IT'S THE LIQUOR TALKING OR ME TALKING BUT THAT'S ACTUALLY FUCKING HILARIOUS THAT I SPENT TWO ENTIRE HOURS TRYING TO FIGURE OUT WHY THIS WASN'T WORKING ONLY FOR THIS FILE TO NOT BE CALLED AT ALL IN THE COMPILER

//don't repeat my mistake, leave this file well alone, it won't do you any good			^spitzer

#define GET_RANDOM_JOB 0
#define BE_ASSISTANT 1
#define RETURN_TO_LOBBY 2

/datum/controller/occupations
		//List of all jobs
	var/list/occupations = list()
	var/list/occupations_by_name = list()
		//Players who need jobs
	var/list/unassigned = list()
		//Debug info
	var/list/job_debug = list()


	proc/SetupOccupations(var/faction = "NEV Northern Light")
		occupations.Cut()
		occupations_by_name.Cut()
		for(var/J in subtypesof(/datum/job))
			// // // BEGIN ECLIPSE EDITS // // //
			//Rationale: Job whitelisting setup.
			if(J.manual_whitelist)			//Admin wants this whitelisted for whatever reason.
				J.whitelist_only = TRUE
				whitelisted_jobs += J
			//Whitelist job based on configuration files.
			if(J.wl_config_heads && config.wl_heads)		//Heads of Staff
				J.whitelist_only = TRUE
				whitelisted_jobs += J
			if(J.wl_config_sec && config.wl_security)		//Security
				J.whitelist_only = TRUE
				whitelisted_jobs += J
			if(J.wl_config_borgs && config.wl_silicons)		//Silicons
				J.whitelist_only = TRUE
				whitelisted_jobs += J
			// // // END ECLIPSE EDITS // // //

			var/datum/job/job = new J()
			if(job.faction != faction)
				continue
			occupations += job
			occupations_by_name[job.title] = job

		if(!occupations.len)
			world << SPAN_WARNING("Error setting up jobs, no job datums found!")
			return 0

		return 1

	proc/Debug(var/text)
		if(!Debug2)
			return 0
		job_debug.Add(text)
		return 1

	proc/GetJob(var/rank)
		return rank && occupations_by_name[rank]

	proc/AssignRole(var/mob/new_player/player, var/rank, var/latejoin = 0)
		Debug("Running AR, Player: [player], Rank: [rank], LJ: [latejoin]")
		if(player && player.mind && rank)
			var/datum/job/job = GetJob(rank)
			if(!job)
				return 0
			if(job.minimum_character_age && (player.client.prefs.age < job.minimum_character_age))
				return 0
			if(!is_job_whitelisted(player, rank))		//eclipse addition this iteration
				return 0
			if(jobban_isbanned(player, rank))
				return 0

			var/position_limit = job.total_positions
			if(!latejoin)
				position_limit = job.spawn_positions
			if((job.current_positions < position_limit) || position_limit == -1)
				Debug("Player: [player] is now Rank: [rank], JCP:[job.current_positions], JPL:[position_limit]")
				player.mind.assigned_role = rank
				player.mind.assigned_job = job
				unassigned -= player
				job.current_positions++
				return 1
		Debug("AR has failed, Player: [player], Rank: [rank]")
		return 0

	proc/FreeRole(var/rank)	//making additional slot on the fly
		var/datum/job/job = GetJob(rank)
		if(job && job.current_positions >= job.total_positions && job.total_positions != -1)
			job.total_positions++
			return 1
		return 0

	proc/FindOccupationCandidates(datum/job/job, level, flag)
		Debug("Running FOC, Job: [job], Level: [level], Flag: [flag]")
		var/list/candidates = list()
		for(var/mob/new_player/player in unassigned)
			if(!is_job_whitelisted(player, job.title))		//Eclipse addition this iteration - whitelisting
				Debug("FOC is_job_whitelisted failed, Player: [player]")
				continue
			if(jobban_isbanned(player, job.title))
				Debug("FOC isbanned failed, Player: [player]")
				continue
			if(job.minimum_character_age && (player.client.prefs.age < job.minimum_character_age))
				Debug("FOC character not old enough, Player: [player]")
				continue
			if(flag && !(flag in player.client.prefs.be_special_role))
				Debug("FOC flag failed, Player: [player], Flag: [flag], ")
				continue
			if(player.client.prefs.GetJobDepartment(job, level) & job.flag)
				Debug("FOC pass, Player: [player], Level:[level]")
				candidates += player
		return candidates

	proc/GiveRandomJob(var/mob/new_player/player)
		Debug("GRJ Giving random job, Player: [player]")
		for(var/datum/job/job in shuffle(occupations))
			if(!job)
				continue

			if(job.minimum_character_age && (player.client.prefs.age < job.minimum_character_age))
				continue

			if(istype(job, GetJob("Assistant"))) // We don't want to give him assistant, that's boring!
				continue

			if(job in command_positions) //If you want a command position, select it!
				continue

			if(!is_job_whitelisted(player, job.title))		//Eclipse Addition this iteration - whitelisting
				Debug("GRJ is_job_whitelisted failed, Player: [player], Job: [job.title]")
				continue

			if(jobban_isbanned(player, job.title))
				Debug("GRJ isbanned failed, Player: [player], Job: [job.title]")
				continue

			if((job.current_positions < job.spawn_positions) || job.spawn_positions == -1)
				Debug("GRJ Random job given, Player: [player], Job: [job]")
				AssignRole(player, job.title)
				unassigned -= player
				break

	proc/ResetOccupations()
		for(var/mob/new_player/player in player_list)
			if((player) && (player.mind))
				player.mind.assigned_role = null
				player.mind.assigned_job = null
		//		player.mind.special_role = null
		SetupOccupations()
		unassigned = list()
		return


	///This proc is called before the level loop of DivideOccupations() and will try to select a head, ignoring ALL non-head preferences for every level until it locates a head or runs out of levels to check
	proc/FillHeadPosition()
		for(var/level = 1 to 3)
			for(var/command_position in command_positions)
				var/datum/job/job = GetJob(command_position)
				if(!job)	continue
				var/list/candidates = FindOccupationCandidates(job, level)
				if(!candidates.len)	continue

				// Build a weighted list, weight by age.
				var/list/weightedCandidates = list()
				for(var/mob/V in candidates)
					// Log-out during round-start? What a bad boy, no head position for you!
					if(!V.client) continue
					var/age = V.client.prefs.age

					if(age < job.minimum_character_age) // Nope.
						continue

					switch(age)
						if(job.minimum_character_age to (job.minimum_character_age+10))
							weightedCandidates[V] = 3 // Still a bit young.
						if((job.minimum_character_age+10) to (job.ideal_character_age-10))
							weightedCandidates[V] = 6 // Better.
						if((job.ideal_character_age-10) to (job.ideal_character_age+10))
							weightedCandidates[V] = 10 // Great.
						if((job.ideal_character_age+10) to (job.ideal_character_age+20))
							weightedCandidates[V] = 6 // Still good.
						if((job.ideal_character_age+20) to INFINITY)
							weightedCandidates[V] = 3 // Geezer.
						else
							// If there's ABSOLUTELY NOBODY ELSE
							if(candidates.len == 1) weightedCandidates[V] = 1


				var/mob/new_player/candidate = pickweight(weightedCandidates)
				if(AssignRole(candidate, command_position))
					return 1
		return 0


	///This proc is called at the start of the level loop of DivideOccupations() and will cause head jobs to be checked before any other jobs of the same level
	proc/CheckHeadPositions(var/level)
		for(var/command_position in command_positions)
			var/datum/job/job = GetJob(command_position)
			if(!job)	continue
			var/list/candidates = FindOccupationCandidates(job, level)
			if(!candidates.len)	continue
			var/mob/new_player/candidate = pick(candidates)
			AssignRole(candidate, command_position)
		return


/** Proc DivideOccupations
 *  fills var "assigned_role" for all ready players.
 *  This proc must not have any side effect besides of modifying "assigned_role".
 **/
	proc/DivideOccupations()
		//Setup new player list and get the jobs list
		Debug("Running DO")
		SetupOccupations()

		//Holder for Triumvirate is stored in the ticker, this just processes it
		if(ticker && ticker.triai)
			for(var/datum/job/A in occupations)
				if(A.title == "AI")
					A.spawn_positions = 3
					break

		//Get the players who are ready
		for(var/mob/new_player/player in player_list)
			if(player.ready && player.mind && !player.mind.assigned_role)
				unassigned += player

		Debug("DO, Len: [unassigned.len]")
		if(unassigned.len == 0)	return 0

		//Shuffle players and jobs
		unassigned = shuffle(unassigned)

		HandleFeedbackGathering()

		//People who wants to be assistants, sure, go on.
		Debug("DO, Running Assistant Check 1")
		var/datum/job/assist = new DEFAULT_JOB_TYPE ()
		var/list/assistant_candidates = FindOccupationCandidates(assist, 3)
		Debug("AC1, Candidates: [assistant_candidates.len]")
		for(var/mob/new_player/player in assistant_candidates)
			Debug("AC1 pass, Player: [player]")
			AssignRole(player, "Assistant")
			assistant_candidates -= player
		Debug("DO, AC1 end")

		//Select one head
		Debug("DO, Running Head Check")
		FillHeadPosition()
		Debug("DO, Head Check end")

		//Other jobs are now checked
		Debug("DO, Running Standard Check")


		// New job giving system by Donkie
		// This will cause lots of more loops, but since it's only done once it shouldn't really matter much at all.
		// Hopefully this will add more randomness and fairness to job giving.

		// Loop through all levels from high to low
		var/list/shuffledoccupations = shuffle(occupations)
		// var/list/disabled_jobs = ticker.mode.disabled_jobs  // So we can use .Find down below without a colon.
		for(var/level = 1 to 3)
			//Check the head jobs first each level
			CheckHeadPositions(level)

			// Loop through all unassigned players
			for(var/mob/new_player/player in unassigned)

				// Loop through all jobs
				for(var/datum/job/job in shuffledoccupations) // SHUFFLE ME BABY
					/*if(!job || ticker.mode.disabled_jobs.Find(job.title) )
						continue
					*/

					if(!is_job_whitelisted(player, job.title))		//Eclipse addition this iteration - whitelisting
						Debug("DO is_job_whitelisted failed, Player: [player], Job:[job.title]")
						continue

					if(jobban_isbanned(player, job.title))
						Debug("DO isbanned failed, Player: [player], Job:[job.title]")
						continue

					// If the player wants that job on this level, then try give it to him.
					if(player.client.prefs.GetJobDepartment(job, level) & job.flag)

						// If the job isn't filled
						if((job.current_positions < job.spawn_positions) || job.spawn_positions == -1)
							Debug("DO pass, Player: [player], Level:[level], Job:[job.title]")
							AssignRole(player, job.title)
							unassigned -= player
							break

		// Hand out random jobs to the people who didn't get any in the last check
		// Also makes sure that they got their preference correct
		for(var/mob/new_player/player in unassigned)
			if(player.client.prefs.alternate_option == GET_RANDOM_JOB)
				GiveRandomJob(player)

		Debug("DO, Standard Check end")

		Debug("DO, Running AC2")

		// For those who wanted to be assistant if their preferences were filled, here you go.
		for(var/mob/new_player/player in unassigned)
			if(player.client.prefs.alternate_option == BE_ASSISTANT)
				Debug("AC2 Assistant located, Player: [player]")
				AssignRole(player, "Assistant")

		//For ones returning to lobby
		for(var/mob/new_player/player in unassigned)
			if(player.client.prefs.alternate_option == RETURN_TO_LOBBY)
				player.ready = 0
				player.new_player_panel_proc()
				unassigned -= player
		return 1


	proc/EquipRank(var/mob/living/carbon/human/H, var/rank, var/joined_late = 0)
		if(!H)	return null

		var/datum/job/job = GetJob(rank)
		var/list/spawn_in_storage = list()

		if(job)

			//Equip custom gear loadout.
			var/list/custom_equip_slots = list() //If more than one item takes the same slot, all after the first one spawn in storage.
			var/list/custom_equip_leftovers = list()
			if(H.client.prefs.gear && H.client.prefs.gear.len && job.title != "Cyborg" && job.title != "AI")
				for(var/thing in H.client.prefs.gear)
					var/datum/gear/G = gear_datums[thing]
					if(G)
						var/permitted
						if(G.allowed_roles)
							for(var/job_name in G.allowed_roles)
								if(job.title == job_name)
									permitted = 1
						else
							permitted = 1

						if(G.whitelisted && !is_alien_whitelisted(H, G.whitelisted))
							permitted = 0

						if(!permitted)
							H << SPAN_WARNING("Your current job or whitelist status does not permit you to spawn with [thing]!")
							continue

						if(G.slot && !(G.slot in custom_equip_slots))
							// This is a miserable way to fix the loadout overwrite bug, but the alternative requires
							// adding an arg to a bunch of different procs. Will look into it after this merge. ~ Z
							var/metadata = H.client.prefs.gear[G.display_name]
							if(G.slot == slot_wear_mask || G.slot == slot_wear_suit || G.slot == slot_head)
								custom_equip_leftovers += thing
							else if(H.equip_to_slot_or_del(G.spawn_item(H, metadata), G.slot))
								H << SPAN_NOTICE("Equipping you with \the [thing]!")
								custom_equip_slots.Add(G.slot)
							else
								custom_equip_leftovers.Add(thing)
						else
							spawn_in_storage += thing
			//Equip job items and language stuff
			job.equip(H)
			job.add_stats(H)
			job.add_additiional_language(H)
			job.setup_account(H)

			job.apply_fingerprints(H)

			//If some custom items could not be equipped before, try again now.
			for(var/thing in custom_equip_leftovers)
				var/datum/gear/G = gear_datums[thing]
				if(G.slot in custom_equip_slots)
					spawn_in_storage += thing
				else
					var/metadata = H.client.prefs.gear[G.display_name]
					if(H.equip_to_slot_or_del(G.spawn_item(H, metadata), G.slot))
						H << SPAN_NOTICE("Equipping you with \the [thing]!")
						custom_equip_slots.Add(G.slot)
					else
						spawn_in_storage += thing
		else
			H << "Your job is [rank] and the game just can't handle it! Please report this bug to an administrator."

		H.job = rank

		if(!joined_late)
			var/turf/S = pickSpawnLocation(job.type)
			if(istype(S))
				H.forceMove(S)
			else
				LateSpawn(H.client, rank)

			// Moving wheelchair if they have one
			if(H.buckled && istype(H.buckled, /obj/structure/bed/chair/wheelchair))
				H.buckled.forceMove(H.loc)
				H.buckled.set_dir(H.dir)

		// If they're head, give them the account info for their department
		if(H.mind && job.head_position)
			var/remembered_info = ""
			var/datum/money_account/department_account = department_accounts[job.department]

			if(department_account)
				remembered_info += "<b>Your department's account number is:</b> #[department_account.account_number]<br>"
				remembered_info += "<b>Your department's account pin is:</b> [department_account.remote_access_pin]<br>"
				remembered_info += "<b>Your department's account funds are:</b> $[department_account.money]<br>"
			remembered_info += "<b>Your part of nuke code:</b> [ticker.get_next_nuke_code_part()]<br>"

			H.mind.store_memory(remembered_info)

		var/alt_title = null
		if(H.mind)
			H.mind.assigned_role = rank
		//	alt_title = H.mind.role_alt_title

			switch(rank)
				if("Cyborg")
					return H.Robotize()
				if("AI")
					return H
				if("Captain")
					var/sound/announce_sound = (ticker.current_state <= GAME_STATE_SETTING_UP)? null : sound('sound/misc/boatswain.ogg', volume=20)
					captain_announcement.Announce("All hands, Captain [H.real_name] on deck!", new_sound=announce_sound)

			//Deferred item spawning.
			if(spawn_in_storage && spawn_in_storage.len)
				var/obj/item/weapon/storage/B
				for(var/obj/item/weapon/storage/S in H.contents)
					B = S
					break

				if(!isnull(B))
					for(var/thing in spawn_in_storage)
						H << SPAN_NOTICE("Placing \the [thing] in your [B.name]!")
						var/datum/gear/G = gear_datums[thing]
						var/metadata = H.client.prefs.gear[G.display_name]
						G.spawn_item(B, metadata)
				else
					H << SPAN_DANGER("Failed to locate a storage object on your mob, either you spawned with no arms and no backpack or this is a bug.")

		if(istype(H)) //give humans wheelchairs, if they need them.
			var/obj/item/organ/external/l_foot = H.get_organ(BP_L_FOOT)
			var/obj/item/organ/external/r_foot = H.get_organ(BP_R_FOOT)
			if(!l_foot || !r_foot)
				var/obj/structure/bed/chair/wheelchair/W = new /obj/structure/bed/chair/wheelchair(H.loc)
				H.buckled = W
				H.update_canmove()
				W.set_dir(H.dir)
				W.buckled_mob = H
				W.add_fingerprint(H)

		H << "<B>You are [job.total_positions == 1 ? "the" : "a"] [alt_title ? alt_title : rank].</B>"

		if(job.supervisors)
			H << "<b>As the [alt_title ? alt_title : rank] you answer directly to [job.supervisors]. Special circumstances may change this.</b>"

		if(job.idtype)
			spawnId(H, rank, alt_title)
			H.equip_to_slot_or_del(new /obj/item/device/radio/headset(H), slot_l_ear)
			H << "<b>To speak on your department's radio channel use :h. For the use of other channels, examine your headset.</b>"

		if(job.req_admin_notify)
			H << "<b>You are playing a job that is important for Game Progression. If you have to disconnect, please notify the admins via adminhelp.</b>"

		//Gives glasses to the vision impaired
		if(H.disabilities & NEARSIGHTED)
			var/equipped = H.equip_to_slot_or_del(new /obj/item/clothing/glasses/regular(H), slot_glasses)
			if(equipped != 1)
				var/obj/item/clothing/glasses/G = H.glasses
				G.prescription = 1

		BITSET(H.hud_updateflag, ID_HUD)
		BITSET(H.hud_updateflag, SPECIALROLE_HUD)
		return H


	proc/spawnId(var/mob/living/carbon/human/H, rank, title, idtype)
		if(!H)	return 0
		var/obj/item/weapon/card/id/C = null

		var/datum/job/job = null
		for(var/datum/job/J in occupations)
			if(J.title == rank)
				job = J
				break

		if(job)
			if(job.title == "Cyborg")
				return
			else
				idtype = idtype ? idtype : job.idtype
				C = new idtype(H)
				C.access = job.get_access()
		else
			C = new /obj/item/weapon/card/id(H)
		if(C)
			C.rank = rank
			C.assignment = title ? title : rank
			H.set_id_info(C)

			//put the player's account number onto the ID
			if(H.mind && H.mind.initial_account)
				C.associated_account_number = H.mind.initial_account.account_number

			H.equip_to_slot_or_del(C, slot_wear_id)

		H.equip_to_slot_or_del(new /obj/item/device/pda(H), slot_belt)
		if(locate(/obj/item/device/pda,H))
			var/obj/item/device/pda/pda = locate(/obj/item/device/pda,H)
			pda.owner = H.real_name
			pda.ownjob = C.assignment
			pda.ownrank = C.rank
			pda.name = "PDA-[H.real_name] ([pda.ownjob])"

		return 1


	proc/LoadJobs(jobsfile) //ran during round setup, reads info from jobs.txt -- Urist
		if(!config.load_jobs_from_txt)
			return 0

		var/list/jobEntries = file2list(jobsfile)

		for(var/job in jobEntries)
			if(!job)
				continue

			job = trim(job)
			if (!length(job))
				continue

			var/pos = findtext(job, "=")
			var/name = null
			var/value = null

			if(pos)
				name = copytext(job, 1, pos)
				value = copytext(job, pos + 1)
			else
				continue

			if(name && value)
				var/datum/job/J = GetJob(name)
				if(!J)	continue
				J.total_positions = text2num(value)
				J.spawn_positions = text2num(value)
				if(name == "AI" || name == "Cyborg")//I dont like this here but it will do for now
					J.total_positions = 0

		return 1

	proc/HandleFeedbackGathering()
		for(var/datum/job/job in occupations)
			var/tmp_str = "|[job.title]|"

			var/level1 = 0 //high
			var/level2 = 0 //medium
			var/level3 = 0 //low
			var/level4 = 0 //never
			var/level5 = 0 //banned
			var/level6 = 0 //account too young
			var/level7 = 0 //whitelist - eclipse edit
			for(var/mob/new_player/player in player_list)
				if(!(player.ready && player.mind && !player.mind.assigned_role))
					continue //This player is not ready
				if(jobban_isbanned(player, job.title))
					level5++
					continue
				if(!is_job_whitelisted(player, job.title))		//eclipse edit this iteration
					level7++
					continue
				if(player.client.prefs.GetJobDepartment(job, 1) & job.flag)
					level1++
				else if(player.client.prefs.GetJobDepartment(job, 2) & job.flag)
					level2++
				else if(player.client.prefs.GetJobDepartment(job, 3) & job.flag)
					level3++
				else level4++ //not selected

			tmp_str += "HIGH=[level1]|MEDIUM=[level2]|LOW=[level3]|NEVER=[level4]|BANNED=[level5]|YOUNG=[level6]|WHITELIST=[level7]-"		//eclipse edit


/datum/controller/occupations/proc/LateSpawn(var/client/C, var/rank, var/return_location = 0)
	//spawn at one of the latespawn locations
	var/datum/spawnpoint/spawnpos

	if(!C)
		CRASH("Null client passed to LateSpawn() proc!")

	var/mob/H = C.mob
	if(C.prefs.spawnpoint)
		spawnpos = getSpawnPoint(C.prefs.spawnpoint, FALSE)
	if(!spawnpos || !spawnpos.check_job_spawning(rank))
		for(var/name in spawnpoints_late)
			var/datum/spawnpoint/SP = spawnpoints_late[name]
			if(SP.check_job_spawning(rank))
				spawnpos = SP
				break

	if(spawnpos && istype(spawnpos))
		var/list/latejoin = safepick(spawnpos.getFreeTurfs())
		if(return_location)
			return latejoin
		else
			if(H)
				H.forceMove(latejoin)
			return spawnpos.message
	else
		if(return_location)
			return pickSpawnLocation()
		else
			if(H)
				H.forceMove(pickSpawnLocation())
			return "has arrived on the ship"

/datum/controller/occupations/proc/print_whitelisted_jobs(mob/user)		//Eclipse Addition for debug purposes.
	user = usr
	return whitelisted_jobs
