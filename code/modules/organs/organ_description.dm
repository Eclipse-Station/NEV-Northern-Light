/datum/organ_description
	var/name = "limb"
	var/surgery_name
	var/organ_tag = "limb"
	var/body_part
	var/parent_organ_base
	var/default_type = /obj/item/organ/external
	var/default_bone_type = /obj/item/organ/internal/bone

	var/max_damage = 0
	var/min_broken_damage = 30
	var/dislocated = 0
	var/vital = FALSE
	var/cannot_amputate = FALSE

	var/gendered = FALSE

	var/w_class = ITEM_SIZE_NORMAL
	var/max_volume = ITEM_SIZE_SMALL	//Space used up by specific organ size and w_class of cavity implants

	var/amputation_point = "spine"
	var/joint = "neck"
	var/encased
	var/cavity_name = "cavity"

	var/icon_position = null
	var/functions = NONE
	var/list/drop_on_remove = null

/datum/organ_description/proc/create_organ(var/mob/living/carbon/human/H)
	return new default_type(H,src)

/datum/organ_description/chest
	name = "upper body"
	surgery_name = "torso"
	organ_tag = BP_CHEST
	body_part = UPPER_TORSO
	default_type = /obj/item/organ/external/chest
	default_bone_type = /obj/item/organ/internal/bone/chest

	gendered = TRUE

	max_damage = 100
	min_broken_damage = 60
	dislocated = -1
	vital = TRUE
	cannot_amputate = TRUE

	w_class = ITEM_SIZE_HUGE
	max_volume = ITEM_SIZE_COLOSSAL

	joint = "neck"
	amputation_point = "spine"
	encased = "ribcage"
	cavity_name = "thoracic cavity"

/datum/organ_description/groin
	name = "lower body"
	surgery_name = "lower abdomen"
	organ_tag = BP_GROIN
	body_part = LOWER_TORSO
	parent_organ_base = BP_CHEST
	default_type = /obj/item/organ/external/groin
	default_bone_type = /obj/item/organ/internal/bone/groin

	gendered = TRUE

	max_damage = 100
	min_broken_damage = 60
	dislocated = -1

	w_class = ITEM_SIZE_BULKY
	max_volume = ITEM_SIZE_GARGANTUAN

	joint = "hip"
	amputation_point = "lumbar"
	cavity_name = "abdominal cavity"

/datum/organ_description/head
	name = "head"
	surgery_name = "head" // Prevents "Unknown's Unkonwn's head" from popping up if the head was amputated and then reattached
	organ_tag = BP_HEAD
	body_part = HEAD
	parent_organ_base = BP_CHEST
	default_type = /obj/item/organ/external/head
	default_bone_type = /obj/item/organ/internal/bone/head

	gendered = TRUE

	max_damage = 75
	min_broken_damage = 60
	vital = TRUE

	w_class = ITEM_SIZE_NORMAL
	max_volume = ITEM_SIZE_BULKY

	joint = "jaw"
	amputation_point = "neck"
	encased = "skull"
	cavity_name = "cranial cavity"

	drop_on_remove = list(slot_glasses, slot_head, slot_l_ear, slot_r_ear, slot_wear_mask)
	functions = BODYPART_REAGENT_INTAKE | BODYPART_GAS_INTAKE

/datum/organ_description/arm
	parent_organ_base = BP_CHEST

	w_class = ITEM_SIZE_NORMAL

	max_damage = 50
	min_broken_damage = 50

	functions = BODYPART_GRASP

/datum/organ_description/arm/left
	name = "left arm"
	organ_tag = BP_L_ARM
	body_part = ARM_LEFT
	default_bone_type = /obj/item/organ/internal/bone/l_arm

	joint = "left elbow"
	amputation_point = "left shoulder"

/datum/organ_description/arm/right
	name = "right arm"
	organ_tag = BP_R_ARM
	body_part = ARM_RIGHT
	default_bone_type = /obj/item/organ/internal/bone/r_arm

	joint = "right elbow"
	amputation_point = "right shoulder"

/datum/organ_description/leg
	parent_organ_base = BP_GROIN

	w_class = ITEM_SIZE_NORMAL

	max_damage = 60
	min_broken_damage = 50

	functions = BODYPART_STAND

/datum/organ_description/leg/left
	name = "left leg"
	organ_tag = BP_L_LEG
	body_part = LEG_LEFT
	icon_position = LEFT
	default_bone_type = /obj/item/organ/internal/bone/l_leg

	joint = "left knee"
	amputation_point = "left hip"

/datum/organ_description/leg/right
	name = "right leg"
	organ_tag = BP_R_LEG
	body_part = LEG_RIGHT
	icon_position = RIGHT
	default_bone_type = /obj/item/organ/internal/bone/r_leg

	joint = "right knee"
	amputation_point = "right hip"

/datum/organ_description/hand
	min_broken_damage = 40
	w_class = ITEM_SIZE_SMALL
	drop_on_remove = list(slot_gloves, slot_handcuffed)

/datum/organ_description/hand/left
	organ_tag = BP_L_HAND
	name = "left hand"
	body_part = HAND_LEFT
	parent_organ = BP_L_ARM
	joint = "left wrist"
	amputation_point = "left wrist"
	default_bone_type = /obj/item/organ/internal/bone/l_hand

/datum/organ_description/hand/right
	organ_tag = BP_R_HAND
	name = "right hand"
	body_part = HAND_RIGHT
	parent_organ = BP_R_ARM
	joint = "right wrist"
	amputation_point = "right wrist"
	default_bone_type = /obj/item/organ/internal/bone/r_hand

/datum/organ_description/foot
	min_broken_damage = 40
	drop_on_remove = list(slot_shoes, slot_legcuffed)

/datum/organ_description/foot/left
	organ_tag = BP_L_FOOT
	name = "left foot"
	body_part = FOOT_LEFT
	icon_position = LEFT
	parent_organ = BP_L_LEG
	joint = "left ankle"
	amputation_point = "left ankle"
	default_bone_type = /obj/item/organ/internal/bone/l_foot

/datum/organ_description/foot/right
	organ_tag = BP_R_FOOT
	name = "right foot"
	body_part = FOOT_RIGHT
	icon_position = RIGHT
	parent_organ = BP_R_LEG
	joint = "right ankle"
	amputation_point = "right ankle"
	default_bone_type = /obj/item/organ/internal/bone/r_foot

////SLIME////
/datum/organ_description/chest/slime
	name = "upper body"
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/groin/slime
	name = "fork"
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/head/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/arm/left/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/arm/right/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/leg/left/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/leg/right/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/hand/left/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/hand/right/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/foot/left/slime
	default_type = /obj/item/organ/external/unbreakable

/datum/organ_description/foot/right/slime
	default_type = /obj/item/organ/external/unbreakable


