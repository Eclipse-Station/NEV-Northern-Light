/obj/structure/closet/secure_closet/personal/hydroponics
	name = "botanist's locker"
	req_access = list(access_hydroponics)
	access_occupy = list(access_hydroponics)
	icon_state = "hydro"

/obj/structure/closet/secure_closet/personal/hydroponics/populate_contents()
	if(prob(25))
		new /obj/item/weapon/storage/backpack/botanist(src)
	else if(prob(25))
		new /obj/item/weapon/storage/backpack/sport/botanist(src)
	else
		new /obj/item/weapon/storage/backpack/satchel/botanist(src)
	new /obj/item/clothing/suit/apron(src)
	new /obj/item/weapon/storage/bag/produce(src)
	new /obj/item/clothing/under/rank/hydroponics(src)
	new /obj/item/device/scanner/plant(src)
	new /obj/item/device/radio/headset/headset_service(src)
	new /obj/item/clothing/mask/bandana/botany(src)
	new /obj/item/weapon/tool/minihoe(src)
	new /obj/item/weapon/tool/hatchet(src)
	new /obj/item/weapon/tool/wirecutters(src)
	new /obj/item/weapon/reagent_containers/spray/plantbgone(src)
	new /obj/item/clothing/gloves/botanic_leather(src)

/obj/structure/closet/secure_closet/personal/hydroponics/public
	name = "gardener's locker"
	req_access = list(access_hydroponics)
	access_occupy = list()

/obj/structure/closet/secure_closet/personal/agrolyte
	name = "agrolyte's locker"
	req_access = list(access_hydroponics)
	access_occupy = list(access_hydroponics)
	icon_state = "agrolyte"

/obj/structure/closet/secure_closet/personal/agrolyte/populate_contents()
	if(prob(25))
		new /obj/item/weapon/storage/backpack/neotheology(src)
	else if(prob(25))
		new /obj/item/weapon/storage/backpack/sport/neotheology(src)
	else
		new /obj/item/weapon/storage/backpack/satchel/neotheology(src)
	new /obj/item/clothing/suit/apron(src)
	new /obj/item/weapon/storage/belt/utility/neotheology(src)
	new /obj/item/weapon/storage/bag/produce(src)
	new /obj/item/clothing/under/rank/hydroponics(src)
	new /obj/item/device/scanner/plant(src)
	new /obj/item/device/radio/headset/church(src)
	new /obj/item/clothing/mask/bandana/botany(src)
	new /obj/item/weapon/tool/minihoe(src)
	new /obj/item/weapon/tool/hatchet(src)
	new /obj/item/weapon/tool/wirecutters(src)
	new /obj/item/weapon/reagent_containers/spray/plantbgone(src)
	new /obj/item/clothing/suit/space/void/agrolyte(src)
	new /obj/item/clothing/gloves/botanic_leather(src)
