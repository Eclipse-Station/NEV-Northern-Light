/*
 * Contains:
 *		Security
 *		Inspector
 *		Aegis Commander
 */

/*
 * Security
 */

/obj/item/clothing/under/security_formal
	name = "Aegis Operative formal uniform"
	desc = "A navy blue suit. Often used by Aegis personnel, for shooting with style."
	icon_state = "ih_formal"
	item_state = "ih_formal"
	spawn_blacklisted = TRUE

/obj/item/clothing/under/rank/warden
	desc = "The uniform worn by Aegis Sergeants, the sight of it is often followed by shouting. It has\"Gunnery Sergeant\" rank pins on the shoulders."
	name = "Gunnery Sergeant jumpsuit"
	icon_state = "warden"
	item_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/warden/skirt
	name = "Gunnery Sergeant jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for more robust protection. It has\"Gunnery Sergeant\" rank pins on the shoulders."
	icon_state = "warden_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/head/warden //legacy security hat
	name = "warden hat"
	desc = "A special helmet issued to the Warden of a securiy force."
	icon_state = "policehelm"
	body_parts_covered = NONE

/obj/item/clothing/under/rank/security
	name = "Aegis Operative jumpsuit"
	desc = "The standard issue uniform of Aegis grunts all over the sector."
	icon_state = "security"
	item_state = "ba_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/security/turtleneck
	name = "Aegis Operative's turtleneck"
	desc = "Same as the standard Aegis uniform but with a sleek black military style sweater. Best used in cold environments"
	icon_state = "securityrturtle"

/obj/item/clothing/under/rank/security/skirt
	name = "Aegis Operative jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection."
	icon_state = "security_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/medspec
	name = "Medical Specialist jumpsuit"
	desc = "An Aegis uniform modified for use by medics. Comes with a white shirt and medical insignia. It has \"Specialist\" rank pins on the shoulders."
	icon_state = "medspec"
	item_state = "ba_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/medspec/skirt
	name = "Medical Specialist jumpskirt"
	desc = "It's made of a slightly sturdier material than standard jumpskirts, to allow for robust protection. It has \"Specialist\" rank pins on the shoulders."
	icon_state = "medspec_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/*
 * Inspector
 */
/obj/item/clothing/under/rank/inspector
	name = "inspector's suit"
	desc = "Casual turtleneck and jeans, civilian clothes of the Aegis Inspector."
	icon_state = "insp_under"
	item_state = "insp_under"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/det
	name = "inspector's suit"
	desc = "A rumpled white dress shirt paired with well-worn grey slacks, complete with a blue striped tie and a faux-gold tie clip."
	icon_state = "detective"
	item_state = "det"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/det/black
	icon_state = "detective3"
	//item_state = "sl_suit"
	desc = "An immaculate white dress shirt, paired with a pair of dark grey dress pants, a red tie, and a charcoal vest."

/obj/item/clothing/head/detective
	name = "fedora"
	desc = "A brown fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."
	icon_state = "detective_brown"
	item_state_slots = list(
		slot_l_hand_str = "detective_hat",
		slot_r_hand_str = "detective_hat",
		)
	allowed = list(/obj/item/reagent_containers/food/snacks/candy_corn, /obj/item/pen)
	armor = list(
		melee = 2,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)
	siemens_coefficient = 0.8
	body_parts_covered = NONE

/obj/item/clothing/head/detective/grey
	icon_state = "detective_gray"
	desc = "A grey fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."

/obj/item/clothing/head/detective/black
	icon_state = "detective_black"
	desc = "A black fedora - either the cornerstone of a detective's style or a poor attempt at looking cool, depending on the person wearing it."


/*
 * Aegis Commander
 */
/obj/item/clothing/under/rank/ih_commander
	desc = "It's a jumpsuit worn by those few with the dedication to achieve the position of \"Aegis Commander\"."
	name = "Aegis Commander's jumpsuit"
	icon_state = "hos"
	item_state = "r_suit"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/ih_commander/skirt
	name = "Aegis Commander's jumpskirt"
	desc = "It's a jumpskirt worn by those few with the dedication to achieve the position of \"Aegis Commander\"."
	icon_state = "hos_skirt"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/head/HoS
	name = "Aegis Commander Hat"
	desc = "The hat of the Aegis Commander. For showing the officers who's in charge."
	icon_state = "hoshat"
	body_parts_covered = NONE
	siemens_coefficient = 0.8

/*
 * "Navy" uniforms
 */
/obj/item/clothing/under/rank/cadet
	name = "Aegis Cadet jumpskirt"
	desc = "A sailor's uniform used for cadets in training, though more frequently in acts of hazing."
	icon_state = "cadet"
	item_state = "cadet"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
