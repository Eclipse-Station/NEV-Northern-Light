/datum/soulcrypt_module/file_browser
	name = "internal file browser"
	description = "The internal file browser for your soulcrypt, acessible with just a thought."
	activation_message = "File browser opened."
	deactivation_message = "Filebrowser closed."
	nanomodule_path = /datum/nano_module/soulcrypt/file_browser

/datum/nano_module/soulcrypt/file_browser
	name = "File Browser"
	var/mob/living/owner

/datum/nano_module/soulcrypt/file_browser/ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/data[0]

	data["modules"] = get_files()

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "sc_filebrowser.tmpl", src.name, 650, 800)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/datum/nano_module/soulcrypt/file_browser/proc/get_files()
	var/datum/soulcrypt_module/hostmodule = host

	var/list/disk_data = list(
		"ref" = "\ref[hostmodule.owner]"
	)

	var/list/programs = list()
	for(var/datum/soulcrypt_module/module in hostmodule.owner.modules)
		var/list/program = list(
			"name" = module.name,
			"desc" = module.description,
			"running" = module.active
			)
		programs.Add(list(program))
	disk_data["programs"] = programs

	return disk_data

/datum/nano_module/soulcrypt/file_browser/Topic(href, href_list)
	var/datum/soulcrypt_module/hostmodule = host

	if(href_list["activate"])
		var/mob/user = usr
		var/datum/soulcrypt_module/mod = hostmodule.owner.find_module_by_name(href_list["activate"])
		mod.activate(user)

	if(href_list["deactivate"])
		var/mob/user = usr
		var/datum/soulcrypt_module/mod = hostmodule.owner.find_module_by_name(href_list["deactivate"])
		mod.activate(user)