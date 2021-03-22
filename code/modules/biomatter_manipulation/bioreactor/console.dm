//Bioreactor console
//In fact, this is not a console. Just metrics screen


/obj/machinery/multistructure/bioreactor_part/console
	name = "bioreactor metrics"
	icon_state = "screen"
	layer = ABOVE_MOB_LAYER + 0.1
	idle_power_usage = 350

/obj/machinery/multistructure/bioreactor_part/console/Initialize()
	. = ..()
	set_light(1, 2, COLOR_LIGHTING_BLUE_MACHINERY)


/obj/machinery/multistructure/bioreactor_part/console/attack_hand(mob/user as mob)
	if(check_MS())
		ui_interact(user)


/obj/machinery/multistructure/bioreactor_part/console/ui_data()
	var/list/data = list()
	if(MS_bioreactor.is_operational())
		if(MS_bioreactor.chamber_solution)
			//operational
			data["status"] = 1
		else
			//solution required
			data["status"] = 2
	else
		if(MS_bioreactor.chamber_breached)
			//breach
			data["status"] = 3
		else if(!MS_bioreactor.chamber_closed)
			//chamber opened
			data["status"] = 4
		else if(MS_bioreactor.biotank_platform.pipes_opened)
			//tank at to-port position
			data["status"] = 5
		else if(!MS_bioreactor.biotank_platform.pipes_cleanness)
			//pipes issue
			data["status"] = 6
		else
			//non operational
			data["status"] = 0

	data["biotank_occupancy"] = MS_bioreactor.biotank_platform.biotank.reagents.total_volume || 0
	data["biotank_max_capacity"] = MS_bioreactor.biotank_platform.biotank.max_capacity
	data["biotank_status"] = MS_bioreactor.biotank_platform.pipes_opened
	data["pipes_condition"] = MS_bioreactor.biotank_platform.pipes_cleanness
	if(MS_bioreactor.biotank_platform.biotank.canister)
		data["canister"] = MS_bioreactor.biotank_platform.biotank.canister.name
	else
		data["canister"] = null

	return data


/obj/machinery/multistructure/bioreactor_part/console/ui_interact(mob/user, ui_key = "main", datum/nanoui/ui = null, force_open = NANOUI_FOCUS, datum/topic_state/state = GLOB.default_state)
	var/list/data = ui_data()

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "bioreactor.tmpl", src.name, 410, 500, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/multistructure/bioreactor_part/console/CanUseTopic(var/mob/user)
	if(issilicon(user) && !Adjacent(user))
		return STATUS_UPDATE
	return ..()

/obj/machinery/multistructure/bioreactor_part/console/Topic(href, href_list)
	if(..())
		return 1

	if(href_list["pump_solution"])


		if(!MS_bioreactor.chamber_closed)
			visible_message(SPAN_DANGER("[src] states, 'Unable to engage solution pumps - chamber doors open.'"))
			playsound(src, 'sound/machines/buzz-two.ogg', 100, 1)
			return 1

		MS_bioreactor.pump_solution()
		visible_message(SPAN_NOTICE("[src] states, 'Solution pumps engaged. Solution pumping [MS_bioreactor.chamber_solution ? "in" : "out"].'"))
		playsound(src, 'sound/machines/synth_yes.ogg', 100, 1)
		. = 1

	if(href_list["toggle_chamber_doors"])

		if(MS_bioreactor.chamber_solution)
			visible_message(SPAN_DANGER("[src] states, 'Unable to open doors - solution detected in chamber.'"))
			playsound(src, 'sound/machines/buzz-two.ogg', 100, 1)
			return 1

		MS_bioreactor.toggle_platform_door()
		visible_message(SPAN_NOTICE("[src] states, 'Chamber doors now [MS_bioreactor.chamber_closed ? "closed" : "opened"].'"))
		playsound(src, 'sound/machines/synth_yes.ogg', 100, 1)
		. = 1

	ui_interact(usr)