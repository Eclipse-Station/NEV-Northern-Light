/datum/job/assistant
	title = ASSISTANT_TITLE
	flag = ASSISTANT
	department = DEPARTMENT_CIVILIAN
	department_flag = CIVILIAN
	faction = "NEV Northern Light"
	total_positions = -1
	spawn_positions = -1
	supervisors = "anyone who pays you"
	selection_color = "#dddddd"
	initial_balance	= 0 // This is now defined in code\modules\economy\cash.dm under spacecash/bundle/Vagabond as they carry cash on them.
	wage = WAGE_NONE //Get a job ya lazy bum
	alt_titles = list("Intern", "Vagabond", "Assistant")
	access = list(access_maint_tunnels)
	outfit_type = /decl/hierarchy/outfit/job/assistant

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)


	description = "There are two potential lives before you, and you must choose wisely.<br>\
In one, you are a vagabond, journeying through the vast expanses of space upon the NEV Northern Light. You will not be paid a wage.<br>\
Though this does not mean you have no home, as the Northern Light is your home. Whatever planet you may have came from a now distant memory.<br>\
You remember boarding the Northern Light sometime in your past, when it had a different purpose and a different captain.<br>\
Over time you've become accustomed to the dangers of this ship.<br>\
The ID you wear likely not even your own. At least as far as you can remember.<br>\
But this chunk of plastic still can be a rare oddity, that can change your character.<br>\
As a vagabond, you should strive to help out anyone you can. Or at least, anyone who offers you a paying job. Find a way to make money, stay out of trouble, and survive.<br>\
You can do anything, or be anyone. To be a Vagabond is to be free. Be wary of those that would take this freedom, for not all of the crew are your friends. You can trust in the Church of Mekhane to look out for you, but they are not all powerful.<br>\
<br>\
In another, you are an intern. In the rush to escape SolGov bureaucracy, NanoTrasen hired on as many laborers and crewmen as they could. Some of them adapted to maintenance life, but others still set out to better themselves.<br>\
Not all of those laborers and crewman were qualified for the journey ahead. You are untrained or uncertified, and unpaid, but unlike vagabonds you have a chance.<br>\
The crew are dismissive of interns, but not unfriendly. You, unlike vagabonds, seek to insert yourselves into the established order in any way you can. Order, above all else, will keep this ship flying, and you understand that.<br>\
Thus, you seek guidance and training from one of the corporate departments on ship. You have many options to choose from, and not all of them may be willing to take you. Only you can prove yourself worthy."


	perks = list(/datum/perk/vagabond)
	loyalties = "Your loyalty is yours to decide"

/obj/landmark/join/start/assistant
	name = ASSISTANT_TITLE
	icon_state = "player-grey"
	join_tag = /datum/job/assistant
/* None for now - Eclipse Edit
/datum/job/assistant/New()
	..()
	for(var/alt in subtypesof(/datum/job_flavor/assistant))
		random_flavors += new alt
*/