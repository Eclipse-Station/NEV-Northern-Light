/obj/machinery/vending/serbomat
	name = "BulletHeaven"
	desc = "Everything you need for protection, in one place!"
	icon_state = "generic"		//Placeholder
	product_ads = "Don't dial 911, dial .357!;Coming soon: Pink and blue tracer bullets so you can protect your family in the dark!;Did you bring your protection?;Exercise your right to carry today!"		//Need to add more
	products = list(
					/obj/item/weapon/storage/deferred/crate/uniform_green = 2, /obj/item/weapon/storage/deferred/crate/uniform_brown = 2,
					/obj/item/weapon/storage/deferred/crate/uniform_black = 2,
					/obj/item/weapon/storage/deferred/crate/uniform_light = 5,
					/obj/item/weapon/gun/projectile/boltgun/serbian = 8,
					/obj/item/ammo_magazine/ammobox/lrifle_small = 30
					)
	prices = list(
					/obj/item/weapon/storage/deferred/crate/uniform_green = 2500, /obj/item/weapon/storage/deferred/crate/uniform_brown = 2500,
					/obj/item/weapon/storage/deferred/crate/uniform_black = 2500,
					/obj/item/weapon/storage/deferred/crate/uniform_light = 1750,
					/obj/item/weapon/gun/projectile/boltgun/serbian = 1000,
					/obj/item/ammo_magazine/ammobox/lrifle_small = 400
					)
	idle_power_usage = 211
	auto_price = FALSE
	vendor_department = DEPARTMENT_CIVILIAN
	
/* Serbomat changelog
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