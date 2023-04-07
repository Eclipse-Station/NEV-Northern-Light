///////////////
// BULLETHEAVEN
///////////////

/obj/machinery/vending/serbomat
	name = "BulletHeaven"
	desc = "Everything you need for protection, in one place!"
	icon = 'zzz_modular_eclipse/gunvendor/vendor.dmi'
	icon_state = "serbomat"
	product_ads = "Don't dial 911, dial .357!;Coming soon: Pink and blue tracer bullets so you can protect your family in the dark!;Did you bring your protection?;Exercise your right to carry today!"		//Need to add more
	no_criminals = TRUE
	products = list(
					/obj/item/storage/deferred/crate/uniform_green = 2, /obj/item/storage/deferred/crate/uniform_brown = 2,
					/obj/item/storage/deferred/crate/uniform_black = 2,
					/obj/item/storage/deferred/crate/uniform_light = 5,
					/obj/item/gun/projectile/boltgun/serbian = 8,
					/obj/item/ammo_magazine/ammobox/lrifle_small = 30,
					/obj/item/storage/box/gunkits/mk58 = 5,
					/obj/item/storage/box/gunkits/mk58_wood = 3,
					/obj/item/storage/box/gunkits/colt = 5,
					/obj/item/ammo_magazine/ammobox/pistol = 30
					)
	prices = list(
					/obj/item/storage/deferred/crate/uniform_green = 2500, /obj/item/storage/deferred/crate/uniform_brown = 2500,
					/obj/item/storage/deferred/crate/uniform_black = 2500,
					/obj/item/storage/deferred/crate/uniform_light = 1750,
					/obj/item/gun/projectile/boltgun/serbian = 1000,
					/obj/item/ammo_magazine/ammobox/lrifle_small = 450,
					/obj/item/storage/box/gunkits/mk58 = 1750,
					/obj/item/storage/box/gunkits/mk58_wood = 2050,
					/obj/item/storage/box/gunkits/colt = 1550,
					/obj/item/ammo_magazine/ammobox/pistol = 500
					)
	idle_power_usage = 211
	auto_price = FALSE
	vendor_department = DEPARTMENT_GUILD


//all these are just to update the bill validator lights
/obj/machinery/vending/serbomat/New()
	..()
	update_icon()

/obj/machinery/vending/serbomat/power_change()
	..()
	update_icon()

/obj/machinery/vending/serbomat/malfunction()
	spawn(20)		//2 seconds is enough time for the icon to change OK.
		update_icon()
	..()		//there is a return statement in ..() so we need that last

/obj/machinery/vending/serbomat/attack_hand()
	spawn(20)
		update_icon()
	..()		//there is a return statement in ..() so we need that last
//this concludes the edits to make bill validator lights work right.

/obj/machinery/vending/serbomat/update_icon()		//bill validator lights

	var/bv_head = "billval-ready"		//"bill validator head" - baseline state if nothing else.

	//let's start with getting the BV state.
	if(stat & BROKEN)
		bv_head = "billval-standby"
	if(stat & NOPOWER)
		bv_head = "billval-offline"

//First, switch it to the lighting plane so we can get the lights working.
	set_plane(ABOVE_LIGHTING_PLANE)

//store that real fast, that's the one we want...
	var/glowplane = plane

//and revert it back to how it was before.
	set_plane(initial(plane))

//now we actually do the lighting magic!
	var/image/overlay = image(icon, bv_head)
	overlay.plane = glowplane
	overlay.layer = ABOVE_LIGHTING_LAYER
	overlay.alpha = 200
	overlays.Cut()		//clear out any overlays we may have
	overlays += overlay		//and apply the overlay.

	. = ..()	//And we go back to how things were.

/* Serbomat changelog

2021-09-17 ------
	Changed Money Account from CIVILIAN to GUILD

2020-07-19 ------
	increased ammo packet costs
		pistol 350 -> 500
		lrifle 400 -> 450
	gun kits now cost 50 more
2020-06-30: ------
	added gun kits (finally)
	added pistol ammo boxes
	changed sprites to proper ones
	changed update_icons code
2020-05-03: ------
	Make sprites generic for now
	Changed name, desc, and slogans.

2020-05-01 ------
	Removed vodka, changed name, removed flak armour, removed vodka
	Pricing changes:
		uniform_green, uniform_brown, uniform_black: 2000 --> 2500
		uniform_light: 1800 --> 1750
		lrifle_small ammo: 300 --> 400
	Stock count changes:
		uniform_green, uniform_brown, uniform_black: 4 --> 2
		uniform_light: 2 --> 5

*/

///////////////
// FROZEN STAR GUNS & AMMO
///////////////

/obj/machinery/vending/weapon_machine
	name = "Frozen Star Guns&Ammo"
	desc = "A self-defense equipment vending machine. When you need to take care of that clown."
	product_slogans = "The best defense is good offense!;Buy for your whole family today!;Nobody can outsmart bullet!;God created man - Frozen Star made them EQUAL!;Stupidity can be cured! By LEAD.;Dead kids can't bully your children!"
	product_ads = "Stunning!;Take justice in your own hands!;LEADearship!"
	icon_state = "weapon"
	no_criminals = TRUE
	products = list(/obj/item/device/flash = 6,
					/obj/item/reagent_containers/spray/pepper = 6,
					/obj/item/gun/projectile/olivaw = 5,
					/obj/item/gun/projectile/giskard = 5,
					/obj/item/gun/energy/gun/martin = 5,
					/obj/item/gun/energy/gun = 5,
					/obj/item/gun/energy/lever_action = 2,
					/obj/item/gun/projectile/revolver/havelock = 5,
					/obj/item/gun/projectile/automatic/atreides = 3,
					/obj/item/gun/projectile/shotgun/pump = 3,
					/obj/item/gun/projectile/automatic/slaught_o_matic = 30,
					/obj/item/ammo_magazine/pistol/rubber = 20,
					/obj/item/ammo_magazine/hpistol/rubber = 5,
					/obj/item/ammo_magazine/slpistol/rubber = 20,
					/obj/item/ammo_magazine/smg/rubber = 15,
					/obj/item/ammo_magazine/ammobox/pistol/rubber = 20,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 10,
					/obj/item/ammo_magazine/ammobox/shotgun/flashshells = 10,
					/obj/item/ammo_magazine/ammobox/shotgun/blanks = 10,
					/obj/item/clothing/accessory/holster = 5,
					/obj/item/clothing/accessory/holster/armpit = 5,
					/obj/item/clothing/accessory/holster/waist = 5,
					/obj/item/clothing/accessory/holster/hip = 5,
					/obj/item/ammo_magazine/slpistol = 5,
					/obj/item/ammo_magazine/pistol = 5,
					/obj/item/ammo_magazine/hpistol = 5,
					/obj/item/ammo_magazine/smg = 3,
					/obj/item/ammo_magazine/ammobox/pistol = 5,
					/obj/item/ammo_magazine/ammobox/shotgun = 3,
					/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 3,
					/obj/item/tool/knife/tacknife = 5,
					/obj/item/storage/box/smokes = 3)

	prices = list(
					/obj/item/ammo_magazine/ammobox/pistol/rubber = 200,
					/obj/item/ammo_magazine/slpistol/rubber = 100,
					/obj/item/ammo_magazine/pistol/rubber = 150,
					/obj/item/ammo_magazine/hpistol = 300,
					/obj/item/ammo_magazine/hpistol/rubber = 200,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 300,
					/obj/item/ammo_magazine/ammobox/shotgun/flashshells = 300,
					/obj/item/ammo_magazine/ammobox/shotgun/blanks = 50,
					/obj/item/ammo_magazine/slpistol = 100,
					/obj/item/ammo_magazine/smg/rubber = 200,
					/obj/item/ammo_magazine/smg = 400,
					/obj/item/ammo_magazine/ammobox/pistol = 500,
					/obj/item/ammo_magazine/ammobox/shotgun = 600,
					/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 600,
					/obj/item/tool/knife/tacknife = 300,
					/obj/item/storage/box/smokes = 200,
					/obj/item/ammo_magazine/pistol = 300,)

/* FS changelog

2022-07-10 ------
	Added CA Maverick.

*/
/obj/machinery/vending/weapon_machine_practice //Adds in practice round vendor for the shooting range
	name = "Frozen Star: Practice Rounds"
	desc = "A self-defense equipment vending machine. For practice use only!"
	product_slogans = "Practice like a pro with Frozen Star's Practice Rounds!;Stay sharp without the risk with Frozen Star's Practice Rounds!;Get realistic training without the danger with Frozen Star's Practice Rounds!;Train smarter, not harder with Frozen Star's Practice Rounds!;The safest way to sharpen your skills - Frozen Star's Practice Rounds!;Practice makes perfect, and Frozen Star's Practice Rounds make it safe!;Train like a pro without the worry with Frozen Star's Practice Rounds!;Unleash your potential with Frozen Star's Practice Rounds!;The most reliable practice ammunition - Frozen Star's Practice Rounds!;Take your training to the next level with Frozen Star's Practice Rounds - completely safe, completely realistic!"
	product_ads = "Tracers not included!;Take justice in your own hands!;Now with 50% less penetration!"
	icon_state = "weapon"
	no_criminals = TRUE
	products = list(/obj/item/ammo_magazine/ammobox/lrifle_small/practice=200,
	/obj/item/ammo_magazine/ammobox/shotgun/practiceshells=200,
	/obj/item/ammo_magazine/ammobox/pistol/practice=200,
	/obj/item/ammo_magazine/ammobox/magnum/practice=200,
	/obj/item/ammo_magazine/ammobox/pistol/practice=200,
	/obj/item/ammo_magazine/ammobox/clrifle_small/practice=200,
	/obj/item/ammo_magazine/ammobox/pistol/practice=200,
	/obj/item/ammo_magazine/ammobox/srifle_small/practice=200)
	prices = list(/obj/item/ammo_magazine/ammobox/lrifle_small/practice=20,
	/obj/item/ammo_magazine/ammobox/shotgun/practiceshells=20,
	/obj/item/ammo_magazine/ammobox/pistol/practice=20,
	/obj/item/ammo_magazine/ammobox/magnum/practice=20,
	/obj/item/ammo_magazine/ammobox/pistol/practice=20,
	/obj/item/ammo_magazine/ammobox/clrifle_small/practice=20,
	/obj/item/ammo_magazine/ammobox/pistol/practice=20,
	/obj/item/ammo_magazine/ammobox/srifle_small/practice=20)