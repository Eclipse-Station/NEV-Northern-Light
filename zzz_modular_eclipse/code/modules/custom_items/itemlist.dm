/obj/item/clothing/shoes/jackboots/bugboots
	name = "B.U.G. command boots"
	desc = "A set of worn in and well polished Jack Boots with a custom-made compartment along the side to comfortably fit any reasonable \
	blade and then some. Burned into the back heel it says \"if found return to Bellow Rose.\" \
	The entire thing has an authoritative presence, bug guts and blood can still be seen in sole despite it's rigorous cleaning."
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/storage/leather_jacket/ripley
	name = "Ripley\'s leather jacket"
	desc = "An old, worn but sturdy looking leather jacket that seems to have been maintained for many years. \
	Above the left breast is a name tag sewn into it that reads \"Jack Ripley\"."
	spawn_blacklisted = TRUE

/obj/item/clothing/head/hardhat/visor/pinkwaffle
	name = "Marilene Endsley\'s Hardhat"
	icon = 'zzz_modular_eclipse/icons/custom_items/head.dmi'
	icon_state = "hardhat_pink_visor"
	desc = "A redecorated piece of headgear used in dangerous working conditions to protect the head. \
	It has been painted pink and the protective visor has a green hue. The initials M.E. are engraved on the back."
	body_parts_covered = HEAD|EYES
	icon_override = 'zzz_modular_eclipse/icons/custom_items/mob.dmi'
	spawn_blacklisted = TRUE


/obj/item/gun/energy/modkit/catgun
	name = "Fortunate"
	icon_state = "m16a1"
	item_state = "m16a1"
	desc = "A high quality reproduction of an ancient earth assault rifle, this one has an underslung grenade launcher. \
	You feel like you could run through a jungle with this."
	icon = 'zzz_modular_eclipse/icons/custom_items/catgun.dmi'
	modtype = /obj/item/gun/projectile/boltgun/serbian
	spawn_new = /obj/item/gun/projectile/automatic/z8/m16a1

/obj/item/gun/projectile/automatic/z8/m16a1
	name = "M16A1 \"Grenadier\""
	desc = "A high quality reproduction of an ancient earth assault rifle, this one has an underslung grenade launcher."
	icon = 'zzz_modular_eclipse/icons/custom_items/catgun.dmi'
	icon_state = "m16a1"
	item_state = "m16a1"
	wielded_item_state = "_doble"
	price_tag = 2000

	penetration_multiplier = 0.8
	damage_multiplier = 0.8


/obj/item/gun/projectile/automatic/z8/m16a1/update_icon()
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

/obj/item/reagent_containers/food/snacks/fortunecookie/catcookie
	name = "Lucky cookie"
	desc = "A fortune cookie with an imprint of a robotic face. Smells like ginger and honey."
	spawn_blacklisted = TRUE
	var/obj/item/paper/cookiepaper

/obj/item/reagent_containers/food/snacks/fortunecookie/catcookie/New()
	. = ..()
	cookiepaper = new /obj/item/paper(src)
	cookiepaper.info = {"Sorry for the hold up, hope you enjoy! :) \
	- N"}
	trash = cookiepaper

/obj/item/clothing/under/bambi
	name = "Bambi\'s Black Bodysuit"
	desc = "A skintight black bodysuit made from a synthetic fabric, it'd look almost like a one-piece swimsuit had the fabric been a little thinner. One of Bambi Boemus' favourite articles of clothing."
	icon = 'zzz_modular_eclipse/icons/custom_items/timidvi.dmi'
	icon_state = "bodysuit"
	item_state = "bodysuit"
	icon_override = 'zzz_modular_eclipse/icons/custom_items/timidvi.dmi'
	icon_override_female = 'zzz_modular_eclipse/icons/custom_items/timidvi.dmi'
	spawn_blacklisted = TRUE

/obj/item/clothing/under/rank/dalphine
	name = "Dalphine Panzer\'s Aegis Jager suit"
	desc = "A high speed low drag combat suit utilized as a special purpose replacement for standard uniforms issued to stealth specialists and special operations."
	icon = 'zzz_modular_eclipse/icons/custom_items/scorn7.dmi'
	icon_state = "Aegis_tacsuit_F"
	item_state = "Aegis_tacsuit_F"
	icon_override = 'zzz_modular_eclipse/icons/custom_items/scorn7.dmi'
	icon_override_female = 'zzz_modular_eclipse/icons/custom_items/scorn7.dmi'
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/storage/apron/kira
	name = "Kira\'s Work Apron"
	desc = "A Pink Apron that is adjusted to have pockets so that she can work in a minimal amount of clothing given the right client at the right time."
	icon = 'zzz_modular_eclipse/icons/custom_items/yuritakashi.dmi'
	icon_state = "kira_mob"
	item_state = "kira"
	icon_override = 'zzz_modular_eclipse/icons/custom_items/yuritakashi.dmi'
	spawn_blacklisted = TRUE

/obj/item/clothing/suit/storage/neotheology_coat/rikkan
	name = "Rikkan\'s well worn coat"
	desc = "Probably should print another eventually. Despite the rest of the damage the sleeves seem to be intentionally torn off, and there's a small rose hairpin sewn into the lining."
	icon = 'zzz_modular_eclipse/icons/custom_items/jaxtalmk2.dmi'
	icon_state = "rikkan_mob"
	item_state = "rikkan"
	icon_override = 'zzz_modular_eclipse/icons/custom_items/jaxtalmk2.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS
	spawn_blacklisted = TRUE

/obj/item/clothing/head/beret/purple/sela
	name = "worn squadron leader beret"
	desc = "hat might seem like a just another worn-out piece of headwear, reveals to be much more upon closer inspection. This beret seems to be connected to an unidentified fighter wing, the emblem on the front of the beret's been worn down to the point that it's only distinct feature are three small chevrons flying in formation with each other. Though age has taken it's toll, the beret seems to be lovingly cared for, as there are small signs of repair upon the fabric."
	icon_state = "beret_purple"
