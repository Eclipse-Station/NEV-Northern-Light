/obj/item/organ/internal/xenos/phoronvessel
	name = "phoron vessel"
	parent_organ = BP_CHEST
	icon_state = "xgibdown1"
	organ_tag = BP_PHORON
	var/stored_phoron = 0
	var/max_phoron = 500
	owner_verbs = list(/obj/item/organ/internal/xenos/phoronvessel/proc/transfer_phoron)

/obj/item/organ/internal/xenos/phoronvessel/proc/transfer_phoron(mob/living/carbon/human/M as mob in oview(1, owner))
	set name = "Transfer Phoron"
	set desc = "Transfer Phoron to another alien"
	set category = "Abilities"

	if (get_dist(owner, M) > 1)
		to_chat(owner, "<span class='alium'>You need to be closer.</span>")
		return

	var/amount = input(owner, "Amount:", "Transfer Phoron to [M]") as num
	if (amount)
		amount = abs(round(amount))
		if(check_alien_ability(amount))
			M.gain_phoron(amount)
			to_chat(M, "<span class='alium'>[owner] has transfered [amount] phoron to you.</span>")
			to_chat(owner, "<span class='alium'>You have transferred [amount] phoron to [M].</span>")


/obj/item/organ/internal/xenos/phoronvessel/queen
	name = "bloated phoron vessel"
	stored_phoron = 200
	max_phoron = 500

/obj/item/organ/internal/xenos/phoronvessel/sentinel
	stored_phoron = 100
	max_phoron = 250

/obj/item/organ/internal/xenos/phoronvessel/hunter
	name = "tiny phoron vessel"
	stored_phoron = 100
	max_phoron = 150
	owner_verbs = null //Can't transfer phoron

/obj/item/organ/internal/xenos/phoronvessel/drone
	owner_verbs = list(
		/obj/item/organ/internal/xenos/phoronvessel/proc/transfer_phoron,
		/obj/item/organ/internal/xenos/phoronvessel/drone/proc/evolve
	)


/obj/item/organ/internal/xenos/phoronvessel/drone/proc/evolve()
	set name = "Evolve (500)"
	set desc = "Produce an interal egg sac capable of spawning children. Only one queen can exist at a time."
	set category = "Abilities"

	if(alien_queen_exists())
		to_chat(owner, SPAN_NOTICE("We already have an active queen."))
		return

	if(check_alien_ability(500))
		visible_message(
			"<span class='alium'><B>[src] begins to twist and contort!</B></span>",
			"<span class='alium'>You begin to evolve!</span>"
		)
		owner.set_species("Xenomorph Queen")
