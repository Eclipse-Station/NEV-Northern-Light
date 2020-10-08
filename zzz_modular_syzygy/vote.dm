// Syzygy's crew transfer vote stuff and other vote-related overrides go here

/datum/poll/evac
	next_vote = 30 MINUTES //Minimum round length before it can be called for the first time, set to 30 minutes from 90

/datum/controller/subsystem/ticker/proc/crew_transfer()
	if(!SSvote.active_vote)
		SSvote.autocrew_transfer()
	addtimer(CALLBACK(src, .proc/crew_transfer), 60 MINUTES)	//Starts another vote an hour later

/datum/controller/subsystem/vote/proc/autocrew_transfer()
	start_vote(/datum/poll/evac/transfer)

/datum/poll/evac/transfer
	name = "Engage Bluespace Drive"
	question = "Do you want to jump to another sector of space and restart the round?"
	choice_types = list(/datum/vote_choice/transfer, /datum/vote_choice/notransfer)

/datum/vote_choice/transfer
	text = "Spool up the Bluespace Drive!"

/datum/vote_choice/transfer/on_win()
	evacuation_controller.call_evacuation(null, FALSE, TRUE, FALSE, TRUE)

/datum/vote_choice/notransfer
	text = "Remain here for the next hour"

// Power to the people!
/datum/poll/power
	name = "Power the Ship"
	question = "No engineers? Have no fear! Simply vote here and all your problems will go away (not really)."
	time = 60
	choice_types = list(/datum/vote_choice/power, /datum/vote_choice/nopower)
	minimum_voters = 0
	only_admin = FALSE

	multiple_votes = FALSE
	can_revote = TRUE
	can_unvote = TRUE
	cooldown = 30 MINUTES
	next_vote = 5 MINUTES	//Have to wait 5 minutes after roundstart before doing it
	see_votes = TRUE

/datum/vote_choice/power
	text = "Power to the people!"

/datum/vote_choice/power/on_win()
	power_restore()

/datum/vote_choice/nopower
	text = "Don't ruin my immersion."
