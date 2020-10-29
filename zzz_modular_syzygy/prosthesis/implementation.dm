//This file is for actual implementation of whatever modified/new variants/subtypes of prosthesis we make. So if you added new hands and feet for Eris' prosthetics and want to add it to science or a trading station or whatever, dump the code here.

// Adds Moebius hands and feet to the research node
/datum/technology/top_biotech
	unlocks_designs = list(	/datum/design/research/item/mechfab/modules/armor,
							/datum/design/research/item/mechfab/modules/armblade,
							/datum/design/research/item/mechfab/modules/runner,
							/datum/design/research/item/mechfab/modules/multitool/surgical,
							/datum/design/research/item/mechfab/modules/multitool/engineer,
							/datum/design/research/item/mechfab/modules/multitool/miner,
							/datum/design/research/item/mechfab/prosthesis_moebius/r_arm,
							/datum/design/research/item/mechfab/prosthesis_moebius/l_arm,
							/datum/design/research/item/mechfab/prosthesis_moebius/r_leg,
							/datum/design/research/item/mechfab/prosthesis_moebius/l_leg,
							/datum/design/research/item/mechfab/prosthesis_moebius/groin,
							/datum/design/research/item/mechfab/prosthesis_moebius/l_foot,
							/datum/design/research/item/mechfab/prosthesis_moebius/r_foot,
							/datum/design/research/item/mechfab/prosthesis_moebius/l_hand,
							/datum/design/research/item/mechfab/prosthesis_moebius/r_hand
							)

/datum/design/research/item/mechfab/prosthesis_moebius/r_hand
	build_path = /obj/item/organ/external/robotic/moebius/r_hand

/datum/design/research/item/mechfab/prosthesis_moebius/l_hand
	build_path = /obj/item/organ/external/robotic/moebius/l_hand

/datum/design/research/item/mechfab/prosthesis_moebius/r_foot
	build_path = /obj/item/organ/external/robotic/moebius/r_foot

/datum/design/research/item/mechfab/prosthesis_moebius/l_foot
	build_path = /obj/item/organ/external/robotic/moebius/l_foot

/datum/trade_station/cybermoebus
	assortiment = list(
		"Moebius" = list(
			/obj/item/organ/external/robotic/moebius/l_arm,
			/obj/item/organ/external/robotic/moebius/l_hand,
			/obj/item/organ/external/robotic/moebius/r_arm,
			/obj/item/organ/external/robotic/moebius/r_hand,
			/obj/item/organ/external/robotic/moebius/l_leg,
			/obj/item/organ/external/robotic/moebius/l_foot,
			/obj/item/organ/external/robotic/moebius/r_leg,
			/obj/item/organ/external/robotic/moebius/r_foot,
			/obj/item/organ/external/robotic/moebius/groin
		),
		"Some Artifacted Shit" = list(
			/obj/item/organ/external/robotic/one_star/l_arm = good_data("What? Left Arm", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/l_hand = good_data("What? Left Hand", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/r_arm = good_data("What? Right Arm", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/r_hand = good_data("What? Right Hand", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/l_leg = good_data("What? Left Leg", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/l_foot = good_data("What? Left Foot", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/r_leg = good_data("What? Right Leg", list(-8, 3)),
			/obj/item/organ/external/robotic/one_star/r_foot = good_data("What? Right Foot", list(-8, 3))
		),
		"Technomancers" = list(
			/obj/item/organ/external/robotic/technomancer/l_arm,
			/obj/item/organ/external/robotic/technomancer/l_hand,
			/obj/item/organ/external/robotic/technomancer/r_arm,
			/obj/item/organ/external/robotic/technomancer/r_hand,
			/obj/item/organ/external/robotic/technomancer/l_leg,
			/obj/item/organ/external/robotic/technomancer/l_foot,
			/obj/item/organ/external/robotic/technomancer/r_leg,
			/obj/item/organ/external/robotic/technomancer/r_foot
		),
		"Frozen Star" = list(
			/obj/item/organ/external/robotic/frozen_star/l_arm,
			/obj/item/organ/external/robotic/frozen_star/l_hand,
			/obj/item/organ/external/robotic/frozen_star/r_arm,
			/obj/item/organ/external/robotic/frozen_star/r_hand,
			/obj/item/organ/external/robotic/frozen_star/l_leg,
			/obj/item/organ/external/robotic/frozen_star/l_foot,
			/obj/item/organ/external/robotic/frozen_star/r_leg,
			/obj/item/organ/external/robotic/frozen_star/r_foot
		)
	)
