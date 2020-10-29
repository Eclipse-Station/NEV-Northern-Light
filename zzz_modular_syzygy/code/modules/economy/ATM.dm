/obj/machinery/atm/verb/quick_cash() //verb to withdraw cash without the UI
	set name = "Quick Cash"
	set category = "Object"
	set src in view(1)

	//Quick cash requires a card in the machine
	if(!held_card)
		to_chat(usr,SPAN_WARNING("Please insert your card to complete transaction."))
		return

	//User enters pin
	var/inputpin = input("Enter PIN code", "Account PIN") as num
	var/datum/money_account/quickcashaccount = attempt_account_access(held_card.associated_account_number,inputpin,2,force_security = TRUE)
	if(quickcashaccount)
		if(quickcashaccount.is_valid())
			var/valuein = input("Enter quick cash amount:","Quick Cash Amount") as num//ask how much money they want!
			if(valuein<1)//We can't request 0 or negative cash!
				to_chat(usr,SPAN_WARNING("Invalid amount, please enter positive nonzero value"))
				return
			if(valuein <= quickcashaccount.money)
				playsound(src, 'sound/machines/chime.ogg', 50, 1)
				src.visible_message("\icon[src] \The [src] chimes.")

				//data entry in account log
				var/datum/transaction/T = new(-valuein, quickcashaccount.owner_name, "Credit withdrawal", machine_id)
				T.apply_to(quickcashaccount)
				spawn_money(valuein,src.loc,usr)
			else
				to_chat(usr, "\icon[src]<span class='warning'>You don't have that much money!</span>")
		else
			to_chat(usr, "\icon[src]<span class='warning'>Your account has been suspended.</span>")

	else
		to_chat(usr,SPAN_WARNING("Unable to access account. Check security settings and try again."))//bad pin, nope.avi
	return