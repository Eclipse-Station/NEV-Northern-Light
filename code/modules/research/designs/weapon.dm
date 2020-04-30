/datum/design/research/item/weapon
	category = CAT_WEAPON

// Weapons
/datum/design/research/item/weapon/AssembleDesignDesc()
	if(!desc && build_path)
		var/obj/item/I = build_path
		desc = initial(I.desc)
	else
		..()

/datum/design/research/item/weapon/stunrevolver
	build_path = /obj/item/weapon/gun/energy/stunrevolver
	sort_string = "TAAAA"

/datum/design/research/item/weapon/nuclear_gun
	build_path = /obj/item/weapon/gun/energy/gun/nuclear
	sort_string = "TAAAB"

/datum/design/research/item/weapon/lasercannon
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	build_path = /obj/item/weapon/gun/energy/lasercannon
	sort_string = "TAAAC"

/datum/design/research/item/weapon/c20r
	name = "C20R-prototype"
	desc = "The C-20r is a lightweight and rapid-firing SMG. Uses 10mm rounds."
	build_path = /obj/item/weapon/gun/projectile/automatic/c20r
	sort_string = "TAAAF"

/datum/design/research/item/weapon/phoronpistol
	build_path = /obj/item/weapon/gun/energy/toxgun
	sort_string = "TAAAD"

/datum/design/research/item/weapon/decloner
	build_path = /obj/item/weapon/gun/energy/decloner
	sort_string = "TAAAE"

/datum/design/research/item/weapon/chemsprayer
	desc = "An advanced chem spraying device."
	build_path = /obj/item/weapon/reagent_containers/spray/chemsprayer
	sort_string = "TABAA"

/datum/design/research/item/weapon/rapidsyringe
	build_path = /obj/item/weapon/gun/launcher/syringe/rapid
	sort_string = "TABAB"

/datum/design/research/item/weapon/temp_gun
	desc = "A gun that shoots high-powered glass-encased energy temperature bullets."
	build_path = /obj/item/weapon/gun/energy/temperature
	sort_string = "TABAC"

/datum/design/research/item/weapon/large_grenade
	build_path = /obj/item/weapon/grenade/chem_grenade/large
	sort_string = "TACAA"

/datum/design/research/item/weapon/flora_gun
	build_path = /obj/item/weapon/gun/energy/floragun
	sort_string = "TBAAA"

/datum/design/research/item/weapon/bluespace_harpoon
	build_path = /obj/item/weapon/bluespace_harpoon
	sort_string = "TBAAB"

/datum/design/research/item/weapon/hatton
	name = "NanoTrasen BT \"Q-del\""
	desc = "This breaching tool was reverse engineered from the \"Hatton\" design.\
			Despite the Excelsior \"Hatton\" being traded on the free market through Technomancer League channels,\
			this device suffers from a wide number of reliability issues stemming from it being lathe printed."
	//Eclipse Note: Leaving this reference to technomancers intact since it doesn't imply that our engineering staff is contracted out ^Spitzer
	build_path = /obj/item/weapon/hatton/moebius
	sort_string = "TBAAD"


// Ammo
/datum/design/research/item/ammo
	name_category = "ammunition"
	category = CAT_WEAPON

/datum/design/research/item/ammo/hatton
	name = "NanoTrasen BT \"Q-del\" gas tube"
	build_path = /obj/item/weapon/hatton_magazine/moebius
	sort_string = "TAACC"

/datum/design/research/item/ammo/c20r_ammo
	name = "C20R 35 Auto Magazine"
	desc = "35 Auto SMG magazine for the C-20r"
	build_path = /obj/item/ammo_magazine/smg
	sort_string = "TAACD"

/datum/design/research/item/ammo/shotgun_incendiary
	name = "incendiary shotgun shells"
	desc = "Insendiary ammunition for shotguns"
	build_path = /obj/item/ammo_casing/shotgun/incendiary/prespawned
	sort_string = "TAACF"

