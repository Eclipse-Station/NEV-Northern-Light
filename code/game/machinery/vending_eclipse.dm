/obj/machinery/vending/serbomat
	name = "BulletHeaven"
	desc = "All the gun food you'll ever need."
	icon = 'zzz_modular_eclipse/gunvendor/vendor.dmi'
	icon_state = "serbomat"
	product_ads = "Don't dial 911, dial .357!;Coming soon: Pink and blue tracer bullets so you can protect your family in the dark!;Did you bring your protection?;Exercise your right to carry today!"		//Need to add more
	no_criminals = TRUE
	products = list(
					/obj/item/ammo_magazine/slpistol/rubber = 10,
					/obj/item/ammo_magazine/pistol/rubber = 20,
					/obj/item/ammo_magazine/hpistol/rubber = 10,
					/obj/item/ammo_magazine/smg/rubber =10,
					/obj/item/ammo_magazine/ammobox/pistol/rubber = 20,
					/obj/item/ammo_magazine/slmagnum/rubber = 10,
					/obj/item/ammo_magazine/magnum/rubber = 5,
					/obj/item/ammo_magazine/msmg/rubber = 5,
					/obj/item/ammo_magazine/ammobox/magnum/rubber = 10,
					/obj/item/ammo_magazine/cspistol/rubber = 5,
					/obj/item/ammo_magazine/ammobox/clrifle_small/rubber = 5,
					/obj/item/ammo_casing/shotgun/beanbag/prespawned = 20,
					/obj/item/weapon/storage/box/shotgunammo/beanbags = 5,
					/obj/item/weapon/cell/small/high = 10
					)
	prices = list(
					/obj/item/ammo_magazine/slpistol/rubber = 90,
					/obj/item/ammo_magazine/pistol/rubber = 200,
					/obj/item/ammo_magazine/hpistol/rubber = 260,
					/obj/item/ammo_magazine/smg/rubber = 500,
					/obj/item/ammo_magazine/ammobox/pistol/rubber = 300,
					/obj/item/ammo_magazine/slmagnum/rubber = 100,
					/obj/item/ammo_magazine/magnum/rubber = 220,
					/obj/item/ammo_magazine/msmg/rubber = 550,
					/obj/item/ammo_magazine/ammobox/magnum/rubber = 360,
					/obj/item/ammo_magazine/cspistol/rubber = 250,
					/obj/item/ammo_magazine/ammobox/clrifle_small/rubber = 900,
					/obj/item/ammo_casing/shotgun/beanbag/prespawned = 75,
					/obj/item/weapon/storage/box/shotgunammo/beanbags = 575,
					/obj/item/weapon/cell/small/high = 500
					)
	idle_power_usage = 211
	auto_price = FALSE
	vendor_department = DEPARTMENT_CIVILIAN


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
2020-07-19
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
