/datum/bounty/item/roboticist/bot
	gens_allowed = FALSE

/datum/bounty/item/roboticist/bot/ship(mob/M)
	if(!applies_to(M))
		return
	if(istype(M, /mob/living/simple_animal/bot))
		var/mob/living/simple_animal/bot/bot = M
		bot.mode = BOT_IDLE
	..()

/datum/bounty/item/roboticist/bot/floorbot
	name = "Cleanbots"
	description = "Your neighbor station is in need of cleaning duty and our ERT Janitors are busy. Send them a bot squad to eliminate filth."
	reward = 7400
	required_count = 4
	wanted_types = list(/mob/living/simple_animal/bot/cleanbot)

/datum/bounty/item/roboticist/bot/medbot
	name = "Medbots"
	description = "All our medbots were eliminated after some antisilicon revolutionary pogrom. Could you construct us a fresh new pair?"
	reward = 6000
	required_count = 2
	wanted_types = list(/mob/living/simple_animal/bot/medbot)

/datum/bounty/item/roboticist/bot/floorbot
	name = "Floorbots"
	description = "Station 14 is devastated after recent security armory update. We need you to deploy floorbots to cover hull breaches and help their engineers."
	reward = 6600
	required_count = 3
	wanted_types = list(/mob/living/simple_animal/bot/floorbot)

/datum/bounty/item/roboticist/bot/firebot
	name = "Firebot"
	description = "Desperate times requieres desperate measures: we need one firebot as a mascot for our atmoshepic technicians."
	reward = 8000
	required_count = 1
	wanted_types = list(/mob/living/simple_animal/bot/firebot)

/datum/bounty/item/roboticist/bot/ed209
	name = "ED-209 Security Robot"
	description = "Our appointed meeting with TerraGov generals is near failure: our newest unmanned weaponry was scrapped! Send us something lethal!"
	reward = 20000
	required_count = 1
	wanted_types = list(/mob/living/simple_animal/bot/ed209)

///////////////////////////////////////////////////////////////////
/datum/bounty/item/roboticist/cyborglimbs/New()
	..()
	description = "The roboticist wing needs to be restocked with [name] as soon as possible. Ship it to receive a payment."
	reward = round(rand(2000, 8000), 100) // Рыночек порешал. Повезёт или нет.
	required_count = 2

/datum/bounty/item/roboticist/bot/ship(obj/O)
	if(!applies_to(O))
		return
	..()

/datum/bounty/item/roboticist/cyborglimbs/arms
	name = "Cyborg Arms"
	wanted_types = list(/obj/item/bodypart/l_arm/robot, /obj/item/bodypart/r_arm/robot)
	include_subtypes = FALSE

/datum/bounty/item/roboticist/cyborglimbs/legs
	name = "Cyborg Legs"
	wanted_types = list(/obj/item/bodypart/l_leg/robot, /obj/item/bodypart/r_leg/robot)
	include_subtypes = FALSE

/datum/bounty/item/roboticist/cyborglimbs/chest
	name = "Cyborg Chests"
	wanted_types = list(/obj/item/bodypart/chest/robot)

/datum/bounty/item/roboticist/cyborglimbs/chest
	name = "Cyborg Heads"
	wanted_types = list(/obj/item/bodypart/head/robot)

////////////////////////

/datum/bounty/item/roboticist/endoskeleton/ship(obj/O)
	if(!applies_to(O))
		return
	if(istype(O, /obj/item/robot_suit))
		var/obj/item/robot_suit/endo = O
		if(endo.check_completion() == FALSE)
			return
	..()

/datum/bounty/item/roboticist/endoskeleton
	name = "Fully assembled cyborg endosceletons"
	description = "We got fresh MMIs with ready-to-hard-work brains in them. Send us some assembled frames to work with."
	reward = 9200
	required_count = 2
	wanted_types = list(/obj/item/robot_suit)

////////////////////////

/datum/bounty/item/roboticist/powerarmor
	name = "Power Armor"
	description = "Fellow General Cross is willing to remember his old days blues. Send him some powered armor."
	reward = 12000
	required_count = 1
	wanted_types = list(/obj/item/clothing/suit/space/hardsuit/powerarmor)

