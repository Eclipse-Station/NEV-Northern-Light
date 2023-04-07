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
	var/json_file = file(BANK_ACCOUNT_SAVE_FILE)
	if(!fexists(json_file))
		return
	var/list/json = json_decode(file2text(json_file))
	if(!json)
		return


	var/list/entries = json["entries"]
	bank_accounts = entries


	log_world("Successfully loaded persistent bank accounts!")