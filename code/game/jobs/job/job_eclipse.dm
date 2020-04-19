/datum/job
	//This is the variable the game is looking for in determining whether 
	//something is whitelisted or not. It is recommended to leave this one alone
	//and use manual_whitelist below instead to reduce the possibility of
	//unforseen consequences.
	var/whitelist_only = FALSE

	//It is recommended you use THESE FIVE VARIABLES for whitelist adjustments.


	var/manual_whitelist = FALSE	//Manually force a job to be whitelisted,
	//regardless of config options. This is run first in job init.
	// FALSE = Normal behaviour              TRUE = Job whitelisted.

	//Is this job whitelisted based on config files?
	var/wl_config_heads = FALSE		//heads of staff
	var/wl_config_sec = FALSE		//security
	var/wl_config_borgs = FALSE		//silicons

	//Is this job intended for admins only?
	var/wl_admin_only = FALSE 