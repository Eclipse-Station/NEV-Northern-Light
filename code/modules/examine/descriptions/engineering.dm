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

/obj/machinery/power/generator/
	description_info = "A thermoelectric generator produces electricity by running \
	a gas through its two attached circulators. One loop is warmer than the other, \
	and the difference in temperature is what it uses to generate power. Generally \
	speaking, the higher the temperature difference, the more power is produced, but \
	gas pressure also plays a role in electrical production. \n\
	\n\
	Gases that go through either circulator will have their temperature somewhat \
	equalized with the gas going through the other circulator. The gases are still \
	isolated from each other, so you don't need to worry about contaminating the \
	cold loop with waste gas from the hot loop. \n\
	\n\
	Thermoelectric generators are only rated to produce a certain amount of power. \
	Exceeding the generator will cause it to occasionally emit sparks, which will \
	cause a brief dip in its efficiency, but have no other inherently harmful effects. \
	Be careful of flammable gases present in the air, however, as it can easily ignite \
	a roaring fire."
	description_antag = GENERIC_ANTAG_STAYAWAY_SUPERMATTER		//Usually only present in the engine room.

//This is technically an Atmospherics item, but is in here for consistency.
/obj/machinery/atmospherics/binary/circulator
	description_info = "A thermoelectric generator circulator is a turbine with \
	a port to connect a standard pipe to on either end. For more information on \
	a thermoelectric generator, examine the main unit."

/obj/machinery/gravity_generator
	description_info = "A gravity generator produces a small field of gravity when \
	it is powered and turned on - \"small\", of course, being relative to a planet. \n\
	\n\
	A gravity generator emits quite a bit of radiation while it is charging up or \
	powering down. You should wear radiation equipment while working nearby, in  \
	the event it unexpectedly shuts off - if you can see it, you're in range."

/obj/machinery/power/shield_generator
	description_info = "A shield generator produces a protective shield when it is \
	powered up and properly configured. You can configure a shield generator by \
	interacting with it directly, or by using the 'Shield Control' program on a \
	modular computer or laptop. \n\
	\n\
	Shield generators, in general, consume a lot of power and emit a lot of heat. \
	Most shield generators have a built-in safety shutoff to prevent it from being \
	damaged from overheating, which will trigger an emergency shutdown to cool off. \
	Given how far out into nullspace the ship currently is, and how difficult it \
	would be to source a replacement, this is probably for the best. \n\
	\n\
	For most shield generators, the trip point for this is 125 Celsius, or about \
	398 Kelvin. Keep an ear on your radio for an overheat alarm. In the event it \
	overheats and shuts down, it will also set itself to only draw 1 kilowatt of \
	power, to prevent an infinite overheat loop."

/obj/machinery/power/shield_generator/hull/installed		//The one installed on the ship.
	description_fluff = "This shield generator has seen better days. It's been \
	kept running with the manufacturer's recommended grease... that's been filtered \
	and reused at least a hundred times, using spare parts that have been hastily \
	repaired or - in some cases - substituted with a makeshift equivalent when said \
	spare parts ran out, and has clocked enough Hobbs hours to qualify for a senior \
	citizen's discount at Blue's Recluse many times over. The fact that it still \
	runs at all is a miracle in and of itself."
	description_antag = GENERIC_ANTAG_STAYAWAY

/obj/machinery/shield_conduit
	description_info = "A shield generator conduit stores power that the generator \
	itself is not actively using at the moment, so it doesn't need to pull from the \
	grid to repair the shields if a section of shielding collapses."
	description_antag = GENERIC_ANTAG_STAYAWAY

/obj/machinery/power/long_range_scanner
	description_info = "A long-range scanner functions as a low-frequency radar, \
	allowing the ship's navigation suite to see things such as debris, meteors, and \
	stations long before they're visible through (or, as is often the case, on) the \
	glass of the bridge."

/obj/machinery/scanner_conduit
	description_info = "A long-range scanner conduit stores power that the scanner \
	itself is not actively using at the moment, so it doesn't need to pull from the \
	grid to sustain the navigation suite's sensors."