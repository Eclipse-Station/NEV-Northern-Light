
/obj/item/storage/box/tainted_gift
	name = "tainted gift"
	desc = "A vile gift from an even more vile entitiy!"
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "present_dead"
	rarity_value = 5
	var/list/loots = list(
		/obj/item/reagent_containers/food/snacks/sliceable/plaincake = 5,
		/obj/item/reagent_containers/food/snacks/sliceable/chocolatecake = 5,
		/obj/item/reagent_containers/food/snacks/candy_corn = 20,
		/obj/item/reagent_containers/food/snacks/chocolatebar = 10,
		/obj/item/reagent_containers/food/snacks/donut = 10,
		/obj/item/reagent_containers/food/snacks/donut/chaos = 3,
		/obj/item/reagent_containers/food/snacks/cookie = 10,
		/obj/item/reagent_containers/food/snacks/chocolateegg = 10,
		/obj/item/reagent_containers/food/snacks/candy/mre = 5,
		/obj/item/reagent_containers/food/snacks/candiedapple = 10,
		/obj/item/reagent_containers/food/snacks/appletart = 10
	)

/obj/item/storage/box/tainted_gift/proc/get_loot()
	var/items_to_spawn = rand(3, 5)
	var/list/goodies = list()
	while(items_to_spawn > 0)
		items_to_spawn--
		goodies += pickweight(loots)
	return goodies

/obj/item/storage/box/tainted_gift/New()
	. = ..()
	var/list/things2spawn = list()
	things2spawn += get_loot()
	things2spawn += pick(subtypesof(/obj/item/toy/plushie) + subtypesof(/obj/item/toy/figure))

	if(prob(5)) //Special drops!

		if(prob(50))
			things2spawn += /obj/item/reagent_containers/syringe/drugs_recreational
		else if(prob(40))
			things2spawn += /obj/item/reagent_containers/syringe/stim/grape_drops
		else if(prob(30))
			things2spawn += /obj/item/reagent_containers/syringe/stim/violence_ultra
		else if(prob(20)) //Due to else-ifs this actually has a far smaller chance of dropping
			things2spawn += /obj/item/gun/projectile/automatic/dallas
		else
			things2spawn += /obj/item/stack/material/sandstone //You got a rock.
	for(var/path in things2spawn)
		new path(src)






//WEAPONS//

/obj/item/tool/knife/switchblade/candy_cane
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "candycane"
	desc = "God roast ye, merry gentlemen!"
	force = WEAPON_FORCE_HARMLESS
	switched_on_force = WEAPON_FORCE_WEAK


/obj/item/grenade/fruitcake
	name = "grandma's fruitcake"
	desc = "A fruitcake so dense, biting into it seems impossible."
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "fruitcake"


/obj/item/grenade/fruitcake/prime()
	new /obj/effect/sparks/jpeg_boom(get_turf(src))
	var/turf/T = get_turf(src)
	for (var/mob/living/carbon/C in range(4, T))
		C.SpinAnimation(3, 8)
		C.Weaken(5)
		C.stuttering += 5
		if(prob(80))
			C.Stun(5)
		to_chat(C, "\red Your body goes numb for a moment.")
	qdel(src)


/obj/effect/sparks/jpeg_boom
	name = "sparks"
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "jpeg_explosion"
	anchored = TRUE
	mouse_opacity = 0
	amount = 1

/obj/effect/sparks/jpeg_boom/New()
	..()
	var/matrix/M = matrix()
	M.Scale(3)
	M.Translate(0, 32)
	src.transform = M
	playsound(src.loc, 'zzz_modular_eclipse/sound/effects/jpeg_boom.ogg', 100, 1)
	var/turf/T = src.loc
	if (istype(T, /turf))
		T.hotspot_expose(1000,100)

/obj/effect/sparks/Initialize()
	. = ..()
	QDEL_IN(src, 1 SECONDS)


/obj/effect/plant/xmass
	name = "festive lights"
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "vine-1"
	vine_icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'


/obj/item/grenade/pinade
	name = "pinecone"
	desc = "A pinecone..?"
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "pinecone"


/obj/item/grenade/pinade/prime()
	new /mob/living/simple_animal/hostile/tree/xmas(get_turf(src))
	new /obj/effect/sparks/jpeg_boom(get_turf(src))
	qdel(src)


/* -- TODO - MAKE A KUDZU VARIANT
/obj/item/grenade/pinade/prime()
	var/T = get_turf(src)
	var/datum/seed/seed = plant_controller.create_random_seed(1)
	seed.set_trait(TRAIT_SPREAD,3)             // So it will function properly as vines.
	seed.set_trait(TRAIT_POTENCY,rand(70, 100)) // 70-100 potency will help guarantee a wide spread and powerful effects.
	seed.set_trait(TRAIT_MATURATION,rand(5, 15))
	seed.force_layer = LOW_OBJ_LAYER //Vines will grow in the background underneath and around objects

	//make vine zero start off fully matured
	var/obj/effect/plant/xmass/vine = new(T,seed)
	vine.health = vine.max_health
	vine.mature_time = 0
	vine.layer = SPACEVINE_LAYER
	vine.Process()
	log_and_message_admins("Spacevines spawned at \the [jumplink(T)]", location = T)

	SSmigration.handle_plant_spreading()
*/

/obj/item/grenade/evilgift
	name = "suspicious gift"
	desc = "A suspicious festive box. Seems to emit agitated growling from time to time."
	icon = 'zzz_modular_eclipse/icons/obj/festive.dmi'
	icon_state = "present_sus"

/obj/item/grenade/evilgift/prime()
	new /mob/living/simple_animal/hostile/foolbox(get_turf(src))
	new /obj/effect/sparks/jpeg_boom(get_turf(src))
	qdel(src)