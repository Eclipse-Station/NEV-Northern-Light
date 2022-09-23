// Firearm and energy-based ranged weaponry, as well as ballistic magazines.

///////////////
// ENERGY
///////////////

//Generic energy gun.
/obj/item/gun/energy
	description_info = "This is an energy weapon. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	Most lasers can safely fire through glass without harming it."

/obj/item/gun/energy/get_description_interaction()
	var/list/results = list()
	if(firemodes.len)
		results += "This energy weapon has a firemode selector. To switch firemodes, \
		use the firemode selector button on \
		your HUD."
	
	if(self_recharge)
		results += "This energy weapon is self-recharging, and does not require a \
		power cell to function."
	else
		results += "Most energy weapons require a \
		power cell in order to fire. Power cells can be removed by dragging from \
		the gun into an empty hand. You can tell what power cell a gun needs by \
		the letter immediately before the gun's nickname."
	
	if(can_dual)
		results += "This energy weapon can be held guns-akimbo. To dual-wield, find \
		another firearm that can be dual-wielded, ensure the \
		safety of both weapons is off, ensure you are on 'harm' intent, and click \
		where you want to fire. Dual-wielding has an innate penalty to recoil control."
		
	
	if(twohanded)
		results += "This energy weapon is too heavy to fire with one hand. To hold \
		it two-handed, press the wield button on your HUD, \
		or press shift-X in hotkey mode."
	else if(one_hand_penalty)
		results += "This energy weapon is heavy. You'll have difficulty keeping it \
		on target if you try to fire it one-handed. To hold it two-handed, press \
		the wield button on your HUD, or press shift-X \
		in hotkey mode."
	
	return results

/obj/item/gun/energy/ionrifle
	description_info = "This is an energy weapon. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	Ion-based weapons are extremely effective against mechanical threats, but will \
	disrupt electronics near the point of impact."

/obj/item/gun/energy/shrapnel
	description_info = "This is an energy weapon. To fire the weapon, ensure the \
	safety is off, and click where you want to fire."

// Eclipse-added guns
/obj/item/gun/energy/lever_action		//Maverick
	description_info = "This is an energy weapon. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	Most energy weapons require a power cell \
	in order to fire. You can tell what power cell a gun needs by the S, M, or L \
	immediately before the gun's nickname. \n\
	\n\
	This weapon in particular can hold up to 3 cells in the magazine tube, plus one \
	in the 'chamber'. To eject the 'chambered' cell and load the next one, use the \
	gun in your hand, press 'Page Down', or (on hotkey mode) the Y or Z key.\n\
	\n\
	This weapon's damage depends on the amount of charge in the cell it is firing. \
	The more charge the cell has, the more damage it will output. Like the Squire \
	and Paladin, firing the weapon will completely discharge the currently loaded cell. \
	Unlike the Squire and Paladin, however, it will not destroy the cell.\n\
	\n\
	Most lasers can safely fire through glass without harming it."

/obj/item/gun/energy/lever_action/get_description_interaction()
	return null

/obj/item/gun/energy/laser/paladin		//Paladin
	description_info = "This is an energy weapon. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	This weapon's damage depends on the amount of charge in the cell it is firing. \
	The more charge the cell has, the more damage it will output. Be warned, however, \
	that firing this weapon will destroy the cell inside.\n\
	\n\
	Most lasers can safely fire through glass without harming it."

/obj/item/gun/energy/laser/squire		//Squire
	description_info = "This is an energy weapon. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	This weapon's damage depends on the amount of charge in the cell it is firing. \
	The more charge the cell has, the more damage it will output. Be warned, however, \
	that firing this weapon will destroy the cell inside.\n\
	\n\
	Most lasers can safely fire through glass without harming it."

///////////////
// BALLISTICS
///////////////

/obj/item/gun/projectile		//Generic.
	description_info = "This is a ballistic firearm. To fire the weapon, ensure the \
	safety is off, and click where you want to fire."

/obj/item/gun/projectile/get_description_interaction()
	var/list/results = list()

	if(load_method == MAGAZINE)
		results += "Most ballistic weapons load from a \
		magazine. To remove a magazine, drag it from a gun into an empty hand."

	results += "You can tell what caliber a firearm is chambered for by the designation \
	immediately before the gun's nickname."
	
	if(firemodes.len)
		results += "This firearm has a firemode selector. To switch firemodes, \
		use the firemode selector button \
		on your HUD."
	
	if(saw_off)
		results += "This firearm can be made shorter by \
		sawing it down. You can use any tool with the 'sawing' quality to do this. \
		Obviously, it is a bad idea to saw down a loaded firearm."
	
	if(can_dual)
		results += "This firearm can be held guns-akimbo. To dual-wield, find \
		another firearm that can be dual-wielded, ensure the \
		safety of both weapons is off, ensure you are on 'harm' intent, and click \
		where you want to fire. Dual-wielding has an innate penalty to recoil control."
	
	if(twohanded)
		results += "This firearm is too heavy to fire with one hand. To hold \
		it two-handed, press the wield button on your HUD, \
		or press shift-X in hotkey mode."
	else if(one_hand_penalty)
		results += "This firearm is heavy. You'll have difficulty keeping it \
		on target if you try to fire it one-handed. To hold it two-handed, press \
		the wield button on your HUD, or press shift-X \
		in hotkey mode."
	
	
	return results

/obj/item/gun/projectile/automatic/slaught_o_matic		//Disposable SMG
	description_info = "This is a ballistic firearm. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	This weapon's magazine cannot be removed or reloaded - once it's empty, that's it."

/obj/item/gun/projectile/revolver/get_description_interaction()
	var/list/results = list()
	
	results += "Revolvers store their ammunition in a cylinder. You can reload \
	it by using bullets on the gun, or by using \
	a speedloader. You can quickly dump the \
	cylinder out on the ground by using it in your hand, pressing the 'Page Down' \
	key, or (in hotkey mode) the Y or Z key."
	
	results += ..()
	return results

/obj/item/gun/projectile/boltgun/get_description_interaction()
	var/list/results = list()

	results += "Bolt-action firearms generally do not have a removable magazine, \
	and must be cycled by hand after every shot. To open the bolt and eject the \
	chambered round, click on it in your hand, press 'Page Down', or (in hotkey \
	mode) the Y or Z key. To close the bolt and allow the rifle to fire again, \
	use it in your hand again. \n\
	\n\
	Bolt-action firearms can be loaded by using \
	bullets on the gun with the bolt open, or by using a \
	stripper clip."

	if(saw_off)
		results += "This firearm can be made shorter by \
		sawing it down. You can use any tool with the 'sawing' quality to do this. \
		Obviously, it is a bad idea to saw down a loaded firearm."
	
	if(can_dual)		//As if.
		results += "This firearm can be held guns-akimbo. To dual-wield, find \
		another firearm that can be dual-wielded, ensure the \
		safety of both weapons is off, ensure you are on 'harm' intent, and click \
		where you want to fire. Dual-wielding has an innate penalty to recoil control."
	if(twohanded)
		results += "This firearm is too heavy to fire with one hand. To hold \
		it two-handed, press the wield button on your HUD, \
		or press shift-X in hotkey mode."
	else if(one_hand_penalty)
		results += "This firearm is heavy. You'll have difficulty keeping it \
		on target if you try to fire it one-handed. To hold it two-handed, press \
		the wield button on your HUD, or press shift-X \
		in hotkey mode."
	
	return results

/obj/item/gun/projectile/shotgun/get_description_interaction()		//lotta copy paste here.
	var/list/results = list()
	
	if(load_method == MAGAZINE)
		results += "Most ballistic weapons load from a \
		magazine. To remove a magazine, drag it from a gun into an empty hand."
	else
		results += "Most shotguns generaly do not have a removable magazine, and must by cycled by \
		hand after every shot. To rack the slide and eject the chambered shell, use the \
		gun in your hand, press the 'Page Down' key, or (in hotkey mode) the Y or Z key. \
		To load ammo into a shotgun, click on it with a shell."

	if(firemodes.len)
		results += "This firearm has a firemode selector. To switch firemodes, \
		use the firemode selector button \
		on your HUD."
	
	if(saw_off)
		results += "This firearm can be made shorter by \
		sawing it down. You can use any tool with the 'sawing' quality to do this. \
		Obviously, it is a bad idea to saw down a loaded firearm."
		
	if(twohanded)
		results += "This firearm is too heavy to fire with one hand. To hold \
		it two-handed, press the wield button on your HUD, \
		or press shift-X in hotkey mode."
	else if(one_hand_penalty)
		results += "This firearm is heavy. You'll have difficulty keeping it \
		on target if you try to fire it one-handed. To hold it two-handed, press \
		the wield button on your HUD, or press shift-X \
		in hotkey mode."
	
	return results

/obj/item/gun/projectile/shotgun/bull/get_description_interaction()		//Bull
	var/list/results = list()

	results += "This shotgun does not have a removable magazine, and must by cycled by \
	hand after firing both barrels. To rack the slide and eject the chambered shells, use the \
	gun in your hand, press the 'Page Down' key, or (in hotkey mode) the Y or Z key. \
	To load ammo into this shotgun, click on it with a shell."
	
	if(firemodes.len)
		results += "You can use the firemode \
		selector to switch between firing one barrel at a time, and firing both barrels at once."
	
	return results

/obj/item/gun/projectile/shotgun/doublebarrel/get_description_interaction()		//Double-barrel.
	var/list/results = list()
	
	results += "This shotgun holds two shells - one per barrel. To open the breech, \
	use the gun in your hand, press the 'Page Down' key, or (in hotkey mode) the \
	Y or Z key. Opening the breech will automatically eject the shells in the chambers. \
	To load ammo into this shotgun, click on it with a \
	shell while the breech is open."
	
	if(firemodes.len)
		results += "You can use the firemode \
		selector to switch between firing one barrel at a time, and firing both barrels at once."
	if(saw_off)
		results += "This firearm can be made shorter by \
		sawing it down. You can use any tool with the 'sawing' quality to do this. \
		Obviously, it is a bad idea to saw down a loaded firearm."
	
	if(twohanded)
		results += "This firearm is too heavy to fire with one hand. To hold \
		it two-handed, press the wield button on your HUD, \
		or press shift-X in hotkey mode."
	else if(one_hand_penalty)
		results += "This firearm is heavy. You'll have difficulty keeping it \
		on target if you try to fire it one-handed. To hold it two-handed, press \
		the wield button on your HUD, or press shift-X \
		in hotkey mode."
	return results

/obj/item/gun/projectile/rpg		//RPG-17.
	description_info = "This is (technically) a ballistic firearm. To fire the weapon, \
	ensure the safety is off, and click where you \
	want to fire. \n\
	\n\
	RPG launchers use RPG ammunition. To load a RPG warhead, click on it with the \
	warhead. To remove the warhead without firing, drag it from the launcher into \
	an empty hand."

///////////////
// OTHER
///////////////

/obj/item/gun/matter/launcher/nt_sprayer		//Street Sprayer
	description_info = "This is a chemical sprayer. To fire the weapon, ensure the \
	safety is off, and click where you want to fire. \n\
	\n\
	This sprayer feeds from an internal reservoir of biomatter. To reload it, click \
	on the sprayer with a stack of biomatter sheets. \n\
	\n\
	You can use the firemode selector to \
	switch the sprayer between cleaning solution and herbicide."

/obj/item/hatton		//Hatton.
	description_info = "This is a breaching tool. To use it, click on what you \
	need to use it on. You must be adjacent to the item you use it on. \n\
	\n\
	This tool will destroy walls and barriers, and will have an effect on things \
	such as tables, computers, machinery, and airlocks. In a pinch, it can also be \
	used as a makeshift weapon. \n\
	\n\
	This tool uses special gas tubes to function. The gas tubes cannot be refilled."

