/obj/item/reagent_containers/food/snacks/monkeycube/iancube
	name = "Ian cube"
	var/corgi_type = "Ian"

/obj/item/reagent_containers/food/snacks/monkeycube/iancube/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	if(istype(T))
		new /mob/living/simple_animal/corgi/Ian(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/monkeycube/iancube/wrapped
	desc = "Still wrapped in some paper."
	icon_state = "monkeycubewrap"
	reagent_flags = NONE
	wrapped = TRUE

/obj/item/reagent_containers/food/snacks/monkeycube/catcube
	name = "Bones cube"
	var/cat_type = "Bones"

/obj/item/reagent_containers/food/snacks/monkeycube/catcube/Expand()
	src.visible_message(SPAN_NOTICE("\The [src] expands!"))
	var/turf/T = get_turf(src)
	if(istype(T))
		new /mob/living/simple_animal/cat/fluff/bones(T)
	qdel(src)
	return TRUE

/obj/item/reagent_containers/food/snacks/monkeycube/catcube/wrapped
	desc = "Still wrapped in some paper."
	icon_state = "monkeycubewrap"
	reagent_flags = NONE
	wrapped = TRUE
