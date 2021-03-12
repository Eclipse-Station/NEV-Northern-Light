/datum/job/chaplain
	title = "Mekhane Preacher"
	flag = CHAPLAIN
	head_position = 1
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH | COMMAND
	faction = "NEV Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mekhanite Council"
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	cruciform_access = list(
		access_morgue, access_chapel_office, access_crematorium, access_hydroponics, access_janitor, access_maint_tunnels
	)

	access = list(
		access_RC_announce, access_keycard_auth, access_heads, access_sec_doors, access_change_nt
	)

	wage = WAGE_PROFESSIONAL //The church has deep pockets
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/chaplain

	wl_config_heads = TRUE //Eclipse edit

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_BIO = 35,
		STAT_VIG = 15,
		STAT_COG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_PRIEST,
		CRUCIFORM_REDLIGHT
	)

	description = "You are the head of a local branch of the Church of the Children of Mekhane. You represent the church's interests aboard the NEV Northern Light, as well as the interests of Mekhane disciples among the crew. The church is a major contributor to the funding of the Northern Light's mission, and demands respect.<br>\
	<br>\
	Your duties aboard the ship may not seem so important to its mission, but they have greater significance in the galaxy as a whole. As well as a more immediate significance to the morale of the crew, especially the followers of the Mekhane.<br>\
	<br>\
	Sometimes the Church will deploy Inquisitors to remote outposts like this, to serve its interests. When one is on the Northern Light, you will generally be their point of contact. Inquisitors outrank you and you should follow all of their instructions without question. Inquisitors work in secret, and so you should not discuss their presence with anyone unless they permit it.<br>\
	<br>\
	First and foremost, you are a Man of the Cloth, and as such you must tend to the spiritual needs of the crew. Those looking to convert to the Children of Mekhane should come to you for the rites.<br>\
	When the mood is dour, when all hope is lost, it falls to you to be a spiritual leader. Preach to the flock, inspire faith and strength in their hearts. The rituals in your book can also offer more tangible assistance in labour and combat.<br>\
	Even when times are bright, do your best to keep it that way. Tour the ship, offering support to those in need. A prayer in the right ear, a helping hand, or a shoulder to cry on, can do wonders. And people are most vulnerable to conversion when they are at their weakest.<br>\
	<br>\
	For those who reject the words of Mekhane, all is not lost. Your cloning services are not inclusive to the faithful, though they may have priority in a crisis. For those that refuse Mekhane's cloning rituals, the best that can be offered is a dignified funeral. The chapel area contains coffins and machinery to commit the dead unto the void. Burial at space. Any player who is given a proper funeral will have their respawn time reduced, allowing them to rejoin the crew as a new character more quickly, after death.<br>\
	<br>\
	Above all else, remember that Mekhane is a religion of tolerance."


	duties = "Represent the interests of the Mekhanite Council and your fellow disciples aboard the NEV Northern Light. Protect them from persecution and speak for them.<br>\
		Hold mass, give sermons, preach to the faithful, and lead group ritual sessions.<br>\
		Try to protect sapient life in all its myriad forms, especially the Vagabond for they are epitome of the downtrodden here.<br>\
		Recover and clone the dead, for all sapient life is precious.<br>\
		Hold funerals for the dead heathens."

	setup_restricted = TRUE

/obj/landmark/join/start/chaplain
	name = "Chaplain"
	icon_state = "player-black"
	join_tag = /datum/job/chaplain

/datum/job/acolyte
	title = "Mekhane Acolyte"
	flag = ACOLYTE
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Mekhane Preacher"
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 10)
	cruciform_access = list(access_morgue, access_crematorium, access_maint_tunnels, access_hydroponics)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/acolyte

	stat_modifiers = list(
	STAT_BIO = 25,
	STAT_VIG = 20,
	STAT_TGH = 15,
	STAT_ROB = 15
	)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	description = "You serve the Preacher as a disciple of the Faith.<br>\
	<br>\
	Though more may be required of you, should your Preacher so chose.<br>\
	<br>\
	Above all else, remember that Mekhane is a religion of tolerance."

	duties = "Serve the Preacher's will.<br>\
	Assist in cloning the dead, for all sapient life is precious."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "Mekhane Acolyte"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte


/datum/job/hydro
	title = "Mekhane Agrolyte"
	flag = BOTANIST
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = "NEV Northern Light"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Mekhane Preacher"
	selection_color = "#ecd37d"
	//alt_titles = list("Hydroponicist")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	cruciform_access = list(access_hydroponics, access_morgue, access_crematorium, access_maint_tunnels)
	wage = WAGE_PROFESSIONAL

	outfit_type = /decl/hierarchy/outfit/job/church/gardener
	stat_modifiers = list(
		STAT_BIO = 20,
		STAT_TGH = 10,
		STAT_ROB = 10,
	)

	core_upgrades = list(
		CRUCIFORM_AGROLYTE
	)

	perks = list(/datum/perk/greenthumb)

	description = "You are the holy cultivator of the church's plants, and assist in the production of biomatter. All duties of plant growth fall to you, making your role critical.<br>\
	<br>\
	Though the church is your primary concern, as you are a disciple of its faith, many others aboard the ship rely upon your work as well. The crew requires food, and the club manager seeks to provide. Though the manager cannot make food without fresh produce grown from the church's holy garden.<br>\
	<br>\
	Thus, out of good will, the Church provides produce to the manager, as well as the crew. And perhaps in time earn the favor of new converts."

	duties = "Grow plants for use as biomatter.<br>\
	Provide fresh produce.<br>\
	Serve the Faith."

	setup_restricted = TRUE

/obj/landmark/join/start/hydro
	name = "Mekhane Agrolyte"
	icon_state = "player-black"
	join_tag = /datum/job/hydro

/datum/job/janitor
	title = "Mekhane Custodian"
	flag = JANITOR
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH
	faction = "NEV Northern Light"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the Mekhane Preacher"
	selection_color = "#ecd37d"
	//alt_titles = list("Custodian","Sanitation Technician")
	also_known_languages = list(LANGUAGE_CYRILLIC = 15, LANGUAGE_JIVE = 80)
	cruciform_access = list(access_janitor, access_maint_tunnels, access_morgue, access_crematorium)
	wage = WAGE_PROFESSIONAL
	outfit_type = /decl/hierarchy/outfit/job/church/janitor

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 10,
		STAT_VIG = 15
	)

	perks = list(/datum/perk/neat)

	software_on_spawn = list(/datum/computer_file/program/camera_monitor)

	description = "You are the Custodian, the church's disciple charged with keeping the corridors of not only the church clean, but that of the entire ship.<br>\
	<br>\
	While most ships employ a simple janitor, you are much more than that. Cleanliness is next to godliness, and so, the halls must remain clean. Though the ship is also infested with giant roaches and spiders, which may find their ways out from the maintenance tunnels and into the main corridors where they consequently die.<br>\
	<br>\
	Though dead roaches and dead spiders, like you, are more than what they seem. Their corpses are useful for biomatter, both for the bioreactor and for the church's holy cloner. Thus in your duty to keep the halls clean, you also provide precious biomatter for the Church."

	duties = "Keep the hallways clean of blood, dirt, and bug carcasses.<br>\
	Serve the faith."

	setup_restricted = TRUE

/obj/landmark/join/start/janitor
	name = "Mekhane Custodian"
	icon_state = "player-black"
	join_tag = /datum/job/janitor
