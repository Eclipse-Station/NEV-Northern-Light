SUBSYSTEM_DEF(persistence) //Eclipse Edit: An eclipse-level port of /tg/'s JSON Persistence system for our uses
	name = "Persistence"
	init_order = INIT_ORDER_PERSISTENCE
	flags = SS_NO_FIRE
	//instantiated character bank account data
	var/list/bank_accounts = list()


/datum/controller/subsystem/persistence/Initialize()
	load_bank_accounts()





///Collects all data to persist.
/datum/controller/subsystem/persistence/proc/collect_data()
	save_bank_accounts()



/datum/controller/subsystem/persistence/proc/save_bank_accounts()
	var/json_file = file(BANK_ACCOUNT_SAVE_FILE)
	var/list/saved_data = list()
	var/list/entries = list()
	if(fexists(json_file))
		var/list/old_json = json_decode(file2text(json_file))
		if(old_json)
			entries += old_json["entries"]  //Save the old if its there
	entries += bank_accounts

	saved_data["entries"] = entries

	fdel(json_file)
	WRITE_FILE(json_file, json_encode(saved_data))



/datum/controller/subsystem/persistence/proc/load_bank_accounts()
	var/json_file = file("data/bank_accounts.json")
	if(!fexists(json_file))
		return
	var/list/json = json_decode(file2text(json_file))
	if(!json)
		return


	for(var/raw_json in loaded_accounts)


	log_world("Successfully loaded persistent bank accounts!")

/datum/bank_account
	var/owner_ckey
	var/character_name
	var/account_number
	var/account_pin
	var/account_funds
	var/loaded_from_json = FALSE

/datum/bank_account/proc/load_from_json(list/json_data)
	owner_ckey = json_data["ckey"]
	character_name = json_data["character_name"]
	account_number = json_data["account_number"]
	account_pin = json_data["account_pin"]
	account_funds = json_data["account_funds"]
	loaded_from_json = TRUE

/datum/bank_account/proc/to_json()
	var/list/new_data = list()
	new_data["owner_ckey"] = owner_ckey
	new_data["character_name"] = character_name
	new_data["account_number"] = account_number
	new_data["account_pin"] = account_pin
	new_data["account_funds"] = account_funds
	return new_data