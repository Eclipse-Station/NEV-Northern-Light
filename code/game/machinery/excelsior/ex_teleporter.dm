var/list/global/excelsior_teleporters = list() //This list is used to make turrets more efficient

/obj/machinery/complant_teleporter
	name = "excelsior long-range teleporter"
	desc = "A powerful teleporter that allows shipping matter in and out. Takes a long time to charge."
	density = TRUE
	anchored = TRUE
	icon = 'icons/obj/machines/excelsior/teleporter.dmi'
	icon_state = "idle"
	use_power = IDLE_POWER_USE
	idle_power_usage = 40
	active_power_usage = 15000
	circuit = /obj/item/weapon/circuitboard/excelsior_teleporter

	var/energy = 0
	var/max_energy = 1000
	var/energy_gain = 1
	var/processing_order = FALSE

<<<<<<< HEAD
	var/list/buy_list = list(
		MATERIAL_STEEL = list("amount" = 30, "price" = 50),
		MATERIAL_WOOD = list("amount" = 30, "price" = 50),
		MATERIAL_PLASTIC = list("amount" = 30, "price" = 50),
		MATERIAL_GLASS = list("amount" = 30, "price" = 50),
		MATERIAL_PLASTEEL = list("amount" = 10, "price" = 200),
		MATERIAL_SILVER = list("amount" = 10, "price" = 100),
		MATERIAL_GOLD = list("amount" = 10, "price" = 200),
		MATERIAL_URANIUM = list("amount" = 10, "price" = 300),
		MATERIAL_DIAMOND = list("amount" = 10, "price" = 400),
=======
	var/list/nanoui_data = list()			// Additional data for NanoUI use
	var/list/materials_list = list(
		MATERIAL_STEEL = list("amount" = 30, "price" = 50), //base prices doubled untill new item are in
		MATERIAL_WOOD = list("amount" = 30, "price" = 50),
		MATERIAL_PLASTIC = list("amount" = 30, "price" = 50),
		MATERIAL_GLASS = list("amount" = 30, "price" = 50),
		MATERIAL_SILVER = list("amount" = 10, "price" = 100),
		MATERIAL_PLASTEEL = list("amount" = 10, "price" = 200),
		MATERIAL_GOLD = list("amount" = 10, "price" = 200),
		MATERIAL_URANIUM = list("amount" = 10, "price" = 300),
		MATERIAL_DIAMOND = list("amount" = 10, "price" = 400)
		)

	var/list/parts_list = list(
		/obj/item/weapon/stock_parts/console_screen = 50,
		/obj/item/weapon/stock_parts/capacitor = 100,
		/obj/item/weapon/stock_parts/scanning_module = 100,
		/obj/item/weapon/stock_parts/manipulator = 100,
		/obj/item/weapon/stock_parts/micro_laser = 100,
		/obj/item/weapon/stock_parts/matter_bin = 100,
		/obj/item/weapon/stock_parts/capacitor/excelsior = 350,
		/obj/item/weapon/stock_parts/scanning_module/excelsior = 350,
		/obj/item/weapon/stock_parts/manipulator/excelsior = 350,
		/obj/item/weapon/stock_parts/micro_laser/excelsior = 350,
		/obj/item/weapon/stock_parts/matter_bin/excelsior = 350,
		/obj/item/clothing/under/excelsior = 100,
		/obj/item/weapon/circuitboard/excelsior_teleporter = 500,
		/obj/item/weapon/circuitboard/excelsiorautolathe = 150,
		/obj/item/weapon/circuitboard/excelsiorreconstructor = 150,
		/obj/item/weapon/circuitboard/excelsior_turret = 150,
		/obj/item/weapon/circuitboard/excelsiorshieldwallgen = 150,
		/obj/item/weapon/circuitboard/excelsior_boombox = 150,
		/obj/item/weapon/circuitboard/diesel = 150
>>>>>>> 6644dd9... Excel rework part 2 - Items (#4977)
		)

/obj/machinery/complant_teleporter/Initialize()
	excelsior_teleporters |= src
	.=..()

/obj/machinery/complant_teleporter/Destroy()
	excelsior_teleporters -= src
	.=..()

/obj/machinery/complant_teleporter/RefreshParts()
	var/man_rating = 0
	var/man_amount = 0
	for(var/obj/item/weapon/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
		man_amount++

	// +50% speed for each upgrade tier
	var/coef = 1 + (((man_rating / man_amount) - 1) / 2)

	energy_gain = initial(energy_gain) * coef
	active_power_usage = initial(active_power_usage) * coef

	var/obj/item/weapon/cell/C = locate() in component_parts
	if(C)
		max_energy = C.maxcharge / 10
		energy = min(energy, max_energy)
		if(C.autorecharging)
			energy_gain *= 2

/obj/machinery/complant_teleporter/update_icon()
	overlays.Cut()

	if(panel_open)
		overlays += image("panel")

	if(stat & (BROKEN|NOPOWER))
		icon_state = "off"
	else
		icon_state = initial(icon_state)


/obj/machinery/complant_teleporter/attackby(obj/item/I, mob/user)
	if(default_deconstruction(I, user))
		return
	..()

/obj/machinery/complant_teleporter/power_change()
	..()
	SSnano.update_uis(src) // update all UIs attached to src

/obj/machinery/complant_teleporter/Process()
	if(stat & (BROKEN|NOPOWER))
		return

	if(energy < max_energy)
		energy = min(energy + energy_gain, max_energy)
		SSnano.update_uis(src)
		use_power = ACTIVE_POWER_USE
	else
		use_power = IDLE_POWER_USE

/obj/machinery/complant_teleporter/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return


 /**
  * The ui_interact proc is used to open and update Nano UIs
  * If ui_interact is not used then the UI will not update correctly
  * ui_interact is currently defined for /atom/movable
  *
  * @param user /mob The mob who is interacting with this ui
  * @param ui_key string A string key to use for this ui. Allows for multiple unique uis on one obj/mob (defaut value "main")
  *
  * @return nothing
  */
/obj/machinery/complant_teleporter/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS)
	if(stat & (BROKEN|NOPOWER)) return
	if(user.stat || user.restrained()) return

	var/list/data = ui_data()

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "excelsior_teleporter.tmpl", name, 390, 450)
		ui.set_initial_data(data)
		ui.open()

/obj/machinery/complant_teleporter/ui_data()
	var/list/data = list()
	data["energy"] = round(energy)
	data["maxEnergy"] = round(max_energy)

	var/list/order_list_m = list()
	for(var/item in materials_list)
		order_list_m += list(
			list(
				"title" = material_display_name(item),
				"amount" = materials_list[item]["amount"],
				"price" = materials_list[item]["price"],
				"commands" = list("order" = item)
				)
			) // list in a list because Byond merges the first list...

	data["materials_list"] = order_list_m
	
	var/list/order_list_p = list()
	for(var/item in parts_list)
		var/obj/item/I = item
		order_list_p += list(
			list(
				"name_p" = initial(I.name),
				"price_p" = parts_list[item],
				"commands_p" = list("order_p" = item)
			)
		)

	data["list_of_parts"] = order_list_p

	return data


/obj/machinery/complant_teleporter/Topic(href, href_list)
	if(stat & (NOPOWER|BROKEN))
		return 0 // don't update UIs attached to this object

	if(processing_order)
		return 0

	if(href_list["order"])
		var/ordered_item = href_list["order"]
<<<<<<< HEAD
		if (buy_list.Find(ordered_item))
			var/order_energy_cost = buy_list[ordered_item]["price"]
			if(order_energy_cost > energy)
				to_chat(usr, SPAN_WARNING("Not enough energy."))
				return 0

			processing_order = TRUE
			energy = max(energy - order_energy_cost, 0)

=======
		if (materials_list.Find(ordered_item))
			var/order_energy_cost = materials_list[ordered_item]["price"]
>>>>>>> 6644dd9... Excel rework part 2 - Items (#4977)
			var/order_path = material_stack_type(ordered_item)
			var/order_amount = materials_list[ordered_item]["amount"]
			send_order(order_path, order_energy_cost, order_amount)

	if(href_list["order_p"])
		var/ordered_item = text2path(href_list["order_p"])
		if (parts_list.Find(ordered_item))
			var/order_energy_cost = parts_list[ordered_item]
			send_order(ordered_item, order_energy_cost, 1)

	add_fingerprint(usr)
	return 1 // update UIs attached to this object

<<<<<<< HEAD
=======

/obj/machinery/complant_teleporter/proc/update_nano_data()
	nanoui_data["menu"] = nanoui_menu
	if (nanoui_menu == 1)
		var/list/available_mandates = list()
		var/list/completed_mandates = list()
		for(var/datum/antag_contract/M in GLOB.excel_antag_contracts)
			var/list/entry = list(list(
				"name" = M.name,
				"desc" = M.desc,
				"reward" = M.reward,
				"status" = M.completed ? "Fulfilled" : "Available"
			))
			if(!M.completed)
				available_mandates.Add(entry)
			else
				completed_mandates.Add(entry)
		nanoui_data["available_mandates"] = available_mandates
		nanoui_data["completed_mandates"] = completed_mandates

/obj/machinery/complant_teleporter/proc/send_order(order_path, order_cost, amount)
	if(order_cost > excelsior_energy)
		to_chat(usr, SPAN_WARNING("Not enough energy."))
		return 0

	processing_order = TRUE
	excelsior_energy = max(excelsior_energy - order_cost, 0)
	flick("teleporting", src)
	spawn(17)
		complete_order(order_path, amount)

>>>>>>> 6644dd9... Excel rework part 2 - Items (#4977)
/obj/machinery/complant_teleporter/proc/complete_order(order_path, amount)
	use_power(active_power_usage * 3)
	new order_path(loc, amount)
	processing_order = FALSE

/obj/machinery/complant_teleporter/attack_hand(mob/user)
	if(stat & BROKEN)
		return
	ui_interact(user)
