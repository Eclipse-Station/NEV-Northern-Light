/*
	Department Datums
	Currently only used for a non-shitcode way of having variable initial balances in department accounts
	in future, should be a holder for job datums
*/

/datum/department
	var/name = "unspecified department"	//Name may be shown in UIs, proper capitalisation
	var/id	= "department" //This should be one of the DEPARTMENT_XXX defines in __defines/jobs.dm
	var/account_number = 0
	var/account_pin
	var/account_initial_balance = 3500	//How much money this account starts off with



	//Account Funding
	/*
		Every payday, department accounts recieve money.
		Part of this is their budget, it stays in the account and is to be used for department purchases
		Most of it is wages, that are immediately paid onwards to individual crewmembers/
	*/
	var/account_budget = 2500	//How much money is paid into this account and kept, every payday

	//Must be one of the FUNDING_XXX defines in __defines/economy.dm
	var/funding_type = FUNDING_INTERNAL

	//Where the money for wages and budget actually comes from. With internal, this is a department account ID
	//With external, this is the name of an organisation
	var/funding_source = DEPARTMENT_COMMAND

	//This is a key value list of datacore records and their total owed wage
	//When payday comes, accounts in the department are added here, and removed once the balance is paid off
	//They are not removed until they are paid, so multiple paydays could rollover and stack up if unpaid
	var/list/pending_wages

	// The total of the values in the above wage list. Just cached for convenience
	var/pending_wage_total = 0

	//Increased by account_budget every payday, reset to zero when paid, works like above
	var/pending_budget_total = 0


//Populates the pending wage total
/datum/department/proc/sum_wages()
	pending_wage_total = 0
	for (var/a in pending_wages)
		pending_wage_total += pending_wages[a]


/*************
	Command
**************/
/datum/department/command
	name = "NEV Northern Light Command"
	id = DEPARTMENT_COMMAND
	/*
	The command account is the ship account. It is the master account that retainer departments are paid from,
	and represents the Captain's wealth, assets and holdings

	For now, it is set to an effectively infinitely high amount which shouldn't run out in normal gameplay
	In future, we will implement largescale missions and research contracts to earn money, and then set it
	to a much lower starting value
	*/
	account_initial_balance = 100000
	funding_type = FUNDING_NONE


/*************
	Retainers
**************/
//These departments are paid out of ship funding

//Eclipse Edit: Engineering - moved in-house
/datum/department/technomancers
	name = "NEV Northern Light Engineering"
	id = DEPARTMENT_ENGINEERING

/datum/department/ironhammer
	name = "Aegis Security Solutions"
	id = DEPARTMENT_SECURITY

/datum/department/civilian
	name = "NEV Northern Light Civic"
	id = DEPARTMENT_CIVILIAN
	account_initial_balance = 2000
	funding_type = FUNDING_NONE
	//Now for the club


/******************
	Benefactors
*******************/
//Departments subsidised by an external organisation. These pay their own employees
/datum/department/moebius_medical
	name = "Lazarus Foundation: Medical Division"
	id = DEPARTMENT_MEDICAL
	account_initial_balance = 5000
	funding_type = FUNDING_INTERNAL
	funding_source = "DEPARTMENT_SCIENCE"

/datum/department/moebius_research
	name = "Lazarus Foundation: Research Division"
	id = DEPARTMENT_SCIENCE
	account_initial_balance = 10000 //For buying materials and components and things of scientific value
	funding_type = FUNDING_NONE
	funding_source = "NanoTrasen."

/datum/department/church
	name = "Children of Mekhane"
	id = DEPARTMENT_CHURCH
	account_initial_balance = 4500 //each Neotheo has a wage of 900, this is enough to pay 5 paychecks before needing more cash
	funding_type = FUNDING_NONE //The church on eris has no external funding. This further reinforces the theory that everyone on the CEV Eris is a reject of their factions
	funding_source = "Church of NeoTheology"



/******************
	Independent
*******************/
//Self funds and pays wages out of its earnings
/datum/department/guild
	name = "Free Trade Union"
	id = DEPARTMENT_GUILD

	/*
		The guild account represents the holdings of the local branch, and merchant.
		He recieves no funding, infact later he will pay guild fees out of his earnings
	*/
	account_initial_balance = 7500
	funding_type = FUNDING_NONE

/datum/department/offship //So we can pay the Club without giving them independant money
	name = "Offship entities"
	id = DEPARTMENT_OFFSHIP
	account_budget = 0
