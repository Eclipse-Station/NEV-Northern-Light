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
	
	if(premium)
		results += "This machine in particular also has premium items available. \
		To show or dispense premium items, insert a coin."
