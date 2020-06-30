/datum/soulcrypt_module/crew_monitor
	name = "Crew Lifesign Monitor"
	description = "A program for monitoring the crew's suit sensors."
	activation_message = "Connected to LifeLink!"
	deactivation_message = "LifeLink connection terminated by user."
	activates = TRUE
	req_access = list(access_moebius)
	nanomodule_type = /datum/nano_module/crew_monitor
	has_nanomodule = TRUE

/datum/soulcrypt_module/crew_monitor/stat_text()
	return "Engage Crew Monitor"
