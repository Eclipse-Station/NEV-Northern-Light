//Eclipse Edit - Laser Flintlock for the church - Weaker than the Paladin, but less cumbersome to use, as it can be fired one handed, making reloading easier.
/obj/item/gun/energy/laser/squire
	name = "MA LP S \"Squire\""
	desc = "The Mekhane Armory \"Squire\" laser pistol is a cheap, easily-produced sidearm issued to Mekhane disciples for self-defence. It is best used with Mekhane disposable cells, but can load any standard S class power cell. The weapon fires a single powerful shot, overloading and destroying the cell when fired."
	icon = 'zzz_modular_eclipse/icons/obj/guns/energy/squire.dmi'
	icon_state = "squire"
	item_state = "squire"
	fire_sound = 'sound/weapons/Laser.ogg'
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	matter = list(MATERIAL_STEEL = 10, "biomatter" = 5, MATERIAL_GOLD = 2)
	zoom_factor = 0
	damage_multiplier = 2 //60 damage base
	charge_cost = 10000
	suitable_cell = /obj/item/cell/small
	var/consume_cell = TRUE
	price_tag = 2300
	projectile_type = /obj/item/projectile/beam/midlaser
	init_firemodes = list(WEAPON_NORMAL)
	twohanded = FALSE
	spawn_blacklisted = TRUE //Added to spawn blacklist while waiting for sprite

/obj/item/gun/energy/laser/squire/attackby(obj/item/C, mob/living/user)
	..()
	refresh_upgrades()
	if(!cell) return null
	if(cell && cell.charge <= 250)
		damage_multiplier *= 0.85 //51 damage
	else if(cell && cell.charge >= 999) 
		damage_multiplier *= 1200 //God is pissed at you damage
	else if(cell && cell.charge >= 500)
		damage_multiplier *= 1.25 //75 damage
	else
		damage_multiplier *= 1

/obj/item/gun/energy/laser/squire/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(consume_cell && !cell.checked_use(charge_cost))
		visible_message(SPAN_WARNING("\The [cell] of \the [src] burns out!"))
		qdel(cell)
		cell = null
		playsound(loc, 'zzz_modular_eclipse/sound/weapons/m1_garand_ping.ogg', 40, 1, -1)
		new /obj/effect/decal/cleanable/ash(get_turf(src))
		new /obj/item/dead_cell/small(get_turf(src))
		new /obj/effect/sparks(get_turf(src))
		return new projectile_type(src)
	else if(!consume_cell && !cell.checked_use(charge_cost))
		return null
	else
		return new projectile_type(src)

/obj/item/gun/energy/laser/squire/on_update_icon()
	cut_overlays()
	if(cell)
		add_overlays("laser_squire")

/obj/item/dead_cell/small
	name = "fried small battery"
	desc = "A small battery that's been fried beyond a useable state, only good for recycling now."
	icon_state = "dead_s"
	w_class = ITEM_SIZE_TINY
	matter = list(MATERIAL_STEEL = 1)