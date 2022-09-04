/mob/living/simple_animal/vermin
	name = "pile of viscera"
	desc = "A non-descript amalgamation of guts"
	icon = 'icons/mob/biocraps.dmi'
	icon_state = "flesh"
	faction = "mimic"
	response_help  = "touches"
	response_disarm = "pushes aside"
	response_harm   = "hits"
	wander = FALSE
	canmove = FALSE
	density = TRUE
	a_intent = I_HURT
	anchored = TRUE
	hunger_enabled = 0

	var/power_nutrition = 0
	var/origin_entity

	var/forbidden_machinery_types = list(/obj/machinery/alarm,
	/obj/machinery/atmospherics,
	/obj/machinery/light,
	/obj/machinery/door,
	/obj/machinery/firealarm,
	/obj/machinery/camera,
	/obj/machinery/holoposter,
	/obj/machinery/ai_status_display,
	/obj/machinery/power,
	/obj/machinery/requests_console,
	/obj/machinery/button,
	/obj/machinery/computer/cryopod,
	/obj/machinery/multistructure,
	/obj/machinery/holomap,
	/obj/machinery/neotheology/clone_vat
	)

	var/forbidden_structure_types = list(/obj/structure/cable,
	/obj/structure/disposalpipe,
	/obj/structure/low_wall,
	/obj/structure/sign,
	/obj/structure/catwalk,
	/obj/structure/window,
	/obj/structure/railing,
	/obj/structure/extinguisher_cabinet,
	/obj/structure/girder,
	/obj/structure/multiz/stairs,
	/obj/structure/burrow,
	/obj/structure/cyberplant,
	/obj/structure/multiz,
	/obj/structure/table,
	/obj/structure/closet/wall_mounted,
	/obj/structure/lattice
	)

	var/list/death_sounds = list("sound/effects/vermin/vermin1.ogg",
	"sound/effects/vermin/vermin2.ogg",
	"sound/effects/vermin/vermin3.ogg",
	"sound/effects/vermin/vermin4.ogg"
	)


/mob/living/simple_animal/vermin/New()
	..()
	var/turf/T = get_turf(src)
	var/list/eligible_appearances = list()
	for(var/obj/machinery/M in range(7, T))
		if (!is_allowed_appearance(M))
		 continue
		else
			eligible_appearances += M

	for(var/obj/structure/S in range(7, T))
		if (!is_allowed_appearance(S))
			continue
		else
			eligible_appearances += S

	if(length(eligible_appearances))
		var/obj/origin = pick(eligible_appearances)
		origin_entity = origin.name
		assume_appearance(origin)
	else
		gib()



/mob/living/simple_animal/vermin/Life()
	.=..()

	var/area/A = get_area(src)
	if(A)
		if(A.powered(STATIC_ENVIRON))
			A.use_power(850, STATIC_ENVIRON)
			power_nutrition++

	if (power_nutrition > 75)
		spawn_vermin(src)




/mob/living/simple_animal/vermin/death()
	overlays.Cut()
	visible_message("<b>[src]</b> splatters!")
	playsound(loc, pick(death_sounds), 100, 0)
	..()
	new /obj/effect/gibspawner/generic(src.loc)
	qdel(src)
	return

/mob/living/simple_animal/vermin/proc/assume_appearance(obj/O)
	name = O.name
	desc = O.desc
	icon = O.icon
	icon_state = O.icon_state
	for(var/overlay in O.overlays)
		overlays += overlay


/mob/living/simple_animal/vermin/proc/is_allowed_appearance(obj/target)
	if(istype(target, /obj/machinery))
		for(var/entry in forbidden_machinery_types)
			if(istype(target, entry))
				return FALSE
	else
		for(var/entry in forbidden_structure_types)
			if(istype(target, entry))
				return FALSE

	if(target.name == "" || !target.name)
		return FALSE


	return TRUE

/mob/living/simple_animal/vermin/proc/spawn_vermin(mob/parent)
	var/list/turfs = cardinal_turfs(src)
	for (var/t in turfs)
		var/turf/T = t
		var/turf/U = get_connecting_turf(T, loc)//This handles Zlevel stuff
		//If the target turf connects to another across Zlevels, U will hold the destination
		var/mob/living/simple_animal/vermin/B = (locate(/mob/living/simple_animal/vermin) in U)
		//We check for existing vermin in the destination
		if (B)
			continue
		else
			if(istype(T, /turf/unsimulated/) || istype(T, /turf/space) || (istype(T, /turf/simulated/mineral) && T.density))
				continue
			if(istype(T, /turf/simulated/wall))//slowly chip away
				var/turf/simulated/wall/SW = T
				SW.take_damage(rand(0,3))
				power_nutrition = power_nutrition - 5
				return
			var/obj/structure/girder/G = locate() in T
			if(G)
				G.take_damage(100)
				power_nutrition = power_nutrition - 5
				return
			var/obj/structure/window/W = locate() in T
			if(W)
				W.take_damage(rand(0,7)) //Reinforced windows have 6 resistance so this will rarely damage them
				power_nutrition = power_nutrition - 5
				return
			var/obj/structure/grille/GR = locate() in T
			if(GR)
				qdel(GR)
				power_nutrition = power_nutrition - 5
				return

			for(var/obj/machinery/door/D in T)
				if(D.density)
					D.take_damage(15)
					//Vermin eat through doors
					return
			var/obj/structure/S = locate() in T
			var/obj/machinery/M = locate() in T
			if(S?.density == FALSE)
				S = null
			if(M?.density == FALSE)
				M = null

			if (S == null && M == null)
				T.Enter(src) //This should make them travel down stairs
				var/mob/living/simple_animal/vermin/child = new /mob/living/simple_animal/vermin(T)
				var/datum/effect/effect/system/smoke_spread/smoke = new /datum/effect/effect/system/smoke_spread()
				smoke.set_up(1, 0, T)
				smoke.attach(child)
				smoke.start()


				return

	power_nutrition = power_nutrition - 75

/mob/living/simple_animal/vermin/attackby(var/obj/item/O as obj)
	. = ..()
	if(QUALITY_HAMMERING in O.tool_qualities)
		death()
