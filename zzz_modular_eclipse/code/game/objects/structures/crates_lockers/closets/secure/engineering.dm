//Personal lockers for the Engineering Enforcers
/obj/structure/closet/secure_closet/personal/engi_enforcer_personal
	name = "enforcer's locker"
	req_access = list(access_ce)
	access_occupy = list(access_engine_equip)
	icon_state = "eng"
	icon_door = "eng_secure"

/obj/structure/closet/secure_closet/personal/engi_enforcer_personal/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else
		new /obj/item/storage/backpack/satchel/industrial(src)
	new /obj/item/taperoll/engineering(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/clothing/under/rank/engineer(src)
	new /obj/item/storage/belt/tactical(src)
	new /obj/item/storage/pouch/pistol_holster(src)
	new /obj/item/clothing/gloves/insulated(src)
	new /obj/item/device/radio/headset/headset_eng(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/clothing/suit/storage/vest/insulated(src)
	new /obj/item/clothing/head/armor/helmet/technomancer_old(src)
	new	/obj/item/gun/energy/guanyu(src)
	new /obj/item/cell/medium/super(src)
	new /obj/item/cell/medium/super(src)
	new /obj/item/device/flash(src)
	new /obj/item/handcuffs(src)
