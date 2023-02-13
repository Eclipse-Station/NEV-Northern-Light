///hook/startup/proc/makeTeshIcons()
//	generate_non_humanoid_icons("teshari")

//Code inspired/stolen from HumanScissors tool by Arokha
/proc/generate_non_humanoid_icons(var/species_tag)

	var/base_path = "zzz_modular_eclipse/icons/mob/cut_up/" + species_tag
	var/original_path = "icons/inventory"
	var/list/icons = list(
	"uniform"		= "/uniform/mob.dmi",
	"uniform_f"		= "/uniform/mob_fem.dmi",
	"suit"			= "/suit/mob.dmi" ,
	"suit_f"		= "/suit/mob_fem.dmi",
	"gloves"		= "/hands/mob.dmi",
	"glasses"		= "/eyes/mob.dmi",
	"ears"			= "/ears/mob.dmi",
	"mask"			= "/face/mob.dmi",
	"hat"			= "/head/mob.dmi",
	"shoes"			= "/feet/mob.dmi",
	"belt"			= "/belt/mob.dmi",
	"s_store"		= "/on_suit/mob.dmi",
	"backpack"		= "/back/mob.dmi",
	"underwear"		= "/underwear/mob.dmi"
	)

	//fcopy(outputIcon, filename)	//Update output icon each iteration
	//fdel(filename)

	for(var/slot in icons)
		var/icon/RunningOutput = new ()
		var/icon/sprite_to_snip = icon(original_path + icons[slot])
		var/icon/cookie_cutter = icon(base_path + "/stencil/" + species_tag + ".dmi")
		//testing(base_path + "/stencil/" + species_tag + ".dmi")
		for(var/original_state in icon_states(sprite_to_snip))

			//The fully assembled icon to cut
			var/icon/original = icon(sprite_to_snip,original_state)

			//Our cookie cutter sprite
			var/icon/cutter = icon(cookie_cutter, "cutter")

			//We have to make these all black to cut with
			cutter.Blend(rgb(0,0,0),ICON_MULTIPLY)

			//Blend with AND to cut
			original.Blend(cutter,ICON_AND) //AND, not ADD

			//Make a useful name
			var/good_name = "[original_state]"

			//Add to the output with the good name
			RunningOutput.Insert(original,good_name)

		var/filename = base_path + "/" + slot + ".dmi"

		fdel(filename)

		fcopy(RunningOutput, filename)
