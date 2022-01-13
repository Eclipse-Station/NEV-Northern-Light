/*
	This map in intended to run with both this and Eris area files enabled.
	It's like this because of downstream nature of a codebase Erida was meant for.
*/

/area/erida
	ship_area = TRUE
	icon_state = "erisyellow"




/area/erida/hallway
	sound_env = LARGE_ENCLOSED
	icon_state = "erisgreen"
	holomap_color = HOLOMAP_AREACOLOR_HALLWAYS

/area/erida/hallway/side/docks
	name = "Docking Subsection Hallway"
	icon_state = "hallway3"




/area/erida/neotheology
	icon_state = "erisgreen"
	area_light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT
	holomap_color = HOLOMAP_AREACOLOR_CHURCH

/area/erida/neotheology/generator
	name = "Church Generator Room"
	icon_state = "erisgreen"



/area/erida/maintenance
	is_maintenance = TRUE
	flags = AREA_FLAG_RAD_SHIELDED
	sound_env = TUNNEL_ENCLOSED
	turf_initializer = new /datum/turf_initializer/maintenance()
	forced_ambience = list('sound/ambience/maintambience1.ogg','sound/ambience/maintambience2.ogg','sound/ambience/maintambience3.ogg','sound/ambience/maintambience4.ogg','sound/ambience/maintambience5.ogg','sound/ambience/maintambience6.ogg')
	area_light_color = COLOR_LIGHTING_MAINT_DARK

/area/erida/maintenance/medicalward
	name = "Closed Medical Ward"
	icon_state = "erisyellow"

/area/erida/maintenance/sciweapondeck
	name = "Science Weapon Deck"
	icon_state = "erisyellow"

/area/erida/maintenance/portsection2deck1
	name = "Port Section Deck 1 Maintenance"
	icon_state = "section2deck1port"

/area/erida/maintenance/starboardsection2deck1
	name = "Starboard Section Deck 1 Port Maintenance"
	icon_state = "section2deck1starboard"

/area/erida/maintenance/portsection2deck2
	name = "Port Section Deck 2 Maintenance"
	icon_state = "section2deck2port"

/area/erida/maintenance/starboardsection2deck2
	name = "Starboard Section Deck 2 Port Maintenance"
	icon_state = "section2deck2starboard"

/area/erida/maintenance/portsection2deck3
	name = "Port Section Deck 3 Maintenance"
	icon_state = "section2deck3port"

/area/erida/maintenance/starboardsection2deck3
	name = "Starboard Section Deck 3 Port Maintenance"
	icon_state = "section2deck3starboard"

/area/erida/maintenance/portsection2deck4
	name = "Port Section Deck 4 Maintenance"
	icon_state = "section2deck4port"

/area/erida/maintenance/starboardsection2deck4
	name = "Starboard Section Deck 4 Port Maintenance"
	icon_state = "section2deck4starboard"

/area/erida/maintenance/substation
	name = "Substation"
	icon_state = "substation"
	sound_env = SMALL_ENCLOSED
	forced_ambience = list('sound/ambience/maintambience.ogg')

/area/erida/maintenance/substation/port_section
	name = "Port Section Substation"

/area/erida/maintenance/substation/starboard_section
	name = "Starboard Section Substation"

/area/erida/maintenance/substation/docking_section
	name = "Docking Section Substation"

/area/erida/maintenance/substation/civilian_section
	name = "Civilian Section Substation"
