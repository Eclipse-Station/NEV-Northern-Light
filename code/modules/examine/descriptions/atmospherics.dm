// Atmospherics-related help texts.

//Pipes.
/obj/machinery/atmospherics/pipe
	description_info = "This pipe, and all other pipes, can be connected or disconnected \
	by a wrench. The internal pressure of the pipe must be less than about 400 kPa \
	above the ambient pressure to do this. More pipes can be obtained from the pipe \
	dispenser in Atmospherics, or a Rapid Piping Device. \n\
	\n\
	Pipes are self-sealing in the event of a pipeline break, meaning the only gases \
	lost are those in the sections of pipe that were affected."

/obj/machinery/atmospherics/pipe/get_description_interaction()
	var/list/results = list()
	if(connect_types != CONNECT_TYPE_REGULAR)
		results += "This pipe is an offset pipe. To get gas to flow into it from \
		a standard pipe, use a universal pipe adapter."
	
	return results


/obj/machinery/atmospherics/pipe/tank
	description_info = "Pressure tanks hold large amounts of gas in a small amount \
	of space."

/obj/machinery/atmospherics/pipe/vent
	description_info = "Exhaust vents are essentially an opening where gas from \
	a pipe can freely mix with the ambient surrounding gases. They do not require \
	power to function."

/obj/machinery/atmospherics/pipe/tank/get_description_interaction()
	return

/obj/machinery/atmospherics/pipe/simple/visible/universal/get_description_interaction()
	var/list/results = list()
	results += "A universal pipe adapter allows you to connect offset pipes, such \
	as those used with scrubber and supply pipes, with a standard pipe."
	
	return results

/obj/machinery/atmospherics/pipe/simple/hidden/universal/get_description_interaction()
	var/list/results = list()
	
	results += "A universal pipe adapter allows you to connect offset pipes, such \
	as those used with scrubber and supply pipes, with a standard pipe."
	
	return results

//Unary devices (one port)
/obj/machinery/atmospherics/unary/freezer
	description_info = "A gas cooler will cool gases down to whatever it's set to. \
	This is not instant, and takes time depending on the pressure of the gas, and \
	the power level it's set to. The higher the power level, the quicker it can cool \
	gas down, but the more power it consumes. \n\
	\n\
	Despite the fact that a gas cooler can be set to absolute zero, it cannot cool \
	gas down beyond 2.4 Kelvin. This is a hardcoded limitation to prevent anomalous \
	behavior, and setting the gas cooler below that value will make it run continuously, \
	often with undesirable results."

/obj/machinery/atmospherics/unary/heater
	description_info = "A gas heater will heat gases down to whatever it's set to. \
	This is not instant, and takes time depending on the pressure of the gas, and \
	the power level it's set to. The higher the power level, the quicker it can heat \
	gas up, but the more power it consumes."

/obj/machinery/atmospherics/unary/heat_exchanger
	description_info = "A heat exchanger array will try and equalize the temperature \
	between the pipes on both sides of the grid. You need two heat exchanger grids \
	beside each other, facing each other, for this to work. Heat exchanger arrays \
	are isolated from each other, so gas on one side of the array cannot mix with \
	gas from the other side in most circumstances."

/obj/machinery/atmospherics/unary/outlet_injector
	description_info = "A gas injector is essentially a one-way valve with a side \
	pump to pump gas into an area. \n\
	\n\
	When unpowered, gas injectors close the valve, and air cannot travel past. This \
	is indicated with a solid red light. \n\
	\n\
	If a special signal (that is mostly unused) is received, it will open the valve, \
	and if the pressure of the gas is higher than the ambient pressure, gas will \
	flow into the ambient air. This is indicated by a flashing green light.\n\
	\n\
	If the pump is powered, the gas injector will pump gas into the ambient air. \
	This is indicated with a solid green light."

/obj/machinery/atmospherics/unary/vent_pump
	description_info = "A vent pump is a two-way pump, to pump gas into or out of, \
	an area. Vent pumps can be controlled at an air alarm. \n\
	\n\
	The color of the light surrounding the vent pump indicates whether the \
	pump is siphoning gas (red) or releasing gas (blue). In addition, the number \
	of lights indicates whether it's operating on standard range (one) or expanded \
	range (two)."

/obj/machinery/atmospherics/unary/vent_scrubber
	description_info = "A scrubber removes gas from the ambient atmosphere. The \
	gases it will remove can be set at an air alarm. \n\
	\n\
	The color of the lights in the scrubber inlet indicates whether the scrubber \
	is scrubbing out certain gases (blue) or siphoning out all gases (green or red). \
	In addition, the lights also indicate whether it's operating on standard range \
	(blue square, or a green square that gets smaller) or expanded range (blue border \
	lights, or a red square that gets smaller)."

//Binary devices (two ports)
/obj/machinery/atmospherics/binary/passive_gate
	description_info = "Pressure regulators, also known as passive gates, are small \
	devices placed into a pipeline to allow gas through in certain situations. They \
	do not require power to function, but only work when the pressure at the output \
	is lower than or equal to the pressure at the input. \n\
	\n\
	Pressure regulators can be set up to allow gas to flow if the input pressure \
	is high enough, the output pressure is low enough, or regardless of the pressures \
	at either end (in essence becoming a valve). \n\
	\n\
	Pressure regulators offer the second-highest maximum flow rate of any two-port \
	pipeline device, behind valves and pipes."
	
/obj/machinery/atmospherics/binary/pump
	description_info = "Pumps are small devices placed into a pipeline to allow \
	or force gas through in certain situations. They require power to function and \
	use the interface, but do not use power to pump gas if the inlet pressure is \
	higher than the outlet pressure.\n\
	\n\
	Pumps allow far finer control over how much pressure the outlet will have than \
	a pressure regulator would, and allows you to force gas into the outlet if the \
	inlet pressure is lower than the outlet pressure."

//Trinary devices (three ports)
/obj/machinery/atmospherics/trinary/filter
	description_info = "Gas filters will filter a single gas out of a pipeline. \n\
	\n\
	Basic filters only filter out one gas at a time. The filtered gas is shunted \
	into the side, and all other gas goes straight through."

/obj/machinery/atmospherics/trinary/mixer
	description_info = "Gas mixers will combine two pipelines' gas contents, and \
	allow far finer control over how much of the gas from each particular pipeline \
	goes into the output, at the cost of a low pump power."

/obj/machinery/atmospherics/trinary/mixer/get_description_interaction()
	var/list/results = list()
	results += "Node 1 is the back input (stright through), and Node 2 is the side input."
	return results

/obj/machinery/atmospherics/trinary/mixer/t_mixer/get_description_interaction()
	var/list/results = list()
	results += "Node 1 is the right side of the T, and Node 2 is the left side."	//With a mirrored mixer facing north, Node 1 is south and 2 is west; the offsets being -180 and 90. This means that the rotation is inverted; 90 being anticlockwise. With a T-mixer, the offsets are -90 (clockwise) and 90 (anticlockwise), so Node 1 on a T-mixer facing south (to form the T shape) would be East, and Node 2 would be west.
	return results

//Quaternary devices (four ports)
/obj/machinery/atmospherics/omni/filter
	description_info = "Gas omni-filters will filter up to two gases out of a pipeline. \n\
	\n\
	Filtered gases can be shunted out in any direction, and any direction that gas \
	is being filtered out of will show a gold bar on the filter itself.\n\
	\n\
	All omni-filters require an input and an output."

/obj/machinery/atmospherics/omni/mixer
	description_info = "Gas omni-mixers will mix the gases of up to three pipelines."