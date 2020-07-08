ADMIN_VERB_ADD(/client/proc/respawn_character_virgo, R_FUN, FALSE)
/client/proc/respawn_character_virgo()
	set category = "Special Verbs"
	set name = "Spawn Character (VR)"
	set desc = "(Re)Spawn a client's loaded character, using Virgo's old respawn proc."
	if(!holder)
		src << "Only administrators may use this command."
		return

	//I frontload all the questions so we don't have a half-done process while you're reading.
	var/client/picked_client = input(src, "Please specify which client's character to spawn.", "Client", "") as null|anything in clients
	if(!picked_client)
		return

	var/location = alert(src,"Please specify where to spawn them.", "Location", "Right Here", "Dorms", "Cancel")
	if(!location)
		return

	var/announce = alert(src,"Announce as if they had just arrived?", "Announce", "Yes", "No", "Cancel")
	if(announce == "Cancel")
		return
	else if(announce == "Yes") //Too bad buttons can't just have 1/0 values and different display strings
		announce = TRUE
	else
		announce = FALSE
	
	var/announce_arrival		//down here to avoid nesting.
	if(announce)
		announce_arrival = alert(src,"Which arrival message should we use?", "Announcement Message", "Dorm", "Cryo", "Custom")
		if(announce_arrival == "Dorm")
			announce_arrival = "has awoken in the dormitory"
		else if(announce_arrival == "Cryo")
			announce_arrival = "has completed cryogenic revival"
		else if(announce_arrival == "Custom")
			var/_msg = input(usr,"How would you like the custom announcement to read? (Note: The system will add a period at the end automatically.)\n\n \"John Doe, Scientist, ...\"","Custom Announcement", "has awoken in the dormitory") as message|null
			if(!_msg)
				announce = FALSE
			announce_arrival = sanitize(_msg)

	var/inhabit = alert(src,"Put the person into the spawned mob?", "Inhabit", "Yes", "No", "Cancel")
	if(inhabit == "Cancel")
		return
	else if(inhabit == "Yes")
		inhabit = TRUE
	else
		inhabit = FALSE

	//Name matching is ugly but mind doesn't persist to look at.
	var/charjob
	var/records
	var/datum/data/record/record_found
	record_found = find_general_record("name",picked_client.prefs.real_name)

	//Found their record, they were spawned previously
	if(record_found)
		var/samejob = alert(src,"Found [picked_client.prefs.real_name] in data core. They were [record_found.fields["real_rank"]] this round. Assign same job? They will not be re-added to the manifest/records, either way.","Previously spawned","Yes","Vagabond","No")
		if(samejob == "Yes")
			charjob = record_found.fields["real_rank"]
		else if(samejob == "Vagabond")
			charjob = "Vagabond"
	else
		records = alert(src,"No data core entry detected. Would you like add them to the manifest, and sec/med/HR records?","Records","Yes","No","Cancel")
		if(records == "Cancel")
			return
		if(records == "Yes")
			records = TRUE
		else
			records = FALSE

	//Well you're not reloading their job or they never had one.
	if(!charjob)
		var/pickjob = input(src,"Pick a job to assign them (or none).","Job Select","-No Job-") as null|anything in joblist + "-No Job-"
		if(!pickjob)
			return
		if(pickjob != "-No Job-")
			charjob = pickjob

	//If you've picked a job by now, you can equip them.
	var/equipment
	if(charjob)
		equipment = alert(src,"Spawn them with equipment?", "Equipment", "Yes", "No", "Cancel")
		if(equipment == "Cancel")
			return
		else if(equipment == "Yes")
			equipment = TRUE
		else
			equipment = FALSE

	//For logging later
	var/admin = key_name_admin(src)
	var/player_key = picked_client.key
	//Needed for persistence
	var/picked_ckey = picked_client.ckey
	var/picked_slot = picked_client.prefs.default_slot

	var/mob/living/carbon/human/new_character
	var/datum/spawnpoint/spawnpoint

	//Where did you want to spawn them?
	switch(location)
		if("Right Here") //Spawn them on your turf
			if(!src.mob)
				src << "You can't use 'Right Here' when you are not 'Right Anywhere'!"
				return
			spawnpoint = get_turf(src.mob)

		if("Dorms") //Spawn them at a latejoin spawnpoint
			var/list/candidates_list = list()
			for(var/obj/landmark/join/late/dormitory/candidate in world)
				candidates_list += candidate
			if(!candidates_list.len)
				src << "No dorm spawn positions found!"
				return
			
			var/spawnpoint_selected = pick(candidates_list)
			spawnpoint = get_turf(spawnpoint_selected)
			
		else //I have no idea how you're here
			src << "Invalid spawn location choice."
			return

	//Did we actually get a loc to spawn them?
	if(!spawnpoint)
		src << "Couldn't get valid spawn location."
		return

	new_character = new(spawnpoint)

	//We were able to spawn them, right?
	if(!new_character)
		src << "Something went wrong and spawning failed."
		return

	//Write the appearance and whatnot out to the character
	picked_client.prefs.copy_to(new_character)
	if(new_character.dna)
		new_character.dna.ResetUIFrom(new_character)
		new_character.sync_organ_dna()
	if(inhabit)
		new_character.key = player_key
		//Were they any particular special role? If so, copy.
		/*		//Eclipse removal - incompatible
		if(new_character.mind)
			var/datum/antagonist/antag_data = get_antag_data(new_character.mind.special_role)
			if(antag_data)
				antag_data.add_antagonist(new_character.mind)
				antag_data.place_mob(new_character)
		*/
	if(new_character.mind)
		new_character.mind.key = picked_ckey
		new_character.client.prefs.default_slot = picked_slot		//Eclipse note: Probably redundant, but this is how Virgo did it.

	//If desired, apply equipment.
	if(equipment)
		if(charjob)
			SSjob.EquipRank(new_character, charjob, 1)
		equip_custom_items(new_character)


	//If desired, add records.
	if(records)
		data_core.manifest_inject(new_character)

	//A redraw for good measure
	new_character.update_body()
	new_character.update_icon()

	//If we're announcing their arrival
	if(announce)
		spawn(2 SECONDS)
			AnnounceArrival(new_character, new_character.mind.assigned_role, announce_arrival)

	log_admin("[admin] has spawned [player_key]'s character [new_character.real_name].")
	message_admins("[admin] has spawned [player_key]'s character [new_character.real_name].", 1)

	new_character << "You have been fully spawned. Enjoy the game."

	return new_character