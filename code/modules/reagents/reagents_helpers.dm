<<<<<<< HEAD
/proc/get_reagent_name_by_id(var/id)
	if(!chemical_reagents_list.len)
=======
/proc/get_reagent_name_by_id(id)
	if(!GLOB.chemical_reagents_list.len)
>>>>>>> fdd6ee7... NT plumbing integration (#5445)
		return "REAGENTS NOT INITIALISED"
	var/datum/reagent/D = chemical_reagents_list[id]
	if(D)
		return D.name

	return "REAGENT NOT FOUND"

<<<<<<< HEAD
/proc/get_reagent_type_by_id(var/id)
	if(!chemical_reagents_list.len)
=======
/proc/get_reagent_type_by_id(id)
	if(!GLOB.chemical_reagents_list.len)
>>>>>>> fdd6ee7... NT plumbing integration (#5445)
		return "REAGENTS NOT INITIALISED"
	var/datum/reagent/D = chemical_reagents_list[id]
	if(D)
		return D.type

	return "REAGENT NOT FOUND"

<<<<<<< HEAD
/proc/is_reagent_with_id_exist(var/id)
	if(!chemical_reagents_list.len)
=======
/proc/is_reagent_with_id_exist(id)
	if(!GLOB.chemical_reagents_list.len)
>>>>>>> fdd6ee7... NT plumbing integration (#5445)
		error("REAGENTS NOT INITIALISED")
		return FALSE
	var/datum/reagent/D = chemical_reagents_list[id]
	if(D)
		return TRUE

	return FALSE