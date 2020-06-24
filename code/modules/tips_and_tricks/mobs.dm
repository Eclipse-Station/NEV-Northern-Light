// This file contains all mobs tips and tricks and shown when you spawn or your mind is transfered
/tipsAndTricks/mobs
    var/list/mobs_list       //list of mobs to which tip can be shown
    textColor = "#957820"

/tipsAndTricks/mobs/breathing
    mobs_list = list(/mob/living/carbon/human)
    tipText = "As a human, you need oxygen and pressure to breathe. Comfortable air pressure for human is around 101kPa. Some gases, like phoron, are toxic to you."

/tipsAndTricks/mobs/breathing_two
    mobs_list = list(/mob/living/carbon/human)
    tipText = "The point at which air is too thin to breathe is not the point where you will take damage from pressure loss. Atmospheres as low as 30kPa are survivable with an oxygen mask and tank."