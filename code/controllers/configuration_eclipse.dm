//
// Loader for Eclipse-specific configuration options.
// RSpitzer 2020-04-18
//

#define CURRENT_CONFIG_VERSION 6

/datum/configuration
//For things that require delaying until the config loads for things (e.g. the
//Reginald spawn code on Eclipase Station code). Will be set TRUE after load.
	var/eclipse_config_loaded = FALSE

//Current configuration file version, to check for mismatches.
	var/eclipse_config_version = 0

//If you add stuff here, please use a consistent prefix so it will all group
//together in the variable editor. Easier for diag that way.

//job whitelisting. Prefix: "WhiteList"
	var/usejobwhitelist = FALSE		//master job whitelisting enable
	var/wl_heads = FALSE			//Whitelist Heads of Staff?
	var/wl_security = FALSE			//Whitelist Security?
	var/wl_silicons = FALSE			//Whitelist silicons?
	var/wl_admins_too = FALSE		//Do admins go through whitelist checks?

//Jobs required to start the round. Prefix: "Staff Requirement"
	var/sr_bypass_command_requirement = FALSE		//Should we allow the round to start without a Head of Staff?
	var/sr_lowpop_threshold = 10					//At what point are we no longer lowpop for the purposes of staff requirements?
	
//Dispatcher-related variables. Prefix: "NanoTrasen Department Alarm Dispatcher"
	var/ntdad_enabled = FALSE			//should it be enabled?
	var/ntdad_debug = 1					//debug the dispatcher
	var/ntdad_cooldown = 600			//Cooldown between calls
	var/ntdad_max_oper = 10				//maximum concurrent operations, intended to reduce lag while flushing lists
		//role pings
	var/ntdad_role_church = ""
	var/ntdad_role_command = ""
	var/ntdad_role_engineering = ""
	var/ntdad_role_medical = ""
	var/ntdad_role_research = ""
	var/ntdad_role_security = ""
	var/ntdad_role_service = ""
	var/ntdad_role_supply = ""
	var/ntdad_maximum_noncommand = 0
	var/ntdad_maximum_command = 0


/hook/startup/proc/read_eclipse_config()
	var/list/Lines = file2list("config/config_eclipse.txt")		//We don't want to add shit to the main config when we update this (merge conflicts)
	for(var/t in Lines)
		if(!t)	continue

		t = trim(t)
		if (length(t) == 0)
			continue
		else if (copytext(t, 1, 2) == "#")
			continue

		var/pos = findtext(t, " ")
		var/name = null
		var/value = null
		value = value
		if (pos)
			name = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
		else
			name = lowertext(t)

		if (!name)
			continue


		switch (name)
			if("config_file_version")
				config.eclipse_config_version = text2num(value)
			if("use_job_whitelisting")
				config.usejobwhitelist = TRUE
			if("whitelist_heads")
				config.wl_heads = TRUE
			if("whitelist_security")
				config.wl_security = TRUE
			if("whitelist_silicons")
				config.wl_silicons = TRUE
			if("admins_restricted_by_whitelist")
				config.wl_admins_too = TRUE
			if("bypass_head_of_staff_requirement")
				config.sr_bypass_command_requirement = TRUE
			if("staff_requirement_lowpop_threshold")
				config.sr_lowpop_threshold = text2num(value)
			if("enable_dispatcher")
				config.ntdad_enabled = TRUE
			if("debug_dispatcher")
				config.ntdad_debug = text2num(value)
			if("dispatcher_cooldown")
				config.ntdad_cooldown = 10 * text2num(value)
			if("maximum_concurrent_operations")
				config.ntdad_max_oper = text2num(value)
			if("role_ping_church")
				config.ntdad_role_church = value
			if("role_ping_command")
				config.ntdad_role_command = value
			if("role_ping_engineering")
				config.ntdad_role_engineering = value
			if("role_ping_medical")
				config.ntdad_role_medical = value
			if("role_ping_research")
				config.ntdad_role_research = value
			if("role_ping_security")
				config.ntdad_role_security = value
			if("role_ping_service")
				config.ntdad_role_service = value
			if("role_ping_supply")
				config.ntdad_role_supply = value
			if("dispatcher_maximum_noncommand_ping")
				config.ntdad_maximum_noncommand = text2num(value)
			if("dispatcher_maximum_command_ping")
				config.ntdad_maximum_command = text2num(value)

//Version check, warns if the configuration file is updated and the sysop hasn't updated their copy.
	if(!config.eclipse_config_version)
		spawn(20 SECONDS)
			to_chat(world, "<span class='info'>--- \n\nCAUTION: Unable to check Eclipse configuration file version. You may be using an outdated config.\nPlease double-check it for missing sections and update appropriately, else unexpected behaviours may occur.\n\nExpected: [CURRENT_CONFIG_VERSION], got no version.\n\n---</span>")
	else if(config.eclipse_config_version < CURRENT_CONFIG_VERSION)
		spawn(20 SECONDS)
			to_chat(world, "<span class='info'>--- \n\nCAUTION: The Eclipse configuration file is outdated. \nPlease double-check it for missing sections and update appropriately, else unexpected behaviours may occur.\n\nExpected: [CURRENT_CONFIG_VERSION], got [config.eclipse_config_version].\n\n---</span>")
	else if(config.eclipse_config_version > CURRENT_CONFIG_VERSION)
		spawn(20 SECONDS)
			to_chat(world, "<span class='info'>--- \n\nCAUTION: The Eclipse configuration file you are using is from a newer build of the server. \nUnexpected behaviours may occur.\n\nExpected: [CURRENT_CONFIG_VERSION], got [config.eclipse_config_version].\n\n---</span>")


	config.eclipse_config_loaded = TRUE		//config is loaded

	return 1
