/datum/job_flavor
	var/title
	var/list/stat_modifiers

/datum/job_flavor/assistant/stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/veterinarian
	title = "Cattle Export Vehicle \"Northern Light\" Veterinarian"

/datum/job_flavor/assistant/shepherd
	title = "Cattle Export Vehicle \"Northern Light\" Shepherd"

/datum/job_flavor/assistant/colonist
	title = "Colony Expansion Vehicle \"Northern Light\" Colonist"

/datum/job_flavor/assistant/geoengineer
	title = "Colony Expansion Vehicle \"Northern Light\" Geoengineer"

/datum/job_flavor/assistant/ecologist
	title = "Colony Expansion Vehicle \"Northern Light\" Ecologist"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 16,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/ensign
	title = "Command Evacuation Vehicle \"Northern Light\" Ensign"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 16,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/pilot
	title = "Command Evacuation Vehicle \"Northern Light\" Pilot"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 16,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/cmcp_janitor
	title = "Command Evacuation Vehicle \"Northern Light\" Command Master Chief Petty Janitor"

/datum/job_flavor/assistant/dc_tech
	title = "Combat Engineer Vehicle \"Northern Light\" Damage Control Technician"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 16,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/field_eng
	title = "Combat Engineer Vehicle \"Northern Light\" Field Engineer"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 16,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/politruk
	title = "Cosmicheskiy Edinstveniy Velikohod \"Northern Light\" Politruk"

/datum/job_flavor/assistant/krasnoarmeets
	title = "Cosmicheskiy Edinstveniy Velikohod \"Northern Light\" Krasnoarmeets"

/datum/job_flavor/assistant/kosmonavt
	title = "Cosmicheskiy Edinstveniy Velikohod \"Northern Light\" Kosmonavt"
	stat_modifiers = list(
		STAT_ROB = 16,
		STAT_TGH = 16,
		STAT_BIO = 16,
		STAT_MEC = 16,
		STAT_VIG = 16,
		STAT_COG = 16
	)

/datum/job_flavor/assistant/reg_officer
	title = "Czech Emigration Vessel \"Northern Light\" Registration Officer"

/datum/job_flavor/assistant/refugee
	title = "Czech Emigration Vessel \"northern Light\" Refugee"

/datum/job_flavor/assistant/mig_officer
	title = "Czech Emigration Vessel \"Northern Light\" Emigration Officer"

/datum/job_flavor/assistant/protein_farmer
	title = "Cockroach Exile Vessel \"Northern Light\" Protein Farmer"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 16,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/biotechnician
	title = "Cockroach Exile Vessel \"Northen Light\" Biotechnician"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 16,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/bioterror_spec
	title = "Cockroach Exile Vessel \"Northern Light\" Bioterror Specialist"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 16,
		STAT_MEC = 8,
		STAT_VIG = 16,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/bomber
	title = "Capital Extermination Vessel \"Northern Light\" Bomber"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 16,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/m_arms
	title = "Capital Extermination Vessel \"Northern Light\" Master at Arms"
	stat_modifiers = list(
		STAT_ROB = 16,
		STAT_TGH = 16,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/datum/job_flavor/assistant/loader
	title = "Capital Extermination Vessel \"Northern Light\" Loader"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 16,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
	)

/datum/job_flavor/assistant/cat_psy
	title = "Cat Exhibition Vessel \"Northern Light\" Cat Psychologist"

/datum/job_flavor/assistant/feline_herder
	title = "Cat Exhibition Vessel \"Northern Light\" Feline Herder"

/datum/job_flavor/assistant/breeder
	title = "Cat Exhibition Vessel \"Northern Lgiht\" Breeder"

/datum/job_flavor/assistant/mixologist
	title = "Corporate Entertain Vehicle \"Northern Light\" Mixologist"
	stat_modifiers = list(
		STAT_ROB = 8,
		STAT_TGH = 8,
		STAT_BIO = 16,
		STAT_MEC = 8,
		STAT_VIG = 8,
	)

/datum/job_flavor/assistant/stripper
	title = "Corporate Entertain Vehicle \"Northen Light\" Stripper"

/datum/job_flavor/assistant/officiant
	title = "Corporate Entertain Vehicle \"Northern Light\" Officiant"

/datum/job_flavor/assistant/quartermaster
	title = "Class \"Emigrator\" Vessel \"Northen Light\" Quartermaster"

/datum/job_flavor/assistant/deck_chief
	title = "Class \"Emigrator\" Vessel \"Northern Light\" Deck Chief"

/datum/job_flavor/assistant/deck_tech
	title = "Class \"Emigrator\" Vessel \"Northen Light\" Deck Technician"

/datum/job_flavor/assistant/patriarch
	title = "Christian Era Vector \"Northern Light\" Patriarch"

/datum/job_flavor/assistant/protodeacon
	title = "Christian Era Vector \"Northen Light\" Protodeacon"

/datum/job_flavor/assistant/archimandrite
	title = "Christian Era Vector \"Northen Light\" Archimandrite"

/datum/job_flavor/assistant/prisoner
	title = "Convict Exploitation Vehicle \"Northen Light\" Prisoner"

/datum/job_flavor/assistant/guard
	title = "Convict Exploitation Vehicle \"Northen Light\" Guard"

/datum/job_flavor/assistant/warden
	title = "Convict Exploitation Vehicle \"Northen Light\" Warden"

/datum/job_flavor/assistant/smuggler
	title = "Cargo Export Vehicle \"Northen Light\" Smuggler"

/datum/job_flavor/assistant/salesman
	title = "Cargo Export Vehicle \"Northen Light\" Salesman"

/datum/job_flavor/assistant/stockmarket
	title = "Capital Exchange Venue \"Northen Light\" Market Analyst"

/datum/job_flavor/assistant/executive
	title = "Capital Exchange Venue \"Northen Light\" Executive"
