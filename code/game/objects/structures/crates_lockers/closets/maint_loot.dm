//Closets full of loot, they should be placed in maints
<<<<<<< HEAD
/obj/structure/closet/random
	spawn_frequency = 10
	spawn_tags = SPAWN_TAG_RANDOM_CLOSET
	rarity_value = 10
	bad_types = /obj/structure/closet/random
=======
>>>>>>> 57c0f65... Merge pull request #196 from SyzygyStation/revert-193-beep_boop

/obj/structure/closet/random_miscellaneous
	name = "\improper forgotten closet"
	desc = "Old and rusty closet, probably older than you."
	icon_state = "oldstyle"
	old_chance = 50

/obj/structure/closet/random_miscellaneous/populate_contents()
	new /obj/random/contraband/low_chance(src)
	new /obj/random/contraband/low_chance(src)
	new /obj/random/pack/rare/low_chance(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/junk(src)
	new /obj/random/lowkeyrandom(src)
	new /obj/random/lowkeyrandom(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	new /obj/random/pack/cloth/low_chance(src)
	new /obj/random/pack/cloth/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)




/obj/structure/closet/random_tech
	name = "\improper technical closet"
	desc = "Somewhat old closet with wrench sign on it."
	icon_state = "eng"
	icon_door = "eng_tool"
	old_chance = 10

/obj/structure/closet/random_tech/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)


<<<<<<< HEAD
/obj/structure/closet/random/spareparts
=======


/obj/structure/closet/random_spareparts
>>>>>>> 57c0f65... Merge pull request #196 from SyzygyStation/revert-193-beep_boop
	name = "\improper spare parts closet"
	desc = "Somewhat old closet with spare parts in it."
	icon_state = "eng"
	icon_door = "eng_secure_door"
	old_chance = 10

/obj/structure/closet/random_tech/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/techpart(src)
	new /obj/random/tool_upgrade(src)
	new /obj/random/tool_upgrade(src)
	new /obj/random/tool_upgrade(src)
	new /obj/random/lathe_disk(src)
	new /obj/random/lathe_disk/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)
	new /obj/random/pack/tech_loot/low_chance(src)





/obj/structure/closet/random_milsupply
	name = "\improper military supply closet"
	desc = "Why is this here?"
	icon_state = "syndicate"
	old_chance = 10

/obj/structure/closet/random_milsupply/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/pack/gun_loot/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)





/obj/structure/closet/random_medsupply
	name = "\improper medical supply closet"
	desc = "Abandoned medical supply."
	icon_state = "freezer"
	old_chance = 10

/obj/structure/closet/random_medsupply/populate_contents()
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical_lowcost(src)
	new /obj/random/medical(src)
	new /obj/random/medical(src)
	new /obj/random/medical(src)
	new /obj/random/medical/low_chance(src)
	new /obj/random/medical/low_chance(src)




/obj/structure/closet/secure_closet/rare_loot
	name = "\improper sealed military supply closet"
	desc = "The access pannel looks old. There is probably no ID's around that can open it."
	req_access = list(access_cent_specops) //You are suppose to hack it
	icon_state = "syndicate"

/obj/structure/closet/secure_closet/rare_loot/populate_contents()
	new /obj/random/pack/rare(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/rare(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)
	new /obj/random/pack/gun_loot(src)



//Closet with unfair bullshit inside
/obj/structure/closet/random_hostilemobs
	name = "\improper forgotten closet"
	desc = "Old and rusty closet, probably older than you."
	icon_state = "oldstyle"
	old_chance = 70

/obj/structure/closet/random_hostilemobs/populate_contents()
	new /obj/random/pack/rare(src) //To reward players for fighting this bullshit
	new /obj/random/pack/rare(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/cluster/roaches(src)

// Used for scrap beacon
<<<<<<< HEAD
/obj/structure/closet/random/hostilemobs/beacon
	rarity_value = 6

/obj/structure/closet/random/hostilemobs/beacon/populate_contents()
	new /obj/spawner/pack/rare(src) //To reward players for fighting this bullshit
	new /obj/spawner/pack/rare(src)
	new /obj/spawner/lowkeyrandom/low_chance(src)
	new /obj/spawner/lowkeyrandom/low_chance(src)
	new /obj/spawner/lowkeyrandom/low_chance(src)
	new /obj/spawner/lowkeyrandom/low_chance(src)
	new /obj/spawner/rations(src)
	new /obj/spawner/rations(src)
	new /obj/spawner/rations(src)
	new /obj/spawner/mob/roaches/cluster/beacon(src)
=======
/obj/structure/closet/random_hostilemobs/beacon/populate_contents()
	new /obj/random/pack/rare(src) //To reward players for fighting this bullshit
	new /obj/random/pack/rare(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/lowkeyrandom/low_chance(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/rations(src)
	new /obj/random/cluster/roaches/beacon(src)
>>>>>>> 57c0f65... Merge pull request #196 from SyzygyStation/revert-193-beep_boop
