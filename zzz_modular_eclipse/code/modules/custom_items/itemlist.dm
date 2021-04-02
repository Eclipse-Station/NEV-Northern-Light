/obj/item/clothing/shoes/jackboots/bugboots
	name = "B.U.G. command boots"
	desc = "A set of worn in and well polished Jack Boots with a custom-made compartment along the side to comfortably fit any reasonable\
	blade and then some. Burned into the back heel it says \"if found return to Bellow Rose.\" \
	The entire thing has an authoritative presence, bug guts and blood can still be seen in sole despite it's rigorous cleaning."
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/storage/leather_jacket/ripley
	name = "Ripley's leather jacket"
	desc = "An old, worn but sturdy looking leather jacket that seems to have been maintained for many years. \
	Above the left breast is a name tag sewn into it that reads \"Jack Ripley\"."
	spawn_blacklisted = TRUE

/obj/item/clothing/head/hardhat/visor/pinkwaffle
	name = "Marilene Endsley's Hardhat"
	icon = 'zzz_modular_eclipse/icons/custom_items/head.dmi'
	icon_state = "hardhat_pink_visor"
	desc = "A redecorated piece of headgear used in dangerous working conditions to protect the head. \
	It has been painted pink and the protective visor has a green hue. The initials M.E. are engraved on the back."
	icon_override = 'zzz_modular_eclipse/icons/custom_items/mob.dmi'
	spawn_blacklisted = TRUE


/obj/item/weapon/gun/projectile/revolver/capgun/jk47
	name = "FS AR .30 \"Kalashnikov\""
	icon = 'icons/obj/guns/projectile/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	desc = "Long, flat, gun shaped noodle. A staple of Oberth cuisine. \
	However, Oberthians have a culturally embedded fear of being hit by a spinning gun-noodle, \
	as adolescent Oberthians claim that the limp and wiggly properties of the noodle are transferred to new carriers on contact. \
	There is an engraving near the stock - \"I.O.U. 1 Gun - Nestor\""
	caliber = CAL_CAP
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	price_tag = 200
	handle_casings = CYCLE_CASINGS
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/cap
	spawn_tags = SPAWN_TAG_ITEM_TOY
	spawn_blacklisted = TRUE
