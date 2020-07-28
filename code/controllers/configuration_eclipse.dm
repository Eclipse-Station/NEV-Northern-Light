//
// Loader for Eclipse-specific configuration options.
// RSpitzer 2020-04-18
//

/datum/configuration
//For things that require delaying until the config loads for things (e.g. the
//Reginald spawn code on Eclipase Station code). Will be set TRUE after load.
	var/eclipse_config_loaded = FALSE

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
	
//Dispatcher-related variables. Predix: "NanoTrasen Department Alarm Dispatcher"
	var/ntdad_enabled = FALSE			//should it be enabled?
	var/ntdad_debug = 1					//debug the dispatcher
	var/ntdad_cooldown = 600			//Cooldown between calls
	var/ntdad_max_oper = 5				//maximum concurrent operations, intended to reduce lag while flushing lists
		//role pings
	var/ntdad_role_command = ""
	var/ntdad_role_engineering = ""
	var/ntdad_role_medical = ""
	var/ntdad_role_research = ""
	var/ntdad_role_security = ""
	var/ntdad_role_service = ""
	var/ntdad_role_supply = ""


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


	config.eclipse_config_loaded = TRUE		//config is loaded

	return 1
