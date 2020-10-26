/datum/department/church
	funding_source = "Church of Mekhane"

/datum/department/guild
	account_initial_balance = 12000

/datum/department/civilian
	name = "NEV Northern Light Civic"
	id = DEPARTMENT_CIVILIAN
	account_initial_balance = 2000 // Less vital than most departments and smaller
	account_budget = 1000 //A small stipend that the manager can distribute as he sees fit.
	/*
		This account pays out to club workers, hydroponics, and custodians.
		It is managed by The Club manager.

	*/

/datum/job/clubworker
	wage = WAGE_LABOUR_DUMB //Club workers make less than professional wages and are expected to make up the difference in tips.

/datum/job/clubmanager
	department_account_access = TRUE
	outfit_type = /decl/hierarchy/outfit/job/service/manager
	/* The manager is not command, but is responsible for ensuring that his workers,
	custodians, and botanists get paid
	*/

/obj/item/weapon/card/id/account/
	var/department

/obj/item/weapon/card/id/account/New()
	var/datum/money_account/department_account = department_accounts[department]
	associated_account_number = department_account.account_number

/obj/item/weapon/card/id/account/command
	name = "NEV Northern Light banking card"
	desc = "A card that holds account information for the Northern Light command bank account."
	item_state = "gold_id"
	registered_name = "NEV Northern Light Command"
	department = DEPARTMENT_COMMAND

/obj/item/weapon/card/id/account/technomancers
	name = "Engineering Department banking card"
	desc = "A card that holds account information for the Northern Light engineering bank account."
	item_state = "id_ce"
	registered_name = "NEV Northern Light Engineering"
	department = DEPARTMENT_ENGINEERING

/obj/item/weapon/card/id/account/aegis
	name = "Aegis company banking card"
	desc = "A card that holds account information for the Cobalt Aegis bank account."
	item_state = "id_hos"
	registered_name = "Cobalt Aegis Security Mercenary Company"
	department = DEPARTMENT_SECURITY

/obj/item/weapon/card/id/account/medical
	name = "Medical Department banking card"
	desc = "A card that holds account information for the Nanotrasen Medical Divsion account."
	item_state = "id_cmo"
	registered_name = "Nanotrasen: Medical Division"
	department = DEPARTMENT_MEDICAL


/obj/item/weapon/card/id/account/research
	name = "Research Department banking card"
	desc = "A card that holds account information for the Northern Light command account."
	item_state = "id_rd"
	registered_name = "Nanotrasen: Research Division"
	department = DEPARTMENT_SCIENCE

/obj/item/weapon/card/id/account/church
	name = "Church of the Mekhane banking card"
	desc = "A card that holds account information for the Northern Light command account."
	item_state = "id_chaplain"
	registered_name = "Church of Mekhane"
	department = DEPARTMENT_CHURCH

/obj/item/weapon/card/id/account/guild
	name = "Free Trade Union banking card"
	desc = "A card that holds account information for the Northern Light command account."
	item_state = "gold_id"
	registered_name = "Free Trade Union"
	department = DEPARTMENT_GUILD

/obj/item/weapon/card/id/account/club
	name = "The Club banking card"
	desc = "A card that holds account information for the Northern Light command account."
	item_state = "id_hop"
	registered_name = "NEV Northern Light Civic"
	department = DEPARTMENT_CIVILIAN

/decl/hierarchy/outfit/job/captain
	backpack_contents = list(/obj/item/weapon/storage/box/ids = 1, /obj/item/weapon/tool/knife/dagger/ceremonial = 1, /obj/item/weapon/card/id/account/command = 1)
/decl/hierarchy/outfit/job/hop
	backpack_contents = list(/obj/item/weapon/storage/box/ids = 1, /obj/item/weapon/tool/knife/dagger/ceremonial = 1, /obj/item/weapon/card/id/account/club = 1)
/decl/hierarchy/outfit/job/engineering/exultant
	backpack_contents = list(/obj/item/weapon/card/id/account/technomancers = 1)
/decl/hierarchy/outfit/job/cargo/merchant
	backpack_contents = list(/obj/item/weapon/card/id/account/guild =1)
/decl/hierarchy/outfit/job/security/ihc
	backpack_contents = list(/obj/item/weapon/handcuffs = 1,/obj/item/ammo_magazine/magnum/rubber = 1,/obj/item/device/lighting/toggleable/flashlight/seclite = 1, /obj/item/weapon/cell/small/high = 2, /obj/item/weapon/gun/energy/gun/martin = 1, /obj/item/weapon/card/id/account/aegis = 1)
/decl/hierarchy/outfit/job/medical/cmo
	backpack_contents = list(/obj/item/weapon/card/id/account/medical = 1)
/decl/hierarchy/outfit/job/science/rd
	backpack_contents = list(/obj/item/weapon/oddity/secdocs = 1, /obj/item/weapon/card/id/account/research = 1)
/decl/hierarchy/outfit/job/church/chaplain
	backpack_contents = list(/obj/item/weapon/card/id/account/church = 1)
/decl/hierarchy/outfit/job/church/acolyte //THIS IS A TEMPORARY FIX UNTIL PREACHERS ARE RE-ENABLED
	backpack_contents = list(/obj/item/weapon/card/id/account/church = 1)
/decl/hierarchy/outfit/job/service/manager
	name = OUTFIT_JOB_NAME("Manager")
	uniform = /obj/item/clothing/under/rank/bartender
	id_type = /obj/item/weapon/card/id/white
	pda_type = /obj/item/modular_computer/pda/club_worker
	backpack_contents = list(/obj/item/ammo_casing/shotgun/beanbag = 4, /obj/item/weapon/card/id/account/club = 1)

