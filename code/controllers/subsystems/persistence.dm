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
		raw_saved_accounts = json["saved_ccounts"]
	else
		var/json_file = file("data/bank_accounts.json")
		if(!fexists(json_file))
			return
		var/list/json = json_decode(file2text(json_file))
		if(!json)
			return
		raw_saved_accounts = json["saved_accounts"]

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

datum/controller/subsystem/proc/check_existing_account(owner_ckey,character_name)
	. = list()
	var/load_key = owner_ckey + "?" + character_name
	for(SSpersistence.saved_bank_accounts)
		if(load_key)
			return TRUE
	return FALSE



/datum/controller/subsystem/persistence/proc/save_accounts()
	var/list/saved_data = list()
	saved_data["saved_accounts"] = list()
	saved_data["saved_accounts"]+= SSpersistence.saved_bank_accounts
	var/json_file = file("data/bank_accounts.json")

	for(var/datum/money_account/entry) //TODO: Fix loop to go through every existing account and save it to saved_bank_accounts, or update the information if it's one that already exists
		if(entry.ckey != "" && entry.owner_name != "")
			var/list/saving_data = list()
			saving_data[entry.ckey + "?" + entry.owner_name] = entry.save_persistent()
			saved_data["saved_accounts"] += saving_data
	fdel(json_file)

	WRITE_FILE(json_file,json_encode(saved_data))

datum/controller/subsystem/persistence/proc/load_account(unique_key,var/datum/money_account/M)
	var/list/loaded_account = saved_bank_accounts[unique_key]
	M.ckey = loaded_account["ckey"]
	M.owner_name = loaded_account["character_name"]
	M.account_number = loaded_account["account_number"]
	M.remote_access_pin = loaded_account["pin_number"]
	M.money =  loaded_account["account_funds"]
	return M


