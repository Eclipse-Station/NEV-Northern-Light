/datum/surgery_step/robotic/install_mmi
	allowed_tools = list(/obj/item/device/mmi = 100)

	duration = 70

/datum/surgery_step/robotic/install_mmi/can_use(mob/living/user, obj/item/organ/external/organ, obj/item/tool)
	return organ.is_open() && organ.can_add_item(tool, user)

/datum/surgery_step/robotic/install_mmi/begin_step(mob/living/user, obj/item/organ/external/organ, obj/item/tool)
	user.visible_message("[user] starts installing \the [tool] into [organ.get_surgery_name()].", \
	"You start installing \the [tool] into [organ.get_surgery_name()].")


/datum/surgery_step/robotic/install_mmi/end_step(mob/living/user, obj/item/organ/external/organ, obj/item/tool)
	user.visible_message(SPAN_NOTICE("[user] has installed \the [tool] into [organ.get_surgery_name()]."), \
	SPAN_NOTICE("You have installed \the [tool] into [organ.get_surgery_name()]."))

	var/obj/item/device/mmi/M = tool
	var/obj/item/organ/internal/mmi_holder/holder = new(organ.owner, 1)
	organ.owner.internal_organs_by_efficiency[BP_BRAIN] += holder
	user.drop_from_inventory(tool)
	tool.loc = holder
	holder.stored_mmi = tool
	holder.update_from_mmi()

	if(M.brainmob && M.brainmob.mind)
		M.brainmob.mind.transfer_to(organ.owner)

/datum/surgery_step/robotic/install_mmi/fail_step(mob/living/user, obj/item/organ/external/organ, obj/item/tool)
	user.visible_message(
		SPAN_WARNING("[user]'s hand slips."),
		SPAN_WARNING("Your hand slips.")
	)