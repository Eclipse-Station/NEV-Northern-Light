/*		BALLS - GLORIOUS BALLS
//
//	Includes:-
//		1) Tennis balls, lines 10 - 92
//
//
//
*/

/obj/item/toy/tennis
	name = "tennis ball"
	desc = "A classical tennis ball. It appears to have faint bite marks scattered all over its surface."
	icon = 'zzz_modular_syzygy/icons/obj/toys.dmi'
	icon_state = "tennis_classic"
	item_icons = list(
		slot_l_hand_str = 'zzz_modular_syzygy/icons/mob/toys_l.dmi',
		slot_r_hand_str = 'zzz_modular_syzygy/icons/mob/toys_r.dmi',
		slot_head_str = 'zzz_modular_syzygy/icons/mob/toys_mouth.dmi',
		slot_wear_mask_str = 'zzz_modular_syzygy/icons/mob/toys_mouth.dmi'		)
	item_state = "tennis_classic"
	slot_flags = SLOT_HEAD | SLOT_MASK
	throw_range = 14
	w_class = ITEM_SIZE_SMALL
	var/spam_flag = 0

/obj/item/toy/tennis/attack_self(mob/user as mob) //Hjonk
	if (spam_flag == 0)
		spam_flag = 1
		playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)
		src.add_fingerprint(user)
		spawn(20)
			spam_flag = 0

/obj/item/toy/tennis/rainbow
	name = "pseudo-euclidean interdimensional tennis sphere"
	desc = "A tennis ball from another plane of existance. Really groovy."
	icon_state = "tennis_rainbow"
	item_state = "tennis_rainbow"

/obj/item/toy/tennis/rainbow/izzy	//izzyinbox's donator item
	name = "Katlin's Ball"
	desc = "A tennis ball that's seen a good bit of love, being covered in a few black and white hairs and slobber."
	icon_state = "tennis_izzy"
	item_state = "tennis_izzy"

/obj/item/toy/tennis/red	//da red wuns go fasta
	name = "red tennis ball"
	desc = "A red tennis ball. It goes three times faster!"
	icon_state = "tennis_red"
	item_state = "tennis_red"
	throw_speed = 9

/obj/item/toy/tennis/yellow	//because yellow is hot I guess
	name = "yellow tennis ball"
	desc = "A yellow tennis ball."
	icon_state = "tennis_yellow"
	item_state = "tennis_yellow"

/obj/item/toy/tennis/green	//pestilence
	name = "green tennis ball"
	desc = "A green tennis ball."
	icon_state = "tennis_green"
	item_state = "tennis_green"

/obj/item/toy/tennis/cyan	//electric
	name = "cyan tennis ball"
	desc = "A cyan tennis ball."
	icon_state = "tennis_cyan"
	item_state = "tennis_cyan"

/obj/item/toy/tennis/blue	//reliability
	name = "blue tennis ball"
	desc = "A blue tennis ball."
	icon_state = "tennis_blue"
	item_state = "tennis_blue"

/obj/item/toy/tennis/purple	//because purple dyes have high pH and would neutralize acids I guess
	name = "purple tennis ball"
	desc = "A purple tennis ball."
	icon_state = "tennis_purple"
	item_state = "tennis_purple"

