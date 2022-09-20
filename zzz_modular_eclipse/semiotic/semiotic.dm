/* Semiotic Standard signage - for all commercial trans-stellar utility 
 * lifter and heavy element transport spacecraft. April 16, 2078.
 *
 * Original design by R. Cobb and used in the film "Alien", recreated for use
 * within Space Station 13 by Andreas Spitzer. Currently, only signs specified
 * in the Standard have been included without any custom variants made by me.
 *
 * One day, though... ^RSpitzer 2022-09-01
 */

///////////////
//Structures, to be hung on walls, etc
///////////////

//00 - BASE DEFINE
/obj/structure/sign/semiotic
	name = "\improper Semiotic Standard sign"
	desc = "A sign in the Semiotic Standard."
	icon = 'zzz_modular_eclipse/semiotic/semiotic_signage.dmi'

//01 - PRESSURISED AREA
/obj/structure/sign/semiotic/pressurised
	name = "pressurized area sign"
	desc = "A sign indicating a pressurized area."
	icon_state = "pressurised"

//02 - PRESSURISED AREA WITH ARTIFICIAL GRAVITY
/obj/structure/sign/semiotic/pressurised_gravity
	name = "\"pressurized area with gravity\" sign"
	desc = "A sign indicating a pressurized area with artificial gravity present."
	icon_state = "pressurised_gravity"

//03 - PRESSURISED AREA WITH NO GRAVITY
/obj/structure/sign/semiotic/pressurised_nograv
	name = "\"pressurized area without gravity\" sign"
	desc = "A sign indicating that artificial gravity is absent."
	icon_state = "pressurised_nograv"

//04 - CRYOGENIC VAULT
/obj/structure/sign/semiotic/cryo
	name = "cryogenic vault sign"
	desc = "A sign indicating a cryogenic vault."
	icon_state = "cryo"

//05 - AIRLOCK
/obj/structure/sign/semiotic/airlock
	name = "airlock sign"
	desc = "A sign indicating an airlock that can be pressurized or depressurized."
	icon_state = "airlock"

//06 - BULKHEAD
/obj/structure/sign/semiotic/bulkhead
	name = "bulkhead door sign"
	desc = "A sign indicating a door which exits directly into an area that's depressurized."
	icon_state = "eva_bulkhead"

//07 - NON-PRESSURISED AREA
/obj/structure/sign/semiotic/nonpressurised
	name = "non-pressurized area sign"
	desc = "A sign indicating an area which has no pressure."
	icon_state = "nopress_beyond"

//08 - PRESSURE SUIT LOCKER
/obj/structure/sign/semiotic/suit
	name = "voidsuit locker sign"
	desc = "A sign indicating a voidsuit locker."
	icon_state = "suit_locker"

//08a - PRESSURE SUIT LOCKER (ALTERNATE)
/obj/structure/sign/semiotic/suit/alt
	icon_state = "suit_locker_alt"

//09 - PHOTONIC SYSTEM (FIBRE OPTICS)
/obj/structure/sign/semiotic/fibre
	name = "photonic system sign"
	desc = "A sign indicating a photonic or fiber-optic system."
	icon_state = "fibre_optics"

//10 - LASER
/obj/structure/sign/semiotic/laser
	name = "laser sign"
	desc = "A sign indicating lasers. Pew pew."
	icon_state = "laser"

//11 - ASTRONIC SYSTEMS (ELECTRONICS)
/obj/structure/sign/semiotic/electronics
	name = "astronic systems sign"
	desc = "A sign indicating astronic systems. Or, in other words, electronics."
	icon_state = "electronics"

//12 - HAZARD/WARNING
/obj/structure/sign/semiotic/hazard
	name = "hazard sign"
	desc = "A sign indicating a miscellaneous hazard."
	icon_state = "hazard"

//13 - ARTIFICIAL GRAVITY AREA, NON-PRESSURISED, SUIT REQUIRED
/obj/structure/sign/semiotic/nonpressurised_suit
	name = "nonpressurized area warning sign"
	desc = "A sign indicating a non-pressurized area, which requires a voidsuit."
	icon_state = "nopress_grav"

//14 - NON-PRESSURISED AREA, GRAVITY ABSENT, SUIT REQUIRED
/obj/structure/sign/semiotic/no_grav_no_press
	name = "nonpressurized area warning sign"
	desc = "A sign indicating a non-pressurized area without gravity, requiring a voidsuit."
	icon_state = "nopress_nograv"

//15 - EXHAUST
/obj/structure/sign/semiotic/exhaust
	name = "exhaust warning sign"
	desc = "A sign indicating a danger from exhaust systems."
	icon_state = "exhaust"

//16 - AREA SHIELDED FROM RADIATION
/obj/structure/sign/semiotic/radshield
	name = "\"area shielded from radiation\" sign"
	desc = "A sign indicating an area that is shielded from radiation."
	icon_state = "rad_shielded"

//17 - RADIATION HAZARD
/obj/structure/sign/semiotic/radiation_hazard
	name = "radiation hazard sign"
	desc = "A sign indicating a radiation hazard."
	icon_state = "rad_hazard"

//18 - HIGH RADIOACTIVITY
/obj/structure/sign/semiotic/high_radiation
	name = "high radioactivity sign"
	desc = "A sign indicating high levels of radioactivity. Better not stay here too long."
	icon_state = "high_rad"

//19 - REFRIGERATED STORAGE
/obj/structure/sign/semiotic/refrigerated_storage
	name = "refrigerated storage sign"
	desc = "A sign indicating refrigerated storage."
	icon_state = "refr"

//20 - DIRECTION
/obj/structure/sign/semiotic/directions
	name = "direction sign"
	desc = "A sign pointing somewhere."
	icon_state = "dir"

//21 - LIFE SUPPORT SYSTEM
/obj/structure/sign/semiotic/lss
	name = "life support systems sign"
	desc = "A sign indicating automated life support systems."
	icon_state = "lifesupport"

//22 - GALLEY
/obj/structure/sign/semiotic/galley
	name = "galley sign"
	desc = "A sign indicating the galley. Or the kitchen, if you'd rather."
	icon_state = "galley"

//23 - COFFEE
/obj/structure/sign/semiotic/coffee
	name = "coffee sign"
	desc = "A sign indicating coffee."	//This coffee ain't shit, though.
	icon_state = "coffee"

//24 - BRIDGE
/obj/structure/sign/semiotic/bridge
	name = "bridge sign"
	desc = "A sign indicating the bridge."
	icon_state = "bridge"

//25 - AUTODOC
/obj/structure/sign/semiotic/autodoc
	name = "auto-doc sign"
	desc = "A sign indicating an automatic medical system."
	icon_state = "autodoc"

//26 - MAINTENANCE
/obj/structure/sign/semiotic/maintenance
	name = "maintenance access sign"
	desc = "A sign indicating the maintenance section of the ship."
	icon_state = "maint"

//27 - LADDERWAY
/obj/structure/sign/semiotic/ladder
	name = "ladderway sign"
	desc = "A sign indicating a ladderway, in case stairs aren't really your thing."
	icon_state = "ladder"

//28 - INTERCOM
/obj/structure/sign/semiotic/intercom
	name = "communications systems sign"
	desc = "A sign indicating communications systems."
	icon_state = "intercom"

//29 - STORAGE
/obj/structure/sign/semiotic/storage
	name = "storage sign"
	desc = "A sign indicating storage of some sort."
	icon_state = "storage"

//29a - FOODSTUFF STORAGE
/obj/structure/sign/semiotic/storage/food
	desc = "A sign indicating food storage."
	icon_state = "storage_foodstuff"

//29b - REFRIGERATED FOODSTUFF STORAGE
/obj/structure/sign/semiotic/storage/food/refrigerated
	desc = "A sign indicating refrigerated food storage."
	icon_state = "storage_foodstuff_refr"

//30 - COMPUTER
/obj/structure/sign/semiotic/computer
	name = "terminal sign"
	desc = "A sign indicating a computer terminal."
	icon_state = "computer"

///////////////
//Floor decals
///////////////

//00 - BASE DEFINE
/obj/effect/floor_decal/semiotic
	icon = 'zzz_modular_eclipse/semiotic/semiotic_tile_decals.dmi'

//01 - PRESSURISED AREA
/obj/effect/floor_decal/semiotic/pressurised
	icon_state = "pressurised"

//02 - PRESSURISED AREA WITH ARTIFICIAL GRAVITY
/obj/effect/floor_decal/semiotic/pressurised_gravity
	icon_state = "pressurised_gravity"

//03 - PRESSURISED AREA, ARTIFICIAL GRAVITY ABSENT
/obj/effect/floor_decal/semiotic/pressurised_nograv
	icon_state = "pressurised_nograv"

//04 - CRYOGENIC VAULT
/obj/effect/floor_decal/semiotic/cryo
	icon_state = "cryo"

//05 - AIRLOCK
/obj/effect/floor_decal/semiotic/airlock
	icon_state = "airlock"

//06 - BULKHEAD DOOR
/obj/effect/floor_decal/semiotic/bulkhead_door
	icon_state = "eva_bulkhead"

//07 - NON-PRESSURISED AREA BEYOND
/obj/effect/floor_decal/semiotic/nopress_beyond
	icon_state = "nopress_beyond"

// 08 - PRESSURE SUIT LOCKER
/obj/effect/floor_decal/semiotic/suit
	icon_state = "suit_locker"

// 08a - PRESSURE SUIT LOCKER (ALTERNATE)
/obj/effect/floor_decal/semiotic/suit/alt
	icon_state = "suit_locker_alt"

// 09 - PHOTONIC SYSTEMS
/obj/effect/floor_decal/semiotic/fibre_optics
	icon_state = "fibre_optics"

// 10 - LASER
/obj/effect/floor_decal/semiotic/laser
	icon_state = "laser"

// 11 - ASTRONIC SYSTEMS (ELECTRONICS)
/obj/effect/floor_decal/semiotic/electronics
	icon_state = "electronics"

// 12 - HAZARD/WARNING
/obj/effect/floor_decal/semiotic/hazard
	icon_state = "hazard"

// 13 - ARTIFICIAL GRAVITY AREA, NON-PRESSURISED, SUIT REQUIRED
/obj/effect/floor_decal/semiotic/nopress_grav
	icon_state = "nopress_grav"

// 14 - NO ARTIFICIAL GRAVITY OR PRESSURE, SUIT REQUIRED
/obj/effect/floor_decal/semiotic/nopress_nograv
	icon_state = "nopress_nograv"

// 15 - EXHAUST
/obj/effect/floor_decal/semiotic/exhaust
	icon_state = "exhaust"

// 16 - AREA SHIELDED FROM RADIATION
/obj/effect/floor_decal/semiotic/rad_shielded
	icon_state = "rad_shielded"

// 17 - RADIATION HAZARD
/obj/effect/floor_decal/semiotic/rad_hazard
	icon_state = "rad_hazard"

// 18 - HIGH RADIOACTIVITY
/obj/effect/floor_decal/semiotic/high_rad
	icon_state = "high_rad"

// 19 - REFRIGERATION
/obj/effect/floor_decal/semiotic/refr
	icon_state = "refr"

// 20 - DIRECTIONS
/obj/effect/floor_decal/semiotic/dir
	icon_state = "dir"

// 21 - LIFE SUPPORT SYSTEM
/obj/effect/floor_decal/semiotic/life_support
	icon_state = "life_support"

// 22 - GALLEY
/obj/effect/floor_decal/semiotic/galley
	icon_state = "galley"

// 23 - COFFEE
/obj/effect/floor_decal/semiotic/coffee
	icon_state = "coffee"

// 24 - BRIDGE
/obj/effect/floor_decal/semiotic/bridge
	icon_state = "bridge"

// 25 - AUTODOC
/obj/effect/floor_decal/semiotic/autodoc
	icon_state = "autodoc"

// 26 - MAINTENANCE
/obj/effect/floor_decal/semiotic/maint
	icon_state = "maint"

// 27 - LADDERWAY
/obj/effect/floor_decal/semiotic/ladder
	icon_state = "ladder"

// 28 - INTERCOM
/obj/effect/floor_decal/semiotic/intercom
	icon_state = "intercom"

// 29 - STORAGE
/obj/effect/floor_decal/semiotic/storage
	icon_state = "storage"

// 29a - FOOD STORAGE
/obj/effect/floor_decal/semiotic/storage/food
	icon_state = "storage_foodstuff"

// 29b - REFRIGERATED FOOD STORAGE
/obj/effect/floor_decal/semiotic/storage/food/refr
	icon_state = "storage_foodstuff_refr"

// 30 - COMPUTER TERMINAL
/obj/effect/floor_decal/semiotic/computer
	icon_state = "computer"