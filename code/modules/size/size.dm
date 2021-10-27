
//these aren't defines so they can stay in this file
var/const/RESIZE_HUGE = 1.2
var/const/RESIZE_BIG = 1.1
var/const/RESIZE_NORMAL = 1
var/const/RESIZE_SMALL = 0.9
var/const/RESIZE_TINY = 0.8
//Eclipse edits ^^^^ Size
//average
var/const/RESIZE_A_HUGEBIG = (RESIZE_HUGE + RESIZE_BIG) / 2
var/const/RESIZE_A_BIGNORMAL = (RESIZE_BIG + RESIZE_NORMAL) / 2
var/const/RESIZE_A_NORMALSMALL = (RESIZE_NORMAL + RESIZE_SMALL) / 2
var/const/RESIZE_A_SMALLTINY = (RESIZE_SMALL + RESIZE_TINY) / 2

// Adding needed defines to /mob/living
// Note: Polaris had this on /mob/living/carbon/human We need it higher up for animals and stuff.
/mob/living
	var/size_multiplier = 1 //multiplier for the mob's icon size
	var/holder_default

// Define holder_type on types we want to be scoop-able
/*/mob/living/carbon/human
	holder_type = /obj/item/holder/micro
*/
// The reverse lookup of player_sizes_list, number to name.
/proc/player_size_name(var/size_multiplier)
	// (This assumes list is sorted big->small)
	for(var/N in player_sizes_list)
		. = N // So we return the smallest if we get to the end
		if(size_multiplier >= player_sizes_list[N])
			return N

/**
 * Scale up the size of a mob's icon by the size_multiplier.
 * NOTE: mob/living/carbon/human/update_icons() has a more complicated system and
 * 	is already applying this transform.   BUT, it does not call ..()
 *	as long as that is true, we should be fine.  If that changes we need to
 *	re-evaluate.
 */
/mob/living/update_icons()
	. = ..()
	var/matrix/M = matrix()
	M.Scale(size_multiplier)
	M.Translate(0, 16*(size_multiplier-1))
	src.transform = M

/**
 * Get the effective size of a mob.
 * Currently this is based only on size_multiplier for micro/macro stuff,
 * but in the future we may also incorporate the "mob_size", so that
 * a macro mouse is still only effectively "normal" or a micro dragon is still large etc.
 */
/mob/proc/get_effective_size()
	return 100000 //Whatever it is, it's too big to pick up, or it's a ghost, or something.

/mob/living/get_effective_size()
	return src.size_multiplier

/**
 * Resizes the mob immediately to the desired mod, animating it growing/shrinking.
 * It can be used by anything that calls it.
 */
/mob/living/proc/resize(var/new_size, var/animate = TRUE)
	if(size_multiplier == new_size)
		return 1

	size_multiplier = new_size //Change size_multiplier so that other items can interact with them
	if(animate)
		var/change = new_size - size_multiplier
		var/duration = (abs(change)+0.25) SECONDS
		var/matrix/resize = matrix() // Defines the matrix to change the player's size
		resize.Scale(new_size) //Change the size of the matrix
		resize.Translate(0, 16 * (new_size - 1)) //Move the player up in the tile so their feet align with the bottom
		animate(src, transform = resize, time = duration) //Animate the player resizing

		var/aura_grow_to = change > 0 ? 2 : 0.5
		var/aura_anim_duration = 5
		var/aura_offset = change > 0 ? 0 : 10
		var/aura_color = size_multiplier > new_size ? "#FF2222" : "#2222FF"
		var/aura_loops = round((duration)/aura_anim_duration)

		animate_aura(src, color = aura_color, offset = aura_offset, anim_duration = aura_anim_duration, loops = aura_loops, grow_to = aura_grow_to)
	else
		update_transform() //Lame way


// Optimize mannequins - never a point to animating or doing HUDs on these.
/mob/living/carbon/human/dummy/mannequin/resize(var/new_size, var/animate = TRUE)
	size_multiplier = new_size

/**
 * Verb proc for a command that lets players change their size OOCly.
 * Ace was here! Redid this a little so we'd use math for shrinking characters. This is the old code.
 */


/mob/living/proc/set_size()
	set name = "Adjust Mass"
	set category = "Abilities" //Seeing as prometheans have an IC reason to be changing mass.

	var/nagmessage = "Adjust your mass to be a size between 80% and 120% (DO NOT ABUSE)"
	var/new_size = input(nagmessage, "Pick a Size") as num|null
	if(new_size && IsInRange(new_size, 80, 120))
		src.resize(new_size/100)
		message_admins("[key_name(src)] used the resize command in-game to be [new_size]% size. \
			([src ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[src.x];Y=[src.y];Z=[src.z]'>JMP</a>" : "null"])")

/*
//Add the set_size() proc to usable verbs. By commenting this out, we can leave the proc and hand it to species that need it.
/hook/living_new/proc/resize_setup(mob/living/H)
	H.verbs += /mob/living/proc/set_size
	return 1
*/

/**
 * Attempt to scoop up this mob up into H's hands, if the size difference is large enough.
 * @return false if normal code should continue, 1 to prevent normal code.

/mob/living/proc/attempt_to_scoop(var/mob/living/M, var/ignoresizediff = 0)
	var/size_diff = M.get_effective_size() - get_effective_size()
	if(!holder_default && holder_type)
		holder_default = holder_type
	if(!istype(M))
		return 0
	if(isanimal(M))
		var/mob/living/simple_animal/SA = M
		if(!SA.has_hands)
			return 0
	if(M.buckled)
		to_chat(usr,"<span class='notice'>You have to unbuckle \the [M] before you pick them up.</span>")
		return 0
	if(size_diff >= 0.50 || ignoresizediff)
		holder_type = /obj/item/holder/micro
		var/obj/item/holder/m_holder = get_scooped(M)
		holder_type = holder_default
		if (m_holder)
			return 1
		else
			return 0; // Unable to scoop, let other code run
 */