//Machinery not-otherwise-listed - things like vendors.

//Vending machines
/obj/machinery/vending
	description_info = "Vending machines allow you to purchase and acquire equipment \
	that sometimes can't be found elsewhere. To use a vending machine, select the \
	product you wish to purchase. If the product isn't free, swipe your ID card, \
	a charge card, or insert cash to pay for it. If you cannot afford the product, \
	you'll receive a non-sufficient funds error, and your product will not be charged."

	description_antag = "Vending machines can be hacked to enable you to purchase \
	contraband. You can also electrify the machine, or make it shoot coins at people \
	by hacking it."

/obj/machinery/vending/get_description_interaction()
	var/list/results = list()
	
	if(premium.len)
		results += "This machine in particular also has premium items available. \
		To show or dispense premium items, insert a coin."
	
	return results

//autolathes
/obj/machinery/autolathe
	description_info = "Autolathes are used to create items and weapons from designs \
	stored on disks. Some designs are licensed, and some disks have a finite number \
	of license points, so you cannot infinitely print everything.\n\
	\n\
	Autolathes require materials to be able to print. You can insert sheets of metal, \
	plastic, wood, etc. to get materials from that, or you can also recycle items \
	to get materials that way.\n\
	\n\
	You can press 'Compress Matter' to compress all the materials in the autolathe \
	to create charges for a Rapid Construction Device. Be warned, however, that this \
	process is one-way, and once you do it, you can't get the materials back!"

/obj/machinery/autolathe/nanoforge
	description_info = "Autolathes are used to create items and weapons from designs \
	stored on disks. Some designs are licensed, and some disks have a finite number \
	of license points, so you cannot infinitely print everything.\n\
	\n\
	Autolathes require materials to be able to print. You can insert sheets of metal, \
	plastic, wood, etc. to get materials from that, or you can also recycle items \
	to get materials that way.\n\
	\n\
	You can press 'Compress Matter' to compress all the materials in the autolathe \
	to create charges for a Rapid Construction Device. Be warned, however, that this \
	process is one-way, and once you do it, you can't get the materials back!\n\
	\n\
	A nanoforge is a special type of autolathe that is capable of perfectly recreating \
	designs on disks. However, it requires an oddity to function."

//jukebox
/obj/machinery/media/jukebox
	description_info = "A jukebox is used to play music. What music it contains is \
	entirely up to the server operator. \n\
	\n\
	If you wish, you can also load a music tape into a jukebox and have it play \
	from that."

//cyborg charger
/obj/machinery/recharge_station
	description_info = "A recharge station is used to recharge cyborgs or drones. \
	It uses an internal cell for the charging circuits, and recharges the cell over \
	time, to avoid excess power consumption. You can tell how charged the internal \
	battery is by looking at the charge meter above the hatch."

//Mech recharger
/obj/machinery/mech_recharger
	description_info = "A mech charger is an in-floor charging station that is \
	used to recharge the internal battery of a mech. To recharge a mech, simply \
	park the mech on the charging station. To stop charging a mech, move it off \
	of the charging pad."

//cryopods and child objects thereof
/obj/machinery/cryopod
	description_info = "Cryo pods (not to be confused with the medical cryo cells) \
	and robotic storage units are used to leave the round. Click-and-drag your \
	character inside to enter it."

//floodlights
/obj/machinery/floodlight
	description_info = "An emergency floodlight is a battery-operated floodlight \
	designed to illuminate a large area. To toggle the light off and on, click on \
	it with an empty hand. \n\
	\n\
	Floodlights are operated by a size-L power cell; they do not draw power from \
	the room. To remove the power cell, click on the floodlight with a screwdriver \
	to open the battery cover, then click on it with your hand to remove the cell. \
	To replace the power cell, use a power cell on it while the battery cover is open."
