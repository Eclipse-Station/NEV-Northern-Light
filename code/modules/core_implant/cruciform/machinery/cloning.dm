#define CLONING_START 	2	//Percent of total progress
#define CLONING_BONES	35
#define CLONING_MEAT 	70
#define CLONING_BODY 	90
#define CLONING_DONE	100

#define ANIM_OPEN 1
#define ANIM_NONE 0
#define ANIM_CLOSE -1

/obj/machinery/neotheology/cloner
	name = "SLT-73 Clonepod Prototype"
	desc = "One of the more fruitful results of NT's investment in Lazarus, this baby puts a person back together from organic slurry just in a few minutes. Now with clear biomass fluids for all your gross anatomy viewing needs."
	icon = 'zzz_modular_eclipse/icons/obj/neotheology_machinery.dmi'
	icon_state = "preview"
	density = TRUE
	anchored = TRUE
	layer = 2.8

	var/obj/machinery/neotheology/reader/reader
	var/reader_loc

	var/obj/machinery/neotheology/biomass_container/container
	var/container_loc

	var/mob/living/carbon/human/occupant
	var/cloning = FALSE
	var/closed = FALSE

	var/progress = 0

	var/cloning_speed = 1	//Try to avoid use of non integer values

	var/biomass_consumption = 2

	var/image/anim0 = null
	var/image/anim1 = null

	var/power_cost = 250


/obj/machinery/neotheology/cloner/New()
	..()
	icon = 'zzz_modular_eclipse/icons/obj/neotheology_machinery.dmi'
	update_icon()

/obj/machinery/neotheology/cloner/Destroy()
	if(occupant)
		qdel(occupant)
	return ..()

/obj/machinery/neotheology/cloner/proc/find_container()
	for(var/obj/machinery/neotheology/biomass_container/BC in orange(1,src))
		return BC
	return null


/obj/machinery/neotheology/cloner/proc/find_reader()
	for(var/obj/machinery/neotheology/reader/CR in orange(1,src))
		return CR
	return null


/obj/machinery/neotheology/cloner/proc/close_anim()
	qdel(anim0)
	anim0 = image(icon, "pod_closing0")
	anim0.layer = 5.01

	qdel(anim1)
	anim1 = image(icon, "pod_closing1")
	anim1.layer = 5.01
	anim1.pixel_z = 32

	update_icon()
	spawn(20)
		qdel(anim0)
		qdel(anim1)
		anim0 = null
		anim1 = null
		update_icon()

	return TRUE

/obj/machinery/neotheology/cloner/proc/open_anim()
	qdel(anim0)
	anim0 = image(icon, "pod_opening0")
	anim0.layer = 5.01

	qdel(anim1)
	anim1 = image(icon, "pod_opening1")
	anim1.layer = 5.01
	anim1.pixel_z = 32

	update_icon()
	spawn(20)
		qdel(anim0)
		qdel(anim1)
		anim0 = null
		anim1 = null
		update_icon()

	return TRUE

/obj/machinery/neotheology/cloner/proc/eject_contents()
	if(occupant)
		occupant.forceMove(loc)
		occupant = null
	else
		if(progress >= CLONING_MEAT)
			new /obj/item/weapon/reagent_containers/food/snacks/meat(loc)

	update_icon()

/obj/machinery/neotheology/cloner/proc/start()
	if(cloning)
		return

	reader = find_reader()
	if(!reader)
		return

	reader_loc = reader.loc

	container = find_container()
	if(!container)
		return

	reader.reading = TRUE
	reader.update_icon()

	container_loc = container.loc

	progress = 0

	cloning = TRUE

	occupant = null

	closed = TRUE

	close_anim()

	update_icon()
	return TRUE

/obj/machinery/neotheology/cloner/proc/stop()
	if(!cloning)
		return

	cloning = FALSE
	closed = FALSE
	if(reader)
		reader.reading = FALSE
		reader.update_icon()

	eject_contents()
	update_icon()
	return TRUE

/obj/machinery/neotheology/cloner/proc/done()
	occupant.setCloneLoss(0)
	occupant.setBrainLoss(0)
	occupant.updatehealth()
	stop()

/obj/machinery/neotheology/cloner/attack_hand(mob/user)
	src.add_fingerprint(user)
	reader = find_reader()
	if(!reader)
		visible_message("[src]'s control panel flashes \"NO READER\" light.")
		return
	if(!reader.implant)
		visible_message("[src]'s control panel flashes \"NO IMPLANT\" light.")
		return
	if(cloning)
		visible_message("[src]'s control panel flashes \"OCCUPIED\" light.")
		return
	start()

///////////////

/obj/machinery/neotheology/cloner/Process()
	if(stat & NOPOWER)
		return

	if(cloning)
		if(!reader || reader.loc != reader_loc || !reader.implant || !container || container.loc != container_loc)
			open_anim()
			stop()
			update_icon()
			return

		progress += cloning_speed

		if(progress <= CLONING_DONE)
			if(container)
				if(!container.reagents.remove_reagent("biomatter", biomass_consumption))
					stop()
			else
				stop()

		if(occupant && ishuman(occupant))
			occupant.setCloneLoss(CLONING_DONE-progress)
			occupant.setBrainLoss(CLONING_DONE-progress)

			occupant.adjustOxyLoss(-4)
			occupant.Paralyse(4)

			occupant.updatehealth()


		if(progress >= CLONING_MEAT && !occupant)
			var/obj/item/weapon/implant/core_implant/soulcrypt/R = reader.implant
			if(!R)
				open_anim()
				stop()
				update_icon()
				return

			occupant = new/mob/living/carbon/human(src)
			occupant.dna = R.host_dna.Clone()
			occupant.set_species()
			occupant.real_name = R.host_dna.real_name
			occupant.age = R.host_age
			occupant.UpdateAppearance()
			occupant.sync_organ_dna()
			occupant.flavor_text = R.host_flavor_text
			R.host_stats.copyTo(occupant.stats)

		if(progress == CLONING_BODY || progress <= CLONING_BODY && progress > CLONING_BODY-10)
			var/datum/effect/effect/system/spark_spread/s = new
			s.set_up(3, 1, src)
			s.start()

		if(progress == CLONING_DONE || progress >= CLONING_DONE-5)
			open_anim()
			closed = FALSE

		if(progress >= CLONING_DONE + 2)
			done()

		update_icon()

	use_power(power_cost)

/obj/machinery/neotheology/cloner/update_icon()
	icon_state = "pod_base0"

	overlays.Cut()

	if(panel_open)
		var/image/P = image(icon, "pod_panel")
		overlays.Add(P)

	var/image/I = image(icon, "pod_base1")
	I.layer = 5
	I.pixel_z = 32
	overlays.Add(I)

	if(closed)
		I = image(icon, "pod_under")
		I.layer = 5
		overlays.Add(I)

		I = image(icon, "pod_top_on")
		I.layer = 5.021
		I.pixel_z = 32
		overlays.Add(I)


	/////////BODY
	var/P = progress
	if(cloning && P >= CLONING_START)
		var/icon/IC = icon(icon, "clone_bones")
		var/crop = 32-min(32,round(((P-CLONING_START)/(CLONING_BONES-CLONING_START))*32))
		IC.Crop(1,crop,IC.Width(),IC.Height())

		I = image(IC)
		I.layer = 5
		I.pixel_z = 11 + crop

		overlays.Add(I)

		if(P >= CLONING_BONES)
			I = image(icon, "clone_meat")
			I.alpha = min(255,round(((P-CLONING_BONES)/(CLONING_MEAT-CLONING_BONES))*255))
			I.layer = 5
			I.pixel_z = 11
			overlays.Add(I)

			if(P >= CLONING_MEAT && occupant)
				I = image(occupant.icon, occupant.icon_state)
				I.alpha = min(255,round(((P-CLONING_MEAT)/(CLONING_BODY-CLONING_MEAT))*255))
				I.overlays = occupant.overlays
				I.layer = 5
				I.pixel_z = 11
				overlays.Add(I)

	//////////////

	if(closed)
		if(!anim0 && !anim1)
			I = image(icon, "pod_glass0")
			I.layer = 5.01
			overlays.Add(I)

			I = image(icon, "pod_glass1")
			I.layer = 5.01
			I.pixel_z = 32
			overlays.Add(I)

			I = image(icon, "pod_liquid0")
			I.layer = 5.01
			overlays.Add(I)

			I = image(icon, "pod_liquid1")
			I.layer = 5.01
			I.pixel_z = 32
			overlays.Add(I)

	if(anim0 && anim1)
		overlays.Add(anim0)
		overlays.Add(anim1)

	I = image(icon, "pod_top0")

	if(!cloning)
		I.layer = layer
	else
		I.layer = 5.02

	overlays.Add(I)

	I = image(icon, "pod_top1")
	I.layer = 5.02
	I.pixel_z = 32
	overlays.Add(I)


/////////////////////

/////////////////////
//BIOMASS CONTAINER
/////////////////////

/obj/machinery/neotheology/biomass_container
	name = "Lazarus' biomass container"
	desc = "A barrel that makes strange noises, filled with a substance which at any time may become someone else's body."
	icon_state = "biocan"
	density = TRUE
	anchored = TRUE

	var/biomass_capacity = 600


/obj/machinery/neotheology/biomass_container/Initialize(mapload, d, bolt=TRUE)
	. = ..()
	create_reagents(biomass_capacity)
	if(SSticker.current_state != GAME_STATE_PLAYING)
		reagents.add_reagent("biomatter", 300)
	anchored = bolt
	AddComponent(/datum/component/plumbing/demand/all/biomass, bolt, FALSE)
	var/turf/T = get_turf(src)
	T?.levelupdate()

/obj/machinery/neotheology/biomass_container/update_icon()
	overlays.Cut()
	var/list/new_overlays = update_overlays()
	if(new_overlays.len)
		for(var/overlay in new_overlays)
			overlays.Add(overlay)

/obj/machinery/neotheology/biomass_container/update_overlays()
	. = ..()
	if(panel_open)
		var/image/P = image(icon, "biocan_panel")
		P.dir = dir
		. += P

/obj/machinery/neotheology/biomass_container/examine(mob/user)
	if(!..(user, 2))
		return

	if(!reagents.has_reagent("biomatter"))
		to_chat(user, SPAN_NOTICE("It is empty."))
	else
		to_chat(user, SPAN_NOTICE("Filled to [reagents.total_volume]/[biomass_capacity]."))

/obj/machinery/neotheology/biomass_container/attackby(obj/item/I, mob/user)
	if (istype(I, /obj/item/stack/material/biomatter))
		var/obj/item/stack/material/biomatter/B = I
		if (B.biomatter_in_sheet && B.amount)
			var/sheets_amount_to_transfer = input(user, "How many sheets you want to load?", "Biomatter melting", 1) as num
			if(sheets_amount_to_transfer > 0)
				if(sheets_amount_to_transfer > B.amount)
					sheets_amount_to_transfer = B.amount
				var/total_transfer_from_stack = 0
				for(var/i=1;(i <= sheets_amount_to_transfer && i <= B.amount);i++)
					reagents.add_reagent("biomatter", B.biomatter_in_sheet)
					total_transfer_from_stack += B.biomatter_in_sheet
				B.use(sheets_amount_to_transfer)
				user.visible_message(
									"[user.name] inserted \the [B.name]'s sheets in \the [name].",
									"You inserted \the [B.name] in  (in amount: [sheets_amount_to_transfer]) \the [name].\
									And after that you see how the counter on \the [name] is incremented by [total_transfer_from_stack]."
									)
				ping()
			else
				to_chat(user, SPAN_WARNING("You can't insert [sheets_amount_to_transfer] in [name][sheets_amount_to_transfer < 0 ? " because it is literally impossible" :""]."))
			return
		else
			to_chat(user, SPAN_WARNING("\The [B.name] is exhausted and can't be melted to biomatter. "))

	if(istype(I, /obj/item/weapon/reagent_containers) && I.is_open_container())
		var/obj/item/weapon/reagent_containers/container = I
		if(container.reagents.get_reagent_amount("biomatter") == container.reagents.total_volume)
			container.reagents.trans_to_holder(reagents, container.amount_per_transfer_from_this)
			to_chat(user, SPAN_NOTICE("You transfer some of biomatter from \the [container] to \the [name]."))
		else
			to_chat(user, SPAN_NOTICE("You need clear biomatter to fill \the [name]."))

/////////////////////

/////////////////////
//CRUCIFORM IMPLANT READER
/////////////////////

/obj/machinery/neotheology/reader
	name = "SLT-73-B Core Implant Reader"
	icon = 'zzz_modular_eclipse/icons/obj/neotheology_machinery.dmi'
	desc = "A neat-looking device capable of extracting DNA and conciousness imprints from a core implant."
	icon_state = "reader_off"
	density = TRUE
	anchored = TRUE

	var/obj/item/weapon/implant/core_implant/soulcrypt/implant
	var/reading = FALSE


/obj/machinery/neotheology/reader/attackby(obj/item/I, mob/user as mob)
	if(istype(I, /obj/item/weapon/implant/core_implant/soulcrypt))
		var/obj/item/weapon/implant/core_implant/soulcrypt/C = I
		user.drop_item()
		C.forceMove(src)
		implant = C
		visible_message("[I] slides smoothly into the slot.")

	src.add_fingerprint(user)
	update_icon()

/obj/machinery/neotheology/reader/attack_hand(mob/user as mob)
	if(!implant)
		return

	if(reading)
		to_chat(user, SPAN_WARNING("You try to pull the [implant], but it does not move."))
		return

	user.put_in_active_hand(implant)
	implant = null

	src.add_fingerprint(user)
	update_icon()

/obj/machinery/neotheology/reader/on_deconstruction()
	if(implant)
		implant.forceMove(loc)
		implant = null
	return ..()

/obj/machinery/neotheology/reader/update_icon()
	overlays.Cut()

	if(panel_open)
		var/image/P = image(icon, "reader_panel")
		overlays.Add(P)


	icon_state = "reader_off"

	if(reading)
		var/image/S = image(icon, "screen")
		overlays.Add(S)

	if(implant)
		var/image/I = image(icon, "reader_c_green")
		overlays.Add(I)


/////////////////////

/obj/machinery/neotheology
	icon = 'icons/obj/neotheology_machinery.dmi'

#undef ANIM_OPEN
#undef ANIM_NONE
#undef ANIM_CLOSE
