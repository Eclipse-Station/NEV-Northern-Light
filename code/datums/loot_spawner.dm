/datum/loot_spawner_data
<<<<<<< HEAD
	var/list/all_spawn_bad_paths = list()
	var/list/all_spawn_blacklist = list()
=======
	//var/list/all_spawn_bad_paths = list()//hard
	//var/list/all_spawn_blacklist = list()//soft
>>>>>>> 4b88393... loot rework update. (#5604)
	//var/list/all_spawn_by_price = list()
	var/list/all_spawn_price_by_path = list()
	//var/list/all_spawn_by_frequency = list()
	var/list/all_spawn_frequency_by_path = list()
	//var/list/all_spawn_by_rarity = list()
	var/list/all_spawn_rarity_by_path = list()
	var/list/all_spawn_by_tag = list()
	var/list/all_spawn_accompanying_obj_by_path = list()

/datum/loot_spawner_data/New()
	var/list/paths = list()

	//spawn vars
	var/price
	var/rarity
	var/frequency
<<<<<<< HEAD
	var/blacklisted
	var/list/spawn_tags = list()
	var/list/accompanying_objs = list()
	var/list/bad_paths = list()
=======
	//var/blacklisted
	//var/list/bad_paths = list()
	var/list/spawn_tags = list()
	var/list/accompanying_objs = list()
	var/generate_files = config.generate_loot_data
	var/file_dir = "strings/loot_data"
	var/source_dir = file("[file_dir]/")
	var/loot_data = file("[file_dir]/all_spawn_data.txt")
	var/loot_data_paths = file("[file_dir]/all_spawn_paths.txt")
	var/hard_blacklist_data = file("[file_dir]/hard_blacklist.txt")
	var/blacklist_paths_data = file("[file_dir]/blacklist.txt")
	var/fike_dir_tags = "[file_dir]/tags/"
	if(generate_files)
		fdel(source_dir)
		loot_data  << "paths    spawn_tags    blacklisted    spawn_value    price_tag    all_accompanying_obj    prob_all_accompanying_obj"
>>>>>>> 4b88393... loot rework update. (#5604)

	//Initialise all paths
	paths = subtypesof(/obj/item) - typesof(/obj/item/projectile)
	paths += subtypesof(/mob/living)
	paths += subtypesof(/obj/machinery)
	paths += subtypesof(/obj/structure)
	paths += subtypesof(/obj/spawner)
	paths += subtypesof(/obj/effect)

	for(var/path in paths)
		var/atom/movable/A = path
<<<<<<< HEAD

		bad_paths = initial(A.bad_types)
		if(istext(bad_paths))
			bad_paths = splittext(bad_paths, ",")
			if(bad_paths.len)
				var/list/temp_list = bad_paths
				bad_paths = list()
				for(var/bad_path_text in temp_list)
					bad_paths += text2path(bad_path_text)
		else if(ispath(bad_paths))
			bad_paths = list(bad_paths)
		if(islist(bad_paths) && bad_paths.len)
			for(var/bad_path in bad_paths)
				if(!ispath(bad_path))
					continue
				if(!(bad_path in all_spawn_bad_paths))
					all_spawn_bad_paths += bad_path

		if(path in all_spawn_bad_paths)
			continue

		frequency = initial(A.spawn_frequency)
		if(!frequency || frequency <= 0)
			continue

		spawn_tags = splittext(initial(A.spawn_tags), ",")

		if(!spawn_tags.len)
			continue
		//tags
		for(var/tag in spawn_tags)
			all_spawn_by_tag[tag] += list(path)
=======
		var/bad_path = initial(A.bad_type)
		if(bad_path == path)
			hard_blacklist_data  << "[path]"
			continue

		spawn_tags = splittext(initial(A.spawn_tags), ",")
		if(!spawn_tags.len)
			if(generate_files)
				hard_blacklist_data  << "[path]"
			continue

		frequency = initial(A.spawn_frequency)
		if(!frequency)
			if(generate_files)
				hard_blacklist_data  << "[path]"
			continue

>>>>>>> 4b88393... loot rework update. (#5604)

		//frequency
		//all_spawn_by_frequency["[frequency]"] += list(path)
		all_spawn_frequency_by_path[path] = frequency

		//price//
		price = initial(A.price_tag)
		//all_spawn_by_price["[price]"] += list(path)
		all_spawn_price_by_path[path] = price

		//rarity//
		rarity = initial(A.rarity_value)
		//all_spawn_by_rarity["[rarity]"] += list(path)
<<<<<<< HEAD
		all_spawn_rarity_by_path[path] = rarity

=======
		//all_spawn_rarity_by_path[path] = rarity

		//spawn_value//
		var/spawn_value = 10 * frequency/rarity
		all_spawn_value_by_path[path] = spawn_value
>>>>>>> 4b88393... loot rework update. (#5604)
		//blacklisted//
		//blacklisted = initial(A.spawn_blacklisted)
		//if(blacklisted)
		//	all_spawn_blacklist += path

		accompanying_objs = initial(A.accompanying_object)
		if(istext(accompanying_objs))
			accompanying_objs = splittext(accompanying_objs, ",")
			if(accompanying_objs.len)
				var/list/temp_list = accompanying_objs
				accompanying_objs = list()
				for(var/obj_text in temp_list)
					accompanying_objs += text2path(obj_text)
		else if(ispath(accompanying_objs))
			accompanying_objs = list(accompanying_objs)
		if(islist(accompanying_objs) && accompanying_objs.len)
			for(var/obj_path in accompanying_objs)
				if(!ispath(obj_path))
					continue
				all_spawn_accompanying_obj_by_path[path] += list(obj_path)
		if(!all_spawn_accompanying_obj_by_path[path])
			if(ispath(path, /obj/item/weapon/gun/energy))
				var/obj/item/weapon/gun/energy/E = A
				if(!initial(E.use_external_power) && !initial(E.self_recharge))
					all_spawn_accompanying_obj_by_path[path] += list(initial(E.suitable_cell))
			else if(ispath(path, /obj/item/weapon/gun/projectile))
				var/obj/item/weapon/gun/projectile/P = A
				if(initial(P.magazine_type))
					all_spawn_accompanying_obj_by_path[path] += list(initial(P.magazine_type))

		//tags//
		for(var/tag in spawn_tags)
			all_spawn_by_tag[tag] += list(path)
			if(generate_files)
				var/tag_data_i = file("[fike_dir_tags][tag].txt")
				tag_data_i << "[path]    blacklisted=[initial(A.spawn_blacklisted)]    [spawn_value]  [initial(A.price_tag)]  [list2params(all_accompanying_obj_by_path[path])]   [initial(A.prob_aditional_object)]"
		if(generate_files)
			loot_data << "[path]    [initial(A.spawn_tags)]    blacklisted=[initial(A.spawn_blacklisted)]    [spawn_value]  [initial(A.price_tag)]  [list2params(all_accompanying_obj_by_path[path])]   [initial(A.prob_aditional_object)]"
			loot_data_paths << "[path]"
			if(initial(A.spawn_blacklisted))
				blacklist_paths_data << "[path]"

/datum/loot_spawner_data/proc/spawn_by_tag(list/tags)
	var/list/things = list()
	if(!islist(tags))
		return things
	for(var/tag in tags)
		if(all_spawn_by_tag["[tag]"] in things)
			continue
		things += all_spawn_by_tag["[tag]"]
	return things

/datum/loot_spawner_data/proc/spawns_lower_price(list/paths, price)
	//if(!paths || !paths.len || !price) //NOPE
	//	return
	var/list/things = list()
	for(var/path in paths)
		if(all_spawn_price_by_path[path] < price)
			things += path
	return things

/datum/loot_spawner_data/proc/spawns_upper_price(list/paths, price)
	//if(!paths || !paths.len || !price) //NOPE
	//	return
	var/list/things = list()
	for(var/path in paths)
		if(all_spawn_price_by_path[path] > price)
			things += path
	return things

/datum/loot_spawner_data/proc/pick_frequencies_spawn(list/paths)
	//if(!paths || !paths.len) //NOPE
	//	return
	var/list/things = list()
	for(var/path in paths)
		var/frequency_path = all_spawn_frequency_by_path[path]
		things["[frequency_path]"] = frequency_path
	var/frequency = pickweight(things, 0)
	if(istext(frequency))
		frequency = text2num(frequency)
	things = list()
	for(var/path in paths)
		if(all_spawn_frequency_by_path[path] >= frequency)
			things += path
	return things

/datum/loot_spawner_data/proc/pick_rarities_spawn(list/paths)
	//if(!paths || !paths.len) //NOPE
	//	return
	var/list/things = list()
	for(var/path in paths)
		var/rarity_path = 100/all_spawn_rarity_by_path[path]
		things["[all_spawn_rarity_by_path[path]]"] = rarity_path
	var/rarity = pickweight(things, 0)
	if(istext(rarity))
		rarity = text2num(rarity)
	things = list()
	for(var/path in paths)
		if(all_spawn_rarity_by_path[path] <= rarity)
			things += path
	return things

/datum/loot_spawner_data/proc/pick_spawn(list/paths)
	//if(!paths || !paths.len) //NOPE
		//return
	var/list/things = list()
	for(var/path in paths)
		var/frequency_path = all_spawn_frequency_by_path[path]
		if(!frequency_path)
			continue
		if(frequency_path in things)
			continue
		things += frequency_path
	var/frequency = pick(things)
	things = list()
	for(var/path in paths)
		if(all_spawn_frequency_by_path[path] == frequency)
			things += path
	paths = things
	things = list()
	for(var/path in paths)
		var/rarity_path = all_spawn_rarity_by_path[path]
		if(!rarity_path)
			continue
		if(rarity_path in things)
			continue
		things += rarity_path
	var/rarity = pick(things)
	things = list()
	for(var/path in paths)
		if(all_spawn_rarity_by_path[path] == rarity)
			things += path
<<<<<<< HEAD
	var/path_selected = pick(things)
	return path_selected
=======
	return pick(things)

/datum/loot_spawner_data/proc/take_tags(list/paths)
	var/list/local_tags = list()
	var/atom/movable/A
	for(var/path in paths)
		A = path
		var/list/spawn_tags = splittext(initial(A.spawn_tags), ",")
		for(var/tag in spawn_tags)
			if(tag in local_tags)
				continue
			local_tags += list(tag)
	return local_tags

/datum/loot_spawner_data/proc/valid_candidates(list/tags, list/bad_tags, allow_blacklist=FALSE, low_price=0, top_price=0, filter_density=FALSE)
	var/list/candidates = spawn_by_tag(tags)
	candidates -= spawn_by_tag(bad_tags)
	if(!allow_blacklist)
		var/atom/movable/A
		for(var/path in candidates)
			A = path
			if(!initial(A.spawn_blacklisted))
				continue
			candidates -= path
	if(low_price)
		candidates -= spawns_lower_price(candidates, low_price)
	if(top_price)
		candidates -= spawns_upper_price(candidates, top_price)
	if(filter_density)
		candidates = filter_densty(candidates)
	return candidates
>>>>>>> 4b88393... loot rework update. (#5604)
