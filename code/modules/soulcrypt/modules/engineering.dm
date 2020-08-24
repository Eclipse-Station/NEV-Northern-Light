/datum/soulcrypt_module/alarm_monitor
	name = "Alarm Monitoring Program"
	description = "A program for monitoring the ship's built in sensors."
	activation_message = "Connected to sensor network."
	deactivation_message = "Sensor network connection terminated."
	activates = TRUE
//	req_access = list(access_moebius)
	nanomodule_type = /datum/nano_module/alarm_monitor/engineering
	has_nanomodule = TRUE

/datum/soulcrypt_module/alarm_monitor/stat_text()
	return "Activate Alarm Monitoring"