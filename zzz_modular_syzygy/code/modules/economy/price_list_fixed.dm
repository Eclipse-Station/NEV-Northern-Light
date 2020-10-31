//***************//
//---Beverages---//
//***************//

// Juices, soda and similar //

/datum/reagent/water
	price_tag = 0 //We can get infinate amounts of water

/datum/reagent/drink/juice
	price_tag = 1 //We can generate infinate amounts of juice with no effort

/datum/reagent/toxin/poisonberryjuice
	price_tag = 2

/datum/reagent/drink/milk
	price_tag = 2

/datum/reagent/drink/soda
	price_tag = 1 //We can generate infinate amounts of soda with no effort

/datum/reagent/drink/doctor_delight
	price_tag = 3

/datum/reagent/drink/nothing
	price_tag = 4//Actually hard to get. 400cr per bottle

/datum/reagent/drink/milkshake
	price_tag = 4

/datum/reagent/drink/roy_rogers
	price_tag = 2

/datum/reagent/drink/shirley_temple
	price_tag = 2

/datum/reagent/drink/arnold_palmer
	price_tag = 2

/datum/reagent/drink/collins_mix
	price_tag = 2


// Beer //

/datum/reagent/ethanol/ale
	price_tag = 2

/datum/reagent/ethanol/beer
	price_tag = 2


// Hot Drinks //

/datum/reagent/drink/rewriter
	price_tag = 1

/datum/reagent/drink/tea
	price_tag = 1//We can generate infinate amounts of tea with no effort

/datum/reagent/drink/coffee
	price_tag = 1//we can generate infinate amounts of coffee with no effort

/datum/reagent/drink/hot_coco
	price_tag = 1

/obj/item/weapon/reagent_containers/food
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/coffee
	price_tag = 0//Trash

/obj/item/weapon/reagent_containers/food/drinks/tea
	price_tag = 0//It's trash

/obj/item/weapon/reagent_containers/food/drinks/h_chocolate
	price_tag = 0//No bottle returns


// Spirituous liquors //
// Cheap Stuff Up to 30usd//

/datum/reagent/ethanol/vodka
	price_tag = 1

/datum/reagent/ethanol/rum
	price_tag = 1

/datum/reagent/ethanol/coffee/kahlua
	price_tag = 1

/datum/reagent/ethanol/bluecuracao
	price_tag = 1

/datum/reagent/ethanol/melonliquor
	price_tag = 1

// Intermediate stuff, up to 50usd//

/datum/reagent/ethanol/gin
	price_tag = 2

/datum/reagent/ethanol/absinthe
	price_tag = 2

/datum/reagent/ethanol/whiskey
	price_tag = 2

/datum/reagent/ethanol/irish_cream
	price_tag = 2

/datum/reagent/ethanol/deadrum
	price_tag = 2

/datum/reagent/ethanol/goldschlager
	price_tag = 2

/datum/reagent/ethanol/coffee/brave_bull // Not an original liquor in its own. But since it's a mix of purely Tequila
	price_tag = 2

// More expensive stuff

/datum/reagent/ethanol/tequilla
	price_tag = 3

/datum/reagent/ethanol/thirteenloko
	price_tag = 3

/datum/reagent/ethanol/specialwhiskey
	price_tag = 3

// VERY expensive stuff

/datum/reagent/ethanol/patron
	price_tag = 4//Silver in it

// Wines //

/datum/reagent/ethanol/wine
	price_tag = 1

/datum/reagent/ethanol/sake
	price_tag = 1

/datum/reagent/ethanol/vermouth
	price_tag = 1

/datum/reagent/ethanol/cognac
	price_tag = 3

/datum/reagent/ethanol/pwine
	price_tag = 4


// Cocktails //
/*
/datum/reagent/ethanol/acid_spit
	price_tag = 40

/datum/reagent/ethanol/alliescocktail
	price_tag = 40

/datum/reagent/ethanol/aloe
	price_tag = 4

/datum/reagent/ethanol/amasec
	price_tag = 4

/datum/reagent/ethanol/andalusia
	price_tag = 4

/datum/reagent/ethanol/antifreeze
	price_tag = 4

/datum/reagent/ethanol/atomicbomb
	price_tag = 4

/datum/reagent/ethanol/coffee/b52
	price_tag = 4

/datum/reagent/ethanol/bahama_mama
	price_tag = 4

/datum/reagent/ethanol/barefoot
	price_tag = 4

/datum/reagent/ethanol/beepsky_smash
	price_tag = 4

/datum/reagent/ethanol/bilk
	price_tag = 4

/datum/reagent/ethanol/black_russian
	price_tag = 4

/datum/reagent/ethanol/bloody_mary
	price_tag = 4

/datum/reagent/ethanol/booger
	price_tag = 4

/datum/reagent/ethanol/brave_bull
	price_tag = 4

/datum/reagent/ethanol/changeling_sting
	price_tag = 4

/datum/reagent/ethanol/martini
	price_tag = 4

/datum/reagent/ethanol/cuba_libre
	price_tag = 4

/datum/reagent/ethanol/demonsblood
	price_tag = 4

/datum/reagent/ethanol/devilskiss
	price_tag = 4

/datum/reagent/ethanol/driestmartini
	price_tag = 4

/datum/reagent/ethanol/ginfizz
	price_tag = 4

/datum/reagent/ethanol/grog
	price_tag = 4

/datum/reagent/ethanol/erikasurprise
	price_tag = 4

/datum/reagent/ethanol/gargle_blaster
	price_tag = 4

/datum/reagent/ethanol/gintonic
	price_tag = 4

/datum/reagent/ethanol/hippies_delight
	price_tag = 4

/datum/reagent/ethanol/hooch
	price_tag = 4

/datum/reagent/ethanol/iced_beer
	price_tag = 4

/datum/reagent/ethanol/irishcarbomb
	price_tag = 4

/datum/reagent/ethanol/coffee/irishcoffee
	price_tag = 4

/datum/reagent/ethanol/longislandicedtea
	price_tag = 4

/datum/reagent/ethanol/manhattan
	price_tag = 4

/datum/reagent/ethanol/manhattan_proj
	price_tag = 4

/datum/reagent/ethanol/manly_dorf
	price_tag = 4

/datum/reagent/ethanol/margarita
	price_tag = 4

/datum/reagent/ethanol/mead
	price_tag = 4

/datum/reagent/ethanol/moonshine
	price_tag = 4

/datum/reagent/ethanol/neurotoxin
	price_tag = 4

/datum/reagent/ethanol/red_mead
	price_tag = 4

/datum/reagent/ethanol/sbiten
	price_tag = 4

/datum/reagent/ethanol/screwdrivercocktail
	price_tag = 4

/datum/reagent/ethanol/silencer
	price_tag = 4

/datum/reagent/ethanol/singulo
	price_tag = 4

/datum/reagent/ethanol/snowwhite
	price_tag = 4

/datum/reagent/ethanol/suidream
	price_tag = 4

/datum/reagent/ethanol/syndicatebomb
	price_tag = 4

/datum/reagent/ethanol/tequillasunrise
	price_tag = 4

/datum/reagent/ethanol/threemileisland
	price_tag = 4

/datum/reagent/ethanol/toxins_special
	price_tag = 4

/datum/reagent/ethanol/vodkamartini
	price_tag = 4

/datum/reagent/ethanol/vodkatonic
	price_tag = 4

/datum/reagent/ethanol/white_russian
	price_tag = 4

/datum/reagent/ethanol/whiskey_cola
	price_tag = 4

/datum/reagent/ethanol/whiskeysoda
	price_tag = 4


// Cocktails without alcohol //

/datum/reagent/ethanol/bananahonk
	price_tag = 3

*/

// From the machine //

/obj/item/weapon/reagent_containers/food/drinks/cans/cola
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/space_mountain_wind
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/dr_gibb
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/starkist
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/space_up
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/iced_tea
	price_tag = 1

/obj/item/weapon/reagent_containers/food/drinks/cans/grape_juice
	price_tag = 1


//*****************//
//--Bottle Return--//
//*****************//

// Juices, soda and similar //

/obj/item/weapon/reagent_containers/food/drinks/bottle/cola
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/space_up
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/space_mountain_wind
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/orangejuice
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/cream
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/tomatojuice
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/limejuice
	price_tag = 10


// Beer //

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/beer
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/small/ale
	price_tag = 10


// Spirituous Liquors //

/obj/item/weapon/reagent_containers/food/drinks/bottle/absinthe
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/bluecuracao
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/gin
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/kahlua
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/melonliquor
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/rum
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/tequilla
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/whiskey
	price_tag = 10


/obj/item/weapon/reagent_containers/food/drinks/bottle/patron
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/goldschlager
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing
	price_tag = 10

/obj/item/weapon/reagent_containers/food/drinks/bottle/grenadine
	price_tag = 10


// Wines //

/obj/item/weapon/reagent_containers/food/drinks/bottle/wine
	price_tag = 20

/obj/item/weapon/reagent_containers/food/drinks/bottle/cognac
	price_tag = 20

/obj/item/weapon/reagent_containers/food/drinks/bottle/vermouth
	price_tag = 20

/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine
	price_tag = 20

/obj/item/weapon/reagent_containers/get_item_cost(export)
	. = ..()
	for(var/datum/reagent/R in reagents.reagent_list)
		. += R.volume * R.price_tag
/obj/item/weapon/tool/price_tag = 5 //THIS IS MULTIPLIED BY (TOTAL TOOL_QUALITIES/5+1)
/obj/item/ammo_casing/price_tag = 2
