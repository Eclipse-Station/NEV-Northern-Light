/obj/spawner/traps
	name = "random trap"
	icon_state = "trap-red"
	alpha = 128
	tags_to_spawn = list(SPAWN_TRAP_ARMED)
<<<<<<< HEAD
=======
	check_density = FALSE
>>>>>>> e41367c... Loot rework part 2. (#5664)

/obj/spawner/traps/item_to_spawn()
	.=..()
	var/list/possible_traps = valid_candidates()
	//Check that its possible to spawn the chosen trap at this location
	while (possible_traps.len)
		var/trap = pick_spawn(possible_traps)
		if (can_spawn_trap(loc, trap))
			return trap
		else
			possible_traps -= trap

/obj/spawner/traps/low_chance
	icon_state = "trap-red-low"
	spawn_nothing_percentage = 75

/obj/spawner/traps/wire_splicing
	name = "wire splicing"
	icon_state = "trap-orange"
	alpha = 128
	tags_to_spawn = list(SPAWN_TRAP_WIRE)

/obj/spawner/traps/wire_splicing/low_chance
	name = "low chance wire splicing"
	icon_state = "trap-orange-low"
	spawn_nothing_percentage = 70


//Checks if a trap can spawn in this location
/proc/can_spawn_trap(turf/T, trap)
	.=TRUE
	if(ispath(trap, /obj/structure/wire_splicing))
		if (locate(/obj/structure/cable) in dview(3, T))
			return TRUE
		return FALSE
<<<<<<< HEAD
=======

/obj/spawner/traps/find_smart_point(path)
	var/list/spawn_points = ..()
	if(!spawn_points.len)
		return spawn_points
	var/list/trap_points = list()
	for(var/turf/T in spawn_points)
		if(can_spawn_trap(T, path))
			trap_points += T
	return trap_points

/obj/spawner/traps/update_tags()
	..()
	tags_to_spawn = biome.trap_tags

/obj/spawner/traps/update_biome_vars()
	tags_to_spawn = biome.trap_tags
	biome.spawner_trap_count++
	latejoin = TRUE
	var/count = biome.spawner_trap_count
	min_amount = max(1, biome.min_traps_amount / count)
	max_amount = min(biome.max_traps_amount, max(3, biome.max_traps_amount / count))
	if(use_biome_range)
		spread_range = biome.range
		loc = biome.loc
>>>>>>> e41367c... Loot rework part 2. (#5664)
