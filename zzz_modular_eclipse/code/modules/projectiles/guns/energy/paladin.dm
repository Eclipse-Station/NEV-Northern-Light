//Laser Musket for the church
/obj/item/gun/energy/laser/paladin
	name = "MA LR M \"Paladin\""
	desc = "The Mekhane Armory \"Paladin\" laser musket is a cheap, easily-produced firearm that is very popular among the frontier colonies the Children protect. It is best used with Mekhane disposable cells, but can load any standard M class power cell. The weapon fires a single powerful shot, overloading and destroying the cell when fired."
	icon = 'zzz_modular_eclipse/icons/obj/guns/energy/paladin.dmi'
	icon_state = "paladin"
	item_state = "paladin"
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_STEEL = 20, "biomatter" = 10, MATERIAL_GOLD = 5)
	zoom_factor = 0
	damage_multiplier = 2.5 //75 damage
	charge_cost = 100000 //No matter what cell you put in, it's gonna fry it.
	suitable_cell = /obj/item/cell/medium
	var/consume_cell = TRUE
	price_tag = 2500
	projectile_type = /obj/item/projectile/beam/midlaser
	init_firemodes = list(WEAPON_NORMAL)

//Scales the damage multiplier based on the charge level of the cell
/obj/item/gun/energy/laser/paladin/attackby(obj/item/C, mob/living/user)
	..()
	refresh_upgrades()
	if(!cell) return null
	if(cell && cell.charge <= 700)
		damage_multiplier *= 0.8 //60 damage
	else if(cell && cell.charge >= 9999) //fine admemery - if you load an admin cell into this thing, it's gonna do wacky damage
		damage_multiplier *= 1200 //That's a lotta damage
	else if(cell && cell.charge >= 1300)
		damage_multiplier *= 1.2 //90 damage
	else
		damage_multiplier *= 1

//handles frying the cell, also what allows it to fire past the batteries charge
/obj/item/gun/energy/laser/paladin/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'zzz_modular_eclipse/sound/weapons/m1_garand_ping.ogg', 40, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		new /obj/item/dead_cell(get_turf(src))
		new /obj/effect/sparks(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null
	else
		return new projectile_type(src)


/obj/item/gun/energy/laser/paladin/on_update_icon()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""
	
	if(wielded)
		itemstring += "_doble"
	if(cell)
		add_overlays("on_paladin")
	if(!cell)
		add_overlays("off_paladin")

	icon_state = iconstring
	set_item_state(itemstring)

//And finally, a new object, a dead cell, leaves something of a mess (and makes the pinging noise make more sense)
/obj/item/dead_cell
	name = "fried battery"
	desc = "A battery that's been fried beyond a useable state, only good for recycling now."
	icon = 'zzz_modular_eclipse/icons/obj/dead_cell.dmi'
	icon_state = "dead_m"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 1)