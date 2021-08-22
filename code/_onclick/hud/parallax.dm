GLOBAL_VAR_INIT(random_parallax, pick("space0", "space1", "space2", "space3", "space4", "space5", "space6"))

/obj/parallax_screen
	icon = 'icons/parallax.dmi'

/obj/parallax_screen/New()
	icon_state = GLOB.random_parallax

/obj/parallax
	name = "parallax"
	mouse_opacity = 0
	blend_mode = BLEND_MULTIPLY
	plane = PLANE_SPACE_PARALLAX
//	invisibility = 101
	anchored = TRUE
	var/mob/owner
	var/obj/parallax_screen/parallax_screen
	var/list/layers = list()

/obj/parallax/New(mob/M)
	owner = M
	owner.parallax = src
	parallax_screen = new /obj/parallax_screen
	parallax_screen.plane = plane
	add_overlays(parallax_screen)
	update()
	..(null)

/obj/parallax/proc/update() //This proc updates your parallax (duh). If your view has been altered by binoculars, admin fuckery, and so on. We need to make the space bigger by applying a matrix transform to it. This is hardcoded for now.
	if(!owner || !owner.client)
		return
	cut_overlays()
	var/turf/T = get_turf(owner.client.eye)
	screen_loc = "CENTER:[-224-(T&&T.x)],CENTER:[-224-(T&&T.y)]"
	var/view = owner.client.view
	var/matrix/M = matrix() //create matrix for transformation
	var/scalie = owner.client.view ? 1 + (owner.client.view-8)*0.2 : 1
	M.Scale(scalie)
	src.transform = M
	overlays  += parallax_screen

/obj/parallax/update_plane()
	return

/obj/parallax/set_plane(var/np)
	plane = np


/mob
	var/obj/parallax/parallax

/mob/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	. = ..()
	if(. && parallax)
		parallax.update()

/mob/forceMove(atom/destination, var/special_event, glide_size_override=0)
	. = ..()
	if(. && parallax)
		parallax.update()


/mob/Login()
	if(!parallax)
		parallax = new(src)
	client.screen += parallax
	..()
