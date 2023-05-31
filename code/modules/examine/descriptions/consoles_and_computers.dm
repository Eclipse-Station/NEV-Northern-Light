//Consoles and computers. 

/obj/machinery/requests_console
	description_info = "The Requests console is a wall-mounted console that allows \
	you to request supplies, information, or assistance from other departments. To \
	request something, select the department you wish to get assistance from, type \
	in a message, swipe your ID or use a stamp on the console, then press send. \n\
	\n\
	The request console is tied to the Nanotrasen Department Alarm Dispatcher. If \
	certain criteria are met, the message may be passed along to the Discord server \
	for everyone to see."

/obj/machinery/requests_console/get_description_interaction()
	var/list/results = list()
	if(announcementConsole)
		results += "This console can also be used to send departmental announcements."

	return results

//Modular computer generic.
/obj/item/modular_computer
	description_info = "Modular computers are computers which are capable of running \
	more than one software, which allow them to perform more than one duty. More \
	software can be loaded via the 'Software Download Tool' program; exactly what \
	software you can load is limited by the access on your ID and the class of \
	computer you're running it on (console, tablet, or PDA)."
	
	description_antag = "You can use a cryptographic sequencer on modular computers. \
	This will allow you to download software you wouldn't normally be able to obtain, \
	as well as do certain things you normally wouldn't be able to do in programs. \
	Exactly what you'd be able to do varies from program to program."

//Non-modular computer generic.
/obj/machinery/computer
	description_info = "Standard computers are computers running a single software \
	with a single purpose for a single task."

/obj/machinery/computer/operating/get_description_interaction()		//Operating ward patient monitoring console.
	var/list/results = list()
	results += "This console is used to monitor the vitals of a patient on a surgical \
	table immediately next to it."

	return results

/obj/machinery/computer/aifixer/get_description_interaction()
	var/list/results = list()
	results += "This console is used to restore the system integrity of an artificial \
	intelligence that has been corrupted."

	return results

/obj/machinery/computer/arcade
	description_antag = "You can use a crypographic sequencer to crank the difficulty \
	up to Realism Mode. In Realism Mode, if the player dies in the arcade game, \
	they die in front of the arcade cabinet, as well."

/obj/machinery/computer/arcade/get_description_interaction()
	var/list/results = list()
	results += "This is an arcade machine, used to pass idle time."

	return results

/obj/machinery/computer/arcade/orion_trail
	description_fluff = "The Orion Trail series is one of the oldest brands of arcade \
	machines on the market. Despite this, it is also still one of the most popular."

/obj/machinery/computer/guestpass/get_description_interaction()
	var/list/results = list()
	results += "This console is used to print guest passes. Guest passes function \
	identically to ID cards, and can have access put on them by the person creating \
	the guest pass (up to and including all of their access), but expire after a \
	period of time."

	return results


/obj/machinery/computer/message_monitor/get_description_interaction()
	var/list/results = list()
	results += "This console is used to view email and request console messages."

	return results

/obj/machinery/computer/pod/get_description_interaction()
	var/list/results = list()
	results += "This console is used to launch escape pods."

	return results
	
/obj/machinery/computer/pod/old/get_description_interaction()
	var/list/results = list()
	results += "This console is used to control shuttle doors."

	return results


/obj/machinery/computer/telecomms/server/get_description_interaction()
	var/list/results = list()
	results += "This console is used to monitor the telecommunications servers. \
	You can also use it to view logs of what was said over the radio."

	return results

/obj/machinery/computer/helm/get_description_interaction()
	var/list/results = list()
	results += "This console is used to pilot the ship."

	return results

/obj/machinery/computer/engines/get_description_interaction()
	var/list/results = list()
	results += "This console is used to check the status of the thrusters. You can \
	also control the thrust limiter and shut down the thrusters with it."
	
	return results