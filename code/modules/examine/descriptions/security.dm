//Security-related machinery and items.

///////////////
// ITEMS
///////////////

/obj/item/melee/baton		//stunstick
	description_info = "A stun baton is used to incapacitate a target by delivering \
	an electrical shock. To use it, activate it in your hand to turn the power on, \
	and click on them.\n\
	\n\
	In a pinch, a stun baton can be used as a bludgeoning instrument. To use it \
	as one, make sure your intent is set to 'harm'. This will have less of a stun \
	effect if it's on, but will suffice as an improvised baseball bat. \n\
	\n\
	Stun batons (in general) use M-sized cells."

/obj/item/shield		//Generic shield
	description_info = "Shields block incoming projectiles."

/obj/item/shield/buckler
	description_info = "Shields block incoming projectiles. Bucklers are always \
	deployed, but only cover the arm that it is being held by, plus a few other \
	areas."

/obj/item/shield/riot		//Riot shield.
	description_info = "Shields block incoming projectiles. Full-sized shields can \
	be raised or lowered as the situation demands. To raise your shield, set your \
	movement intent to 'walk'; to lower it, switch it back to 'run'."

/obj/structure/reagent_dispensers/peppertank
	description_info = "A pepper spray refiller is a wall-mounted tank containing \
	oleoresin capsicum, for refilling handheld pepper-spray containers. To use it, \
	click the tank with a pepper-spray can."

/obj/item/reagent_containers/spray/pepper
	description_info = "A small spray can containing oleoresin capsicum, used \
	for incapacitating unruly personnel. To spray it, click the tile or person who \
	you wish to spray. \n\
	\n\
	Pepper spray cans can be refilled at a pepper spray refiller station. To refill \
	a pepper spray can, click the refill station with the can."

/obj/item/handcuffs
	description_info = "Handcuffs, cable restraints, and zip ties are used to restrain \
	prisoners and prevent them from escaping. To restrain someone, click them with \
	the restraints. \n\
	\n\
	You can decrease the amount of time it will take to restrain someone by grabbing \
	them. The more aggressive the grab, the shorter time it will take to restrain \
	them. \n\
	\n\
	You can also use handcuffs on orange shoes to create legcuffed shoes, which will \
	significantly slow them down, reducing their ability to escape."
	
	description_antag = "Handcuffs and other similar restraints can be shimmed out \
	of by resisting. The amount of time it will take to shim out of them depends \
	on the type of restraints."

/obj/item/clothing/accessory/holster
	description_info = "A holster attaches to your jumpsuit or undergarment, and \
	can hold a handgun or similar small firearm. To holster or draw a firearm, \
	click on the holster, or press H in hotkey mode."

/obj/item/clothing/glasses/sunglasses/blindfold
	description_info = "A blindfold is used to render a patient or prisoner unable \
	to see."

/obj/item/clothing/mask/muzzle
	description_info = "A muzzle gag is used to silence a patient or prisoner."

/obj/item/device/flash
	description_info = "A flash is a handheld device used to momentarily blind someone."

/obj/item/clothing/suit/straight_jacket
	description_info = "A straight jacket is used to restrain someone without using \
	handcuffs. Prisoners and patients who are wearing a straight jacket cannot take \
	it off or interact with most things without outside assistance."

//Forensics.

/obj/item/autopsy_scanner
	description_info = "An autopsy scanner gives detailed information on wounds of \
	the deceased, such as severity of wounds, their approximate infliction time, \
	and probable causes."

/obj/item/forensics/sample_kit
	description_info = "A fiber collection kit is used to find fibers on objects, \
	such as clothing fibers. Successfully finding fibers will transfer them to an \
	evidence bag, allowing you to examine them in further detail to find a possible \
	suspect or group of suspects."

/obj/item/forensics/sample_kit/powder
	description_info = "Fingerprint powder is used to find fingerprints on objects. \
	Successfully finding fingerprints will transfer them to a fingerprint card, \
	allowing you to examine them in further detail to find a possible suspect."

/obj/item/forensics/swab
	description_info = "A swab kit is used to swab someone's cheek for DNA, or \
	their hand for gunpowder residue. Swabs can be examined in detail under a microscope \
	or analyzed by a DNA scanner."

/obj/item/reagent_containers/spray/luminol
	description_info = "Luminol is used to find hidden blood, or traces that have \
	been washed away."

/obj/item/device/uv_light
	description_info = "A UV light, also known as a black light, is used to find \
	fluorescent objects that may be hidden. Fluorescent objects will glow when hit \
	by ultraviolet light."

/obj/item/sample/print
	description_info = "A fingerprint card is a pressure-sensitive card that holds \
	fingerprints, or fingerprint powder lifted off a surface or object. Fingerprint \
	cards can be examined in detail under a microscope."

/obj/item/sample/fibers
	description_info = "Fiber bags hold fibers collected from a surface or object. \
	Fiber bags can be examined in detail under a microscope."

/obj/item/evidencebag
	description_info = "Evidence bags are used to safely store and transport evidence. \
	To bag an item for evidence, click and drag the item into the evidence bag. To \
	remove an item from an evidence bag, use it in your hand."

/obj/item/storage/briefcase/crimekit
	description_info = "A crime scene kit is used to haul forensic supplies from \
	point A to point B without having to cram it all in your pocket."

/obj/item/device/taperecorder
	description_info = "A universal recorder will record nearby speech to an internal \
	hard drive. Any speech that isn't in Galactic Common will be translated during \
	playback."
	
	description_antag = "Emagging a universal recorder will render it unable to \
	record, and rig it to self-destruct on playback."

///////////////
// MACHINERY
///////////////

/obj/machinery/recharger
	description_info = "A recharger recharges power cells. To use it, all you need \
	to do is insert a power cell. The charger will flash green lights while the \
	cell is charging, and yellow when it is fully charged."

/obj/machinery/door_timer
	description_info = "A door timer remotely controls certain doors. The ID of the \
	door it is controlling is displayed over the timer."

/obj/machinery/nuclearbomb
	description_info = "The ship nuke (officially, the Onboard Nuclear Self-Destruct \
	Device) is exactly what you think it is, and does exactly what you think it does."

	description_antag = "As an antag, arming the ship nuke without explicit permission \
	from the administrators or an explicit objective to do so is a bad idea.\n\
	\n\
	The ship nuke requires a six-digit password, and the nuclear \
	authentication disk, in order to be able to be issued commands. To prevent the \
	nuke from going anywhere, it should be anchored, and to prevent pesky personnel \
	from disarming it, you should A.) remove the disk after it's armed and keep it \
	away from the nuke, and B.) set the timer as short as you can safely take to \
	arm it and get free of the ship."

/obj/machinery/flasher/portable
	description_info = "A portable flasher is used to blind anyone who runs past \
	it, useful for crowd control. It cannot detect someone walking, however."