/obj/random/prothesis
	name = "random prosthesis"
	icon_state = "meds-green"
<<<<<<< HEAD
	allow_blacklist = TRUE
	rarity_value = 80
	tags_to_spawn = list(SPAWN_OS_PROSTHETIC)
=======

/obj/random/prothesis/one_star
	name = "random one star prosthesis"

/obj/random/prothesis/one_star/item_to_spawn()
	return pick(list(
	/obj/item/organ/external/robotic/one_star/l_arm,\
	/obj/item/organ/external/robotic/one_star/r_arm,\
	/obj/item/organ/external/robotic/one_star/l_leg,\
	/obj/item/organ/external/robotic/one_star/r_leg
	))

>>>>>>> 57c0f65... Merge pull request #196 from SyzygyStation/revert-193-beep_boop
