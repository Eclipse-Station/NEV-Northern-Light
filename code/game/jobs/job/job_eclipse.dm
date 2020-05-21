/datum/job
	//This is the variable the game is looking for in determining whether 
	//something is whitelisted or not. It is recommended to leave this one alone
	//and use manual_whitelist below instead to reduce the possibility of
	//unforseen consequences.
	var/whitelist_only = FALSE

	//It is recommended you use THESE FIVE VARIABLES for whitelist adjustments.

	//Is this job whitelisted based on config files?
	var/wl_config_heads = FALSE		//heads of staff
	var/wl_config_sec = FALSE		//security
	var/wl_config_borgs = FALSE		//silicons

	//Is this job intended for admins only?
	var/wl_admin_only = FALSE
	

/* !! !! READ CAREFULLY !! !!
 * !! !! FAILURE TO READ THIS MAY RESULT IN UNEXPECTED BEHAVIOURS !! !!
 *
 * This is the master whitelist override for a single job. It supersedes most of
 * the whitelist calculations and is only superseded by wl_admin_only, and the
 * master whitelist disable (in config).
 * 
 * In most cases, WHITELIST_AUTO (or FALSE) may be used; this will allow the job
 * to proceed through auto-checks (e.g. is the job a head, is it a borg, etc) as
 * usual.
 *
 * If the job is to be whitelisted, you can set this to WHITELIST_MANUAL_ON (or
 * TRUE) to manually make a single job whitelisted. If the opposite is true and
 * the job is to be available to all players, you can use WHITELIST_MANUAL_OFF 
 * to de-whitelist the job.
 *
 * !! !! BEWARE OF INHERITANCE !! !!
 * 
 */

	var/manual_whitelist = WHITELIST_AUTO

