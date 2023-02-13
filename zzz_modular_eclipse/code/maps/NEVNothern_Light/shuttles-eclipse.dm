//New Shuttle to transport people back and forth from the "Centcom Command Vessel"
/datum/shuttle/autodock/multi/antag/centcom
	name = "Centcom Transport Shuttle"
	warmup_time = 0
	move_time = 180
	cloaked = 0
	destination_tags = list(
		"nav_centcom_start",
		"nav_centcom_dock",
		)
	shuttle_area =  /area/shuttle/transport1/centcom
	dock_target = "centcom_shuttle"
	current_location = "nav_centcom_start"
	landmark_transition = "nav_centcom_transition"
	announcer = "NEV Northern Light Sensor Array"
	home_waypoint = "nav_centcom_start"
	arrival_message = "Attention, unidentified vessel detected on long range sensors. \nVessel is approaching on an intercept course. \nHailing frequencies open."
	departure_message = "Attention, unknown vessel has departed"


/obj/effect/shuttle_landmark/centcom/start
	name = "Centcom Shuttle Start"
	icon_state = "shuttle-blue"
	landmark_tag = "nav_centcom_start"
	docking_controller = "centcom_shuttle_dock"

/obj/effect/shuttle_landmark/centcom/internim
	name = "In transit"
	icon_state = "shuttle-blue"
	landmark_tag = "nav_centcom_transition"

/obj/effect/shuttle_landmark/centcom/dock
	name = "Northern Light Docking Port Deck 4"
	icon_state = "shuttle-blue"
	landmark_tag = "nav_centcom_dock"
	dock_target = "second_sec_1_access_console"

//Shuttle Controller
/obj/machinery/computer/shuttle_control/multi/centcom
	name = "Centcom Shuttle Control"
	req_access = list(access_cent_general)
	shuttle_tag = "centcom"