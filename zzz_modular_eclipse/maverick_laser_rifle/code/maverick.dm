// Chiropteran Arms "Maverick" series rifle - object defines and variables.
// R.A. Spitzer 2022-07-10

/obj/item/gun/energy/lever_action
	name = "\improper CA ELAR S \"Maverick\"" 
	desc = "A revision of Chiropteran Arms' popular lever-action varmint-hunting rifle, this rifle design was produced in smaller numbers for colonists who needed the versatility of a laser weapon with the power of a ballistic weapon."
	
	//Icon and sounds. //TODO TODO TODO - CHANGE ALL THIS!
	icon = 'zzz_modular_eclipse/maverick_laser_rifle/icon/maverick.dmi'
	icon_state = "winchester"
	item_state = "winchester"
	fire_sound = 'sound/weapons/Laser.ogg'
	var/firesound_lethal = 'sound/weapons/Laser.ogg'
	var/firesound_stun = 'sound/weapons/Taser.ogg'
	var/action_sound = 'sound/weapons/guns/interact/batrifle_cock.ogg' //The sound made when cycling the action.
	wielded_item_state = "_double"
	
	
	//Size and damage.
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_NORMAL
	projectile_type = /obj/item/projectile/beam/midlaser
	init_firemodes = list(WEAPON_NORMAL)
	damage_multiplier = 1 //Base of 30 damage at 250 charge.
	simplemob_bonus_damage_multiplier = 0.3 //Mobs take 30% extra damage.
	
	//Reference values.
	var/charge_maximum = 400 //Damage multiplier caps at this amount.
	var/charge_reference = 250 //The divisor for the damage multiplier for death beams
	var/charge_taser_maximum = 75 //Below this charge, the rifle will fire a Taser shot.
	var/charge_taser_reference = 50 //The divisor for the agony multiplier for zapping people

	
	//Research and deconstruction.
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2, TECH_ENGINEERING = 4) //Same as E-shotgun
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 4) //The lack of wood here is intentional.
	
	//Miscellany.
	zoom_factor = 0
	charge_cost = 100000 //One shot.
	suitable_cell = /obj/item/cell/small
	price_tag = 2000
	var/recentpumpmsg = FALSE //Variable to prevent chat message spam
	var/list/magazine = list()
	var/magazine_capacity = 3 //We hold 3 cells.
	suppress_already_loaded_message = TRUE //because we can load more than one cell.
