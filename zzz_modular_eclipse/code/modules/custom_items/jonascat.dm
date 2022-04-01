/obj/item/weapon/holder/cat/fluff/haas
	name = "Jonas"
	desc = "It's Jonas! A playful tabby cat."
	gender = MALE
	icon_state = "cat2"
	item_state = "cat2"
	

/mob/living/simple_animal/cat/fluff/haas
	name = "Jonas"
	desc = "That's Jonas the cat. He's a playful, energetic cat!"
	gender = MALE
	icon_state = "cat2"
	item_state = "cat2"
	holder_type = /obj/item/weapon/holder/cat/fluff/haas
	var/friend_name = "Stefan Haas"


/mob/living/simple_animal/cat/fluff/haas/friend()
	set name = "Become Friends"
	set category = "IC"
	set src in view(1)

	if(friend && usr == friend)
		set_dir(get_dir(src, friend))
		say("Meow!")
		return

	if (ishuman(usr))
		var/mob/living/carbon/human/H = usr
		if(H.real_name == friend_name)
			friend = usr
			set_dir(get_dir(src, friend))
			say("Meow!")
			return

	to_chat(usr, SPAN_NOTICE("[src] ignores you."))
	return
	
/obj/item/device/fluff/the_haas_catporter_nine_thousand
	name = "\improper Mysterious Button"
	desc = null
	icon = 'icons/obj/machines/buttons.dmi'
	icon_state = "launcher0"
	
/obj/item/device/fluff/the_haas_catporter_nine_thousand/attack_self()
	if(usr.ckey == "eviljackcarver")
		new /mob/living/simple_animal/cat/fluff/haas(get_turf(usr))
		qdel(src)
	else
		to_chat(usr, "<span class='warning'>You press the button, but nothing happens...</span>")