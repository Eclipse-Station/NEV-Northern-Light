//Adds a box of "Ian Cubes" so the staff can replace their furry mascot

/obj/item/storage/box/iancubes
	name = "Ian cube box"
	desc = "Your new mascot. Just add water!"
	icon = 'icons/obj/food.dmi'
	icon_state = "monkeycubebox"
	illustration = null
	can_hold = list(/obj/item/reagent_containers/food/snacks/monkeycube/iancube)
	initial_amount = 5
	spawn_type = /obj/item/reagent_containers/food/snacks/monkeycube/iancube/wrapped

/obj/item/storage/box/iancubes/populate_contents()
	for(var/i in 1 to initial_amount)
		new spawn_type(src)
