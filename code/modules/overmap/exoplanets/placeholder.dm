#define SKILL_SCIENCE 1
#define SKILL_EXPERT  1
#define SKILL_ADEPT   1
#define SKILL_BASIC   1
var/list/exoplanet_map_data = list()

/atom/proc/skill_check()
	return

/datum/map_template/ruin/exoplanet



/proc/overlay_image(icon,icon_state,color,flags)
	var/image/ret = image(icon,icon_state)
	ret.color = color
	ret.appearance_flags = flags
	return ret

/obj/map_data/exoplanet
	name = "Exoplanet Map Data"
	is_player_level = TRUE
	is_contact_level = TRUE
	is_accessable_level = TRUE
	is_sealed = TRUE
	height = 1


/obj/map_data/exoplanet/New()
	var/obj/map_data/exoplanet/E = src
	exoplanet_map_data += E
	name = "Exoplanet Map Data [exoplanet_map_data.len]"
	..()