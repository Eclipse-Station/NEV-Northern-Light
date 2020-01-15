//Those are all weapons that don't had tool modding at some point, but should have it for balance purposes.

/obj/item/weapon/tool/broken_bottle
	name = "broken bottle"
	desc = "A bottle with a sharp broken bottom."
	icon = 'icons/obj/drinks.dmi'
	icon_state = "broken_bottle"
	matter = list(MATERIAL_GLASS = 2)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 5
	item_state = "beer"
	attack_verb = list("stabbed", "slashed", "attacked")
	sharp = 1
	edge = 0
	tool_qualities = list(QUALITY_CUTTING = 10)
	var/icon/broken_outline = icon('icons/obj/drinks.dmi', "broken")

/obj/item/weapon/tool/hatchet
	name = "hatchet"
	desc = "A very sharp axe blade upon a short fibremetal handle. It has a long history of chopping things, but now it is used for chopping wood."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hatchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 3)
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_SMALL
	sharp = 1
	edge = 1
	armor_penetration = ARMOR_PEN_SHALLOW
	origin_tech = "materials=2;combat=1"
	attack_verb = list("chopped", "torn", "cut")
	tool_qualities = list(QUALITY_CUTTING = 20)

/obj/item/weapon/tool/minihoe
	name = "mini hoe"
	desc = "It's used for removing weeds or scratching your back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "hoe"
	item_state = "hoe"
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	tool_qualities = list(QUALITY_SHOVELING = 10)
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("slashed", "sliced", "cut", "clawed")



//Knifes

/obj/item/weapon/tool/knife
	name = "kitchen knife"
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "knife"
	desc = "A general purpose Chef's Knife made by SpaceCook Incorporated. Guaranteed to stay sharp for years to come."
	flags = CONDUCT
	sharp = 1
	edge = 1
	worksound = WORKSOUND_HARD_SLASH
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_WEAK
	armor_penetration = ARMOR_PEN_SHALLOW
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	slot_flags = SLOT_BELT
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE

/obj/item/weapon/tool/knife/boot
	name = "boot knife"
	desc = "A small fixed-blade knife for putting inside a boot."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 1)
	force = WEAPON_FORCE_PAINFUL
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 10, QUALITY_SCREW_DRIVING = 15)

/obj/item/weapon/tool/knife/hook
	name = "meat hook"
	desc = "A sharp, metal hook what sticks into things."
	icon_state = "hook_knife"
	item_state = "hook_knife"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_DANGEROUS
	armor_penetration = ARMOR_PEN_EXTREME //Should be countered be embedding
	embed_mult = 1.5 //This is designed for embedding

/obj/item/weapon/tool/knife/ritual
	name = "ritual knife"
	desc = "The unearthly energies that once powered this blade are now dormant."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"
	force = WEAPON_FORCE_PAINFUL

/obj/item/weapon/tool/knife/butch
	name = "butcher's cleaver"
	icon_state = "butch"
	desc = "A huge thing used for chopping and chopping up meat. This includes clowns and clown-by-products."
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_NORMAL
	armor_penetration = ARMOR_PEN_MODERATE
	attack_verb = list("cleaved", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	tool_qualities = list(QUALITY_CUTTING = 20,  QUALITY_WIRE_CUTTING = 15)

/obj/item/weapon/tool/knife/neotritual
	name = "NeoTheology ritual knife"
	desc = "The sweet embrace of mercy, for relieving the soul from a tortured vessel."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "neot-knife"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)
	force = WEAPON_FORCE_PAINFUL

/obj/item/weapon/tool/knife/tacknife
	name = "tactical knife"
	desc = "You'd be killing loads of people if this was Medal of Valor: Heroes of Space."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "tacknife_guard"
	item_state = "knife"
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 2)
	force = WEAPON_FORCE_PAINFUL
	armor_penetration = ARMOR_PEN_MODERATE

/obj/item/weapon/tool/scythe
	icon_state = "scythe0"
	name = "scythe"
	desc = "A sharp and curved blade on a long fibremetal handle, this tool makes it easy to reap what you sow."
	matter = list(MATERIAL_PLASTEEL = 7, MATERIAL_PLASTIC = 3)
	sharp = 1
	edge = 1
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	attack_verb = list("chopped", "sliced", "cut", "reaped")
	tool_qualities = list(QUALITY_CUTTING = 15)

//Swords

/obj/item/weapon/tool/sword
	name = "claymore"
	desc = "What are you standing around staring at this for? Get to killing!"
	icon = 'icons/obj/weapons.dmi'
	icon_state = "claymore"
	item_state = "claymore"
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 3)
	sharp = 1
	edge = 1
	slot_flags = SLOT_BELT
	armor_penetration = ARMOR_PEN_EXTREME
	worksound = WORKSOUND_HARD_SLASH
	force = WEAPON_FORCE_BRUTAL
	throwforce = WEAPON_FORCE_NORMAL
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	tool_qualities = list(QUALITY_CUTTING = 10)
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE

/obj/item/weapon/tool/sword/katana
	name = "katana"
	desc = "Woefully underpowered in D20. This one looks pretty sharp."
	icon_state = "katana"
	item_state = "katana"
	slot_flags = SLOT_BELT | SLOT_BACK
