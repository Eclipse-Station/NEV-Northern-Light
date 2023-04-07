/mob/living/carbon/superior_animal/giant_spider/chameleon //Eclipse edit: An Eclipse-level port of the Sojourn cloaker spider
	name = "Mienai spider"
	icon_state = "hunter"
	icon_living = "hunter"
	maxHealth = 70
	health = 70
	melee_damage_lower = 10
	melee_damage_upper = 20
	poison_per_bite = 4
	move_to_delay = 4.5
	meat_type = /obj/item/reagent_containers/food/snacks/meat/spider
	meat_amount = 4
	desc = "A massive tarantula. This one has a weaker chameleonic chitin that makes it hard to see."
	alpha = 50
	armor = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 10, rad = 25)
	rarity_value = 90

/mob/living/carbon/superior_animal/giant_spider/chameleon/death() //We are now unable to chameleonic chitin do to being dead
	..()
	alpha = 255