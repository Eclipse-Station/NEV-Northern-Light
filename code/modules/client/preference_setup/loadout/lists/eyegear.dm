// Eyes
/datum/gear/eyes
	display_name = "eyepatch"
	path = /obj/item/clothing/glasses/eyepatch
	slot = slot_glasses
	sort_category = "Glasses and Eyewear"

/datum/gear/eyes/glasses
	display_name = "Glasses, prescription"
	path = /obj/item/clothing/glasses/regular

/datum/gear/eyes/glasses/green
	display_name = "Glasses, green"
	path = /obj/item/clothing/glasses/gglasses

/datum/gear/eyes/glasses/prescriptionhipster
	display_name = "Glasses, hipster"
	path = /obj/item/clothing/glasses/regular/hipster

/datum/gear/eyes/glasses/monocle
	display_name = "Monocle"
	path = /obj/item/clothing/glasses/monocle

/datum/gear/eyes/scanning_goggles
	display_name = "scanning goggles"
	path = /obj/item/clothing/glasses/regular/scanners

/datum/gear/eyes/sciencegoggles
	display_name = "Science Goggles"
	path = /obj/item/clothing/glasses/powered/science
	allowed_roles = list(JOBS_SCIENCE)

/datum/gear/eyes/security
	display_name = "Security HUD"
	path = /obj/item/clothing/glasses/hud/security
	allowed_roles = list(JOBS_SECURITY)

/datum/gear/eyes/medical
	display_name = "Medical HUD"
	path = /obj/item/clothing/glasses/hud/health
	allowed_roles = list(JOBS_MEDICAL)

/datum/gear/eyes/shades
	display_name = "Sunglasses, fat"
	path = /obj/item/clothing/glasses/sunglasses/big
	allowed_roles = list("Aegis Operative","Aegis Commander","Aegis Gunnery Sergeant","Captain","Head of Personnel","Quartermaster","Aegis Inspector")

/datum/gear/eyes/shades/prescriptionsun
	display_name = "sunglasses, presciption"
	path = /obj/item/clothing/glasses/sunglasses/prescription
	cost = 2
