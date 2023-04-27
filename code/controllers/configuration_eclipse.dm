//
// Loader for Eclipse-specific configuration options.
// RSpitzer 2020-04-18
//

#define CURRENT_CONFIG_VERSION 9

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
	var/ntdad_role_restarts = ""
		//maxima and minima
	var/ntdad_maximum_noncommand = 1
	var/ntdad_maximum_command = 1
	var/ntdad_maximum_hivemind = 15
	var/ntdad_minimum_round_ongoing = 5
	var/ntdad_minimum_roundend = 3
		//Automated pings
	var/ntdad_roundend_ping = FALSE
	var/ntdad_level8_ping_sec = FALSE
	var/ntdad_level8_ping_all = FALSE
	var/ntdad_periodic_ongoing_round_pings = FALSE
	
// Miscellany.
	var/generate_ghost_icons = FALSE		//Should we generate ghost icons?
	var/maximum_hug_sanity_restoration = 15		//Hugging will restore sanity up to this amount.
	var/maximum_hug_sanity_restoration_plushie = 5	//Ditto, but for plushies.
	var/number_of_exoplanets = 2
	var/maximum_vermin = 750		//Absolute maximum number of vermin mobs that can exist before they can no longer reproduce.


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
			if("role_ping_restarts")
				config.ntdad_role_restarts = value
			if("dispatcher_maximum_noncommand_ping")
				config.ntdad_maximum_noncommand = text2num(value)
			if("dispatcher_maximum_command_ping")
				config.ntdad_maximum_command = text2num(value)
			if("dispatcher_maximum_hivemind_ping")
				config.ntdad_maximum_hivemind = text2num(value)
			if("dispatcher_minimum_ongoing_round")
				config.ntdad_minimum_round_ongoing = text2num(value)
			if("dispatcher_minimum_round_end_ping")
				config.ntdad_minimum_roundend = text2num(value)
			if("dispatcher_pings_on_round_end")
				config.ntdad_roundend_ping = TRUE
			if("dispatcher_messages_security_on_hivemind")
				config.ntdad_level8_ping_sec = TRUE
			if("dispatcher_messages_all_on_hivemind")
				config.ntdad_level8_ping_all = TRUE
			if("dispatcher_periodic_pings")
				config.ntdad_periodic_ongoing_round_pings = TRUE
			if("generate_ghost_icons")
				config.generate_ghost_icons = TRUE
			if("maximum_sanity_regen_from_hugs")
				config.maximum_hug_sanity_restoration = text2num(value)
			if("maximum_sanity_regen_from_plushies")
				config.maximum_hug_sanity_restoration_plushie = text2num(value)
			if("exoplanets_to_generate")
				config.number_of_exoplanets = text2num(value)
			if("ship_name")
				station_name = value
			if("vermin_limiter")
				config.maximum_vermin = value

//Version check, warns if the configuration file is updated and the sysop hasn't updated their copy.
	if(!config.eclipse_config_version)
		spawn(20 SECONDS)
			to_chat(world, "<span class='info'>--- \n\nCAUTION: Unable to check Eclipse configuration file version. You may be using an outdated config.\nPlease double-check it for missing sections and update appropriately, else unexpected behaviours may occur.\n\nExpected: [CURRENT_CONFIG_VERSION], got no version.\n\n---</span>")
	else if(config.eclipse_config_version < CURRENT_CONFIG_VERSION)
		spawn(20 SECONDS)
			to_chat(world, "<span class='info'>--- \n\nCAUTION: The Eclipse configuration file is outdated. \nPlease double-check it for missing sections and update appropriately, else unexpected behaviours may occur.\n\nExpected: [CURRENT_CONFIG_VERSION], got: [config.eclipse_config_version].\n\n---</span>")
	else if(config.eclipse_config_version > CURRENT_CONFIG_VERSION)
		spawn(20 SECONDS)
			to_chat(world, "<span class='info'>--- \n\nCAUTION: The Eclipse configuration file you are using is from a newer build of the server. \nUnexpected behaviours may occur.\n\nExpected: [CURRENT_CONFIG_VERSION], got: [config.eclipse_config_version].\n\n---</span>")

//Warn admins on config issues.


	config.eclipse_error_handling()
	config.eclipse_config_loaded = TRUE		//config is loaded

	return 1

/datum/configuration/proc/eclipse_error_handling()
	var/_config_error = FALSE
	var/_temp_data

	if(config.ntdad_level8_ping_all && config.ntdad_level8_ping_sec)
		_config_error = TRUE
		spawn(0)
			throw EXCEPTION("conflicting configuration values: 'DISPATCHER_MESSAGES_SECURITY_ON_HIVEMIND' is mutually exclusive with configuration value 'DISPATCHER_MESSAGES_ALL_ON_HIVEMIND'.")
		config.ntdad_level8_ping_all = FALSE

	if(!isnum(config.number_of_exoplanets) || config.number_of_exoplanets < 0)
		_config_error = TRUE
		_temp_data = config.number_of_exoplanets
		config.number_of_exoplanets = 0
		spawn(0)
			throw EXCEPTION("invalid configuration value: 'EXOPLANETS_TO_GENERATE' requires a positive number or zero as its value. Entry [_temp_data ? "of [_temp_data]" : "of a non-number"] is not valid.")

	if(!isnum(config.maximum_vermin) || config.maximum_vermin < 0)
		_config_error = TRUE
		_temp_data = config.maximum_vermin
		config.maximum_vermin = 250		//A low number, just in case.
		spawn(0)
			throw EXCEPTION("invalid configuration value: 'VERMIN_LIMITER' requires a positive number or zero as its value. Entry [_temp_data ? "of [_temp_data]" : "of a non-number"] is not valid.")

	if(_config_error)
		spawn(25 SECONDS)
			message_admins("One or more configuration errors are present. Check runtime logs for more details.")