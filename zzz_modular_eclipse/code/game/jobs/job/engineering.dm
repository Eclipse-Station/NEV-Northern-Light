//Adding Engineering Enforcer role
/datum/job/technomancer/enforcer
	title = "Xingyun Enforcer"
	total_positions = 2
	spawn_positions = 2
	alt_titles = null

	outfit_type = /decl/hierarchy/outfit/job/engineering/enforcer

	stat_modifiers = list(
		STAT_MEC = 30,
		STAT_COG = 15,
		STAT_TGH = 10,
		STAT_ROB = 15,
		STAT_VIG = 15,
	)

	description = "A loyal and hearty member of the Xingyun Corporation, a subsidiary of NanoTrasen, you are the bulwark that protects your fellow engineers from the dangers aboard this ship that their tool belts and hardhats can't save them from.<br>\
	From ravenous mutated roaches and spiders the size of large dogs, to insidious traitors lurking amidst the crew; the threats to you and your fellows are varied and can come from the most unexpected places, even within your own ranks.<br>\
	It is your job to uphold the law of the Northern Light within the realm of engineering, and to protect your coworkers from harm to the best of your ability.<br>\
	As a Xingyun employee, you were trained as an engineer, and should have at least a passing familiarity with the basic functions that your department is expected to maintain, but if a specialized engineer is available,  you should defer to them, as your primary duty is security.<br>\
	Your day will primarily revolve around patrolling the areas around engineering to clear them of any roaches, traps, or loitering vagabonds, all the while keeping a sharp eye out for anything suspicious.<br>\
	Don't be afraid to ask Aegis for help should you confirm a threat, but be warned, they will try to squeeze a few extra credits out of you whenever they can."

	duties = "	-Guard the engineering sector from tresspassers and thieves.<br>\
	-Protect your coworkers from threats both within and without.<br>\
	-Assist the other engineers in their duties, either by cordoning off a work area, or by helping with repairs if needed.<br>\
	-Follow the instructions of the Chief Engineer."

	loyalties = "	As an enforcer, your first loyalty is to your fellow engineers. Ensure they are safe and well supplied, defend them, assist them, and share everything with them. If problems arise between you, ask the Chief Engineer to rule on it. Don't snitch on your coworkers by calling Aegis. The Chief Engineer is the head of your department, follow their instructions above anyone else's."

/obj/landmark/join/start/enforcer
	name = "Enforcer"
	icon_state = "player-orange"
	join_tag = /datum/job/technomancer/enforcer
