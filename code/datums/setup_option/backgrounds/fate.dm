/datum/category_group/setup_option_category/background/fate
	name = "Fate"
	category_item_type = /datum/category_item/setup_option/background/fate

/datum/category_item/setup_option/background/fate

/datum/category_item/setup_option/background/fate/paper_worm
	name = "Paper Worm"
	desc = "Papers and bureaucracy were your life, cramped offices with angry people is where your personality was forged. \
			Coffee is your blood, your mind is corporate slogans, and personal life is nonexistent. \
			But here you are, on a spaceship flying to hell. There is something more to you, something that may come to light later."

	stat_modifiers = list(
		STAT_ROB = -10,
		STAT_TGH = -10,
		STAT_BIO = -10,
		STAT_MEC = -10,
		STAT_VIG = -10,
		STAT_COG = -10
	)
	perks = list(PERK_PAPER_WORM)

/datum/category_item/setup_option/background/fate/freelancer
	name = "Freelancer"
	desc = "You moved from job to job, opportunity to opportunity. \
			Is this your final job, or just another stop-gap? You're less specialized, but a jack of all trades."

	perks = list(PERK_FREELACER)

/datum/category_item/setup_option/background/fate/nihilist
	name = "Nihilist"
	desc = "One day, something in you changed, and you just stopped caring. \
			It's hard to debase you. It's even harder to convince you to fight for a set of ideals. \
			How long can you go without feeling? Do you even want to, anymore?"

	perks = list(PERK_NIHILIST)

/datum/category_item/setup_option/background/fate/moralist
	name = "Moralist"
	desc = "No matter how hard it is, you faith in humanity will always be strong. \
	You become distressed from seeing others in pain, but you will heal their burdens and carry them on."

	perks = list(PERK_MORALIST)


/datum/category_item/setup_option/background/fate/drug_addict
	name = "Drug Addict"
	desc = "For some reason, you resorted to major drug use; to escape from cruel realty, or to get the edge you need to fight it. \
			Now, you're suffering the consequences. Just one more hit..."

	perks = list(PERK_DRUG_ADDICT)


/datum/category_item/setup_option/background/fate/alcoholic
	name = "Alcoholic"
	desc = "You peered straight down a bottle's neck and saw escape at the bottom. When you finally drank yourself down to it, you found none. \
			It never stopped you from trying again and again, poisoning yourself until you're pale yellow and passed out in your own vomit and piss."

	stat_modifiers = list(STAT_COG = -10)
	perks = list(PERK_ALCOHOLIC)

/datum/category_item/setup_option/background/fate/noble
	name = "Noble"
	desc = "You are of a prestigious family or lineage. Maybe you're self-made. Maybe you're the heir to a fortune.\
			Either way, you, like everyone else, are stuck aboard the NEV Northern Light. This is not the luxury you are used to. \
			You're far more likely to be targeted for abduction by... unsavory types. \
			Stay safe, star-child."

	perks = list(PERK_NOBLE)

/datum/category_item/setup_option/background/fate/rat
	name = "Rat"
	desc = "You're used to acquiring things by repurposing what others have. \
			You know most tricks in the book; how to get the best loot, how to stay unseen, and how to get out. That's what's important."

	perks = list(PERK_RAT)
	stat_modifiers = list(
		STAT_MEC = 10,
		STAT_VIG = -10
	)

/datum/category_item/setup_option/background/fate/rejected_genius
	name = "Rejected Genius"
	desc = "You see the world in a different shade of crimson. \
			You know that the Truth is somewhere out there, hidden in the Null Sector, or somewhere else. \
			Your mind takes in everything it senses; every small detail, every tiny smell, every drip of blood on plating. \
			You will find your Answer, or your mind will break trying."

	perks = list(PERK_REJECTED_GENIUS)

/datum/category_item/setup_option/background/fate/oborin_syndrome
	name = "Oborin Syndrome"
	desc = "A disease that manifested at some recent point in history. \
			Its origin is unknown, but it’s speculated it’s related to psychic phenomena. \
			People affected by it are unable to see colors, and are generally disinterested in the world around them. It's hard to disturb someone who focuses on the greys and in-betweens."

	perks = list(PERK_OBORIN_SYNDROME)

/datum/category_item/setup_option/background/fate/lowborn
	name = "Lowborn"
	desc = "Your origin is at the bottom of the society, be it from slums, underground trash communities, refugees, or any number of neglected communities. \
			Maybe, unlike everyone else here, this ship is actually an improvement in living conditions for you...."
	restricted_jobs = list(/datum/job/captain, /datum/job/chaplain, /datum/job/merchant, /datum/job/cmo, /datum/job/rd, /datum/job/ihc)
	perks = list(PERK_LOWBORN)

