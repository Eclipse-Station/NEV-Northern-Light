// I hate myself sometimes
/*
 * Block macros to define instance presets for prosthesis
 * please make sure that each line that is not the last
 * one ends with \, else DM will refuse to compile it.
 */
#define CREATE_PROSTHESIS_VARIETIES_FULL(typename, string)\
/obj/item/organ/external/robotic/typename/head {\
	name = string + " Head";\
	default_description = /datum/organ_description/head;\
}\
/obj/item/organ/external/robotic/typename/chest {\
	name = string + " Chest";\
	default_description = /datum/organ_description/chest;\
}\
/obj/item/organ/external/robotic/typename/l_arm {\
	name = string + " Left Arm";\
	default_description = /datum/organ_description/arm/left;\
}\
/obj/item/organ/external/robotic/typename/l_hand {\
	name = string + " Left Hand";\
	default_description = /datum/organ_description/hand/left;\
}\
/obj/item/organ/external/robotic/typename/r_arm {\
	name = string + " Right Arm";\
	default_description = /datum/organ_description/arm/right;\
}\
/obj/item/organ/external/robotic/typename/r_hand {\
	name = string + " Right Hand";\
	default_description = /datum/organ_description/hand/right;\
}\
/obj/item/organ/external/robotic/typename/groin {\
	name = string + " Groin";\
	default_description = /datum/organ_description/groin;\
}\
/obj/item/organ/external/robotic/typename/l_leg {\
	name = string + " Left Leg";\
	default_description = /datum/organ_description/leg/left;\
}\
/obj/item/organ/external/robotic/typename/l_foot {\
	name = string + " Left Foot";\
	default_description = /datum/organ_description/foot/left;\
}\
/obj/item/organ/external/robotic/typename/r_leg {\
	name = string + " Right Leg";\
	default_description = /datum/organ_description/leg/right;\
}\
/obj/item/organ/external/robotic/typename/r_foot {\
	name = string + " Right Foot";\
	default_description = /datum/organ_description/foot/right;\
}
// end CREATE_PROSTHESIS_VARIETIES_FULL

/obj/item/organ/external/robotic/tv_head/head
	name = "Unbranded TV-head"
	desc = "A knock-off unbranded tv-shaped head."
	force_icon = 'icons/mob/human_races/cyberlimbs/unbranded/unbranded_monitor.dmi'
	price_tag = 400


/obj/item/organ/external/robotic/bishop
	name = "Bishop"
	desc = "Prosthesis with white polymer casing with blue holo-displays."
	force_icon = 'icons/mob/human_races/cyberlimbs/bishop/bishop_main.dmi'
	price_tag = 600

CREATE_PROSTHESIS_VARIETIES_FULL(bishop, "Bishop")


/obj/item/organ/external/robotic/hesphaistos
	name = "Hesphaistos"
	desc = "Prosthesis with militaristic black and green casing with gold stripes."
	force_icon = 'icons/mob/human_races/cyberlimbs/hephaestus/hephaestus_main.dmi'
	price_tag = 500

CREATE_PROSTHESIS_VARIETIES_FULL(hesphaistos, "Hesphaistos")


/obj/item/organ/external/robotic/zenghu
	name = "Zeng-Hu"
	desc = "Prosthesis with rubbery fleshtone covering with visible seams."
	icon = 'icons/mob/human_races/cyberlimbs/zenghu/zenghu_main.dmi'
	price_tag = 400

CREATE_PROSTHESIS_VARIETIES_FULL(zenghu, "Zeng-Hu")


/obj/item/organ/external/robotic/xion
	name = "Xion"
	desc = "Prosthesis with minimalist black and red casing."
	force_icon = 'icons/mob/human_races/cyberlimbs/xion/xion_main.dmi'
	price_tag = 500

CREATE_PROSTHESIS_VARIETIES_FULL(xion, "Xion")

#undef CREATE_PROSTHESIS_VARIETIES_FULL
