/datum/soulcrypt_module/weasel
	name = "W3@SL.exe"
	description = "UNKNOWN"
	activates = TRUE

/datum/soulcrypt_module/weasel/activate(mob/user)
	message_user("P0P G03Z TH3 W3@SL...")
	explosion(get_turf(user), -1, 0, 1, 6)
	user.gib()