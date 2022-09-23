//Engineering-related help texts and items.

/obj/machinery/power/supermatter
	description_info = "When energized by a laser or something hitting it, a Supermatter \
	emits phoron, oxygen, radiation, and heat. If the ambient temperature reaches \
	5000 Kelvin, its structural integrity will begin to be affected. If the integrity \
	reaches zero, it will delaminate, causing a massive explosion, ship-wide radiation \
	spikes, and hallucinations. \n\
	\n\
	Supermatter cores are extremely dangerous to be close to, and you need radiation \
	protection when nearby it. If you have line-of-sight to the Supermatter, you \
	will also need optical meson scanners to prevent hallucinations.\n\
	\n\
	Touching a Supermatter will result in instant death, and there won't be a body \
	to be able to recover."
	
	description_antag = GENERIC_ANTAG_STAYAWAY_SUPERMATTER

/obj/machinery/power/apc
	description_info = "An APC (Area Power Controller) regulates and supplies backup \
	power for the area they are in. Their power channels are divided out into \
	'environmental' (Items that manipulate airflow and temperature), 'lighting' \
	(the lights), and 'equipment' (Everything else that consumes power). Power \
	consumption and backup power cell charge can be seen from the interface, further \
	controls (turning a specific channel on, off or automatic, toggling the APC's \
	ability to charge the backup cell, or toggling power for the entire area via \
	the master breaker) first requires the interface to be unlocked with an ID with \
	Engineering access or by one of the station's robots or the artificial intelligence."

	description_antag = "This can be emagged to unlock it.  It will cause the APC \
	to have a blue error screen. Wires can be pulsed remotely with a signaler attached \
	to it."

/obj/item/inflatable
	description_info = "Inflate by using it in your hand. The inflatable barrier \
	will inflate on your tile.  To deflate it, use the 'deflate' verb. You can \
	also inflate this on an adjacent tile by clicking the tile."

/obj/structure/inflatable
	description_info = "To remove these safely, use the 'deflate' verb, or alt-click \
	on it.  Hitting these with any objects will probably puncture and break it forever."


/obj/structure/inflatable/door
	description_info = "Click the door to open or close it. Inflatable doors only \
	block airflow while closed. \n\
	\n\
	To remove these safely, use the 'deflate' verb.  Hitting these with any objects \
	will probably puncture and break it forever."

/obj/machinery/power/smes
	description_info = "SMES units function as both a giant battery and a power \
	transformer. To adjust the input draw, output draw, or toggle either, click \
	on it and adjust it in the interface. You can ctrl-click to quickly toggle the \
	output between off and maximum, or alt-click to quickly toggle the input in the \
	same fashion."

/obj/machinery/power/smes/buildable/get_description_interaction()
	var/list/results = list()
	if(RCon_tag != "NO_TAG")
		results += "This SMES unit can also be controlled remotely from a console \
		via the RCON Remote Control software."
	
	return results

/obj/machinery/power/breakerbox
	description_info = "A breaker panel is a quick and easy way to isolate power \
	from a section. Most breaker boxes are connected next to an SMES unit on the \
	same circuit, and turning these on will bypass the SMES unit and put the sub-grid \
	on mains power. You can toggle the breaker by clicking on it."

/obj/machinery/power/breakerbox/get_description_interaction()
	var/list/results = list()
	if(RCon_tag != "NO_TAG")
		results += "This breaker panel can also be controlled remotely from a console \
		via the RCON Remote Control software."
	
	return results
