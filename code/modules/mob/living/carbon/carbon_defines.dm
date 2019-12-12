/mob/living/carbon/
	gender = MALE
	var/datum/species/species //Contains icon generation and language information, set during New().
	var/list/stomach_contents = list()
	var/list/datum/disease2/disease/virus2 = list()
	var/list/antibodies = list()

	var/life_tick = 0      // The amount of life ticks that have processed on this mob.
	var/analgesic = 0 // when this is set, the mob isn't affected by shock or pain
					  // life should decrease this by 1 every tick
	// total amount of wounds on mob, used to spread out healing and the like over all wounds
	var/obj/item/handcuffed = null //Whether or not the mob is handcuffed
	var/obj/item/legcuffed = null  //Same as handcuffs but for legs. Bear traps use this.
	//Active emote/pose
	var/pose = null

	var/datum/reagents/metabolism/bloodstr = null
	var/datum/reagents/metabolism/ingested = null
	var/datum/reagents/metabolism/touching = null
	var/datum/metabolism_effects/metabolism_effects = null
	var/losebreath = 0 //if we failed to breathe last tick

	var/coughedtime = null
	var/lastpuke = 0

	var/cpr_time = 1.0
	nutrition = 400.0//Carbon


	var/obj/item/weapon/tank/internal = null//Human/Monkey

	//TODO: move to brain
	var/list/nerve_system_accumulations = list() // Nerve system accumulations
	var/nsa_threshold = 100
	var/nsa_current = 0
