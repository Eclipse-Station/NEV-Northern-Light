SUBSYSTEM_DEF(persistence) //Eclipse Edit: An eclipse-level port of /tg/'s JSON Persistence system for our uses
	name = "Persistence"
	init_order = INIT_ORDER_PERSISTENCE
	flags = SS_NO_FIRE
	//instantiated character bank account data
	var/list/saved_bank_accounts = list()

/datum/controller/subsystem/persistence/Initialize(start_timeofday)
	var/list/raw_saved_accounts = list()
	if(fexists("data/bank_accounts.json"))
		var/json_file = file("data/bank_accounts.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		if(!json)
			return
		raw_saved_accounts = json["data"]
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

	return ..()

/datum/bank_account
	var/owner_ckey
	var/character_name
	var/account_number
	var/account_pin
	var/account_funds
	var/unique_key

/datum/bank_account/proc/load_from_json(list/json_data)
	owner_ckey = json_data["ckey"]
	character_name = json_data["character_name"]
	account_number = json_data["account_number"]
	account_pin = json_data["account_pin"]
	account_funds = json_data["account_funds"]
	unique_key = json_data["unique_key"]
/*
/datum/bank_account/proc/to_json(var/datum/money_account/saving)
	var/list/new_data = list()
	new_data["owner_ckey"] = owner_ckey
	new_data["character_name"] = character_name
	new_data["account_number"] = account_number
	new_data["account_pin"] = account_pin
	new_data["account_funds"] = account_funds
	new_data["unique_key"] = unique_key
	return new_data*/

//saves all currently tracked account data to file
/*/datum/controller/subsystem/persistence/proc/save_to_file()
	var/json_file = file("data/bank_accounts.json")
	var/list/collated_data = list()
	if(fexists(json_file))
		var/list/old_data = json_decode(file2text(json_file))
		for(var/list/accounting_data as anything in old_data["saved_bank_accounts"])
			collated_data[accounting_data["account_number"]] = accounting_data

	var/list/accounting_data = list()
	for(var/datum/bank_account/bank_account as anything in saved_bank_accounts)
		collated_data[bank_account.unique_key] = bank_account.to_json()


	// Flatten the resulting list
	for(var/key in collated_data)
		accounting_data += list(collated_data[key])
	var/list/all_data = list()
	all_data["saved_bank_accounts"] = accounting_data
	var/payload = json_encode(all_data)
	fdel(json_file)
	WRITE_FILE(json_file, payload)


*/
datum/controller/subsystem/proc/check_existing_account(owner_ckey,character_name)
	. = list()
	for(var/datum/bank_account/bank_account as anything in bank_account)
		if(bank_account.owner_ckey && bank_account.character_name)
			return TRUE
	return FALSE



/datum/controller/subsystem/persistence/proc/save_accounts()
	/*//Collect all account data
	for(var/datum/money_account/saving as anything in /datum/money_account)
		save_persistent()

	save_to_file()*/
	var/list/saved_data = list()
	saved_data["saved_bank_accounts"] = list()
	var/json_file = file("data/bank_accounts.json")

	for(var/datum/money_account/entry as anything in /datum/money_account) //TODO: Fix loop to go through every existing account and save it to saved_bank_accounts, or update the information if it's one that already exists
		saved_data["saved_bank_accounts"] += entry.save_persistent()
	fdel(json_file)

	WRITE_FILE(json_file,json_encode(saved_data))


