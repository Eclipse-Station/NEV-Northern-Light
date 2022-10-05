// Medical and research machinery and items.

///////////////
// MEDICAL MACHINERY
///////////////

/obj/machinery/bodyscanner
	description_info = "A body scanner is used to thoroughly scan a patient or a \
	casualty for injuries, internal and external."

/obj/machinery/body_scanconsole
	description_info = "A body scanner is used to thoroughly scan a patient or a \
	casualty for injuries, internal and external."
	//Same as above.

/obj/machinery/optable
	description_info = "An operating table is an elevated table to allow for surgery."

/obj/machinery/atmospherics/unary/cryo_cell
	description_info = "A cryo cell (not to be confused with a cryopod) is used to \
	rapidly cool down the body temperature of a patient. A beaker with any reagent \
	can be placed inside to transfer it into their bloodstream, but a cryo cell can \
	still heal someone slowly without any reagents in it. The best reagent to use \
	is cryoxadone or clonexadone; you risk an overdose with other reagents. \n\
	\n\
	There should be a gas cooler nearby that you will need to use to cool the cryo \
	cell down to acceptable temperatures. Temperatures below 170 Kelvin (-103 Celsius) \
	are required to activate cryoxadone or clonexadone, though the cryo cell will \
	work (with greatly reduced efficiency) as high as about 225 Kelvin (-48 Celsius). \
	It is recommended to also remove any bulky clothing a patient going into cryo \
	may have, such as jackets or voidsuits, to speed up the rate at which their \
	body temperature drops."

/obj/machinery/sleeper
	description_info = "A sleeper can be used to stabilize a patient or a casualty \
	prior to performing other work. It has a reservoir of some low-potency healing \
	chemicals built-in, as well as space for a beaker. If a beaker is inserted, you \
	can also perform dialysis to see what exactly is in their bloodstream and remove \
	any unwanted chemicals."

//Cloning.

/obj/machinery/neotheology/cloner
	description_info = "The SLT-73 Clonepod is used to clone a casualty. In order \
	for it to work, you must insert the casualty's soulcrypt implant into the core \
	implant reader on the side, and there must be enough biomatter in the biomatter \
	tank for it to create an entire body. \n\
	\n\
	Once the casualty has finished cloning, you must re-implant them with their \
	original soulcrypt to upload the casualty's mind to the body and allow them to \
	play again."

/obj/machinery/neotheology/reader	//Same as above.
	description_info = "The SLT-73 Clonepod is used to clone a casualty. In order \
	for it to work, you must insert the casualty's soulcrypt implant into the core \
	implant reader on the side, and there must be enough biomatter in the biomatter \
	tank for it to create an entire body. \n\
	\n\
	Once the casualty has finished cloning, you must re-implant them with their \
	original soulcrypt to upload the casualty's mind to the body and allow them to \
	play again."

/obj/machinery/neotheology/biomass_container
	description_info = "This tank holds the biomass needed for the SLT-73 Clonepod \
	to create new life from scratch. It can hold a maximum of 600 units."

//Virology... to come eventually(tm).

///////////////
// MEDICAL ITEMS 
///////////////

//Medkits and healing items.
/obj/item/storage/firstaid		//Basic type, we'll override surgical items later.
	description_info = "A first-aid kit is the basic weapon of a medical team in \
	the fight to keep a casualty alive. A first-aid kit can hold various medical \
	supplies, such as gauze, ointment, health scanners, and specific drugs to aid \
	in patching up different types of injuries. There are a few different kinds of \
	first-aid kits, each with their own contents and purposes."

/obj/item/storage/firstaid/adv/get_description_interaction()
	var/list/results = list()
	
	results += "An advanced first-aid kit contains more advanced burn and brute force \
	treatment options than a regular first-aid kit. They also may contain splints to \
	help keep broken bones from being jostled during transportation."
	
	return results

/obj/item/storage/firstaid/toxin/get_description_interaction()
	var/list/results = list()
	
	results += "A toxin first-aid kit contains medicines to help fight poisoning."
	
	return results

/obj/item/storage/firstaid/fire/get_description_interaction()
	var/list/results = list()
	
	results += "A fire first-aid kit contains ointment and medicines to help treat \
	severe burns."
	
	return results

/obj/item/storage/firstaid/o2/get_description_interaction()
	var/list/results = list()
	
	results += "An oxygen-deprivation first aid kit contains medicines to help treat \
	oxygen deprivation and suffocation."
	
	return results
	
/obj/item/storage/firstaid/surgery 
	description_info = "A surgery kit holds surgical tools and contains everything \
	you might need to open up someone who is still alive."

/obj/item/stack/medical/bruise_pack		//Gauze
	description_info = "Gauze is used to bandage, cover, and protect most external \
	wounds. Bandaged wounds have a far lower chance of becoming infected."

/obj/item/stack/medical/ointment
	description_info = "Ointment is used to salve burns, allowing them to heal \
	faster."

/obj/item/stack/medical/advanced/bruise_pack	//Advanced trauma kit
	description_info = "An advanced trauma kit is used to treat, disinfect, and \
	seal most external wounds. Sealed and disinfected wounds have a far lower \
	chance of becoming infected."

/obj/item/stack/medical/advanced/ointment
	description_info = "An advanced burn kit is used to salve burns with regenerative \
	membrane, allowing them to heal much faster."

/obj/item/stack/medical/advanced/bruise_pack/nt	//Mekhanite Bruisepack
	description_info = "A Mekhanite bruisepack is used to treat, disinfect, and \
	seal most external wounds. Sealed and disinfected wounds have a far lower \
	chance of becoming infected."
	
/obj/item/stack/medical/advanced/ointment/nt	//Mekhanite Burnpack
	description_info = "A Mekhanite burnpack is used to salve burns with regenerative \
	membrane, allowing them to heal much faster."

/obj/item/stack/medical/splint
	description_info = "Splints are used to restrict broken bones from movement, \
	allowing a patient or casualty to move about without jostling them painfully."

//Patient transport
/obj/item/bodybag
	description_info = "Body bags are used to store and transport the deceased."

/obj/structure/closet/body_bag
	description_info = "Body bags are used to store and transport the deceased."

/obj/item/bodybag/cryobag
	description_info = "Stasis bags are used to transport and protect casualties \
	pending medical care. Stasis bags are single-use, so once a casualty is inside \
	and the bag is closed, there is no reusing that bag. (If you close it without \
	an occupant inside, it will not consume the stasis bag.) \n\
	\n\
	Stasis bags have their own built-in oxygen supply, so any casualty inside is \
	safe from toxins or contaminants in the air, or lack thereof. In addition, a \
	casualty in stasis will have their metabolism suspended, meaning any medicines \
	or toxins in their bloodstream will not affect them while they are in stasis. \
	This can be useful if you need to buy some time in order to treat them. \n\
	\n\
	You can use a health analyzer to scan the vitals of a casualty without opening \
	(and thus destroying) the stasis bag."

/obj/structure/closet/body_bag/cryobag
	description_info = "Stasis bags are used to transport and protect casualties \
	pending medical care. Stasis bags are single-use, so once a casualty is inside \
	and the bag is closed, there is no reusing that bag. (If you close it without \
	an occupant inside, it will not consume the stasis bag.) \n\
	\n\
	Stasis bags have their own built-in oxygen supply, so any casualty inside is \
	safe from toxins or contaminants in the air, or lack thereof. In addition, a \
	casualty in stasis will have their metabolism suspended, meaning any medicines \
	or toxins in their bloodstream will not affect them while they are in stasis. \
	This can be useful if you need to buy some time in order to treat them. \n\
	\n\
	You can use a health analyzer to scan the vitals of a casualty without opening \
	(and thus destroying) the stasis bag."

/obj/structure/bed/roller
	description_info = "A roller bed, also known as a gurney, is used to safely \
	transport a patient or casualty who is incapable of transporting themselves, \
	such as a casualty with a broken leg. To fold a roller bed, click and drag it \
	onto your sprite."

/obj/item/roller
	description_info = "A roller bed, also known as a gurney, is used to safely \
	transport a patient or casualty who is incapable of transporting themselves, \
	such as a casualty with a broken leg. To deploy a roller bed, use it in your \
	hand."
	
/obj/item/implant/core_implant/soulcrypt
	description_info = "A soulcrypt is used to back up a patient's DNA and mind in \
	the event of death. It can be used in an STL-73 Clonepod to clone a deceased \
	patient."
	
/obj/item/device/defib_kit
	description_info = "A defibrillator (officially, a Manual External Defibrillator) \
	is used to shock a patient's heart. This is useful to revive a patient from the \
	dead, or stop and restart their heart due to a cardiac arrest. \n\
	\n\
	Defibrillating a patient will cause some minor electrical burns. You cannot defib \
	a casualty if their brute, burn, or toxin damage is too high, and you cannot defib \
	someone who has been dead for more than 8 minutes."
	
/obj/item/device/defib_kit/get_description_interaction()
	var/list/results = list()
	results += "To defibrillate a casualty, wear the defibrillator on your back, click \
	the defibrillator to pull the paddles out, use the paddles in your hand to hold \
	them with both hands, then click the casualty."
	results += "A back-worn defibrillator uses an internal L-size cell. You can \
	change the cell by using a screwdriver to remove the old cell, then putting \
	a new cell inside."
	
	return results

/obj/item/device/defib_kit/compact/get_description_interaction()
	var/list/results = list()
	results += "To defibrillate a casualty, wear the defibrillator on your belt, click \
	the defibrillator to pull the paddles out, use the paddles in your hand to hold \
	them with both hands, then click the casualty."
	results += "A belt-worn defibrillator uses an internal M-size cell. You can \
	change the cell by using a screwdriver to remove the old cell, then putting \
	a new cell inside."
	
	return results
	
/obj/item/device/defib_kit/jumper_kit
	description_info = "A jumper cable kit is a special type of defibrillator used \
	to revive a full-body prosthetic from the dead.\n\
	\n\
	Defibrillating a patient will cause some minor electrical burns. You cannot defib \
	a casualty if their brute, burn, or toxin damage is too high, and you cannot defib \
	someone who has been dead for more than 8 minutes."
	
/obj/item/implanter
	description_info = "An implanter is used to put implants, such as a death alarm \
	or soulcrypt, into someone."
	
/obj/structure/medical_stand 
	description_info = "Medical stands can be used to hang blood bags, beakers, and \
	anaesthetic tanks. You can perform a blood draw using a medical stand and a \
	blood bag or beaker."

/obj/item/device/scanner/mass_spectrometer
	description_info = "A mass spectrometer is used to identify chemicals in a \
	blood sample. You can use it on a beaker (or other glassware) or a syringe. \
	Blood must be the only thing in the sample for it to work, else the sample will \
	be considered 'contaminated' and give no results."

/obj/item/device/scanner/mass_spectrometer/get_description_interaction()
	var/list/results = list()
	if(details)
		results += "An advanced mass spectrometer will also tell you how much of \
		a reagent was found in the blood sample."
	
	return results
	
///////////////
// CHEMISTRY MACHINERY
///////////////

/obj/machinery/centrifuge
	description_info = "A centrifuge is used to separate reagents from beakers."

/obj/machinery/chemical_dispenser
	description_info = "A chemical dispenser is used to dispense reagents into \
	beakers or other glassware."

/obj/machinery/chemical_dispenser/get_description_interaction()
	if(hacked_reagents.len)
		description_antag = "You can hack this to allow it to dispense other reagents."

/obj/machinery/chemical_dispenser/soda		//Not strictly chemistry equipment.
	description_info = "A soda dispenser is used to fill drinkware with various \
	different non-alcoholic beverages."

/obj/machinery/chemical_dispenser/beer
	description_info = "A booze dispenser is used to fill drinkware with alcoholic \
	beverages."

/obj/machinery/chem_heater
	description_info = "Chemical heaters are used to adjust the temperature of reagents \
	in a beaker. This is normally used to force them to react and create a different \
	reagent."

/obj/machinery/chem_master
	description_info = "A ChemMaster 3000 is used to analyze reagents within a beaker, \
	as well as create smaller bottles of reagent. It can also create pills."

/obj/machinery/chem_master/condimaster		//TODO: Check and see.
	description_info = null

/obj/machinery/electrolyzer
	description_info = "An electrolyzer is used to separate a compound into its \
	basic chemicals."

/obj/machinery/reagentgrinder
	description_info = "Grinders are used to grind sheets of material, such as iron \
	or phoron, into reagents."

///////////////
// CHEMISTRY ITEMS
///////////////

/obj/item/reagent_containers/syringe
	description_info = "A syringe is used to inject reagents into a patient. They \
	can also be used to draw blood."
	
	description_antag = "Syringes do not change their name based on the reagent \
	that is currently inside them. However, be careful when loading one with toxins, \
	as a victim might be able to tell something's up by the color of the reagent \
	inside the syringe."

/obj/item/reagent_containers/hypospray/autoinjector
	description_info = "An autoinjector is used to quickly inject a small amount \
	of medicine into a casualty or patient. Unlike a regular syringe, autoinjectors \
	cannot be refilled once they are used, and cannot be used to draw blood."

/obj/item/reagent_containers/pill
	description_info = "Pills are a way to administer medicines or drugs."
	
	description_antag = "Pills can be used to spike drinks or beakers with lethal \
	chemicals. If you have the Fast Fingers perk, nobody but you will know you slipped \
	a pill in; otherwise, anyone who is close will be able to see you do it."

/obj/item/reagent_containers/glass/beaker
	description_info = "Beakers, vials, and other similar glassware are used to \
	hold and mix reagents. You can drink from them, though it isn't recommended if \
	you don't know what reagents are in the beaker."

obj/item/reagent_containers/glass/bottle
	description_info = "Beakers, vials, and other similar glassware are used to \
	hold and mix reagents. You can drink from them, though it isn't recommended if \
	you don't know what reagents are in the beaker."

/obj/item/reagent_containers/glass/beaker/bowl	//Technically not a chemistry item, but here for consistency.
	description_info = null

/obj/item/reagent_containers/glass/bucket		//Also not strictly chemistry.
	description_info = "Buckets are usually used to ferry large amounts of water \
	from Point A to Point B. You can use these to water plants, put water in a mop \
	cart, or even use a mop directly in the bucket to wet a mop."

/obj/item/reagent_containers/dropper
	description_info = "Droppers are used to precisely mix reagents. You can adjust \
	how much reagent you transfer between a single unit, up to the full dropper, \
	by right-clicking it."

///////////////
// RESEARCH MACHINERY
///////////////

/obj/machinery/autolathe/rnd/protolathe
	description_info = "A protolathe is used to construct prototypes. It can be \
	operated from an R&D Console.\n\
	\n\
	A protolathe requires materials to be able to print. You can insert sheets of metal, \
	plastic, wood, etc. to get materials from that, or you can also recycle items \
	to get materials that way."

/obj/machinery/autolathe/rnd/imprinter
	description_info = "A circuit imprinter is used to create circuit boards for \
	various machinery, computers, and other things that don't fit neatly within those \
	two categories. It can be operated from an R&D Console. \n\
	\n\
	Most circuit boards require certain reagents to produce. You can remove the \
	beaker and refill it if necessary by detaching it from the imprinter's menu."


/obj/machinery/r_n_d/destructive_analyzer
	description_info = "A destructive analyzer can be used to break down items inserted \
	into them and analyze them for their research value. More valuable items will \
	generally yield higher research values, and higher research values are needed \
	to be able to produce better items and components. It can be operated from an \
	R&D Console."

/obj/machinery/autolathe/mechfab
	description_info = "An exosuit fabricator is used to create robotic parts for \
	cyborgs, mechs, and prosthetics. It functions similarly to an autolathe, but \
	you'll want to sync it with the R&D Console, as increased research levels may \
	yield newer and better designs."

/obj/machinery/bioprinter		//Here because it's in Research Surgery.
	description_info = "A bioprinter is used to create replacement or prosthetic \
	organs out of biomass. To create a replacement organ, you will need to inject \
	a blood sample so the organ is not immediately rejected."

///////////////
// RESEARCH ITEMS
///////////////

/obj/item/device/science_tool
	description_info = "A science tool is used to get data from autopsy reports \
	and artifacts, as well as check what research value an item has."

/obj/item/stock_parts
	description_info = "Stock parts (in general) are used in machinery to allow them \
	to perform their various tasks. Different 'tiers' of stock part exist, and a \
	higher 'tier' of part will generally allow machinery to perform its job better. \
	Exactly what effect a 'tier' will have, however, depends on the machine itself."

