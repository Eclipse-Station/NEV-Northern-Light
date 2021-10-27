/datum/faction/excelsior
	id = FACTION_EXCELSIOR
	name = "Excelsior"
	antag = "infiltrator"
	antag_plural = "infiltrators"
	welcome_text = "YExcelsior, comrades!\n\n\
You are part of the Techno-communist Commune known as Excelsior. You are here to further The\
People’s goals aboard this vessel, with the final goal being to turn this vessel into our newest Commune.\
Secure our position, liberate the oppressed, and produce arms, armour, and propaganda in preparation\
for the final revolution. A slow, methodical approach is preferred, split into three phases:\
<b>Phase One - Awakening:<b\> Seek out other members of the revolution, if present, by speaking to them\n\n\
through your cybernetic implant. Retrieve the cache of manufacturing materials and circuit boards.\
Without a means of production our revolution is in peril.\n\n\
<b>Phase Two - Seize the Means:<b\> Create a fortified position in secret, The People will send additional\
resources through the teleporter once it is established. This and our autolathe will need to be protected\
with turrets, shield generators, and our loyal comrades.\n\n\
<b>Phase Three - Liberate the Bourgeoisie:<b/> Complete mandates for power. Acquire implants, prosthetics, or\
robot parts to convert into new implants, These can be injected into the oppressed to formally induct\
them into the revolution. Use their labour to produce the weapons which will break the chains of their\
servitude.\n\n\
When the People are ready, break the chains of the Oppressor, and seize the ship.\n\n\
<b>Ever upward, comrade!</b>"

	hud_indicator = "excelsior"

	possible_antags = list(ROLE_EXCELSIOR_REV)
	verbs = list(/datum/faction/excelsior/proc/communicate_verb,
				/datum/faction/excelsior/proc/summon_stash)

	var/stash_holder = null


/datum/faction/excelsior/print_success_extra()
	var/extra_text = ""
	var/list/mandates = list()
	for(var/m in GLOB.excel_antag_contracts)
		var/datum/antag_contract/mandate = m
		if(mandate.completed)
			mandates += mandate

	if(length(mandates))
		var/total_power = 0
		var/num = 0

		extra_text += "<br><b>Mandates fulfilled:</b>"
		for(var/m in mandates)
			var/datum/antag_contract/mandate = m
			total_power += mandate.reward
			num++

			extra_text += "<br><b>Mandate [num]:</b> [mandate.desc] <font color='green'>(+[mandate.reward] power)</font>"

		extra_text += "<br><b>Total: [num] mandates, <font color='green'>[total_power] power from mandates</font></b><br>"
	return extra_text
/datum/faction/excelsior/create_objectives()
	objectives.Cut()
	new /datum/objective/timed/excelsior(src)
	for (var/datum/antagonist/A in members)
		to_chat(A.owner.current, SPAN_NOTICE("You may summon your required materials using the \"summon stash\" command."))

	.=..()

/datum/faction/excelsior/proc/communicate_verb()

	set name = "Excelsior comms"
	set category = "Cybernetics"

	if(!ishuman(usr))
		return

	var/datum/faction/F = get_faction_by_id(FACTION_EXCELSIOR)

	if(!F)
		return

	F.communicate(usr)

/datum/faction/excelsior/proc/summon_stash()

	set name = "Summon stash"
	set category = "Cybernetics"

	if(!ishuman(usr))
		return

	var/datum/faction/excelsior/F = get_faction_by_id(FACTION_EXCELSIOR)

	if(!F)
		return

	if(F.stash_holder)
		to_chat(usr, SPAN_NOTICE("The stash has already been summoned by \"[F.stash_holder]\""))
		return

	var/mob/living/carbon/human/H = usr

	var/obj/item/storage/deferred/stash/sack/stash = new

	new /obj/item/computer_hardware/hard_drive/portable/design(stash)
	new /obj/item/computer_hardware/hard_drive/portable/design/excelsior/core(stash)
	new /obj/item/computer_hardware/hard_drive/portable/design/excelsior/weapons(stash)
	new /obj/item/electronics/circuitboard/excelsiorautolathe(stash)
	new /obj/item/electronics/circuitboard/excelsior_teleporter(stash)

	H.put_in_hands(stash)
	F.stash_holder = H.real_name