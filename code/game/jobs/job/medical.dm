/datum/job/cmo
	title = "Chief Medical Officer"
	flag = CMO
	head_position = 1
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL | COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Lazarus Foundation"
	selection_color = "#94a87f"
	req_admin_notify = 1
	wage = WAGE_COMMAND
	outfit_type = /decl/hierarchy/outfit/job/medical/cmo

	wl_config_heads = TRUE		//Eclipse edit.

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce, access_moebius_consoles,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_change_medbay
	)

	ideal_character_age = 50

	stat_modifiers = list(
		STAT_BIO = 50,
		STAT_MEC = 10,
		STAT_COG = 25
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/reports)

	description = "You are the head of the Medical Bay on the NEV Northern Light and provide medical services to the crew.<br>\
You are here to keep everyone alive and ideally, at work. You should make choices that preserve life as much as possible.<br>\

The handling of the medbay is your domain, although remember that both medical and science are branches of Lazarus Foundation, so your colleagues have free access to your resources, and vice versa"

	duties = "Organise the doctors under your command to help save lives. Assign patients, and check on their progress periodically<br>\
Dispatch your paramedics to distress calls, and corpse recoveries as needed<br>\
Use department funds to purchase medical supplies and equipment as needed<br>\
Advise the captain on medical issues that concern the crew<br>\
Advise the crew on ethical issues<br>\
In times of crisis, lock down the medbay to protect those within, from outside threats."

	loyalties = "As a doctor, your first loyalty is to your conscience. You swore an oath to save lives and do no harm. It falls on you to be the ethical and moral core of the crew. You should speak up for prisoners, captured lifeforms, and test subjects. Nobody else will.<br>\

Your second loyalty is to your career with Lazarus, and to your coworkers in both Medical and Research. Help out your scientific colleagues, and aid in their pursuit of knowledge."

/obj/landmark/join/start/cmo
	name = "Chief Medical Officer"
	icon_state = "player-green-officer"
	join_tag = /datum/job/cmo


/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the Chief Medical Officer"
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	alt_titles = list("Surgeon", "Nurse", "Medical Intern")
	outfit_type = /decl/hierarchy/outfit/job/medical/doctor

	access = list(
		access_moebius, access_medical_equip, access_maint_tunnels, access_morgue, access_surgery, access_chemistry, access_virology,
		access_genetics, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_BIO = 40,
		STAT_COG = 10
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)


	description = "You are a highly educated professional doctor, working a placement aboard the NEV Northern Light to treat the injured.<br>\
	Your tasks will primarily keep you inside medbay, the place needs to have a doctor onsite at all times to treat incoming wounded. As a general rule, you should not leave medbay if you're the only one in it, make sure someone is covering for you if you go elsewhere.<br>\
	As a doctor, a broad range of medical procedures fall under your potential purview. You are not expected to be able to perform all of these yourself, being a specialist is fine. <br>\
	<br>\
	-Diagnostics: Figuring out what's wrong and how to fix it as quickly as possible. <br>\
	-General Treatment: Administering bandages, medicine, casts and placing people in a cryocell as necessary<br>\
	-Surgery: Opening the body under general anaesthetic to treat broken bones, organ damage and internal bleeding<br>\
	-Virology: The study and manipulation of viruses<br>\
	<br>\
Divide responsibilities among your colleagues to ensure each patient gets the treatment they need<br>\
You also have full access to chemistry, and can utilize  it if medical is short staffed. But if there is a dedicated chemist on staff, they take priority and the lab belongs to them<br>\
<br>\
Character Expectations:<br>\
You are a real doctor, and as such you are expected to hold a lot of qualifications. You've most likely completed many years of medical study, and hold a PHD in one or more medical fields.<br>\
You are expected to be knowledgeable and competent in at least basic treatment, you may have a specialty though."


	loyalties = "As a doctor, your first loyalty is to your conscience. You swore an oath to save lives and do no harm. It falls on you to be the ethical and moral core of the crew. You should speak up for prisoners, captured lifeforms, and test subjects. Nobody else will.<br>\

Your second loyalty is to your career with Lazarus, and to your coworkers in both Medical and Research. Help out your scientific colleagues, and aid in their pursuit of knowledge."

/obj/landmark/join/start/doctor
	name = "Medical Doctor"
	icon_state = "player-green"
	join_tag = /datum/job/doctor



/datum/job/chemist
	title = "Chemist"
	flag = CHEMIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Chief Medical Officer"
	selection_color = "#a8b69a"
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/medical/chemist

	access = list(
		access_moebius, access_medical_equip, access_maint_tunnels, access_morgue, access_surgery, access_chemistry, access_virology, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_COG = 10,
		STAT_MEC = 10,
		STAT_BIO = 30
	)

	perks = list(/datum/perk/selfmedicated/chemist)

	software_on_spawn = list(/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/scanner)

	description = "The chemist is a man of medicine, as much as of science. You mix up colorful liquids to make other, equally colorful, but more useful liquids.<br>\
	<br>\
	Your primary responsibility is working as a pharmacist. Prepare medicines for use by the medical staff, so that they can capably treat a broad variety of conditions. It's good to keep a stock of bicaridine, dexalin, peridaxon, and alkysine.<br>\
	<br>\
	Your secondary responsibility is as a chemical manufacturer for Lazarus generally. You may be requested to make non-medical chemicals for your colleagues in science, or even for other medical staff. Anyone within moebius should be freely and quickly provided with anything they request. Don't question why, it's above your paygrade.<br>\
	<br>\
	Your third duty is to run a chemical sales outlet. You may get requests from other crewmembers to make acid, chemical grenades, smoke, cleaning products, napalm, or perhaps even just to make medicines. You are fully licensed to sell any and all chemicals to those outside moebius. Sell being the operative word here. If someone isn't an employee of Moebius corp, charge them for their chemicals.<br>\
	<br>\
	Its worth noting that you don't always have everything you need on hand. Some recipes will require external ingredients. Bicaridine, most notably, requires the roach toxin blattedin, so you should gather up roach corpses to hack apart for their chemicals. Pay assistants to do this if necessary"

	duties = "		Mix medicines for doctors<br>\
		Fill chemical requests for Lazarus staff<br>\
		Sell chemicals and chem grenades to outsiders"

	loyalties = "Your loyalty is to your career with Lazarus Foundation, and to your coworkers in both branches of Lazarus. Help out your scientific colleagues, and aid in their pursuit of knowledge."


/obj/landmark/join/start/chemist
	name = "Pharmacist"
	icon_state = "player-green"
	join_tag = /datum/job/chemist


/datum/job/psychiatrist
	title = "Psychiatrist"
	flag = PSYCHIATRIST
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	wage = WAGE_PROFESSIONAL
	supervisors = "the Chief Medical Officer"
	selection_color = "#a8b69a"
	outfit_type = /decl/hierarchy/outfit/job/medical/psychiatrist

	access = list(
		access_moebius, access_medical_equip, access_morgue, access_psychiatrist, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_BIO = 25,
		STAT_COG = 15,
		STAT_VIG = 5
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							/datum/computer_file/program/camera_monitor)


/obj/landmark/join/start/psychiatrist
	name = "Psychiatrist"
	icon_state = "player-green"
	join_tag = /datum/job/psychiatrist

//Beginning of Eclipse Edit - Paramedic replaced with "Trauma Team" role.

/datum/job/paramedic
	title = "Trauma Team"
	flag = PARAMEDIC
	department = DEPARTMENT_MEDICAL
	department_flag = MEDICAL
	faction = "NEV Northern Light"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Chief Medical Officer"
	selection_color = "#a8b69a"
	wage = WAGE_LABOUR_HAZARD
	outfit_type = /decl/hierarchy/outfit/job/medical/paramedic
	access = list(
		access_moebius, access_medical_equip, access_morgue, access_surgery, access_paramedic,
		access_eva, access_maint_tunnels, access_external_airlocks, access_moebius_consoles
	)

	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_ROB = 20,
		STAT_TGH = 10,
		STAT_VIG = 15,
	)

	perks = list(/datum/perk/selfmedicated)

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							/datum/computer_file/program/chem_catalog,
							 /datum/computer_file/program/camera_monitor)

	description = "Members of the trauma team are not scientists or doctors, you are strictly in charge of enforcing the orders of Lazarus leadership.<br>\
	Your primary role is that of a security officer for Lazarus. You make sure that the medical and science departmetns remain safe by ensuring people don't trespass or steal items and remove those who shouldn't be there, by force if necessary.<br>\
	Your secondary responsibility is that of an enforcer. Actions that require in house enforcement such as aiding doctors and security with violent patients in medical, securing the virology lab during an outbreak, and aiding in the destruction of escaped slimes or experiments from science.<br>\
	Your third duty is to aid medical doctors and act as a paramedic. Fixing and collecting patients, this can include retrieving chemicals, doing basic triage, and going out into maintenance recover the injured.<br>\
	You are fully licensed to enforce the will of the Lazarus Foundation and to protect its property, its staff, and your patients with your personal weapons and armor."

	duties = "Act as a guard for Lazarus, watching for and detaining tresspassers and thieves.<br>\
		Aid medical doctors in any way you can.<br>\
		Act as a nurse for minor injuries, treating patients that a doctor needn't bother with.<br>\
		Ensure that any outbreaks are contained, such as slimes, infected monkeys, or kudzu."

	loyalties = "As a security specialist aboard the Northern Light, your first and only loyalty is to the Lazarus Foundation, protect their staff to the best of your ability, and follow their instructions and policies."

/obj/landmark/join/start/paramedic
	name = "Trauma Team"
	icon_state = "player-green"
	join_tag = /datum/job/paramedic

//End of Eclipse edit.
