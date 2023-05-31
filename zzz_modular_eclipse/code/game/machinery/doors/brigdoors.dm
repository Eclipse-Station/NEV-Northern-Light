//Custom Brigdoors accessible by different departments

/obj/machinery/door_timer/lazarus
	name = "Lazarus Isolation Timer"
	req_access = list(access_moebius)
	advanced_access = list(access_cmo)

/obj/machinery/door_timer/engineering
	name = "Engineering Brig Timer"
	req_access = list(access_engine)
	advanced_access = list(access_engine_equip)
