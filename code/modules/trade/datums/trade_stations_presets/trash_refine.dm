/datum/trade_station/lancer
	name_pool = list("NDCV 'Lancer'" = "NanoTrasen Debris Collection Vessel 'Lancer'. They're sending a message. \"Hey, we're kinda short on hands sifting through all this \"treasure\", so we decided to share. Only 50 creds.\"")
	assortiment = list(
		"Trash" = list(/obj/spawner/scrap/dense = custom_good_amount_range(list(6, 80)))
	)

/obj/spawner/scrap
	price_tag = 50

