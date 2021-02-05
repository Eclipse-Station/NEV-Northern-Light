/datum/trade_station/fs_factory
<<<<<<< HEAD
	name_pool = list("HMS 'Kaida'" = "Hephaestus Manufacturing Station 'Kaida'. Welcome, sir or madam. This is the UNDEFINED branch of the Hephaestus Industries, supplying the galaxy with only the finest armaments since 2155.")
=======
	name_pool = list("FSTB 'Kaida'" = "Frozen Star Trade Beacon 'Kaida'. Maybe they have an extra batch of weapon?")
>>>>>>> b75c082... Re:Cargo: "Integration of spawn tags" Deluxe Edition (#5832)
	markup = 0.5
	assortiment = list(
		"Ammunition" = list(
			/obj/item/ammo_magazine/ammobox/magnum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/slmagnum = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/ammobox/magnum/rubber = custom_good_amount_range(list(1, 10)),
			/obj/item/ammo_magazine/slmagnum/rubber = custom_good_amount_range(list(1, 10)),

			/obj/item/ammo_magazine/m12,
			/obj/item/ammo_magazine/m12/beanbag,
			/obj/item/ammo_magazine/lrifle,
			/obj/item/ammo_magazine/smg,
			/obj/item/ammo_magazine/pistol,
			/obj/item/ammo_magazine/hpistol,
			/obj/item/ammo_magazine/m12
		),
		category_data("Projectiles", list(SPAWN_FS_PROJECTILE)),
		category_data("Shotguns", list(SPAWN_FS_SHOTGUN)),
		category_data("Energy", list(SPAWN_FS_ENERGY)),/* = list(
			/obj/item/weapon/gun/energy/gun,
			/obj/item/weapon/gun/energy/gun/martin,
		),*/
		"Grenades" = list(
			/obj/item/weapon/gun/launcher/grenade/lenar,
			/obj/item/weapon/grenade/chem_grenade/incendiary,
			/obj/item/weapon/grenade/chem_grenade/teargas,
			/obj/item/weapon/grenade/empgrenade,
			/obj/item/weapon/grenade/empgrenade/low_yield,
			/obj/item/weapon/grenade/flashbang,
			/obj/item/weapon/grenade/smokebomb,
		)
	)
