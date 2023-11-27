//Adds Ian Cube and Cat Cube boxes so the staff can replace their furry mascots

/obj/item/storage/box/iancubes
	name = "Ian cube box"
	desc = "Your new mascot. Just add water!"
	icon = 'zzz_modular_eclipse/icons/obj/food.dmi'
	icon_state = "petcubebox"
	illustration = null
	can_hold = list(/obj/item/reagent_containers/food/snacks/monkeycube/iancube)
	prespawned_content_amount = 5
	prespawned_content_type = /obj/item/reagent_containers/food/snacks/monkeycube/iancube/wrapped

/obj/item/storage/box/iancubes/populate_contents()
	for(var/i in 1 to prespawned_content_amount)
		new prespawned_content_type(src)

/obj/item/storage/box/catcubes
	name = "Cat cube box"
	desc = "Your new mascot. Just add water!"
	icon = 'zzz_modular_eclipse/icons/obj/food.dmi'
	icon_state = "petcubebox"
	illustration = null
	can_hold = list(/obj/item/reagent_containers/food/snacks/monkeycube/catcube)
	prespawned_content_amount = 5
	prespawned_content_type = /obj/item/reagent_containers/food/snacks/monkeycube/catcube/wrapped

/obj/item/storage/box/catcubes/populate_contents()
	for(var/i in 1 to prespawned_content_amount)
		new prespawned_content_type(src)
