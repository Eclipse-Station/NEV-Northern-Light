/obj/item/clothing/head/armor
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	body_parts_covered = HEAD | EARS
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.6
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
	spawn_tags = SPAWN_TAG_CLOTHING_HEAD_HELMET
	bad_types = /obj/item/clothing/head/armor
	rarity_value = 10
	style = 0

/*
 * Helmets
 */
/obj/item/clothing/head/armor/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	rarity_value = 5
	armor = list(
		melee = 35,
		bullet = 30,
		energy = 30,
		bomb = 20,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/visor
	desc = "Standard Security gear. Protects the head from impacts. Has a permanently affixed visor to protect the eyes."
	icon_state = "helmet_visor"
	body_parts_covered = HEAD | EARS | EYES
	rarity_value = 6.66

/obj/item/clothing/head/armor/helmet/merchelm
	name = "Heavy Armour Helmet"
	desc = "A high-quality helmet in a fetching tan. Very durable"
	icon_state = "merchelm"
	body_parts_covered = HEAD | EARS | EYES | FACE
	armor = list(
		melee = 50,
		bullet = 50,
		energy = 50,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	flash_protection = FLASH_PROTECTION_MAJOR
	price_tag = 500

/obj/item/clothing/head/armor/helmet/dermal
	name = "Dermal Armour Patch"
	desc = "You're not quite sure how you manage to take it on and off, but it implants nicely in your head."
	icon_state = "dermal"
	body_parts_covered = HEAD
	flags_inv = NONE
	rarity_value = 50

/obj/item/clothing/head/armor/helmet/ironhammer
	name = "operator helmet"
	desc = "Aegis Security gear. Protects the head from impacts."
	icon_state = "helmet_ironhammer"
	rarity_value = 50

/obj/item/clothing/head/armor/helmet/technomancer
	name = "technomancer helmet"
	desc = "A piece of armor used in hostile work conditions to protect the head. Comes with a built-in flashlight."
	icon_state = "technohelmet"
	body_parts_covered = HEAD|EARS|EYES|FACE
	item_flags = THICKMATERIAL
	flags_inv = BLOCKHEADHAIR|HIDEEARS|HIDEEYES|HIDEFACE
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	armor = list(
		melee = 45,
		bullet = 35,
		energy = 35,
		bomb = 30,
		bio = 15,
		rad = 30
	)//Mix between hardhat.dm armor values, helmet armor values in armor.dm, and armor values for TM void helmet in station.dm.
	flash_protection = FLASH_PROTECTION_MAJOR
	price_tag = 500

/obj/item/clothing/head/armor/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "helmet_handmade"
	armor = list(
		melee = 35,
		bullet = 25,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 75

/obj/item/clothing/head/armor/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/armor/bulletproof
	name = "bulletproof helmet"
	desc = "A bulletproof helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	body_parts_covered = HEAD | EARS | EYES | FACE
	armor = list(
		melee = 30,
		bullet = 50,
		energy = 25,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	price_tag = 400
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg //currently junk-only
	name = "tactical ballistic helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt nightvision HUD."
	icon_state = "bulletproof_ironhammer"
	body_parts_covered = HEAD | EARS
	action_button_name = "Toggle Night Vision"
	var/obj/item/clothing/glasses/bullet_proof_ironhammer/hud
	price_tag = 600

/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg/ui_action_click()
	if(..())
		return TRUE
	toggle()


/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg/verb/toggle()
	set name = "Toggle Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses))
			to_chat(user, "You enable security hud on [src].")
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way.")
	else
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(user, "You disable security hud on [src].")
		hud.forceMove(src)
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/armor/bulletproof/ironhammer_nvg/update_icon()
	if(hud in src)
		icon_state = "bulletproof_ironhammer"
		set_light(0, 0)
	else
		icon_state = "bulletproof_ironhammer_on"
		set_light(1, 1, COLOR_LIGHTING_GREEN_MACHINERY)
	update_wear_icon()
	..()

/obj/item/clothing/head/armor/bulletproof/ironhammer_full
	name = "full ballistic helmet"
	desc = "Standard-issue Ironhammer ballistic helmet with a basic HUD included, covers the operator's entire face."
	icon_state = "ironhammer_full"
	armor = list(
		melee = 40,
		bullet = 60,
		energy = 35,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 500

/obj/item/clothing/head/armor/bulletproof/ironhammer_full/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/armor/bulletproof/ironhammer_full/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/armor/bulletproof/ironhammer_full/verb/toggle()
	set name = "Toggle Security HUD"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses))
			to_chat(user, "You enable security hud on [src].")
			update_icon()
	else
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(user, "You disable security hud on [src].")
		hud.forceMove(src)
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/armor/bulletproof/ironhammer_full/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/armor/bulletproof/ironhammer_full/update_icon()
	if(hud in src)
		icon_state = "ironhammer_full"
		set_light(0, 0)
	else
		icon_state = "ironhammer_full_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

/obj/item/clothing/head/armor/laserproof //TODO: Give it reflection capabilities after refactor
	name = "ablative helmet"
	desc = "A ablative security helmet that excels in protecting the wearer against energy and laser projectiles."
	icon_state = "ablative"
	body_parts_covered = HEAD | EARS | EYES
	flags_inv = HIDEEARS | HIDEEYES
	rarity_value = 25
	armor = list(
		melee = 30,
		bullet = 25,
		energy = 75,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0
	price_tag = 325

// Riot helmet
/obj/item/clothing/head/armor/riot
	name = "riot helmet"
	desc = "It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	body_parts_covered = HEAD|FACE|EARS
	var/list/armor_up = list(melee = 35, bullet = 25, energy = 25, bomb = 20, bio = 0, rad = 0)
	var/list/armor_down = list(melee = 40, bullet = 40, energy = 30, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	tint = TINT_MODERATE
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Flip Face Shield"
	var/up = FALSE
	price_tag = 150
	rarity_value = 25

/obj/item/clothing/head/armor/riot/Initialize()
	. = ..()
	armor = up ? armor_up : armor_down
	update_icon()

/obj/item/clothing/head/armor/riot/attack_self()
	toggle()

/obj/item/clothing/head/armor/riot/update_icon()
	icon_state = up ? "[initial(icon_state)]_up" : initial(icon_state)

/obj/item/clothing/head/armor/riot/verb/toggle()
	set category = "Object"
	set name = "Adjust riot helmet"
	set src in usr

	if(!usr.incapacitated())
		src.up = !src.up

		if(src.up)
			body_parts_covered &= ~(EYES|FACE)
			tint = TINT_NONE
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = FLASH_PROTECTION_NONE
			armor = armor_up
			to_chat(usr, "You push the [src] up out of your face.")
		else
			body_parts_covered |= (EYES|FACE)
			tint = initial(tint)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = initial(flash_protection)
			armor = armor_down
			to_chat(usr, "You flip the [src] down to protect your face.")

		update_icon()
		update_wear_icon()	//update our mob overlays
		usr.update_action_buttons()


/*
 * Ironhammer riot helmet with HUD
 */
/obj/item/clothing/head/armor/riot_hud
	name = "riot helmet"
	desc = "Standard-issue Aegis helmet with a basic HUD and targeting system included."
	icon_state = "light_riot"
	body_parts_covered = HEAD|FACE|EARS
	armor = list(
		melee = 75,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 300

/obj/item/clothing/head/armor/riot_hud/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/armor/riot_hud/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/armor/riot_hud/verb/toggle()
	set name = "Toggle Security Hud"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses))
			to_chat(user, "You enable security hud on [src].")
			update_icon()
	else
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(user, "You disable security hud on [src].")
		hud.forceMove(src)
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/armor/riot_hud/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/armor/riot_hud/update_icon()
	if(hud in src)
		icon_state = "light_riot"
		set_light(0, 0)
	else
		icon_state = "light_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

// S E R B I A //

/obj/item/clothing/head/armor/steelpot
	name = "steelpot helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "steelpot"
	armor = list(melee = 40, bullet = 35, energy = 0, bomb = 30, bio = 0, rad = 0) // slightly buffed IHS helmet minus energy resistance
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/armor/altyn
	name = "altyn helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "altyn"
	var/list/armor_up = list(melee = 20, bullet = 15, energy = 0, bomb = 15, bio = 0, rad = 0)
	var/list/armor_down = list(melee = 40, bullet = 40, energy = 0, bomb = 35, bio = 0, rad = 0) // slightly better than usual due to mask
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHEADHAIR
	flash_protection = FLASH_PROTECTION_MAJOR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1
	rarity_value = 50

	action_button_name = "Flip Face Shield"
	var/up = TRUE


/obj/item/clothing/head/armor/altyn/Initialize()
	. = ..()
	armor = up ? armor_up : armor_down
	update_icon()

/obj/item/clothing/head/armor/altyn/update_icon()
	icon_state = up ? "[initial(icon_state)]_up" : initial(icon_state)

/obj/item/clothing/head/armor/altyn/attack_self()
	toggle()


/obj/item/clothing/head/armor/altyn/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.up = !src.up

		if(src.up)
			body_parts_covered &= ~(EYES|FACE)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = FLASH_PROTECTION_NONE
			armor = armor_up
			to_chat(usr, "You push the [src] up out of your face.")
		else
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = initial(flash_protection)
			armor = armor_down
			to_chat(usr, "You flip the [src] down to protect your face.")

		update_icon()
		update_wear_icon()	//update our mob overlays
		usr.update_action_buttons()


/obj/item/clothing/head/armor/altyn/brown
	icon_state = "altyn_brown"

/obj/item/clothing/head/armor/altyn/black
	icon_state = "altyn_black"

/obj/item/clothing/head/armor/altyn/maska
	name = "maska helmet"
	desc = "\"I do not know who I am, I don\'t know why I\'m here. All I know is that I must kill.\""
	icon_state = "maska"
	armor_down = list(melee = 55, bullet = 55, energy = 0, bomb = 45, bio = 0, rad = 0) // best what you can get, unless you face lasers
	rarity_value = 100

/obj/item/clothing/head/armor/helmet/visor/cyberpunkgoggle
	name = "\improper Type-34C Semi-Enclosed Headwear"
	desc = "Civilian model of a popular helmet used by certain law enforcement agencies. It does not have any armor plating, but has a neo-laminated fabric lining."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	siemens_coefficient = 0.9	//More conductive than most helmets
	rarity_value = 5.55
	armor = list(
		melee = 5,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)
