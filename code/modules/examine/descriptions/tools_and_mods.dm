//Tools and tool mods. Firearm mods included.

////////////////
// TOOLS
////////////////

/obj/item/tool
	description_info = "Tools have various qualities. The higher the tool quality, the \
	easier it is to perform work using it. Using tools with a low required quality \
	on a task that requires good tools (for example, using a crowbar to collapse \
	a burrow) will probably take longer in each attempt, and fail repeatedly."

/obj/item/tool/get_description_interaction()
	var/results = list()
	if(src.tool_qualities.len)
		if(QUALITY_BOLT_TURNING in src.tool_qualities)
			results += "This tool can be used to turn bolts. Turning bolts will allow \
			you to do things such as securing and removing pipes and breaking down girders."
		if(QUALITY_PULSING in src.tool_qualities)
			results += "This tool can be used to pulse wires. Pulsing wires is mainly \
			used in hacking doors and machinery."
		if(QUALITY_PRYING in src.tool_qualities)
			results += "This tool can be used as a prying implement. Prying is mainly \
			used to remove floor tiles, open unpowered airlocks, shutters, and blast \
			doors, and break down machinery."
		if(QUALITY_WELDING in src.tool_qualities)
			results += "This tool can be used as a welder. Welders are mainly used to \
			seal things together, such as airlocks and floor cracks, and to remove plating \
			from walls."
		if(QUALITY_SCREW_DRIVING in src.tool_qualities)
			results += "This tool can be used to drive screws. Screwdrivers are mainly \
			used to open maintenance panels on airlocks, computers, and machinery, and \
			removing floor tiles without destroying them."
		if(QUALITY_WIRE_CUTTING in src.tool_qualities)
			results += "This tool can be used to cut wires. Wire cutters are mainly used \
			to cut power cables, and in hacking airlocks and machinery."
		if(QUALITY_CLAMPING in src.tool_qualities)
			results += "This tool can be used as surgical clamps."
		if(QUALITY_CAUTERIZING in src.tool_qualities)
			results += "This tool can be used as a surgical cautery."
		if(QUALITY_RETRACTING in src.tool_qualities)
			results += "This tool can be used as surgical retractors."
		if(QUALITY_DRILLING in src.tool_qualities)
			results += "This tool can be used as a surgical drill."
		if(QUALITY_HAMMERING in src.tool_qualities)
			results += "This tool can be used as a hammer. Hammers are used for \
			precise, focused applications of blunt-force trauma."
		if(QUALITY_SAWING in src.tool_qualities)
			results += "This tool can be used as a saw. Saws are mostly used to amputate \
			limbs and saw down firearms."
		if(QUALITY_BONE_SETTING in src.tool_qualities)
			results += "This tool can be used to surgically set bones."
		if(QUALITY_DIGGING in src.tool_qualities)
			results += "This tool can be used as a digging implement. Digging implements \
			are usually used to collapse burrows."
		if(QUALITY_SHOVELING in src.tool_qualities)
			results += "This tool can be used as a shovel. Shovels are usually used \
			to sift through garbage piles."
		if(QUALITY_EXCAVATION in src.tool_qualities)
			results += "This tool can be used for excavation work."
		if(QUALITY_CUTTING in src.tool_qualities)
			results += "This tool has a sharp edge that can be used for butchering \
			or surgical work."

	return results

///////////////
// TOOL MODS
///////////////

/obj/item/tool_upgrade
	description_info = "Tool mods affect the way your tools operate. Some mods will \
	make you perform work faster, or more durable, or deal more damage if you want \
	to use your tools to beat the local wildlife to death. Some tool mods can only \
	be used on tools with certain qualities. You can check what qualities your tools \
	have by examining them."

///////////////
// WEAPON MODS
///////////////

/obj/item/gun_upgrade		//Generic
	description_info = "Weapon mods affect the way your guns handle. Some mods will \
	allow you to fire faster, or allow your bullets to do more damage."

/obj/item/gun_upgrade/underbarrel
	description_info = "Bipods allow you to better rest a weapon on a table or low \
	wall, reducing recoil while it's deployed."

/obj/item/gun_upgrade/muzzle
	description_info = "Barrel attachments affect how your shots behave after leaving \
	the weapon, as well as how loud the weapon's report is."

/obj/item/gun_upgrade/trigger
	description_info = "Trigger mods affect the way a weapon's trigger and safety \
	behave. Some trigger mods also affect how fast you can pull the trigger."

/obj/item/gun_upgrade/barrel
	description_info = "Barrel mods affect the way your shots behave before leaving \
	the weapon, affecting things such as accuracy and stopping power."

/obj/item/gun_upgrade/mechanism
	description_info = "Receiver mods affect the internal mechanisms of a weapon."

/obj/item/gun_upgrade/scope
	description_info = "Sights and scopes affect a weapon's accuracy. Scopes can \
	also be used to look more than seven tiles in front of you."

/obj/item/gun_upgrade/cosmetic
	description_info = "Cosmetic mods affect how your weapon looks."