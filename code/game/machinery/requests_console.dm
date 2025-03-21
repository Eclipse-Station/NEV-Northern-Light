/******************** Requests Console ********************/
/** Originally written by errorage, updated by: Carn, needs more work though. I just added some security fixes */

//Request Console Department Types
#define RC_ASSIST 1		//Request Assistance
#define RC_SUPPLY 2		//Request Supplies
#define RC_INFO   4		//Relay Info

//Request Console Screens
#define RCS_MAINMENU 0	// Main menu
#define RCS_RQASSIST 1	// Request supplies
#define RCS_RQSUPPLY 2	// Request assistance
#define RCS_SENDINFO 3	// Relay information
#define RCS_SENTPASS 4	// Message sent successfully
#define RCS_SENTFAIL 5	// Message sent unsuccessfully
#define RCS_VIEWMSGS 6	// View messages
#define RCS_MESSAUTH 7	// Authentication before sending
#define RCS_ANNOUNCE 8	// Send announcement

var/req_console_assistance = list()
var/req_console_supplies = list()
var/req_console_information = list()
var/list/obj/machinery/requests_console/allConsoles = list()

/obj/machinery/requests_console
	name = "Requests Console"
	desc = "A console intended to send requests to different departments on the ship."
	anchored = TRUE
	icon = 'icons/obj/terminals.dmi'
	icon_state = "req_comp0"
	var/department = "Unknown" //The list of all departments on the station (Determined from this variable on each unit) Set this to the same thing if you want several consoles in one department
	var/list/message_log = list() //List of all messages
	var/departmentType = 0 		//Bitflag. Zero is reply-only. Map currently uses raw numbers instead of defines.
	var/newmessagepriority = 0
		// 0 = no new message
		// 1 = normal priority
		// 2 = high priority
	var/screen = RCS_MAINMENU
	var/silent = 0 // set to 1 for it not to beep all the time
//	var/hackState = 0
		// 0 = not hacked
		// 1 = hacked
	var/announcementConsole = 0
		// 0 = This console cannot be used to send department announcements
		// 1 = This console can send department announcementsf
	var/open = 0 // 1 if open
	var/announceAuth = 0 //Will be set to 1 when you authenticate yourself for announcements
	var/msgVerified = "" //Will contain the name of the person who varified it
	var/msgStamped = "" //If a message is stamped, this will contain the stamp name
	var/message = "";
	var/recipient = ""; //the department which will be receiving the message
	var/priority = -1 ; //Priority of the message being sent
	light_range = 0
	var/datum/announcement/announcement = new
	
	// // // ECLIPSE ADDED VARS // // //
	var/verifyName = ""
	var/verifyRank = ""
	var/stampName = ""

/obj/machinery/requests_console/power_change()
	..()
	update_icon()

/obj/machinery/requests_console/update_icon()
	if(stat & NOPOWER)
		if(icon_state != "req_comp_off")
			icon_state = "req_comp_off"
	else
		if(icon_state == "req_comp_off")
			icon_state = "req_comp[newmessagepriority]"

/obj/machinery/requests_console/New()
	..()
	
	// // // BEGIN ECLIPSE EDITS // // //
	/* If no department name is set, the Request Console should use the area 
	 * name. This allows for emergency responders to figure out where the person
	 * is, and for RC spammers to be caught by security. This also saves map
	 * filesize by not requiring a department for every civilian RC on the ship.
	 */
	if(department == "Unknown")
		var/area/console_area = get_area(src)
		/*
		//This implementation technically works, but is rather dangerous.
		try
			ASSERT(console_area:name)			//don't try shit like this at home without a try-catch block, kids
			department = "[console_area:name]"
		catch
			department = "FAILURE_TO_GET_AREA_NAME"
		*/
		department = "[console_area.name]"
		departmentType = 0		//Reply only, prevent it from showing up
	// // // END ECLIPSE EDITS // // //

	announcement.title = "[department] announcement"
	announcement.newscast = 1

	name = "[department] Requests Console"
	allConsoles += src
	if (departmentType & RC_ASSIST)
		req_console_assistance |= department
	if (departmentType & RC_SUPPLY)
		req_console_supplies |= department
	if (departmentType & RC_INFO)
		req_console_information |= department

	set_light(1)

/obj/machinery/requests_console/Destroy()
	allConsoles -= src
	var/lastDeptRC = 1
	for (var/obj/machinery/requests_console/Console in allConsoles)
		if (Console.department == department)
			lastDeptRC = 0
			break
	if(lastDeptRC)
		if (departmentType & RC_ASSIST)
			req_console_assistance -= department
		if (departmentType & RC_SUPPLY)
			req_console_supplies -= department
		if (departmentType & RC_INFO)
			req_console_information -= department
	. = ..()

/obj/machinery/requests_console/attack_hand(user as mob)
	if(..(user))
		return
	nano_ui_interact(user)

/obj/machinery/requests_console/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/data[0]

	data["department"] = department
	data["screen"] = screen
	data["message_log"] = message_log
	data["newmessagepriority"] = newmessagepriority
	data["silent"] = silent
	data["announcementConsole"] = announcementConsole

	data["assist_dept"] = req_console_assistance
	data["supply_dept"] = req_console_supplies
	data["info_dept"]   = req_console_information

	data["message"] = message
	data["recipient"] = recipient
	data["priortiy"] = priority
	data["msgStamped"] = msgStamped
	data["msgVerified"] = msgVerified
	data["announceAuth"] = announceAuth

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "request_console.tmpl", "[department] Request Console", 520, 410)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/requests_console/Topic(href, href_list)
	if(..())	return
	usr.set_machine(src)
	add_fingerprint(usr)

	if(reject_bad_text(href_list["write"]))
		recipient = href_list["write"] //write contains the string of the receiving department's name

		var/new_message = sanitize(input("Write your message:", "Awaiting Input", ""))
		if(new_message)
			message = new_message
			screen = RCS_MESSAUTH
			switch(href_list["priority"])
				if("1") priority = 1
				if("2")	priority = 2
				else	priority = 0
		else
			reset_message(1)

	if(href_list["writeAnnouncement"])
		var/new_message = sanitize(input("Write your message:", "Awaiting Input", ""))
		if(new_message)
			message = new_message
		else
			reset_message(1)

	if(href_list["sendAnnouncement"])
		if(!announcementConsole)	return
		announcement.Announce(message, msg_sanitized = 1)
		reset_message(1)

	if( href_list["department"] && message )
		var/log_msg = message
		var/pass = 0
		screen = RCS_SENTFAIL
		for (var/obj/machinery/message_server/MS in world)
			if(!MS.active) continue
			MS.send_rc_message(ckey(href_list["department"]),department,log_msg,msgStamped,msgVerified,priority,verifyName,verifyRank,stampName)		//Eclipse edit: Added last 3 params for NTDAD
			pass = 1
		if(pass)
			screen = RCS_SENTPASS
			message_log += "<B>Message sent to [recipient]</B><BR>[message]"
		else
			audible_message(text("\icon[src] *The Requests Console beeps: 'NOTICE: No server detected!'"),,4)

	//Handle screen switching
	if(href_list["setScreen"])
		var/tempScreen = text2num(href_list["setScreen"])
		if(tempScreen == RCS_ANNOUNCE && !announcementConsole)
			return
		if(tempScreen == RCS_VIEWMSGS)
			for (var/obj/machinery/requests_console/Console in allConsoles)
				if (Console.department == department)
					Console.newmessagepriority = 0
					Console.icon_state = "req_comp0"
					Console.set_light(1)
		if(tempScreen == RCS_MAINMENU)
			reset_message()
		screen = tempScreen

	//Handle silencing the console
	if(href_list["toggleSilent"])
		silent = !silent

	updateUsrDialog()
	playsound(loc, 'sound/machines/button.ogg', 100, 1)
	return

					//err... hacking code, which has no reason for existing... but anyway... it was once supposed to unlock priority 3 messanging on that console (EXTREME priority...), but the code for that was removed.
/obj/machinery/requests_console/attackby(var/obj/item/O as obj, var/mob/user as mob)

	if (istype(O, /obj/item/card/id))
		if(inoperable(MAINT)) return
		if(screen == RCS_MESSAUTH)
			// // // BEGIN ECLIPSE EDITS // // //
			// NT Department Alarm Dispatcher
			var/obj/item/card/id/T = O
			verifyName = T.registered_name
			verifyRank = T.assignment
			// // // END ECLIPSE EDITS // // //
			msgVerified = text("<font color='green'><b>Verified by [T.registered_name] ([T.assignment])</b></font>")
			updateUsrDialog()
		if(screen == RCS_ANNOUNCE)
			var/obj/item/card/id/ID = O
			if (access_RC_announce in ID.GetAccess())
				announceAuth = 1
				announcement.announcer = ID.assignment ? "[ID.assignment] [ID.registered_name]" : ID.registered_name
			else
				reset_message()
				to_chat(user, SPAN_WARNING("You are not authorized to send announcements."))
			updateUsrDialog()
	if (istype(O, /obj/item/stamp))
		if(inoperable(MAINT)) return
		if(screen == RCS_MESSAUTH)
			var/obj/item/stamp/T = O
			stampName = T.name		//Eclipse Edit
			msgStamped = text("<font color='blue'><b>Stamped with the [T.name]</b></font>")
			updateUsrDialog()
	return

/obj/machinery/requests_console/proc/reset_message(var/mainmenu = 0)
	message = ""
	recipient = ""
	priority = 0
	msgVerified = ""
	msgStamped = ""
	announceAuth = 0
	announcement.announcer = ""
	if(mainmenu)
		screen = RCS_MAINMENU
	
	//Eclipse edits below - reset everything
	verifyName = ""
	verifyRank = ""
	stampName = ""