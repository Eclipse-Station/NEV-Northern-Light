var/global/list/all_radio_squelch_sounds = list('sound/effects/radio_squelch/squelch1.ogg', 'sound/effects/radio_squelch/squelch2.ogg', 'sound/effects/radio_squelch/squelch3.ogg', 'sound/effects/radio_squelch/squelch4.ogg')

/obj/item/device/radio
	var/audible_squelch_enabled = TRUE
	var/audible_squelch_type = 'sound/misc/null.ogg'		//should be overwritten on New()
	
/obj/item/device/radio/proc/play_squelch_sound(var/audiofile)
	if(audible_squelch_enabled)
		playsound(loc, audiofile, 25, 1, 1)

/obj/item/device/radio/beacon
	audible_squelch_enabled = FALSE
	
/obj/item/device/radio/borg
	audible_squelch_enabled = FALSE

/obj/item/device/radio/exosuit
	audible_squelch_enabled = FALSE

/obj/item/device/radio/electropack
	audible_squelch_enabled = FALSE
	
/obj/item/device/radio/intercom		//we don't want intercoms to do this.
	audible_squelch_enabled = FALSE

/obj/item/device/radio/phone
	audible_squelch_enabled = FALSE

/obj/item/device/radio/spy
	audible_squelch_enabled = FALSE