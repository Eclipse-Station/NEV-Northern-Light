#define LOYALTY_CIVILIAN "As a civilian, your only loyalty is to yourself and your livelihood.<br>\
		You just want to survive, make a living, and get through the day. You shouldn't try to be a hero, or throw your life away for a cause. Nor should you hold any loyalties. Civilians should be easily corruptible, willing to take bribes to do anything someone wants and stay quiet about it."


/datum/job/clubmanager
	title = "Club Manager"
	flag = CLUBMANAGER
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Head of Personnel"
	selection_color = "#dddddd"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 15, LANGUAGE_JIVE = 80)
	access = list(access_bar, access_kitchen, access_maint_tunnels, access_change_club)
	initial_balance = 3000
	wage = WAGE_NONE // Makes his own money
	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/bartender //Re-using this.
	description = "As the Club Manager, you run the club aboard NEV Northern Light. Provide the crewmembers with drinks, food, and entertainment.<br>\
	<br>\
	Technically you take orders from no one, but the Captain and the Head of Personnel are the ones who hired you and you should strive to please them. Your Club Workers help you run the place and make money. Pay them well!"

	duties = "		Run the club, provide a safe haven for food, drinks, and entertainment.<br>\
		Make money, run deals through your place, provide entertainment, trade secrets.<br>\
		Keep the bar safe, clean, and free of fights."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/clubmanager
	name = "Club Manager"
	icon_state = "player-grey"
	join_tag = /datum/job/clubmanager

/datum/job/clubworker
	title = "Club Worker"
	flag = CLUBWORKER
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Club Manager"
	selection_color = "#dddddd"
	access = list(access_bar, access_kitchen)
	initial_balance = 750
	wage = WAGE_NONE //They should get paid by the club owner, otherwise you know what to do.
	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 5,
	)
	outfit_type = /decl/hierarchy/outfit/job/service/waiter
	description = "As a Club Worker, you work for the Club Manager. Your job is to fulfill your duties in running the Club and making sure all the customers are satisfied.<br>\
	<br>\
	You can cook, clean, server, tend the bar, entertain, or even be the bouncer. You have no limits to what you can do inside the Club granted your manager requests you do it.<br>\
	<br>\
	You are paid directly by the Club Manager, he gives you your allowance. The Club Manager only makes money if the Club is ran well, so work hard!"

	duties = "		Assist the Club Manager with running the club.<br>\
		Serve customers. Feed customers. Entertain customers.<br>\
		Protect the Club. Protect the Customers.<br>\
		Make enough money to stay alive aboard the Northern Light."

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/clubworker
	name = "Club Worker"
	icon_state = "player-grey"
	join_tag = /datum/job/clubworker

/datum/job/actor
	title = "Actor"
	flag = ACTOR
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head of Personnel"
	selection_color = "#dddddd"
	access = list(access_maint_tunnels, access_theatre)

	outfit_type = /decl/hierarchy/outfit/job/service/actor/clown
	wage = WAGE_LABOUR_DUMB	//Barely a retaining fee. Actor can busk for credits to keep themselves fed
	stat_modifiers = list(
		STAT_TGH = 30, //basically a punching bag, he can't robust anyone or shoot guns anyway
	)

	loyalties = LOYALTY_CIVILIAN

/obj/landmark/join/start/actor
	name = "Actor"
	icon_state = "player-grey"
	join_tag = /datum/job/actor

/datum/job/hydro
	title = "Botanist"
	flag = BOTANIST
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "NEV Northern Light"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Head of Personnel"
	selection_color = "#ecd37d"
	//alt_titles = list("Hydroponicist")
	access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics)
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/church/gardener
	stat_modifiers = list(
		STAT_BIO = 15,
		STAT_TGH = 15,
		STAT_ROB = 10,
	)

	description = "You are the cultivator of the ship's plants, and assist in the production of biomatter. All duties of plant growth fall to you, making your role critical.<br>\
	<br>\
	Though the growing of plants and raising livestock is your primary concern, many others aboard the ship rely upon your work as well. The crew requires food, and the club manager seeks to provide. Though the manager cannot make food without fresh produce grown from the garden.<br>\
	<br>\
	You can still charge the club manager, as well as the crew for the price of food of course. And perhaps in time earn the favor of new converts."

	duties = "Grow plants for use as biomatter.<br>\
	Provide fresh produce."

/obj/landmark/join/start/hydro
	name = "Botanist"
	icon_state = "player-black"
	join_tag = /datum/job/hydro

/datum/job/janitor
	title = "Custodian"
	flag = JANITOR
	department = DEPARTMENT_CIVILIAN
	department_flag = SERVICE
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Head of Personnel"
	selection_color = "#ecd37d"
	//alt_titles = list("Janitor","Sanitation Technician")
	access = list(access_janitor, access_maint_tunnels, access_crematorium, access_morgue)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/janitor

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_BIO = 10,
		STAT_VIG = 15
	)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)

	description = "You are the Custodian, the person charged with keeping the entire ship clean.<br>\
	<br>\
	Though dead roaches and dead spiders, like you, are more than what they seem. Their corpses are useful for biomatter, both for the bioreactor and for the cloner. Thus in your duty to keep the halls clean, you also provide precious biomatter for cloning."

	duties = "Keep the hallways clean of blood, dirt, and bug carcasses."

/obj/landmark/join/start/janitor
	name = "Custodian"
	icon_state = "player-black"
	join_tag = /datum/job/janitor


