/datum/job/chief_engineer
	title = "Chief Engineer"
	flag = EXULTANT
	head_position = 1
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING | COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Captain and NanoTrasen"
	selection_color = "#c7b97b"
	req_admin_notify = 1
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 25)
	wage = WAGE_COMMAND
	ideal_character_age = 50

	wl_config_heads = TRUE		//Eclipse edit.
//	alt_titles = list()

	outfit_type = /decl/hierarchy/outfit/job/engineering/exultant

	access = list(
		access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_teleporter, access_external_airlocks, access_atmospherics, access_emergency_storage, access_eva,
		access_heads, access_construction, access_sec_doors,
		access_ce, access_RC_announce, access_keycard_auth, access_tcomsat, access_ai_upload, access_change_engineering
	)

	stat_modifiers = list(
		STAT_MEC = 40,
		STAT_COG = 20,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/ntnetmonitor,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control,
							 /datum/computer_file/program/reports)

	description = "You are the Chief Engineer, the head of the ship's maintenance crew. You and your crew work on the Northern Light, it is your work, and your pride. <br>\
You are to keep the ship running and constantly improve it as much as you are able. Let none question the efficacy of your labours."

	loyalties = "Your first loyalty is to NanoTrasen. The engineering department is your territory, and machinery across the ship are your responsibility. Do not tolerate others interfering with them, intruding on your space, or questioning your competence. You don't need inspections, oversight or micromanagement. Outsiders should only enter your spaces by invitation, or out of necessity. Even the captain and other command staff are no exception.<br>\

Your second loyalty is to your workers. Ensure they are paid, fed and safe. Don't risk their lives unnecessarily. If an area is infested with monsters, there's no reason to risk lives trying to repair anything inside there. If one of your people is imprisoned, endangered or accused, you should fight for them. Treat every engineer like your family"

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/chief_engineer
	name = "Chief Engineer"
	icon_state = "player-orange-officer"
	join_tag = /datum/job/chief_engineer


/datum/job/technomancer
	title = "Ship Engineer"
	flag = TECHNOMANCER
	department = DEPARTMENT_ENGINEERING
	department_flag = ENGINEERING
	faction = "NEV Northern Light"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief Engineer"
	selection_color = "#d5c88f"
	also_known_languages = list(LANGUAGE_CYRILLIC = 100, LANGUAGE_SERBIAN = 5)
	wage = WAGE_PROFESSIONAL
	alt_titles = list("Engineering Apprentice", "Atmospherics Technician", "Electrician", "Maintenance Technician")


	outfit_type = /decl/hierarchy/outfit/job/engineering/engineer

	access = list(
		access_eva, access_engine, access_engine_equip, access_tech_storage, access_maint_tunnels,
		access_external_airlocks, access_construction, access_atmospherics
	)

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 15,
		STAT_TGH = 10,
		STAT_VIG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shield_control)

	description = "You are a ship engineer, member of a small clan of spacefaring engineers. Maintaining the ship is your responsibility, ensure the engine is running, the lights are on, the thrusters are fueled, and the air is breathable<br>\
<br>\
Your duties aboard the ship are many and varied. For a start, at the beginning of a shift, you should make sure the Supermatter engine is started up. This is a complex task, and you should learn from others in your group rather than attempting it yourself. Fueling up the thrusters is next to allow the ship to get anywhere, and again you should learn from others<br>\
<br>\
Once these core systems are setup, you may relax a bit, but you should also devote time to learning and configuring. The power distribution systems can be made more robust. Engineers are typically responsible for configuring the shield generators too. Shut it down to save power when not needed, make sure its online before the ship travels anywhere.<br>\
<br>\
With the power of construction, you are free to customise the ship to your own uses. Build and remove walls to make things more efficient, or more secure. Construct new machines to extend capabilities and make everyone's lives easier. You can even place traps or construct turrets to keep nosy outsiders out of sensitive areas. The ship is yours to improve and build upon.<br>\
<br>\
Make sure your EVA gear is prepared, and you're fully equipped with tools. Modding and upgrading your tools is strongly advised for optimal performance. Toolmods can be found while scavenging maintenance, or purchased. And always, always carry duct tape.<br>\
You should carry materials too for field repair work, but don't steal entire stacks for yourself - the other engineers are your brothers and you should share evenly, take only what you need.<br>\
 <br>\
Most importantly, be ready to respond to emergency calls at any time. Parts of the ship may be breached or explode, and its your job to fix it. No matter the cost, no matter the danger, you have the equipment and skills to march into places that would be death to most mortals. It is your responsibility to keep the ship more-or-less in one piece and still able to fly.<br>\
<br>\
The Northern Light is your home, your life, and your livelihood. Take pride in it, and in your responsibilities. You should be hesitant to abandon ship, and try your hardest to prevent that becoming necessary. The engineering department is your sovereign territory, and you should be very wary of outsiders entering uninvited. Your fellow engineers are your family. Take care of them, treat them well, share everything with them, and solve your problems internally."

	duties = "	-Start up the supermatter<br>\
	-Fuel the thrusters<br>\
	-Manage the shield generator<br>\
	-Repair anything and anyone that needs repaired<br>\
	-Respond to distress calls and patch breaches in the hull.<br>\
	-Keep every part of the ship powered, oxygenated, and ready to use"

	loyalties = "	As an engineer, your first loyalty is to your fellow engineers. Ensure they are safe and well supplied, defend them, assist them, and share everything with them. If problems arise between you, ask the Chief Engineer to rule on it. Don't snitch on your fellow clanmates by calling Aegis. The Chief Engineer is the head of your clan, and in many ways a father figure. Trust in their wisdom and follow their instructions above anyone else's.<br>\
	<br>\
	Your second loyalty is to your ship. Unlike most of your crew, who would simply go home, the Northern Light IS your home. Avoid abandoning ship at all costs. This is where you live and it's worth sacrificing for. Take pride in your work, and make the Northern Light something to be cherished."

	perks = list(/datum/perk/inspiration)

/obj/landmark/join/start/technomancer
	name = "Engineer"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer
