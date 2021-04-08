var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

/datum/job/captain
	title = "Captain"
	flag = CAPTAIN
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "your heart, wisdom and NanoTrasen"
	selection_color = "#ccccff"
	req_admin_notify = 1
	wage = WAGE_NONE //The captain doesn't get paid, he's the one who does the paying
	//The ship account is his, and he's free to draw as much salary as he likes

	wl_config_heads = TRUE		//Eclipse edit.


	perks = list(/datum/perk/sommelier)

	perks = list(/datum/perk/sommelier)

	ideal_character_age = 70 // Old geezer captains ftw
	outfit_type = /decl/hierarchy/outfit/job/captain

	description = "You are a NanoTrasen captain. <br>\
The assigned supervisor of the vast rusting hulk that is the NEV Northern Light. At least, as long as you keep sending the expedition reports.<br>\
This ship is a pinnacle of your career, crewed by an alliance of corporations and factions that NanoTrasen has brokered uneasy treaties with.<br>\

You are the supreme leader of this world, and your word is law. But only as long as you can enforce that law.<br>\
The heads of the factions which make up your command staff, each have their own agendas. Their interests must be served too. If you make them unhappy, the loyalty of their faction goes with them, and you may have a mutiny on your hands.<br>\
Treat your command officers with respect, and listen to their council. Try not to micromanage their departments or interfere in their affairs, and they should serve you well<br>\

You are a free agent, able to go where you will, and loyal only to NanoTrasen. This ship however, left the Corporation with quite a bit of unpaid bills. So wherever you go, you should be sure a profitable venture awaits."

	loyalties = "Your first loyalty is to NanoTrasen. The very council of shareholders appointed you here, praising your skills, or, perhaps, as a punishment. Do not disappoint them. <br>\
	Your second loyalty is to the Northern Light, your ship. It is the pinnacle of your career, and you are nothing without it. If it were to be destroyed, you and your descendants would be ruined for centuries. <br>\

Your third loyalty is to your command officers. The heads of each faction. Listen to their counsel, ensure their interests are served, and keep them happy"

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 25,
		STAT_COG = 15
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	equip(var/mob/living/carbon/human/H)
		if(!..())	return 0
		if(H.age>49)
			var/obj/item/clothing/under/U = H.w_uniform
			if(istype(U)) U.accessories += new /obj/item/clothing/accessory/medal/gold/captain(U)
		return 1

	get_access()
		return get_all_station_access()

/obj/landmark/join/start/captain
	name = "Captain"
	icon_state = "player-gold-officer"
	join_tag = /datum/job/captain



/datum/job/hop
	title = "First Officer"
	flag = FIRSTOFFICER
	department = DEPARTMENT_COMMAND
	head_position = 1
	department_flag = COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 15)
	perks = list(/datum/perk/sommelier)
	ideal_character_age = 50

	wl_config_heads = TRUE		//Eclipse edit.

	description = "You are the captain's right hand. Their second in command. Where they go, you follow. Where they lead, you drag everyone else along. You make sure their will is done, their orders obeyed, and their laws enforced.<br>\
If they makes mistakes, discreetly inform them. Help to cover up their indiscretions and smooth relations with the crew, especially other command staff. Keep the captain safe, by endangering yourself in their stead if necessary.<br>\
<br>\
Do not embarrass them or harm relations with faction leaders.<br>\
<br>\
But who are you?<br>\
Perhaps you are the captain's lifelong friend, or a trusted associate to whom they gave a position of power.<br>\
Perhaps you're a consummate professional who comes highly recommended.<br>\
A retired general or naval officer?<br>\
Perhaps you're the captain's sibling, firstborn, or spouse. Nobody can prevent nepotism if they choose<br>\
Perhaps you're a foreign diplomat, your position a ceremonial one to ensure a treaty.<br>\

Whatever your origin, you are fiercely loyal to the captain"

	duties = "Oversee everyone else, especially the other command staff, to ensure the captain's orders are being carried out.<br>\
Handle job reassignments and promotion requests, if an appropriate faction leader isn't available<br>\
Act as the captain's surrogate in risky situations where a command presence is required<br>\
Replace the captain if they become incapacitated, need to take a break, or suffer a premature death<br>\
Act as the captain's sidekick, bodyguard, and last line of defense in a crisis or mutiny situation"

	loyalties = "Your first and only loyalty is to the captain. Unless you're an antagonist and have a good reason for betrayal, you should remain loyal to the death. You are the only one they can truly trust"

	outfit_type = /decl/hierarchy/outfit/job/hop


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)


	get_access()
		return get_all_station_access()

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_VIG = 20,
		STAT_COG = 10
	)

/obj/landmark/join/start/hop
	name = "Head of Personnel"
	icon_state = "player-gold"
	join_tag = /datum/job/hop



/datum/job/boff
	title = "Bridge Officer"
	flag = BRIDGEOFFICER
	department = DEPARTMENT_COMMAND
	head_position = 0
	department_flag = COMMAND
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Captain"
	selection_color = "#ddddff"
	req_admin_notify = 1
	wage = WAGE_PROFESSIONAL
	also_known_languages = list(LANGUAGE_CYRILLIC = 20, LANGUAGE_SERBIAN = 15)
	perks = list(/datum/perk/boff)
	ideal_character_age = 30

	wl_config_heads = TRUE		//Eclipse edit.

	description = "You are the Captain's personal assistant / bodyguard, and serve at their, or the First Officer's, pleasure. Your normal duties include manning the bridge, including the helm console, but the captain or FO may have specific tasks for you to perform.<br>\
You must also be on guard, there are many people on the ship who might be gunning for your boss, and the bridge is one of the primary areas subversive elements will seek to take when they take the ship.<br>\
You might be the only body between them and total control of the ship.<br>\
<br>\
Do not embarrass them or harm relations with faction leaders.<br>\
<br>\
But who are you?<br>\
Perhaps you are a lifelong friend of someone on the Board, or a trusted associate to whom they gave a position of power.<br>\
Perhaps you're a consummate professional who comes highly recommended.<br>\
A retired soldier or naval officer.<br>\
Perhaps you're the sibling, firstborn, or spouse of someone in power. Nobody can prevent nepotism if they choose<br>\
Perhaps you're a foreign diplomat, your position a ceremonial one to ensure a treaty.<br>\

Whatever your origin, you are fiercely loyal to the captain"

	duties = "Man the bridge, to ensure the ship can always carry out its mission.<br>\
Protect the Captain and First Officer, with your life, if necessary. You are their last line of defense.<br>\
Act as the captain's surrogate in situations too hazardous to risk the life of ship's leader.<br>\
Assist other departments from the bridge when the Captain has no work for you. You don't answer to the rest of the crew, but a good bridge staff helps the crew when in need."

	loyalties = "Your first and only loyalty is to the captain, and by extension, the First Officer. Unless you're an antagonist and have a good reason for betrayal, you should remain loyal to the death. You are one of the few they can truly trust."

	outfit_type = /decl/hierarchy/outfit/job/boff


	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/alarm_monitor)


	access = list(access_RC_announce, access_keycard_auth, access_heads, access_external_airlocks, access_bar, access_kitchen, access_network, access_engine, access_moebius, access_rd, access_security)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_BIO = 5,
		STAT_MEC = 5,
		STAT_VIG = 20,
		STAT_COG = 5
	)

/obj/landmark/join/start/boff
	name = "Bridge Officer"
	icon_state = "player-gold"
	join_tag = /datum/job/boff