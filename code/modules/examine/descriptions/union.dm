// Machinery and items related to cargo; purchasing, or selling items and services, and shipping; as well as items relating to theatrics and music.
// This includes ATMs, cash registers, et cetera; for the jukebox see machinery_nol.dm.


//////////
// ITEMS
//////////
/obj/item/device/scanner/price		//Export scanner
	description_info = "An export scanner is used to check the value of an item \
	for export, and automatically includes fees and buyer markdowns in its calculations."

/obj/item/computer_hardware/hard_drive/portable
	description_info = "Disks are used to store and move data and programs between \
	different computers - sometimes, it's simply faster to copy a program from one \
	computer to another than it is to download it on the second computer."

/obj/item/computer_hardware/hard_drive/portable/design
	description_info = "Design disks are small diskettes used to store autolathe \
	designs. Most design disks have a finite number of license points, meaning that \
	some designs cannot be replicated ad infinitum: a design disk with no license \
	points cannot print licensed designs, but can print other, unlicensed designs."

/obj/item/device/scanner/mining
	description_info = "A subsurface ore detector is used to detect ores deep below \
	the surface of a planet, and has a range of two tiles (a 5×5 square) from the scan \
	point."




//////////
// MACHINERY
//////////

/obj/machinery/trade_beacon/sending
	description_info = "A sending trade beacon is used to sell items to other ships \
	or stations. Items being sold must be within two tiles of the sending trade \
	beacon to be able to sell them. \n\
	\n\
	Trade beacons are controlled by the \"Trading Program\" program on a modular \
	computer or tablet."

/obj/machinery/trade_beacon/receiving
	description_info = "A receiving trade beacon is used to buy items from other \
	ships or stations. Items being bought will be brought aboard via bluespace, and \
	will be put somewhere within a two-tile radius of the beacon (excluding the \
	beacon itself), and thus requires a space of clear floor to set them down. \n\
	\n\
	Trade beacons are controlled by the \"Trading Program\" program on a modular \
	computer or tablet."

/obj/machinery/autolathe_disk_cloner
	description_info = "A disk cloner is used to copy files from one autolathe \
	disk to another. \n\
	\n\
	If a disk cloner's parts are of a high-enough tier, you can use it to crack \
	a disk's copy protection and then copy a licensed design onto a disk, bypassing \
	the need to use a disk's license points to print the design."

/obj/machinery/conveyor
	description_info = "Conveyor belts are used to move items automatically, freeing \
	you from having to drag them around manually. This frees you to do other tasks \
	while the items on the belt are moved."

/obj/machinery/conveyor_switch
	description_info = "Conveyor switches are used to operate a nearby conveyor belt."

/obj/machinery/conveyor_switch/get_description_interaction()
	var/list/results = list()
	if(!one_way)
		results += "This conveyor switch has a reverse function, allowing you to \
		drive its belt backwards."
	return results

/obj/machinery/sorter
	description_info = "A sorter is used to filter items from something containing \
	a specific material or reagent from everything else. You can set exactly what \
	gets filtered out, and where everything goes, by interacting with it."

/obj/machinery/smelter
	description_info = "A smelter is used to break items down into material sheets. \
	You can change where everything goes after that by interacting with it."

/obj/machinery/mineral/processing_unit		//The machine that processes ore.
	description_info = "A material processor is used to refine raw ore into material \
	sheets. Different ores require different refinement processes; if an incorrect \
	process is selected for the ore, it will be turned into slag (which is functionally \
	useless) and thus wasted. \n\
	\n\
	A material processor is controlled from a nearby production machine console."

/obj/machinery/mineral/processing_unit_console		//The console that controls the ore processor.
	description_info = "A processing unit console is used to control a nearby material \
	processor. You can set what refinement method to use for raw ores using this. \
	Beware, however, that setting the wrong refinement process for an ore that isn't \
	compatible with it will generate slag, which will waste the ore."

/obj/machinery/mineral/stacking_machine		//Stacking machine
	description_info = "A stacking machine is used to turn a large number of individual \
	material sheets into a neat and manageable stack of sheets. It can be controlled \
	from a nearby stacking machine console."

/obj/machinery/mineral/stacking_unit_console		//The console that controls the stacking machine.
	description_info = "A stacking machine console is used to control a nearby \
	stacking machine. With it, you can force a stacking machine to eject an incomplete \
	material stack if the need arises."

/obj/machinery/mineral/unloading_machine		//Ore box unloader
	description_info = "An unloading machine is used to automaticaly unload ore \
	from an ore box on one side to the floor on the other side."

/obj/machinery/mining/deep_drill
	description_info = "A deep mining drill is used to drill deep into the \
	surface of a planet to recover materials. To use the drill, move the head to \
	where you wish to mine at, then anchor its bolts in place with a wrench and \
	turn it on. \n\
	\n\
	Heavy mining equipment, such as the drill head, have a tendency to disturb the \
	local fauna. You should be prepared to defend the drill (and your life!) if the \
	wildlife take exception to your mining operations. \n\
	\n\
	A deep mining drill runs off a size-L power cell. To remove the cell, open \
	the maintenance panel with a screwdriver, then take the cell out by hand. To \
	insert a cell, use the cell on the drill while the maintenance panel is open. \n\
	\n\
	If the drill becomes damaged, it can be repaired with a welder. If an error \
	occurs, you can reset it by hand. \n\
	\n\
	To unload the ores in its internal storage, right-click the drill head and \
	select \"Unload Drill\". An ore box must be by the drill in order to unload it."