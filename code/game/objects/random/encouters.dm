#define DAMAGE_POWER_TRANSFER 450 //used to transfer power to containment field generators
#define ENCOUTER_PROBALITY 100

/obj/spawner/encouter
	exclusion_paths = list(/obj/spawner/encouter)
	spawn_tags = SPAWN_TAG_SPAWNER_ENCOUNER
	tags_to_spawn = list(SPAWN_SPAWNER_ENCOUNER)

///////ENCOUTERS
//////////////////////

/obj/spawner/encouter/mine
	tags_to_spawn = list(SPAWN_MINE)

/obj/spawner/encouter/miningbot
	allow_blacklist = TRUE
	tags_to_spawn = list(SPAWN_BOT_OS)

/obj/spawner/encouter/strangebeacon
	tags_to_spawn = list(SPAWN_STRANGEBEACON)

<<<<<<< HEAD
/obj/random/spawner/encouter/cryopod
	randspawn = list(/obj/structure/cryopod_spawner/ironhammer, /obj/structure/cryopod_spawner/medical, \
	/obj/structure/cryopod_spawner/serbian)	//Eclipse edit: Removed technomancer cryopod to maintain lore compliance
=======
/obj/spawner/encouter/cryopod
	tags_to_spawn = list(SPAWN_ENCOUNTER_CRYOPOD)
>>>>>>> 0c71e2e... Random spawn values (#5374)

/obj/spawner/encouter/satellite
	tags_to_spawn = list(SPAWN_SATELITE)

/obj/spawner/encouter/coffin
	allow_blacklist = TRUE
	tags_to_spawn = list(SPAWN_COFFIN_CLOSET)

/obj/spawner/encouter/omnius
	tags_to_spawn = list(SPAWN_OMINOUS)

///////ENCOUTERS
//////////////////////

