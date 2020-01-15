/obj/item/weapon/storage/wallet
	name = "wallet"
	desc = "It can hold a few small and personal things."
	storage_slots = 7
	icon_state = "wallet"
	w_class = ITEM_SIZE_SMALL
	can_hold = list(
		/obj/item/weapon/spacecash,
		/obj/item/weapon/card,
		/obj/item/clothing/mask/smokable/cigarette/,
		/obj/item/device/lighting/toggleable/flashlight/pen,
		/obj/item/seeds,
		/obj/item/weapon/reagent_containers/pill,
		/obj/item/weapon/coin,
		/obj/item/weapon/dice,
		/obj/item/weapon/disk,
		/obj/item/weapon/implanter,
		/obj/item/weapon/flame/lighter,
		/obj/item/weapon/flame/match,
		/obj/item/weapon/paper,
		/obj/item/weapon/pen,
		/obj/item/weapon/photo,
		/obj/item/weapon/reagent_containers/dropper,
		/obj/item/weapon/tool/screwdriver,
		/obj/item/weapon/computer_hardware/hard_drive/portable,
		/obj/item/weapon/reagent_containers/syringe,
		/obj/item/weapon/stamp)
	slot_flags = SLOT_ID

	matter = list(MATERIAL_BIOMATTER = 4)
	var/obj/item/weapon/card/id/front_id = null


/obj/item/weapon/storage/wallet/remove_from_storage(obj/item/W as obj, atom/new_location)
	. = ..(W, new_location)
	if(W == front_id)
		front_id = null
		name = initial(name)
		update_icon()

/obj/item/weapon/storage/wallet/handle_item_insertion(obj/item/W as obj, prevent_warning = 0)
	. = ..(W, prevent_warning)
	if(.)
		if(!front_id && istype(W, /obj/item/weapon/card/id))
			front_id = W
			name = "[name] ([front_id])"
			update_icon()

/obj/item/weapon/storage/wallet/update_icon()

	if(front_id)
		switch(front_id.icon_state)
			if("id")
				icon_state = "walletid"
				return
			if(MATERIAL_SILVER)
				icon_state = "walletid_silver"
				return
			if(MATERIAL_GOLD)
				icon_state = "walletid_gold"
				return
			if("centcom")
				icon_state = "walletid_centcom"
				return
	icon_state = "wallet"


/obj/item/weapon/storage/wallet/GetIdCard()
	return front_id

/obj/item/weapon/storage/wallet/GetAccess()
	var/obj/item/I = GetIdCard()
	if(I)
		return I.GetAccess()
	else
		return ..()

/obj/item/weapon/storage/wallet/random/populate_contents()
	var/item1_type = pick(/obj/item/weapon/spacecash/bundle/c10,/obj/item/weapon/spacecash/bundle/c100,/obj/item/weapon/spacecash/bundle/c1000,/obj/item/weapon/spacecash/bundle/c20,/obj/item/weapon/spacecash/bundle/c200,/obj/item/weapon/spacecash/bundle/c50,/obj/item/weapon/spacecash/bundle/c500)
	var/item2_type
	if(prob(50))
		item2_type = pick(/obj/item/weapon/spacecash/bundle/c10,/obj/item/weapon/spacecash/bundle/c100,/obj/item/weapon/spacecash/bundle/c1000,/obj/item/weapon/spacecash/bundle/c20,/obj/item/weapon/spacecash/bundle/c200,/obj/item/weapon/spacecash/bundle/c50,/obj/item/weapon/spacecash/bundle/c500)
	var/item3_type = pick(/obj/item/weapon/coin/silver, /obj/item/weapon/coin/silver, /obj/item/weapon/coin/gold, /obj/item/weapon/coin/iron, /obj/item/weapon/coin/iron, /obj/item/weapon/coin/iron)

	if(item1_type)
		new item1_type(src)
	if(item2_type)
		new item2_type(src)
	if(item3_type)
		new item3_type(src)
