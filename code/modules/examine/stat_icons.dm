//Some global icons for the examine tab to use to display some item properties.
//Ported from ES13 2022-09-20 R.A.Spitzer

/*
 * This Eclipse port is inoperative, sadly. It has a few problems, but I'm leaving
 * the implementation here as-is in hopes that someone who's a better coder than
 * I can solve its problems.
 *
 * The image insertion code (desc_panel_image proc, in examine.dm) technically works
 * to insert an image... though it inserts it at the far left of the panel. In the
 * client's description holder var, it is in the correct position! But in the tab
 * that appears when something is examined, it's always against the left margin.
 *
 * Maybe someone can figure it out. I dunno. I couldn't (and this started as a 
 * straight port of Eclipse Station 13 code!), so this file won't be #include'd.
 *
 * R. Spitzer 2022-09-22
 */

var/global/list/description_icons = list(
	"melee_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="melee_protection"),
	"bullet_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="bullet_protection"),
	"laser_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="laser_protection"),
	"energy_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="energy_protection"),
	"bomb_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="bomb_protection"),
	"radiation_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="radiation_protection_a"),
	"biohazard_armor" = image(icon='icons/mob/screen1_stats.dmi',icon_state="biohazard_protection_a"),

	"offhand" = image(icon='icons/obj/weapons.dmi',icon_state="offhand"),
	"wield" = image(icon='icons/mob/screen/ErisStyleHolo.dmi',icon_state="wield"),

	"welder" = image(icon='icons/obj/tools.dmi',icon_state="welder"),
	"wirecutters" = image(icon='icons/obj/tools.dmi',icon_state="cutters"),
	"screwdriver" = image(icon='icons/obj/tools.dmi',icon_state="screwdriver"),
	"wrench" = image(icon='icons/obj/tools.dmi',icon_state="wrench"),
	"crowbar" = image(icon='icons/obj/tools.dmi',icon_state="crowbar"),
	"multitool" = image(icon='icons/obj/tools.dmi',icon_state="multitool"),
	"cable coil" = image(icon='icons/obj/power.dmi',icon_state="coil"), 
	"saw" = image(icon='icons/obj/tools.dmi',icon_state="metal_saw"), 
	"shovel" = image(icon='icons/obj/tools.dmi',icon_state="shovel"), 
	"hammer" = image(icon='icons/obj/tools.dmi',icon_state="hammer"), 
	
	"scalpel" = image(icon='icons/obj/tools.dmi',icon_state="scalpel_t3"),
	"hemostat" = image(icon='icons/obj/tools.dmi',icon_state="hemostat"),
	"retractor" = image(icon='icons/obj/tools.dmi',icon_state="retractor"),
	"cautery" = image(icon='icons/obj/tools.dmi',icon_state="cautery"),
	"bone setter" = image(icon='icons/obj/tools.dmi',icon_state="bone setter"),
	"drill" = image(icon='icons/obj/tools.dmi',icon_state="drill"),

	"metal sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-metal"),
	"plasteel sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-plasteel"),
	"glass sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-glass"),
	"reinforced glass sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-rglass"),
	"phoronglass sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-plasmaglass"),
	"reinforced phoronglass sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-plasmarglass"),
	"plastic sheet" = image(icon='icons/obj/stack/material.dmi',icon_state="sheet-plastic"),
	"metal rods" = image(icon='icons/obj/stacks.dmi',icon_state="rods"),
	"biomatter" = image(icon='icons/obj/stack/material.dmi',icon_state="biomatter"),

	"air tank" = image(icon='icons/obj/tank.dmi',icon_state="oxygen"),
	"connector" = image(icon='icons/obj/pipes.dmi',icon_state="connector"),
	
	"gun magazine" = image(icon='icons/obj/ammo_mags.dmi',icon_state="pistol_l"),
	"speedloader" = image(icon='icons/obj/ammo_speed.dmi',icon_state="slmagnum_l"),
	"stripper clip" = image(icon='icons/obj/ammo_speed.dmi',icon_state="lrifle"),
	"bullet" = image(icon='icons/obj/ammo.dmi',icon_state="srifle_c_l"),
	"shell" = image(icon='icons/obj/ammo.dmi',icon_state="s-shell_l"),
	"firemode energy" = image(icon='icons/mob/screen/gun_actions.dmi',icon_state="mode_kill"),
	"firemode ballistic" = image(icon='icons/mob/screen/gun_actions.dmi',icon_state="mode_semi"),
	"gun safety" = image(icon='icons/mob/screen/gun_actions.dmi',icon_state="safety0"),

	"stunbaton" = image(icon='icons/obj/weapons.dmi',icon_state="stunbaton_active"),

	"small cell" = image(icon='icons/obj/power_cells.dmi',icon_state="s_st"),
	"medium cell" = image(icon='icons/obj/power_cells.dmi',icon_state="m_st"),
	"large cell" = image(icon='icons/obj/power_cells.dmi',icon_state="b_st"),

	"hatchet" = image(icon='icons/obj/weapons.dmi',icon_state="hatchet"),
	
	"apc" = image(icon='icons/obj/power.dmi',icon_state="apcemag"),
	"air alarm" = image(icon='icons/obj/monitors.dmi',icon_state="alarm0"),
	)