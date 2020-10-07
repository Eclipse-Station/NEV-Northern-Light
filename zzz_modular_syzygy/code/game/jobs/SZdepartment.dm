/datum/department/guild
	account_initial_balance = 12000
	
/datum/department/civilian
	name = "The Club"
	id = DEPARTMENT_CIVILIAN
	account_initial_balance = 2000 // Less vital than most departments and smaller
	account_budget = 1000 //A small stipend that the manager can distribute as he sees fit.
	/*
		This account pays out to club workers, hydroponics, and custodians.
		It is managed by The Club manager.

	*/

/datum/job/clubworker
	wage = WAGE_LABOUR_DUMB //Club workers make less than professional wages and are expected to make up the difference in tips.

/datum/job/clubmanager
	department_account_access = TRUE
	/* The manager is not command, but is responsible for ensuring that his workers,
	custodians, and botanists get paid
	*/
	
