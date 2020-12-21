/datum/sanity/proc/onMusic()
	changeLevel(SANITY_GAIN_MUSIC)
	if(resting)
		add_rest(INSIGHT_DESIRE_MUSIC, 0.4)