//As a general rule, all origin backrounds must have summ of +5 of stat values

/datum/category_group/setup_option_category/background/origin
	name = "Origin"
	category_item_type = /datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin

/datum/category_item/setup_option/background/origin/oberth
	name = "Mercenary"
	desc = "You're a soldier by trade, whether with a PMC or actual government. Close-quarters combat isn't unfamiliar to you, but you're more used to having your hands around a rifle. \
			Even if that rifle is more of a shotgun."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_BIO = 0,
		STAT_MEC = 6,
		STAT_VIG = 10,
		STAT_COG = -8
	)

/datum/category_item/setup_option/background/origin/oberth/apply(mob/living/carbon/human/character)
  ..()
  character.add_language(LANGUAGE_GERMAN)


/datum/category_item/setup_option/background/origin/predstraza
	name = "Thug"
	desc = "You're an unsavory sort, aren't you? \
			Maybe you're a criminal, maybe you just got into a lot of fights. Either way, you know how to swing your weight around and how to not get caught off-guard. \
			...All those blows to your head may have knocked a few things loose, though..."

	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = -5,
		STAT_MEC = -10,
		STAT_VIG = 6,
		STAT_COG = -10
	)

/datum/category_item/setup_option/background/origin/predstraza/apply(mob/living/carbon/human/character)
  ..()
  character.add_language(LANGUAGE_SERBIAN)

/datum/category_item/setup_option/background/origin/sich_prime
	name = "Vagrant"
	desc = "Miscreant. You're used to having to do what it takes to survive, patching up your own wounds to survive, and being... familiar, with how to get through locks."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = -5,
		STAT_BIO = 5,
		STAT_MEC = 8,
		STAT_VIG = 0,
		STAT_COG = -5
	)


/datum/category_item/setup_option/background/origin/new_rome
	name = "Assistant"
	desc = "You've generally spent the majority of your life as the second note to more important people. \
			In your time, you've caught a few tricks. Jack-of-all-trades, master of none."

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 8,
		STAT_BIO = 6,
		STAT_MEC = 10,
		STAT_VIG = -6,
		STAT_COG = -3
	)

/datum/category_item/setup_option/background/origin/new_rome/apply(mob/living/carbon/human/character)
  ..()
  character.add_language(LANGUAGE_LATIN)


/datum/category_item/setup_option/background/origin/shimatengoku
	name = "Academic"
	desc = "You're more familiar with studying and practicing your trade than with how to kill a roach the size of a horse.\
			As a compensation, you're at least probably earning more than your peers...probably. \
			More specialized for work planet-side than on a ship barely held together by tape and prayer, you'll have to be extra-cautious to avoid unfortunate accidents..."

	stat_modifiers = list(
		STAT_ROB = -8,
		STAT_TGH = -8,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = -5,
		STAT_COG = 15
	)

/datum/category_item/setup_option/background/origin/shimatengoku/apply(mob/living/carbon/human/character)
  ..()
  character.add_language(LANGUAGE_NEOHONGO)


/datum/category_item/setup_option/background/origin/hmss_destined
	name = "Crewman"
	desc = "You're not unfamiliar with working on spaceships. Maybe you've been working for NanoTrasen for some time, or maybe you used to be part of some navy.\
			 Either way, you know the general ins-and-outs of working on a ship."

	stat_modifiers = list(
		STAT_ROB = 7,
		STAT_TGH = 6,
		STAT_BIO = -6,
		STAT_MEC = 8,
		STAT_VIG = 0,
		STAT_COG = -10
	)


/datum/category_item/setup_option/background/origin/crozet
	name = "Colonist"
	desc = "You're used to working a planet-side job, whether it's ranching, ship repairs, or good ol' ore-extraction. This fancy-shmancy spaceship stuff's a far cry from what you're used to, but it pays good."

	stat_modifiers = list(
		STAT_ROB = 6,
		STAT_TGH = 10,
		STAT_BIO = -3,
		STAT_MEC = 2,
		STAT_VIG = 10,
		STAT_COG = -2
	)


/datum/category_item/setup_option/background/origin/first_expeditionary_fleet
	name = "Activist"
	desc = "You have a strong set of beliefs, and stick to them. You're not afraid to clash with authority when push comes to shove. \
			Maybe you're even on the NEV Northern Light because you're running from the law. Either way, you're still carrying out your campaign for justice."

	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 0,
		STAT_BIO = -5,
		STAT_MEC = -5,
		STAT_VIG = 5,
		STAT_COG = 5
	)


/datum/category_item/setup_option/background/origin/end_point
	name = "Greasemonkey"
	desc = "To put it bluntly, you're good with machines. Real good. Maybe you specialize in engines, or electrician work, but you know your way around a workshop."

	stat_modifiers = list(
		STAT_ROB = -3,
		STAT_TGH = -2,
		STAT_BIO = 0,
		STAT_MEC = 15,
		STAT_VIG = 3,
		STAT_COG = 8
	)


/datum/category_item/setup_option/background/origin/nss_forecaster
	name = "Nomad"
	desc = "You used to roam the stars. Maybe you still do. Why would you miss your home when your home is all around you? There's so much to see, and you are ready for all of it! \
			Your lack of settling down means that you don't have intimate knowledge of any particular subject, but you've always been able to get around that with your general knowledge and wit.\
			So far, at least."

	stat_modifiers = list(
		STAT_ROB = 2,
		STAT_TGH = 2,
		STAT_BIO = -10,
		STAT_MEC = 2,
		STAT_VIG = 10,
		STAT_COG = 2
	)


/datum/category_item/setup_option/background/origin/eureka
    name = "Eureka"
    desc = "Once a paradise for the Australian colonists that lived on it, their neutrality during the corporate wars cost them this paradise. \
            And thus did the Syndicate and Nanotrasen both bomb Eureka to hell, causing once verdant lands to become hellish deserts of nuclear proportions. \
            As a side effect of this once the corporate wars ended, Eurekans are known to be eerily good trackers and pathfinders in these conditions and elsewhere, causing what's left of the Eurekan people to pay a tithe to Hansa and Neotheology both in the form of criminals. \
            All in the name of saving what's left."

    stat_modifiers = list(
        STAT_ROB = -5,
        STAT_TGH = 5,
        STAT_BIO = 10,
        STAT_MEC = -10,
        STAT_VIG = 10,
        STAT_COG = -5
    )

/datum/category_item/setup_option/background/origin/streltsy
	name = "Wandering Streltsy"
	desc = "The Streltsy are known for their actions during the corporate wars on certain worlds such as Eureka and Predstraza. Serbians know them as valuable debt settlers and an escape from the conditions of their worlds, while more civilized worlds view them as despoilers and raiders. \
			While both of these preconceptions are correct in their own right, a less known fact is that most Streltsy who've survived the corporate war are still suffering the consequences of their participation due to the decimation of their numbers during the war, leading to a miserable quality of life and forcing them to start recruitment from wartorn worlds to desperately replenish their numbers from before the war. \
			Despite this, the survivors and their newer members are unparalleled in the arts of war, but lacking in the art of general technomancy."
	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 10,
		STAT_BIO = -10,
		STAT_MEC = -5,
		STAT_VIG = 10,
		STAT_COG = -10
	)

	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/chaplain, /datum/job/merchant, /datum/job/cmo, /datum/job/rd, /datum/job/ihc)
	restricted_depts = IRONHAMMER | MEDICAL | SCIENCE | CHURCH | GUILD | CIVILIAN | SERVICE

/datum/category_item/setup_option/background/origin/ihmaids
	name = "Aegis M.A.I.D.S Corps"
	desc = "Aegis Medical, Acquisition, Industrial Design and Security Corps are normally posted to construction work of particular importance to Aegis assets, such as fortifications or barracks for the garrisons on the way to the null sector, along with triage work for when an accident inevitably happens at those garrisons. \
			At other times, they're assigned to Aegis security teams on exploratory missions into the null sector due to their prowess as construction specialists and medics."

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -5,
		STAT_BIO = 10,
		STAT_MEC = 10,
		STAT_VIG = -10,
		STAT_COG = 10
	)
	restricted_jobs = list(/datum/job/captain, /datum/job/hop, /datum/job/chaplain, /datum/job/merchant, /datum/job/cmo, /datum/job/rd, /datum/job/chief_engineer)
	restricted_depts = ENGINEERING | MEDICAL | SCIENCE | CHURCH | GUILD | CIVILIAN | SERVICE
