SUBSYSTEM_DEF(persistence) //Eclipse Edit: An eclipse-level port of /tg/'s JSON Persistence system for our uses
	name = "Persistence"
	init_order = INIT_ORDER_PERSISTENCE
	flags = SS_NO_FIRE
	//instantiated character bank account data
	var/list/saved_bank_accounts = list()


/datum/controller/subsystem/persistence/Initialize()
	load_bank_accounts()



	var/json_file = file("data/bank_accounts.json")
	if(fexists(json_file))
		var/list/raw_data = json_decode(file2text(json_file))
		for(var/list/accounting_data as anything in raw_data["saved_bank_accounts"])
			var/datum/bank_account/loaded_accounts = new
			loaded_accounts.load_from_json(accounting_data)
			saved_bank_accounts += loaded_accounts



///Collects all data to persist.
/datum/controller/subsystem/persistence/proc/collect_data()
	save_bank_accounts()



/datum/controller/subsystem/persistence/proc/save_bank_accounts() //Saves all persistent bank accounts


	save_to_file()



/datum/controller/subsystem/persistence/proc/load_bank_accounts()
	var/list/raw_saved_accounts = list()
	if(fexists("data/bank_accounts.json"))
		var/json_file = file("data/bank_accounts.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		if(!json)
			return
		raw_saved_accounts = json["data"]
		fdel("data/bank_accounts.json")
	else
		var/json_file = file("data/bank_accounts.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		if(!json)
			return
		raw_saved_accounts = json["data"]

	for(var/raw_json in raw_saved_accounts)
		var/datum/bank_account/parsed_account_data = new
		parsed_account_data.load_from_json(raw_json)
		saved_bank_accounts += parsed_account_data


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

/datum/controller/subsystem/persistence/proc/save_to_file()
	var/json_file = file("data/bank_accounts.json")

	var/list/collated_data = list()
	if(fexists(json_file))
		var/list/old_data = json_decode(file2text(json_file))
		for(var/list/accounting_data as anything in old_data["saved_bank_accounts"])
			collated_data[accounting_data["account_number"]] = accounting_data

	var/list/accounting_data = list()
	for(var/datum/bank_account/bank_account as anything in saved_bank_accounts)
		collated_data[saved_bank_accounts] = bank_account.to_json()


	// Flatten the resulting list
	for(var/key in collated_data)
		accounting_data += list(collated_data[key])
	var/list/all_data = list("version" = 1)
	all_data["saved_bank_accounts"] = accounting_data
	var/payload = json_encode(all_data)
	fdel(json_file)
	WRITE_FILE(json_file, payload)
