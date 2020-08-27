#define WHITELISTFILE "data/whitelist.txt"

var/list/whitelist = list()

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	whitelist = file2list(WHITELISTFILE)
	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(mob/M /*, var/rank*/)
	if(!whitelist)
		return 0
	return ("[M.ckey]" in whitelist)


/proc/is_alien_whitelisted(mob/M, var/species)
	// always return true because we don't have xenos and related whitelist
	return 1

#undef WHITELISTFILE



var/list/aeiou_whitelist = list()
var/list/blacklist = list()

/hook/startup/proc/loadaeiouwhitelist()
	load_aeiouwhitelist()
	load_blacklist()
	return 1

/proc/load_aeiouwhitelist()
	var/text = file2text("config/playerwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/playerwhitelist.txt")
	else
		aeiou_whitelist = splittext(text, "\n")

/proc/load_blacklist()
	var/text = file2text("config/blacklist.txt")
	if (!text)
		log_misc("Failed to load config/blacklist.txt")
	else
		blacklist = splittext(text, "\n")

/proc/is_player_whitelisted(mob/M)
//	if(check_rights(R_ADMIN, 0))
//		return 1
	if(!aeiou_whitelist)
		log_misc("nestor you fucked up!")
		return 0
	for (var/s in aeiou_whitelist)
		if(findtext(s,"[lowertext(M.ckey)]"))
			return 1
		if(findtext(s,"[replacetext(lowertext(M.ckey), " ", "")]"))
			return 1
	log_misc("[lowertext(M.ckey)] tried to join, but they're not whitelisted!")
	return 0

/proc/is_key_whitelisted(var/checkKey)
//	if(check_rights(R_ADMIN, 0))
//		return 1
	if(!aeiou_whitelist)
		log_misc("nestor you fucked up!")
		return 0
	for (var/s in aeiou_whitelist)
		if(findtext(s,"[lowertext(checkKey)]"))
			return 1
		if(findtext(s,"[replacetext(lowertext(checkKey), " ", "")]"))
			return 1
	return 0

/proc/is_key_blacklisted(var/checkKey)
//	if(check_rights(R_ADMIN, 0))
//		return 1
	if(!blacklist)
		log_misc("nestor you fucked up!")
		return 0
	for (var/s in blacklist)
		if(findtext(s,"[lowertext(checkKey)]"))
			return 1
		if(findtext(s,"[replacetext(lowertext(checkKey), " ", "")]"))
			return 1
	return 0

/mob/new_player/proc/discord_redirect(var/mob/u)
	to_chat(src, "<span class='notice'>You are not whitelisted! Join our forum at https://consonantstation.boards.net/ to get whitelisted.</span>")

ADMIN_VERB_ADD(/client/proc/add_to_whitelist, R_ADMIN, FALSE)


/client/proc/add_to_whitelist()
	set name = "Add CKEY to whitelist"
	set category = "Admin"

	if(!check_rights(R_ADMIN)) return

	var/userkey = input(src, "Enter the ckey. Leave blank to cancel.", "Add to Whitelist")
	if(userkey)
		if (!aeiou_whitelist)
			usr << ("Failed to load config/playerwhitelist.txt")
		if(is_key_whitelisted(userkey))
			usr << ("User is already whitelisted")
			return
		if(is_key_blacklisted(userkey))
			usr << ("This user is blacklisted. Contact Headmin for more information.")
		else
//			userkey += "\n" bad idea
			text2file(replacetext(lowertext(userkey), " ", ""), "config/playerwhitelist.txt")

	load_aeiouwhitelist()

ADMIN_VERB_ADD(/client/proc/reload_whitelist, R_ADMIN, FALSE)

/client/proc/reload_whitelist()
	set name = "Reload Whitelists"
	set category = "Admin"

	if(!check_rights(R_ADMIN)) return
	load_aeiouwhitelist()
