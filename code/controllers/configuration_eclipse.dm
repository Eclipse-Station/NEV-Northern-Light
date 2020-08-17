//
// Loader for Eclipse-specific configuration options.
// RSpitzer 2020-04-18
//

/datum/configuration
//For things that require delaying until the config loads for things (e.g. the
//Reginald spawn code on Eclipase Station code). Will be set TRUE after load.
	var/eclipse_config_loaded = FALSE

//job whitelisting. Prefix: "WhiteList"
	var/usejobwhitelist = FALSE		//master job whitelisting enable
	var/wl_heads = FALSE			//Whitelist Heads of Staff?
	var/wl_security = FALSE			//Whitelist Security?
	var/wl_silicons = FALSE			//Whitelist silicons?
	var/wl_admins_too = FALSE		//Do admins go through whitelist checks?

//Jobs required to start the round. Prefix: "Staff Requirement"
	var/sr_bypass_command_requirement = FALSE		//Should we allow the round to start without a Head of Staff?
	var/sr_lowpop_threshold = 10					//At what point are we no longer lowpop for the purposes of staff requirements?

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

	config.eclipse_config_loaded = TRUE		//config is loaded

	return 1
