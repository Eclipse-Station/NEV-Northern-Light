#define SSMACHINES_PIPENETS      1
#define SSMACHINES_MACHINERY     2
#define SSMACHINES_POWERNETS     3
#define SSMACHINES_POWER_OBJECTS 4

SUBSYSTEM_DEF(machines)
	name = "Machines"
	priority = SS_PRIORITY_MACHINERY
	init_order = INIT_ORDER_MACHINES
	flags = SS_KEEP_TIMING
	runlevels = RUNLEVEL_GAME|RUNLEVEL_POSTGAME

	var/current_step = SSMACHINES_PIPENETS

	var/cost_pipenets      = 0
	var/cost_machinery     = 0
	var/cost_powernets     = 0
	var/cost_power_objects = 0

	var/list/pipenets      = list()
	var/list/machinery     = list()
	var/list/powernets     = list()
	var/list/power_objects = list()

	var/list/processing
	var/nextProcessingListPosition = 0 //position of next thing to be processed, inside of currently processed list

/datum/controller/subsystem/machines/PreInit()
	 processing = machinery

/datum/controller/subsystem/machines/Initialize(timeofday)
	makepowernets()
	setup_atmos_machinery(machinery)
	fire()
	..()

/datum/controller/subsystem/machines/stopProcessingWrapper(var/D, var/list/L = processing) //called before a thing stops being processed
	if (!nextProcessingListPosition) //0 position means currently processed list is not paused or running, no point in adjusting last position due to removals from list
		return
	var/position = L.Find(D) //find exact position in list
	if (position)
		if (position < nextProcessingListPosition) //removals from list are only relevant to currently processed position if they are on the left side of it, otherwise they do not alter order of processing
			nextProcessingListPosition-- //adjust current position to compensate for removed thing

#define INTERNAL_PROCESS_STEP(this_step, check_resumed, proc_to_call, cost_var, next_step)\
if(current_step == this_step || (check_resumed && !resumed)) {\
	timer = TICK_USAGE_REAL;\
	proc_to_call(resumed);\
	cost_var = MC_AVERAGE(cost_var, TICK_DELTA_TO_MS(TICK_USAGE_REAL - timer));\
	if(state != SS_RUNNING){\
		return;\
	}\
	resumed = 0;\
	current_step = next_step;\
}

/datum/controller/subsystem/machines/fire(resumed = 0)
	var/timer = TICK_USAGE_REAL

	INTERNAL_PROCESS_STEP(SSMACHINES_PIPENETS,TRUE,process_pipenets,cost_pipenets,SSMACHINES_MACHINERY)
	INTERNAL_PROCESS_STEP(SSMACHINES_MACHINERY,FALSE,process_machinery,cost_machinery,SSMACHINES_POWERNETS)
	INTERNAL_PROCESS_STEP(SSMACHINES_POWERNETS,FALSE,process_powernets,cost_powernets,SSMACHINES_POWER_OBJECTS)
	INTERNAL_PROCESS_STEP(SSMACHINES_POWER_OBJECTS,FALSE,process_power_objects,cost_power_objects,SSMACHINES_PIPENETS)

#undef INTERNAL_PROCESS_STEP

// rebuild all power networks from scratch - only called at world creation or by the admin verb
// The above is a lie. Turbolifts also call this proc.
/datum/controller/subsystem/machines/proc/makepowernets()
	for(var/datum/powernet/PN in powernets)
		qdel(PN)
	powernets.Cut()
	setup_powernets_for_cables(cable_list)

/datum/controller/subsystem/machines/proc/setup_powernets_for_cables(list/cables)
	for(var/obj/structure/cable/PC in cables)
		if(!PC.powernet)
			var/datum/powernet/NewPN = new()
			NewPN.add_cable(PC)
			propagate_network(PC,PC.powernet)

datum/controller/subsystem/machines/proc/setup_atmos_machinery(list/machines)
	set background=1

	if(!Master.current_runlevel)//So it only does it at roundstart
		report_progress("Initializing atmos machinery")
	for(var/obj/machinery/atmospherics/A in machines)
		A.atmos_init()
		CHECK_TICK

	for(var/obj/machinery/atmospherics/unary/U in machines)
		if(istype(U, /obj/machinery/atmospherics/unary/vent_pump))
			var/obj/machinery/atmospherics/unary/vent_pump/T = U
			T.broadcast_status()
		else if(istype(U, /obj/machinery/atmospherics/unary/vent_scrubber))
			var/obj/machinery/atmospherics/unary/vent_scrubber/T = U
			T.broadcast_status()
		CHECK_TICK
	if(!Master.current_runlevel)//So it only does it at roundstart
		report_progress("Initializing pipe networks")
	for(var/obj/machinery/atmospherics/machine in machines)
		machine.build_network()
		CHECK_TICK

/datum/controller/subsystem/machines/stat_entry()
	var/msg = list()
	msg += "C:{"
	msg += "PI:[round(cost_pipenets,1)]|"
	msg += "MC:[round(cost_machinery,1)]|"
	msg += "PN:[round(cost_powernets,1)]|"
	msg += "PO:[round(cost_power_objects,1)]"
	msg += "} "
	msg += "PI:[pipenets.len]|"
	msg += "MC:[machinery.len]|"
	msg += "PN:[powernets.len]|"
	msg += "PO:[power_objects.len]|"
	msg += "MC/MS:[round((cost ? machinery.len/cost : 0),0.1)]"
	..(jointext(msg, null))

/datum/controller/subsystem/machines/proc/process_pipenets(resumed = 0)
	if (!resumed)
		nextProcessingListPosition = 1 //fresh start, otherwise from saved posisition

	//localizations
	var/list/local_list = pipenets
	var/datum/pipe_network/thing
	var/wait = src.wait

	var/tickCheckPeriod = round(local_list.len/16+1) //pause process at most every 1/16th length of list
	while(nextProcessingListPosition && (nextProcessingListPosition <= local_list.len)) //until position is valid
		thing = local_list[nextProcessingListPosition]
		nextProcessingListPosition++

		if(!QDELETED(thing))
			thing.Process(wait)
		else
			local_list.Remove(thing)
			thing.is_processing = null
			nextProcessingListPosition-- //removing processed thing from list moves the queue to the left, adjust accordingly

		if(!(nextProcessingListPosition%tickCheckPeriod)) //pauses only every tickCheckPeriod-th processed thing
			if (MC_TICK_CHECK)
				return

	nextProcessingListPosition = 0 //entire list was processed

/datum/controller/subsystem/machines/proc/process_machinery(resumed = 0)
	if (!resumed)
		src.nextProcessingListPosition = 1 //fresh start, otherwise from saved posisition

	//localizations
	var/list/local_list = machinery
	var/obj/machinery/thing
	var/wait = src.wait
	var/nextProcessingListPosition = src.nextProcessingListPosition
	if(!nextProcessingListPosition)
		return

	var/tickCheckPeriod = round(local_list.len/16+1) //pause process at most every 1/16th length of list
	while(nextProcessingListPosition <= local_list.len) //until position is valid
		thing = local_list[nextProcessingListPosition]
		nextProcessingListPosition++

		if(!QDELETED(thing) && (thing.Process(wait) != PROCESS_KILL))
			if(thing.use_power)
				thing.auto_use_power()
		else
			local_list.Remove(thing)
			thing.is_processing = null
			nextProcessingListPosition-- //removing processed thing from list moves the queue to the left, adjust accordingly

		if(!(nextProcessingListPosition%tickCheckPeriod)) //pauses only tickCheckPeriod-th processed thing
			if (MC_TICK_CHECK)
				src.nextProcessingListPosition = nextProcessingListPosition
				return

	src.nextProcessingListPosition = 0 //entire list was processed

/datum/controller/subsystem/machines/proc/process_powernets(resumed = 0)
	if (!resumed)
		nextProcessingListPosition = 1 //fresh start, otherwise from saved posisition

	//localizations
	var/list/local_list = powernets
	var/datum/powernet/thing
	var/wait = src.wait

	var/tickCheckPeriod = round(local_list.len/16+1) //pause process at most every 1/16th length of list
	while(nextProcessingListPosition && (nextProcessingListPosition <= local_list.len)) //until position is valid
		thing = local_list[nextProcessingListPosition]
		nextProcessingListPosition++

		if(!QDELETED(thing))
			thing.reset(wait)
		else
			local_list.Remove(thing)
			thing.is_processing = null
			nextProcessingListPosition-- //removing processed thing from list moves the queue to the left, adjust accordingly

		if(!(nextProcessingListPosition%tickCheckPeriod)) //pauses only every tickCheckPeriod-th processed thing
			if (MC_TICK_CHECK)
				return

	nextProcessingListPosition = 0 //entire list was processed

/datum/controller/subsystem/machines/proc/process_power_objects(resumed = 0)
	if (!resumed)
		nextProcessingListPosition = 1 //fresh start, otherwise from saved posisition

	//localizations
	var/list/local_list = power_objects
	var/obj/item/thing
	var/wait = src.wait

	var/tickCheckPeriod = round(local_list.len/16+1) //pause process at most every 1/16th length of list
	while(nextProcessingListPosition && (nextProcessingListPosition <= local_list.len)) //until position is valid
		thing = local_list[nextProcessingListPosition]
		nextProcessingListPosition++

		if(!thing.pwr_drain(wait)) // 0 = Process Kill, remove from processing list.
			local_list.Remove(thing)
			thing.is_processing = null
			nextProcessingListPosition-- //removing processed thing from list moves the queue to the left, adjust accordingly

		if(!(nextProcessingListPosition%tickCheckPeriod)) //pauses only every tickCheckPeriod-th processed thing
			if (MC_TICK_CHECK)
				return

	nextProcessingListPosition = 0 //entire list was processed

/datum/controller/subsystem/machines/Recover()
	if (istype(SSmachines.pipenets))
		pipenets = SSmachines.pipenets
	if (istype(SSmachines.machinery))
		machinery = SSmachines.machinery
	if (istype(SSmachines.powernets))
		powernets = SSmachines.powernets
	if (istype(SSmachines.power_objects))
		power_objects = SSmachines.power_objects

#undef SSMACHINES_PIPENETS
#undef SSMACHINES_MACHINERY
#undef SSMACHINES_POWERNETS
#undef SSMACHINES_POWER_OBJECTS
