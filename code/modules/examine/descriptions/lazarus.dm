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