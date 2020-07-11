/obj/machinery/vending/serbomat
	name = "BulletHeaven"
	desc = "Everything you need for protection, in one place!"
	icon = 'zzz_modular_eclipse/gunvendor/vendor.dmi'
	icon_state = "serbomat"
	product_ads = "Don't dial 911, dial .357!;Coming soon: Pink and blue tracer bullets so you can protect your family in the dark!;Did you bring your protection?;Exercise your right to carry today!"		//Need to add more
	no_criminals = TRUE
	products = list(
					/obj/item/weapon/storage/deferred/crate/uniform_green = 2, /obj/item/weapon/storage/deferred/crate/uniform_brown = 2,
					/obj/item/weapon/storage/deferred/crate/uniform_black = 2,
					/obj/item/weapon/storage/deferred/crate/uniform_light = 5,
					/obj/item/weapon/gun/projectile/boltgun/serbian = 8,
					/obj/item/ammo_magazine/ammobox/lrifle_small = 30,
					/obj/item/weapon/storage/box/gunkits/mk58 = 5,
					/obj/item/weapon/storage/box/gunkits/mk58_wood = 3,
					/obj/item/weapon/storage/box/gunkits/colt = 5,
					/obj/item/ammo_magazine/ammobox/pistol = 30
					)
	prices = list(
					/obj/item/weapon/storage/deferred/crate/uniform_green = 2500, /obj/item/weapon/storage/deferred/crate/uniform_brown = 2500,
					/obj/item/weapon/storage/deferred/crate/uniform_black = 2500,
					/obj/item/weapon/storage/deferred/crate/uniform_light = 1750,
					/obj/item/weapon/gun/projectile/boltgun/serbian = 1000,
					/obj/item/ammo_magazine/ammobox/lrifle_small = 400,
					/obj/item/weapon/storage/box/gunkits/mk58 = 1700,
					/obj/item/weapon/storage/box/gunkits/mk58_wood = 2000,
					/obj/item/weapon/storage/box/gunkits/colt = 1500,
					/obj/item/ammo_magazine/ammobox/pistol = 350
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