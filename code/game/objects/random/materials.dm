/obj/spawner/material
	name = "random material"
	icon_state = "material-grey"
	tags_to_spawn = list(SPAWN_MATERIAL)

/obj/spawner/material/building
	name = "random building material"
	icon_state = "material-grey"
	tags_to_spawn = list(SPAWN_MATERIAL_BUILDING)

/obj/spawner/material/building/low_chance
	name = "low chance random building material"
	icon_state = "material-grey-low"
	spawn_nothing_percentage = 60

/obj/spawner/material/resources
	name = "random resource material"
	icon_state = "material-green"
	tags_to_spawn = list(SPAWN_MATERIAL_RESOURCES)

<<<<<<< HEAD
/obj/random/material_resources/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/steel/random = 5,\
				/obj/item/stack/material/glass/random = 4,\
				/obj/item/stack/material/glass/phoronglass/random = 3,\
				/obj/item/stack/material/iron/random = 2,\
				/obj/item/stack/material/diamond/random = 1,\
				/obj/item/stack/material/phoron/random = 3,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2))

/obj/random/material_resources/low_chance
=======
/obj/spawner/material/resources/low_chance
>>>>>>> 0c71e2e... Random spawn values (#5374)
	name = "low chance random resource material"
	icon_state = "material-green-low"
	spawn_nothing_percentage = 60

/obj/spawner/material/resources/rare
	name = "random rare material"
	icon_state = "material-orange"
	tags_to_spawn = list(SPAWN_MATERIAL_RESOURCES_RARE)

<<<<<<< HEAD
/obj/random/material_rare/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/diamond/random = 1,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2,\
				/obj/item/stack/material/glass/phoronglass/random = 2))

/obj/random/material_rare/low_chance
=======
/obj/spawner/material/resources/rare/low_chance
>>>>>>> 0c71e2e... Random spawn values (#5374)
	name = "low chance random rare material"
	icon_state = "material-orange-low"
	spawn_nothing_percentage = 60

/obj/spawner/material/ore
	name = "random ore"
	icon_state = "material-black"
	tags_to_spawn = list(SPAWN_ORE)

<<<<<<< HEAD

/obj/random/material_ore/item_to_spawn()
	return pickweight(list(/obj/item/weapon/ore/coal = 4,\
				/obj/item/weapon/ore/glass = 5,\
				/obj/item/weapon/ore/gold = 3,\
				/obj/item/weapon/ore/hydrogen = 2,\
				/obj/item/weapon/ore/iron = 4,\
				/obj/item/weapon/ore/osmium = 2,\
				/obj/item/weapon/ore/phoron = 3,\
				/obj/item/weapon/ore/silver = 2,\
				/obj/item/weapon/ore/uranium = 1,\
				/obj/item/weapon/ore/diamond = 1))

/obj/random/material_ore/low_chance
=======
/obj/spawner/material/ore/low_chance
>>>>>>> 0c71e2e... Random spawn values (#5374)
	name = "low chance random ore"
	icon_state = "material-black-low"
	spawn_nothing_percentage = 60
