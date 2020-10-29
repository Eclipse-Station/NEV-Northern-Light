#define PROSTHESIS_FULL list(\
	BP_HEAD, BP_CHEST,\
	BP_L_ARM, BP_L_HAND, BP_R_ARM, BP_R_HAND,\
	BP_GROIN,\
	BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT\
);

/datum/body_modification/limb/prosthesis/bishop
	id = "prosthesis_bishop"
	body_parts = PROSTHESIS_FULL
	replace_limb = /obj/item/organ/external/robotic/bishop
	prosthetic_model = "bishop"

/datum/body_modification/limb/prosthesis/hesphaistos
	id = "prosthesis_hesphaistos"
	body_parts = PROSTHESIS_FULL
	replace_limb = /obj/item/organ/external/robotic/hesphaistos
	prosthetic_model = "hesphaistos"

/datum/body_modification/limb/prosthesis/zenghu
	id = "prosthesis_zenghu"
	body_parts = PROSTHESIS_FULL
	replace_limb = /obj/item/organ/external/robotic/zenghu
	prosthetic_model = "zenghu"

/datum/body_modification/limb/prosthesis/xion
	id = "prosthesis_xion"
	body_parts = PROSTHESIS_FULL
	replace_limb = /obj/item/organ/external/robotic/xion
	prosthetic_model = "xion"

/datum/body_modification/limb/prosthesis/tv_head
	id = "tv_head"
	body_parts = list(BP_HEAD)
	replace_limb = /obj/item/organ/external/robotic/tv_head
	nature = MODIFICATION_SILICON
	allow_nt = FALSE

/datum/body_modification/limb/prosthesis
	body_parts = list(BP_L_ARM, BP_L_HAND, BP_R_ARM, BP_R_HAND, BP_L_LEG, BP_L_FOOT, BP_R_LEG, BP_R_FOOT)

#undef PROSTHESIS_FULL