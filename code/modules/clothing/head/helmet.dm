/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD | EARS
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 20,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100

/obj/item/clothing/head/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "hm_helmet"
	armor = list(
		melee = 30,
		bullet = 10,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 75

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "Standard-issue Ironhammer helmet with a basic HUD and targeting system included."
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
	price_tag = 150

/obj/item/clothing/head/helmet/riot/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/riot/ui_action_click()
	toggle()

/obj/item/clothing/head/helmet/riot/verb/toggle()
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

/obj/item/clothing/head/helmet/riot/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/riot/update_icon()
	if(hud in src)
		icon_state = "light_riot"
		set_light(0, 0)
	else
		icon_state = "light_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

// S E R B I A //

/obj/item/clothing/head/helmet/steelpot
	name = "steelpot helmet"
	desc = " Titanium helmet of serbian origin. Still widely used despite of its discontinued production."
	icon_state = "steelpot"
	armor = list(melee = 40, bullet = 40, energy = 0, bomb = 40, bio = 0, rad = 0) // slightly buffed IHS helmet minus energy resistance
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/altyn
	name = "green altyn helmet"
	desc = "Green titanium helmet of serbian origin. Still widely used despite of its discontinued production."
	icon_state = "altyn"
	armor = list(melee = 45, bullet = 55, energy = 0, bomb = 35, bio = 0, rad = 0) // slightly better than usual due to mask
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

	tint = TINT_MODERATE
	action_button_name = "Flip Face Shield"
	var/up = 0
	var/base_state

/obj/item/clothing/head/helmet/altyn/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()


/obj/item/clothing/head/helmet/altyn/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		if(src.up)
			src.up = !src.up
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			tint = initial(tint)
			icon_state = base_state
			armor = initial(armor)
			to_chat(usr, "You flip the [src] down to protect your face.")
		else
			src.up = !src.up
			body_parts_covered &= ~(EYES|FACE)
			tint = TINT_NONE
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			icon_state = "[base_state]_up"
			armor = list(melee = 15, bullet = 15, energy = 0, bomb = 15, bio = 0, rad = 0)
			to_chat(usr, "You push the [src] up out of your face.")
		update_wear_icon()	//so our mob-overlays
		usr.update_action_buttons()


/obj/item/clothing/head/helmet/altyn/brown
	name = "brown altyn helmet"
	desc = "Brown titanium helmet of serbian origin. Still widely used despite of its discontinued production."
	icon_state = "altyn_brown"

/obj/item/clothing/head/helmet/altyn/black
	name = "black altyn helmet"
	desc = "Black titanium helmet of serbian origin. Still widely used despite of its discontinued production."
	icon_state = "altyn_black"

/obj/item/clothing/head/helmet/altyn/maska
	name = "maska helmet"
	desc = "I do not know who I am I, don\'t know why I\'m here. All I know is that I must kill."
	icon_state = "maska"
	armor = list(melee = 65, bullet = 65, energy = 0, bomb = 45, bio = 0, rad = 0) // best what you can get, unless you face lasers
	tint = TINT_HEAVY
