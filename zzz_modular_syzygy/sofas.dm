//sofa

/obj/structure/bed/chair/sofa
	name = "sofa"
	desc = "It's a sofa. You sit on it. Possibly with someone else."
	icon = 'zzz_modular_syzygy/icons/obj/sofas.dmi'
	base_icon = "sofamiddle"
	icon_state = "sofamiddle"
	applies_material_colour = TRUE

/*	Seems like this bit of code never worked to begin with
/obj/structure/bed/chair/sofa/update_layer()
	// Corner east/west should be on top of mobs, any other state's north should be.
	if((base_icon == "sofacorner" && ((src.dir == EAST) || (src.dir == WEST))) || (base_icon != "sofacorner" && (src.dir == NORTH)))
		layer = ABOVE_MOB_LAYER
	else
		layer = OBJ_LAYER
*/

//color variations

/obj/structure/bed/chair/sofa/red/New(var/newloc,var/newmaterial)
	..(newloc,"steel","carpet")

/obj/structure/bed/chair/sofa/brown/New(var/newloc,var/newmaterial)
	..(newloc,"steel","leather")

/obj/structure/bed/chair/sofa/teal/New(var/newloc,var/newmaterial)
	..(newloc,"steel","teal")

/obj/structure/bed/chair/sofa/black/New(var/newloc,var/newmaterial)
	..(newloc,"steel","black")

/obj/structure/bed/chair/sofa/green/New(var/newloc,var/newmaterial)
	..(newloc,"steel","green")

/obj/structure/bed/chair/sofa/purp/New(var/newloc,var/newmaterial)
	..(newloc,"steel","purple")

/obj/structure/bed/chair/sofa/blue/New(var/newloc,var/newmaterial)
	..(newloc,"steel","blue")

/obj/structure/bed/chair/sofa/beige/New(var/newloc,var/newmaterial)
	..(newloc,"steel","beige")

/obj/structure/bed/chair/sofa/lime/New(var/newloc,var/newmaterial)
	..(newloc,"steel","lime")

//sofa directions

/obj/structure/bed/chair/sofa/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/brown/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/brown/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/brown/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/teal/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/teal/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/teal/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/black/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/black/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/black/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/green/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/green/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/green/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/purp/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/purp/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/purp/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/blue/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/blue/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/blue/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/beige/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/beige/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/beige/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/lime/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/lime/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/lime/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

/obj/structure/bed/chair/sofa/red/left
	icon_state = "sofaend_left"
	base_icon = "sofaend_left"

/obj/structure/bed/chair/sofa/red/right
	icon_state = "sofaend_right"
	base_icon = "sofaend_right"

/obj/structure/bed/chair/sofa/red/corner
	icon_state = "sofacorner"
	base_icon = "sofacorner"

// Crafting datums:

////////////////////////
	// SOFA CENTERPIECES
////////////////////////

/datum/craft_recipe/furniture/sofa
	name = "beige sofa"
	result = /obj/structure/bed/chair/sofa/beige
	time = 20
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL),
	)
	name_craft_menu = "Sofas (middle)"

/datum/craft_recipe/furniture/sofa/black
	name = "black sofa"
	result = /obj/structure/bed/chair/sofa/black
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/brown
	name = "brown sofa"
	result = /obj/structure/bed/chair/sofa/brown
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/lime
	name = "lime sofa"
	result = /obj/structure/bed/chair/sofa/lime
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/teal
	name = "teal sofa"
	result = /obj/structure/bed/chair/sofa/teal
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/red
	name = "red sofa"
	result = /obj/structure/bed/chair/sofa/red
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/blue
	name = "blue sofa"
	result = /obj/structure/bed/chair/sofa/blue
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/purple
	name = "purple sofa"
	result = /obj/structure/bed/chair/sofa/purp
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofa/green
	name = "green sofa"
	result = /obj/structure/bed/chair/sofa/green
	variation_type = CRAFT_VARIATION

////////////////////////
	// SOFA CORNERS
////////////////////////

/datum/craft_recipe/furniture/sofacorner
	name = "beige sofa"
	result = /obj/structure/bed/chair/sofa/beige/corner
	time = 20
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL),
	)
	name_craft_menu = "Sofas (corner)"

/datum/craft_recipe/furniture/sofacorner/black
	name = "black sofa"
	result = /obj/structure/bed/chair/sofa/black/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/brown
	name = "brown sofa"
	result = /obj/structure/bed/chair/sofa/brown/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/lime
	name = "lime sofa"
	result = /obj/structure/bed/chair/sofa/lime/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/teal
	name = "teal sofa"
	result = /obj/structure/bed/chair/sofa/teal/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/red
	name = "red sofa"
	result = /obj/structure/bed/chair/sofa/red/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/blue
	name = "blue sofa"
	result = /obj/structure/bed/chair/sofa/blue/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/purple
	name = "purple sofa"
	result = /obj/structure/bed/chair/sofa/purp/corner
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofacorner/green
	name = "green sofa"
	result = /obj/structure/bed/chair/sofa/green/corner
	variation_type = CRAFT_VARIATION

////////////////////////
	// SOFA LEFT CAPS
////////////////////////

/datum/craft_recipe/furniture/sofaleft
	name = "beige sofa"
	result = /obj/structure/bed/chair/sofa/beige/left
	time = 20
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL),
	)
	name_craft_menu = "Sofas (left)"

/datum/craft_recipe/furniture/sofaleft/black
	name = "black sofa"
	result = /obj/structure/bed/chair/sofa/black/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/brown
	name = "brown sofa"
	result = /obj/structure/bed/chair/sofa/brown/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/lime
	name = "lime sofa"
	result = /obj/structure/bed/chair/sofa/lime/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/teal
	name = "teal sofa"
	result = /obj/structure/bed/chair/sofa/teal/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/red
	name = "red sofa"
	result = /obj/structure/bed/chair/sofa/red/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/blue
	name = "blue sofa"
	result = /obj/structure/bed/chair/sofa/blue/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/purple
	name = "purple sofa"
	result = /obj/structure/bed/chair/sofa/purp/left
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaleft/green
	name = "green sofa"
	result = /obj/structure/bed/chair/sofa/green/left
	variation_type = CRAFT_VARIATION

////////////////////////
	// SOFA RIGHT CAPS
////////////////////////

/datum/craft_recipe/furniture/sofaright
	name = "beige sofa"
	result = /obj/structure/bed/chair/sofa/beige/right
	time = 20
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_STEEL),
	)
	name_craft_menu = "Sofas (right)"

/datum/craft_recipe/furniture/sofaright/black
	name = "black sofa"
	result = /obj/structure/bed/chair/sofa/black/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/brown
	name = "brown sofa"
	result = /obj/structure/bed/chair/sofa/brown/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/lime
	name = "lime sofa"
	result = /obj/structure/bed/chair/sofa/lime/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/teal
	name = "teal sofa"
	result = /obj/structure/bed/chair/sofa/teal/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/red
	name = "red sofa"
	result = /obj/structure/bed/chair/sofa/red/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/blue
	name = "blue sofa"
	result = /obj/structure/bed/chair/sofa/blue/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/purple
	name = "purple sofa"
	result = /obj/structure/bed/chair/sofa/purp/right
	variation_type = CRAFT_VARIATION

/datum/craft_recipe/furniture/sofaright/green
	name = "green sofa"
	result = /obj/structure/bed/chair/sofa/green/right
	variation_type = CRAFT_VARIATION
