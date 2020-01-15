/obj/item/weapon/circuitboard/recharge_station
	name = T_BOARD("cyborg recharging station")
	build_path = /obj/machinery/recharge_station
	board_type = "machine"
	origin_tech = list(TECH_DATA = 3, TECH_ENGINEERING = 3, TECH_POWER = 3)
	req_components = list(
		/obj/item/stack/cable_coil = 5,
		/obj/item/weapon/stock_parts/capacitor = 2,
		/obj/item/weapon/stock_parts/manipulator = 2,
		/obj/item/weapon/cell/large = 1
	)
