//Ported from ES13 code

/decl/xgm_gas/trichloramine
	id = "trichloramine"		//Also known as Nitrogen Trichloride, occasionally mistakenly called 'mustard gas' (mustard gas is sulfur mustard)
	name = "Trichloramine"		//NCl₃
	specific_heat = 32.75		// J/(mol*K)		//Not scientifically accurate, this is based off separate averages of that of chlorine and nitrogen.
	molar_mass = 0.1203			// kg/mol

	flags = XGM_GAS_FUEL | XGM_GAS_OXIDIZER		//probably also a contaminant, but I'm just gonna make this gas only hazardous to breathe, not hazardous to wear.

//This gas is functionally identical to trichloramine, but is not flammable.
/decl/xgm_gas/chloramine
	id = "monochloramine"
	name = "Monochloramine"
	specific_heat = 32.75		//Again, not scientifically accurate.
	molar_mass = 0.05148

	flags = XGM_GAS_OXIDIZER
