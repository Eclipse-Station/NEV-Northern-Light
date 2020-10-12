// Syzygy's wonky seperate multiline me stuff goes here

/mob/verb/me_wrapper_multline()
	set name = "Me multiline verb"
	set category = "IC"

	set_typing_indicator(TRUE)
	hud_typing = TRUE
	var/message = input("", "me (text)") as message|null	//SYZYGY EDIT - Multiline textbox
	hud_typing = FALSE
	set_typing_indicator(FALSE)
	if(message)
		me_verb(message)
