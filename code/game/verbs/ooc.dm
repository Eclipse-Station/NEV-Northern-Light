
/client/verb/ooc(msg as text)
	set name = "OOC"
	set category = "OOC"

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, SPAN_WARNING("Speech is currently admin-disabled."))
		return

	if(!mob)	return
	if(IsGuestKey(key))
		to_chat(src, "Guests may not use OOC.")
		return

	if(!is_key_whitelisted(key))
		to_chat(src, "Non-whitelisted users may not use OOC. Join our discord server at https://discord.gg/xuS4t9U to get whitelisted.")
		return

	msg = sanitize(msg)
	if(!msg)	return

	if(src.get_preference_value(/datum/client_preference/show_ooc) == GLOB.PREF_HIDE)
		to_chat(src, SPAN_WARNING("You have OOC muted."))
		return

	if(!holder)
		if(!config.ooc_allowed)
			to_chat(src, SPAN_DANGER("OOC is globally muted."))
			return
		if(!config.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, SPAN_DANGER("OOC for dead mobs has been turned off."))
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, SPAN_DANGER("You cannot use OOC (muted)."))
			return
		if(handle_spam_prevention(msg,MUTE_OOC))
			return

	log_ooc("[mob.name]/[key] : [msg]")

	msg = emoji_parse(msg)

	var/ooc_style = "everyone"
	if(holder && !holder.fakekey)
		ooc_style = "elevated"
		if(holder.rights & R_MOD)
			ooc_style = "moderator"
		if(holder.rights & R_DEBUG)
			ooc_style = "developer"
		if(holder.rights & R_ADMIN)
			ooc_style = "admin"

	for(var/client/target in clients)
		if(target.get_preference_value(/datum/client_preference/show_ooc) == GLOB.PREF_SHOW)
			var/display_name = src.key
			if(holder)
				if(holder.fakekey)
					if(target.holder)
						display_name = "[holder.fakekey]/([src.key])"
					else
						display_name = holder.fakekey
			if(holder && !holder.fakekey && (holder.rights & R_ADMIN) && config.allow_admin_ooccolor && (src.prefs.ooccolor != initial(src.prefs.ooccolor))) // keeping this for the badmins
				to_chat(target, "<span class='ooc'>" + create_text_tag("ooc", "OOC:", target) + " <font color='[src.prefs.ooccolor]'><EM>[display_name]:</EM></font> <span class='[ooc_style]'><span class='message linkify'>[msg]</span></span></span>")
			else
				to_chat(target, "<span class='ooc'><span class='[ooc_style]'>" + create_text_tag("ooc", "OOC:", target) + " <EM>[display_name]:</EM> <span class='message linkify'>[msg]</span></span></span>")

/client/verb/looc(msg as text)
	set name = "LOOC"
	set desc = "Local OOC, seen only by those in view."
	set category = "OOC"

	if(say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, SPAN_DANGER("Speech is currently admin-disabled."))
		return

	if(!mob)
		return

	if(IsGuestKey(key))
		to_chat(src, "Guests may not use OOC.")
		return

	msg = sanitize(msg)
	if(!msg)
		return

	if(src.get_preference_value(/datum/client_preference/show_looc) == GLOB.PREF_HIDE)
		to_chat(src, SPAN_DANGER("You have LOOC muted."))
		return

	if(!holder)
		if(!config.looc_allowed)
			to_chat(src, SPAN_DANGER("LOOC is globally muted."))
			return
		if(!config.dooc_allowed && (mob.stat == DEAD))
			to_chat(usr, SPAN_DANGER("OOC for dead mobs has been turned off."))
			return
		if(prefs.muted & MUTE_OOC)
			to_chat(src, SPAN_DANGER("You cannot use OOC (muted)."))
			return
		if(handle_spam_prevention(msg, MUTE_OOC))
			return

	log_ooc("(LOCAL) [mob.name]/[key] : [msg]")

	var/mob/source = mob.get_looc_source()

	var/display_name = key
	if(holder && holder.fakekey)
		display_name = holder.fakekey
	if(mob.stat != DEAD)
		display_name = mob.name

	var/turf/T = get_turf(source)
	var/list/listening = list()
	listening |= src	// We can always hear ourselves.
	var/list/listening_obj = list()
	var/list/eye_heard = list()

		// This is essentially a copy/paste from living/say() the purpose is to get mobs inside of objects without recursing through
		// the contents of every mob and object in get_mobs_or_objects_in_view() looking for PAI's inside of the contents of a bag inside the
		// contents of a mob inside the contents of a welded shut locker we essentially get a list of turfs and see if the mob is on one of them.

	if(T)
		var/list/hear = hear(7,T)
		var/list/hearturfs = list()

		for(var/I in hear)
			if(ismob(I))
				var/mob/M = I
				listening |= M.client
				hearturfs += M.locs[1]
			else if(isobj(I))
				var/obj/O = I
				hearturfs |= O.locs[1]
				listening_obj |= O

		for(var/mob/M in GLOB.player_list)
			if(M.get_preference_value(/datum/client_preference/show_ooc) == GLOB.PREF_HIDE)
				continue
			if(isAI(M))
				var/mob/living/silicon/ai/A = M
				if(A.eyeobj && (A.eyeobj.locs[1] in hearturfs))
					eye_heard |= M.client
					listening |= M.client
					continue

			if(M.loc && M.locs[1] in hearturfs)
				listening |= M.client


	for(var/client/t in listening)
		var/admin_stuff = ""
		var/prefix = ""
		if(t in admins)
			admin_stuff += "/([key])"
			if(t != src)
				admin_stuff += "([admin_jump_link(mob, t.holder)])"
		if(isAI(t.mob))
			if(t in eye_heard)
				prefix = "(Eye) "
			else
				prefix = "(Core) "
		to_chat(t, "<span class='ooc'><span class='looc'>" + create_text_tag("looc", "LOOC:", t) + " <span class='prefix'>[prefix]</span><EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span></span>")


	for(var/client/adm in admins)	//Now send to all admins that weren't in range.
		if(!(adm in listening) && adm.get_preference_value(/datum/client_preference/staff/show_rlooc) == GLOB.PREF_SHOW)
			var/admin_stuff = "/([key])([admin_jump_link(mob, adm.holder)])"
			var/prefix = "(R)"

			to_chat(adm, "<span class='ooc'><span class='looc'>" + create_text_tag("looc", "LOOC:", adm) + " <span class='prefix'>[prefix]</span><EM>[display_name][admin_stuff]:</EM> <span class='message'>[msg]</span></span></span>")

/mob/proc/get_looc_source()
	return src

/mob/living/silicon/ai/get_looc_source()
	if(eyeobj)
		return eyeobj
	return src
