//Command-related items and machinery. Includes telecomms. Does not include AI.

///////////////
// ITEMS
///////////////

/obj/item/hand_tele
	description_info = "A hand teleporter is used to teleport to various telebeacons \
	placed around the ship."

/obj/item/pinpointer
	description_info = "A pinpointer is used to locate the nuclear authentication \
	disk and the onboard nuclear self-destruct device, should either of them go \
	missing."

/obj/item/disk/nuclear
	description_info = "The nuclear authentication disk is one of two factors required \
	to authenticate the activation of the onboard nuclear self-destruct device; the \
	other factor being a six-digit code."

	description_antag = "As an antag, arming the ship nuke without explicit permission \
	from the administrators or an explicit objective to do so is a bad idea.\n\
	\n\
	That said, each head of staff is responsible for two digits of the nuke's \
	six-digit authentication code."

/obj/item/electronics/ai_module
	description_info = "AI modules are used to set the laws of an artificial intelligence \
	unit or robot to a pre-defined law or set of laws."
	
	description_antag = "The AI is a nigh-omnipresent force on the ship that makes \
	it hard for you to get anywhere you're not supposed to. Using these modules, \
	however, you may be able to bend these rules to suit you and your needs better."

/obj/item/electronics/ai_module/get_description_interaction()
	var/list/results = list()
	if(!isnull(src.laws))
		results += "\n\nThis AI module has the following laws defined:"
		for(var/i in src.laws.sorted_laws)
			var/datum/ai_law/inherent/this_law = i
			results += "[this_law.index].) [this_law.law]"

	return results

/obj/item/electronics/ai_module/freeform/get_description_interaction()
	var/list/results = list()
	results += "This AI module is a freeform board, allowing someone to define \
	their own laws for upload. Just be prepared for the AI or robot to twist the \
	words to their benefit."
	
	return results


///////////////
// MACHINERY
///////////////

/obj/machinery/keycard_auth
	description_info = "A keycard authentication device is a two-key system for \
	most of its functions, requiring another person elsewhere to confirm. This is \
	useful to prevent a single person from being able to give the order to abandon \
	ship, for example. \n\
	\n\
	You can also disable the keycard checks on maintenance doors here, and this \
	function does NOT require a second person to confirm it."

/obj/machinery/photocopier/faxmachine
	description_info = "A fax machine is used to send faxes to various offices overseeing \
	the operations of the ship."

///////////////
// TELECOMMS
///////////////

/obj/machinery/telecomms/receiver
	description_info = "A subspace receiver is a receive-only antenna, listening \
	for signals. If it receives a signal, it sends it to the network hub (or a \
	processor, if the hub is absent) to clean up the signal into something usable."

/obj/machinery/telecomms/hub
	description_info = "A telecommunications hub routes signals and traffic based \
	on its source. It is not strictly necessary to a working telecomms system, but \
	allows long-range communications via a relay."

/obj/machinery/telecomms/relay
	description_info = "A telecommunications relay broadcasts data for long-range \
	communication, and requires a hub to function."

/obj/machinery/telecomms/processor
	description_info = "A processor unit is responsible for converting a signal \
	into something that people can understand through their headset. Without it, \
	the resulting audio signal will be an unintelligible squelch."

/obj/machinery/telecomms/bus
	description_info = "A bus mainframe is responsible for decompressing a signal \
	into something other telecommunications equipment can work with, and sending \
	usable signals to the broadcaster."

/obj/machinery/telecomms/broadcaster
	description_info = "A subspace broadcaster is a transmit-only antenna, used to \
	broadcast signals (such as radio traffic)."

/obj/machinery/telecomms/server
	description_info = "A server logs all traffic and signal data. If it's present, \
	it then sends the signal to the subspace broadcaster to transmit."

/obj/machinery/bluespacerelay
	description_fluff = "A bluespace relay is used in contacting Nanotrasen. As the \
	ship is currently in nullspace, it's stuck attempting to establish a connection."