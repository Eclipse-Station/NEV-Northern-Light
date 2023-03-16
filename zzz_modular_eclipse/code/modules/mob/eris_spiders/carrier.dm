#define SPINNING_WEB 1
#define LAYING_EGGS 2
#define MOVING_TO_TARGET 3
#define SPINNING_COCOON 4
var/has_made_spiderlings

//Eclipse Edit: Eclipse-level port of Sojourn mob "Carrier spider"
/mob/living/carbon/superior_animal/giant_spider/carrier
	name = "Izumo Spider"
	desc = "A massive tarantula. The eggs on it's body pulsate with a beat."
	icon = 'zzz_modular_eclipse/icons/mob/mob.dmi'
	icon_state = "carrier"
	icon_living = "carrier"
	deathmessage = "splits open! Several wriggling spiders crawl from its gore!"
	//egg_inject_chance = 2 //maybe...
	move_to_delay = 5 //Has babys on it!
	var/has_made_spiderlings = FALSE
	rarity_value = 60
	meat_type = /obj/item/reagent_containers/food/snacks/meat/spider

/mob/living/carbon/superior_animal/giant_spider/carrier/death(var/gibbed,var/message = deathmessage)

	new /obj/effect/spider/spiderling(src.loc)
	new /obj/effect/spider/spiderling(src.loc)
	new /obj/effect/spider/spiderling(src.loc)


	density = 0
	layer = LYING_MOB_LAYER

	. = ..()
