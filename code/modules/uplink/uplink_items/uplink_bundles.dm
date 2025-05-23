
//All bundles and telecrystals

/*
	Uplink Items:
	Unlike categories, uplink item entries are automatically sorted alphabetically on server init in a global list,
	When adding new entries to the file, please keep them sorted by category.
*/

/datum/uplink_item/bundles_tc/chemical
	name = "Bioterror bundle"
	desc = "For the madman: Contains a handheld Bioterror chem sprayer, a Bioterror foam grenade, a box of lethal chemicals, a dart pistol, \
			box of syringes, Donksoft assault rifle, and some riot darts. Remember: Seal suit and equip internals before use."
	item = /obj/item/storage/backpack/duffelbag/syndie/med/bioterrorbundle
	cost = 30 // normally 42
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/bulldog
	name = "Bulldog bundle"
	desc = "Lean and mean: Optimized for people that want to get up close and personal. Contains the popular \
			Bulldog shotgun, a 12g buckshot drum, a 12g taser slug drum and a pair of Thermal imaging goggles."
	item = /obj/item/storage/backpack/duffelbag/syndie/bulldogbundle
	cost = 13 // normally 16
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/c20r
	name = "C-20r bundle"
	desc = "Old Faithful: The classic C-20r, bundled with two magazines, and a (surplus) suppressor at discount price."
	item = /obj/item/storage/backpack/duffelbag/syndie/c20rbundle
	cost = 14 // normally 16
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/contract_kit
	name = "Contract Kit"
	desc = "The Nanotrasen enemies have offered you the chance to become a contractor, take on kidnapping contracts for TC and cash payouts. Upon purchase,  \
			you'll be granted your own contract uplink embedded within the supplied tablet computer. Additionally, you'll be granted \
			standard contractor gear to help with your mission - comes supplied with the tablet, specialised space suit, chameleon jumpsuit and mask, \
			specialised contractor baton, and three randomly selected low cost items. Can include otherwise unobtainable items."
	item = /obj/item/storage/box/syndie_kit/contract_kit
	cost = 30
	player_minimum = 50
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	restricted = TRUE

/datum/uplink_item/bundles_tc/northstar_bundle
	name = "Northstar Bundle"
	desc = "An item usually reserved for the Gorlex Marauders and their operatives, now available for recreational use.  \
			These armbands let the user punch people very fast and with the lethality of a legendary martial artist. \
			Does not improve weapon attack speed or the meaty fists of a hulk, but you will be unmatched in martial power. \
			Combines with all martial arts, but the user will be unable to bring themselves to use guns, nor remove the armbands."
	item = /obj/item/storage/box/syndie_kit/northstar
	cost = 20
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/bundles_tc/scarp_bundle
	name = "Sleeping Carp Bundle"
	desc = "Become one with your inner carp!  Your ancient fish masters leave behind their legacy, and bestow to you their teachings, sacred uniform, and staff. \
	Please be aware that you will not be able to use dishonerable ranged weapons."
	item = /obj/item/storage/box/syndie_kit/scarp
	cost = 20
	player_minimum = 20
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/suits/infiltrator_bundle
	name = "Insidious Infiltration Gear Case"
	desc = "Developed by Roseus Galactic in conjunction with the Gorlex Marauders to produce a functional suit for urban operations, \
			this suit proves to be cheaper than your standard issue hardsuit, with none of the movement restrictions (or the space proofing) of the outdated spacesuits employed by the company. \
			Comes with an armored vest, helmet, blood-red sneaksuit, sneakboots, specialized combat gloves and a high-tech balaclava which obfuscates both your voice and your face. The case is also rather useful as a storage container and bludgeoning implement."
	item = /obj/item/storage/toolbox/infiltrator
	cost = 5
	limited_stock = 1 //you only get one so you don't end up with too many gun cases
	purchasable_from = ~(UPLINK_TRAITORS | UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/bundles_tc/cybernetics_bundle
	name = "Cybernetic Implants Bundle"
	desc = "A random selection of cybernetic implants. Guaranteed 5 high quality implants. Comes with an autosurgeon."
	item = /obj/item/storage/box/cyber_implants
	cost = 40
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/medical
	name = "Medical bundle"
	desc = "The support specialist: Aid your fellow operatives with this medical bundle. Contains a tactical medkit, \
			a Donksoft LMG, a box of riot darts and a pair of magboots to rescue your friends in no-gravity environments."
	item = /obj/item/storage/backpack/duffelbag/syndie/med/medicalbundle
	cost = 15 // normally 20
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/modular
	name = "Modular Pistol Kit"
	desc = "A heavy briefcase containing one modular pistol (chambered in 10mm), one supressor, and spare ammunition, including a box of soporific ammo. \
		Includes a suit jacket that is padded with a robust liner."
	item = /obj/item/storage/briefcase/modularbundle
	cost = 12

/datum/uplink_item/bundles_tc/shredderbundle
	name = "Shredder bundle"
	desc = "A truly horrific weapon designed simply to maim its victim, the CX Shredder is banned by several intergalactic treaties. \
			You'll get two of them with this. And spare ammo to boot. And we'll throw in an extra elite hardsuit and chest rig to hold them all!"
	item = /obj/item/storage/backpack/duffelbag/syndie/shredderbundle
	cost = 30 // normally 41
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/sniper
	name = "Sniper bundle"
	desc = "Elegant and refined: Contains a collapsed sniper rifle in an expensive carrying case, \
			two soporific knockout magazines, a free surplus supressor, and a sharp-looking tactical turtleneck suit. \
			We'll throw in a free red tie if you order NOW."
	item = /obj/item/storage/briefcase/sniperbundle
	cost = 20 // normally 26
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/firestarter
	name = "Spetsnaz Pyro bundle"
	desc = "For systematic suppression of carbon lifeforms in close quarters: Contains a lethal New Russian backpack spray, Elite hardsuit, \
			Stechkin APS pistol, two magazines, a minibomb and a stimulant syringe. \
			Order NOW and comrade Boris will throw in an extra tracksuit."
	item = /obj/item/storage/backpack/duffelbag/syndie/firestarter
	cost = 30
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/bundle
	name = "Operative Bundle"
	desc = "Operative Bundles are specialized groups of items that arrive in a plain box. \
			These items are collectively worth more than 20 credits, but you do not know which specialization \
			you will receive. May contain discontinued and/or exotic items."
	item = /obj/item/storage/box/syndicate
	cost = 15
	purchasable_from = ~(UPLINK_TRAITORS | UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/bundle //blumoon add
	name = "Old hero Bundle"
	desc = "Operative Bundles are specialized groups of items that arrive in a plain box. \
			These items are collectively worth more than 20 credits, but you do not know which specialization \
			you will receive. May contain discontinued and/or exotic items."
	item = /obj/item/storage/box/inteq_kit/new_heroes
	cost = 17
	purchasable_from = UPLINK_TRAITORS
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/surplus
	name = "Surplus Crate"
	desc = "A dusty crate from the back of the illegal warehouse. Rumored to contain a valuable assortment of items, \
			but you never know. Contents are sorted to always be worth 50 CR."
	item = /obj/structure/closet/crate
	cost = 20
	player_minimum = 25
	purchasable_from = ~(UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)
	var/starting_crate_value = 50
	var/uplink_flags = UPLINK_TRAITORS

/datum/uplink_item/bundles_tc/surplus/super
	name = "Super Surplus Crate"
	desc = "A dusty SUPER-SIZED from the back of the illegal warehouse. Rumored to contain a valuable assortment of items, \
			but you never know. Contents are sorted to always be worth 125 CR."
	cost = 40
	player_minimum = 40
	starting_crate_value = 125

/datum/uplink_item/bundles_tc/surplus/purchase(mob/user, datum/component/uplink/U)
	var/list/uplink_items = get_uplink_items(uplink_flags, FALSE)

	var/crate_value = starting_crate_value
	var/obj/structure/closet/crate/C = spawn_item(/obj/structure/closet/crate, user, U)
	if(U.purchase_log)
		U.purchase_log.LogPurchase(C, src, cost)
	while(crate_value)
		var/category = pick(uplink_items)
		var/item = pick(uplink_items[category])
		var/datum/uplink_item/I = uplink_items[category][item]

		if(!I.surplus || prob(100 - I.surplus))
			continue
		if(crate_value < I.cost)
			continue
		crate_value -= I.cost
		var/obj/goods = new I.item(C)
		if(U.purchase_log)
			U.purchase_log.LogPurchase(goods, I, 0)
	return C

/datum/uplink_item/bundles_tc/reroll
	name = "Renegotiate Contract"
	desc = "Selecting this will inform your employers that you wish for new objectives. Can only be done twice."
	item = /obj/effect/gibspawner/generic
	cost = 0
	cant_discount = TRUE
	restricted = TRUE
	limited_stock = 2

/datum/uplink_item/bundles_tc/reroll/purchase(mob/user, datum/component/uplink/U)
	var/datum/antagonist/traitor/T = user?.mind?.has_antag_datum(/datum/antagonist/traitor)
	if(istype(T))
		T.set_traitor_kind(get_random_traitor_kind(blacklist = list(/datum/traitor_class/human/freeform, /datum/traitor_class/human/hijack, /datum/traitor_class/human/martyr)))
	else
		to_chat(user,"Invalid user for contract renegotiation.")

/datum/uplink_item/bundles_tc/random
	name = "Random Item"
	desc = "Picking this will purchase a random item. Useful if you have some TC to spare or if you haven't decided on a strategy yet."
	item = /obj/effect/gibspawner/generic // non-tangible item because techwebs use this path to determine illegal tech
	cost = 0
	cant_discount = TRUE

/datum/uplink_item/bundles_tc/random/purchase(mob/user, datum/component/uplink/U)
	var/list/uplink_items = U.uplink_items
	var/list/possible_items = list()
	for(var/category in uplink_items)
		for(var/item in uplink_items[category])
			var/datum/uplink_item/I = uplink_items[category][item]
			if(src == I || !I.item)
				continue
			if(istype(I, /datum/uplink_item/bundles_tc/reroll)) //oops!
				continue
			if(U.telecrystals < I.cost)
				continue
			if(I.limited_stock == 0)
				continue
			possible_items += I

	if(possible_items.len)
		var/datum/uplink_item/I = pick(possible_items)
		SSblackbox.record_feedback("tally", "traitor_random_uplink_items_gotten", 1, initial(I.name))
		U.MakePurchase(user, I)

/datum/uplink_item/bundles_tc/telecrystal
	name = "1 Telecrystal"
	desc = "A telecrystal in its rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal
	cost = 1
	surplus = 0
	cant_discount = TRUE
	// Don't add telecrystals to the purchase_log since
	// it's just used to buy more items (including itself!)
	purchase_log_vis = FALSE
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/bundles_tc/telecrystal/five
	name = "5 Telecrystals"
	desc = "Five telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/five
	cost = 5
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/bundles_tc/telecrystal/twenty
	name = "20 Telecrystals"
	desc = "Twenty telecrystals in their rawest and purest form; can be utilized on active uplinks to increase their telecrystal count."
	item = /obj/item/stack/telecrystal/twenty
	cost = 20
	purchasable_from = UPLINK_SYNDICATE

/datum/uplink_item/bundles_tc/telecrystal/inteq
	name = "1 Tele Credit"
	desc = "Golden credit. Can be inserted into Uplink."
	item = /obj/item/stack/telecrystal/inteq
	cost = 1
	surplus = 0
	purchasable_from = ~(UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/telecrystal/five/inteq
	name = "5 Tele Credits"
	desc = "Five golden credits. Can be inserted into Uplink."
	item = /obj/item/stack/telecrystal/inteq/five
	cost = 5
	purchasable_from = ~(UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/telecrystal/twenty/inteq
	name = "20 Tele Credits"
	desc = "Twenty golden credits. Can be inserted into Uplink."
	item = /obj/item/stack/telecrystal/inteq/twenty
	cost = 20
	purchasable_from = ~(UPLINK_SYNDICATE)

/datum/uplink_item/bundles_tc/conversion_kit
	name = "InteQ Conversion Kit"
	desc = "Коробка с набором конвертации наушника в bowman headset и ключом-шифратором InteQ. Набор конвертации, после использования на наушнике обеспечивает пользователю защиту от звука светошумовой гранаты. Вставьте в наушник чтобы получить доступ к каналу InteQ (говорить и слышать) и остальным каналам на станции (только слышать)."
	item = /obj/item/storage/box/inteq_kit/conversion_kit
	cost = 1
	purchasable_from = UPLINK_TRAITORS
