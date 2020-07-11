//Yes, this is how NIFs do it.
//Yes, I blatantly copied it.
//No, I don't have any regrets.

/mob/living/carbon/human/Stat()
	. = ..()
	if(crypt && statpanel("Soulcrypt"))
		Setup_Soulcrypt()

/mob/living/carbon/human/proc/Setup_Soulcrypt()
	var/crypt_status = ""
	var/crypt_percent = round((crypt.integrity/initial(crypt.max_integrity))*100)
	var/crypt_energy_percent = round((crypt.energy/initial(crypt.max_energy))*100)
	var/nutrition_usage_text
	switch(crypt.stat)
		if(SOULCRYPT_ONLINE)
			if(crypt.integrity < 20)
				crypt_status = "Service Needed Soon"
			else
				crypt_status = "Operating Normally"
		if(SOULCRYPT_LOW_POWER)
			crypt_status = "Insufficient Energy!"
		if(SOULCRYPT_DISRUPTED)
			crypt_status = "System Failure!"
		else
			throw EXCEPTION(crypt.stat)
	switch(crypt.nutrition_usage_setting)
		if(NUTRITION_USAGE_LOW)
			nutrition_usage_text = "Low"
		if(NUTRITION_USAGE_MEDIUM)
			nutrition_usage_text = "Medium"
		if(NUTRITION_USAGE_HIGH)
			nutrition_usage_text = "High"
	crypt_status += " (Integrity: [crypt_percent]%)"
	crypt_status += " (Energy: [crypt_energy_percent]%)"
	crypt_status += " (Internal fuel cell setting: [nutrition_usage_text])"
	stat("Soulcrypt Status", crypt_status)

	if(crypt.stat == SOULCRYPT_ONLINE)
		stat("- Modules -", "LMB: Toggle, Shift+LMB: Info/Uninstall")
		for(var/module in crypt.modules)
			if(!module) continue
			var/datum/soulcrypt_module/mod = module
			var/obj/effect/crypt_stat/stat_line = mod.stat_line
			stat("[stat_line.module_name]",stat_line.atom_button_text())

// Stat Line Object
/obj/effect/crypt_stat
	name = ""
	var/module_name			//Prevents deeper lookups, and the name won't change
	var/datum/soulcrypt_module/module	//Reference to our nifsoft
	var/toggleable = FALSE		//Won't change, prevents looking it up deeper

/obj/effect/crypt_stat/New(var/datum/soulcrypt_module/new_module)
	..()
	module = new_module
	module_name = new_module.name
	name = new_module.name

/obj/effect/crypt_stat/Destroy()
	module = null
	return ..()

/obj/effect/crypt_stat/proc/atom_button_text()
	name = module.stat_text()
	return src

/obj/effect/crypt_stat/Click(var/location, var/control, var/params)
	if(usr != module.owner.wearer) return

	var/list/clickprops = params2list(params)
	var/opts = clickprops["shift"]

	if(opts)
		var/choice = alert("Select an option","[module_name]","Display Info","Cancel","Uninstall")
		switch(choice)
			if("Display Info")
				module.message_user("[module_name]: [module.description]")
			if("Uninstall")
				var/confirm = alert("Really uninstall [module_name]?","Are you sure?","Cancel","Uninstall","Cancel")
				if(confirm == "Uninstall")
					module.uninstall()
	else if(module.activates)
		if(module.active)
			module.deactivate()
		else
			module.activate(module.owner.wearer)