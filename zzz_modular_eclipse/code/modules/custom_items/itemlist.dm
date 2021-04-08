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
	body_parts_covered = HEAD|EYES
	icon_override = 'zzz_modular_eclipse/icons/custom_items/mob.dmi'
	spawn_blacklisted = TRUE


/obj/item/weapon/gun/energy/modkit/catgun
	name = "Fortunate"
	icon_state = "m16a1"
	item_state = "m16a1"
	desc = "A high quality reproduction of an ancient earth assault rifle, this one has an underslung grenade launcher. \
	You feel like you could run through a jungle with this."
	icon = 'zzz_modular_eclipse/icons/custom_items/catgun.dmi'
	modtype = /obj/item/weapon/gun/projectile/boltgun/serbian
	spawn_new = /obj/item/weapon/gun/projectile/automatic/z8/m16a1

/obj/item/weapon/gun/projectile/automatic/z8/m16a1
	name = "M16A1 \"Grenadier\""
	desc = "A high quality reproduction of an ancient earth assault rifle, this one has an underslung grenade launcher."
	icon = 'zzz_modular_eclipse/icons/custom_items/catgun.dmi'
	icon_state = "m16a1"
	item_state = "m16a1"
	wielded_item_state = "_doble"
	price_tag = 2000

	penetration_multiplier = 0.8
	damage_multiplier = 0.8


/obj/item/weapon/gun/projectile/automatic/z8/m16a1/update_icon()
	if(wielded_item_state)
		if(icon_contained)//If it has it own icon file then we want to pull from that.
			if(wielded)
				item_state_slots[slot_l_hand_str] = "lefthand"  + wielded_item_state
				item_state_slots[slot_r_hand_str] = "righthand" + wielded_item_state
			else
				item_state_slots[slot_l_hand_str] = "lefthand"
				item_state_slots[slot_r_hand_str] = "righthand"
		else//Otherwise we can just pull from the generic left and right hand icons.
			if(wielded)
				item_state_slots[slot_l_hand_str] = wielded_item_state
				item_state_slots[slot_r_hand_str] = wielded_item_state
			else
				item_state_slots[slot_l_hand_str] = initial(item_state)
				item_state_slots[slot_r_hand_str] = initial(item_state)

/obj/item/weapon/reagent_containers/food/snacks/fortunecookie/catcookie
	name = "Lucky cookie"
	desc = "A fortune cookie with an imprint of a robotic face. Smells like ginger and honey."
	spawn_blacklisted = TRUE
	var/obj/item/weapon/paper/cookiepaper

/obj/item/weapon/reagent_containers/food/snacks/fortunecookie/catcookie/New()
	. = ..()
	cookiepaper = new /obj/item/weapon/paper(src)
	cookiepaper.info = {"Sorry for the hold up, hope you enjoy! :) \
	- N"}
	trash = cookiepaper

