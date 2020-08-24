/datum/job/chaplain
	title = "Mekhane Preacher"
	flag = CHAPLAIN
	head_position = 1
	department = DEPARTMENT_CHURCH
	department_flag = CHURCH | COMMAND
	faction = "NEV  Northern Light"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The Mekhanite Council"
	selection_color = "#ecd37d"
	also_known_languages = list(LANGUAGE_CYRILLIC = 25, LANGUAGE_SERBIAN = 25)

	cruciform_access = list(
		access_morgue, access_chapel_office, access_crematorium, access_hydroponics, access_janitor, access_maint_tunnels
	)

	access = list(
		access_RC_announce, access_keycard_auth, access_heads, access_sec_doors
	)

	wage = WAGE_PROFESSIONAL //The church has deep pockets
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/church/chaplain

	stat_modifiers = list(
		STAT_TGH = 10,
		STAT_BIO = 15,
		STAT_VIG = 15,
		STAT_COG = 10,
	)

	software_on_spawn = list(/datum/computer_file/program/records,
							 /datum/computer_file/program/reports)

	core_upgrades = list(
		CRUCIFORM_PRIEST,
		CRUCIFORM_REDLIGHT
	)

	description = "You are the head of a local branch of the Church of the Children of Mekhane. You represent the church's interests aboard the NEV Northern Light, as well as the interests of Mekhane disciples among the crew. The church is a major contributor to the funding of the Northern Light's mission, and demands respect<br>\
	<br>\
	Your duties aboard the ship may not seem so important to its mission, but they have greater significance in the galaxy as a whole. As well as a more immediate significance to the morale of the crew, especially the followers of the Mekhane.<br>\
	<br>\
	Sometimes the Church will deploy Inquisitors to remote outposts like this, to serve its interests. When one is on the Northern Light, you will generally be their point of contact. Inquisitors outrank you and you should follow all of their instructions without question. Inquisitors work in secret, and so you should not discuss their presence with anyone unless they permit it.<br>\
	<br>\
	First and foremost, you are a Man of the Cloth, and as such you must tend to the spiritual needs of the crew. Those looking to convert to the Children of Mekhane should come to you for the rites.<br>\
	When the mood is dour, when all hope is lost, it falls to you to be a spiritual leader. Preach to the flock, inspire faith and strength in their hearts. The rituals in your book can also offer more tangible assistance in labour and combat.<br>\
	Even when times are bright, do your best to keep it that way. Tour the ship, offering support to those in need. A prayer in the right ear, a helping hand, or a shoulder to cry on, can do wonders. And people are most vulnerable to conversion when they are at their weakest.<br>\
	<br>\
	For those who are not part of the fold, the next best thing you can offer is a dignified funeral. The chapel area contains coffins and machinery to commit the dead unto the void. Burial at space. Any player who is given a proper funeral will have their respawn time reduced, allowing them to rejoin the crew as a new character more quickly, after death."


	duties = "Represent the interests of NT disciples aboard the NEV Northern Light. Protect them from persecution and speak for them.<br>\
		Hold mass, give sermons, preach to the faithful, and lead group ritual sessions.<br>\
		Recover and clone the faithful dead.<br>\
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
	STAT_MEC = 25,
	STAT_BIO = 10,
	STAT_VIG = 10,
	STAT_TGH = 5,
	)

	core_upgrades = list(
		CRUCIFORM_PRIEST
	)

	description = "You serve the Preacher as a disciple of the Faith.<br>\
	<br>\
	Though more may be required of you, should your Preacher so chose."

	duties = "Serve the Preacher's will."

	setup_restricted = TRUE

/obj/landmark/join/start/acolyte
	name = "Mekhane Acolyte"
	icon_state = "player-black"
	join_tag = /datum/job/acolyte
