/* BEGIN FILE SUMMARY
 *
 * Glow code for the sign pointing to the evac pods, to allow better low-light
 * recognition. ^Spitzer
 */		//END FILE SUMMARY

#define COLOR_TRITIUM_GLOW "#99FF33"

/obj/structure/sign/directions/evac
	icon = 'zzz_modular_eclipse/evac_sign/evacsign_eclipse.dmi'		//I want to use my file so I don't have to do fancy bollocks later.
	icon_state = "direction_evac"		//Same as it ever was.
	var/glow_alpha = 200

/obj/structure/sign/directions/evac/New()
	..()
	spawn(5)		//don't update icons immediately
		update_icon()
	

/obj/structure/sign/directions/evac/update_icon()
//Necessary for the overlay to actually glow. 
//First, switch it to the lighting plane so we can get the glowy bits.
	set_plane(ABOVE_LIGHTING_PLANE)
	
//store that real fast, that's the one we want...
	var/glowplane = plane

//and revert it back to how it was before.
	set_plane(initial(plane))
	
//now we actually do the lighting magic!
	var/image/overlay = image(icon, "evac_glow")
	overlay.plane = glowplane
	overlay.layer = ABOVE_LIGHTING_LAYER
	overlay.alpha = glow_alpha
	overlays.Cut()		//clear out any overlays we may have
	overlays += overlay		//and apply the overlay.

	set_light(1, 0.5, COLOR_TRITIUM_GLOW)

	. = ..()	//And we go back to how things were.
	
#undef COLOR_TRITIUM_GLOW