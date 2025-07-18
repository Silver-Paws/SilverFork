#define WELDER_FUEL_BURN_INTERVAL 13
/obj/item/weldingtool
	name = "welding tool"
	desc = "A standard edition welder provided by Nanotrasen."
	icon = 'icons/obj/tools.dmi'
	icon_state = "welder"
	item_state = "welder"
	lefthand_file = 'icons/mob/inhands/equipment/tools_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/tools_righthand.dmi'
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT
	item_flags = SURGICAL_TOOL
	force = 3
	throwforce = 5
	hitsound = "swing_hit"
	usesound = list('sound/items/welder.ogg', 'sound/items/welder2.ogg')
	drop_sound = 'sound/items/handling/weldingtool_drop.ogg'
	pickup_sound = 'sound/items/handling/weldingtool_pickup.ogg'
	var/acti_sound = 'sound/items/welderactivate.ogg'
	var/deac_sound = 'sound/items/welderdeactivate.ogg'
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_SMALL
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 30)
	resistance_flags = FIRE_PROOF

	var/self_fueling = FALSE //Do we refill ourselves or not
	var/nextrefueltick = 0 //When is the next tick we refuel?
	var/refueling_interval = 10	//Every how many processing ticks does this refuel? (1 = every processing tick)

	custom_materials = list(/datum/material/iron=70, /datum/material/glass=30)
	var/welding = 0 	//Whether or not the welding tool is off(0), on(1) or currently welding(2)
	var/status = TRUE 		//Whether the welder is secured or unsecured (able to attach rods to it to make a flamethrower)
	var/max_fuel = 20 	//The max amount of fuel the welder can hold
	var/change_icons = 1
	var/can_off_process = FALSE
	var/light_intensity = 2 //how powerful the emitted light is when used.
	var/progress_flash_divisor = 10
	var/burned_fuel_for = 0	//when fuel was last removed
	heat = 3800
	tool_behaviour = TOOL_WELDER
	toolspeed = 1
	wound_bonus = 5
	bare_wound_bonus = 10

/obj/item/weldingtool/Initialize(mapload)
	. = ..()
	create_reagents(max_fuel)
	reagents.add_reagent(/datum/reagent/fuel, max_fuel)
	update_icon()
	if(can_off_process)
		START_PROCESSING(SSobj, src)

/obj/item/weldingtool/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/weldingtool/update_icon_state()
	if(welding)
		item_state = "[initial(item_state)]1"
	else
		item_state = "[initial(item_state)]"

/obj/item/weldingtool/DoRevenantThrowEffects(atom/target)
	attack_self()

/obj/item/weldingtool/update_overlays()
	. = ..()
	if(change_icons)
		var/ratio = get_fuel() / max_fuel
		ratio = CEILING(ratio*4, 1) * 25
		. += "[initial(icon_state)][ratio]"
	if(welding)
		. += "[initial(icon_state)]-on"

/obj/item/weldingtool/process()
	//This handles refueling. Its looking at how much fuel the tool has and comparing that to how much it holds
	//This then looks if the refuel tick has come based on world time.
	//Then looks if we refuel ourselves or not.

	if(self_fueling && get_fuel() < max_fuel && nextrefueltick <= world.time)
		nextrefueltick = world.time + refueling_interval
		reagents.add_reagent(/datum/reagent/fuel, 1)

	switch(welding)
		if(0)
			force = 3
			damtype = "brute"
			update_icon()
			if(!can_off_process)
				STOP_PROCESSING(SSobj, src)
			return
	//Welders left on now use up fuel, but lets not have them run out quite that fast
		if(1)
			force = 15
			damtype = "fire"
			++burned_fuel_for
			if(burned_fuel_for >= WELDER_FUEL_BURN_INTERVAL)
				use(1)
			update_icon()

	//This is to start fires. process() is only called if the welder is on.
	open_flame()

/obj/item/weldingtool/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] welds [user.ru_ego()] every orifice closed! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (FIRELOSS)

/obj/item/weldingtool/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_SCREWDRIVER)
		flamethrower_screwdriver(I, user)
	else if(istype(I, /obj/item/stack/rods))
		flamethrower_rods(I, user)
	else
		. = ..()
	update_icon()

/obj/item/weldingtool/proc/explode()
	var/turf/T = get_turf(loc)
	var/plasmaAmount = reagents.get_reagent_amount(/datum/reagent/toxin/plasma)
	dyn_explosion(T, plasmaAmount/5)//20 plasma in a standard welder has a 4 power explosion. no breaches, but enough to kill/dismember holder
	qdel(src)

/obj/item/weldingtool/use_tool(atom/target, mob/living/user, delay, amount, volume, datum/callback/extra_checks, skill_gain_mult)
	target.add_overlay(GLOB.welding_sparks)
	. = ..()
	target.cut_overlay(GLOB.welding_sparks)

/obj/item/weldingtool/attack(mob/living/carbon/human/H, mob/user)
	if(!istype(H))
		return ..()

	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))

	if(affecting && affecting.is_robotic_limb() && user.a_intent != INTENT_HARM)
		//only heal to threshhold_passed_mindamage if limb is damaged to or past threshhold, otherwise heal normally
		var/damage
		var/heal_amount = 15

		if(src.use_tool(H, user, 0, volume=50, amount=1))
			if(user == H)
				user.visible_message("<span class='notice'>[user] starts to fix some of the dents on [H]'s [affecting.name].</span>",
					"<span class='notice'>You start fixing some of the dents on [H]'s [affecting.name].</span>")
				if(!do_mob(user, H, 50))
					return
			damage = affecting.brute_dam
			affecting.update_threshhold_state(burn = FALSE)
			if(affecting.threshhold_brute_passed)
				heal_amount = min(heal_amount, damage - affecting.threshhold_passed_mindamage)

				if(!heal_amount)
//					to_chat(user, "<span class='notice'>[user == H ? "Your" : "[H]'s"] [affecting.name] appears to have suffered severe internal damage and requires surgery to repair further.</span>") - BLUEMOON REMOVAL
					to_chat(user, span_notice("[user == H ? "Ваша [affecting.ru_name]" : "[affecting.ru_name_capital] [H]"] подверглась сильным внутренним повреждениям. Требуется углубленный ремонт с хирургической точностью.")) // BLUEMOON ADD
					return
			item_heal_robotic(H, user, heal_amount, 0)
	else
		return ..()


/obj/item/weldingtool/afterattack(atom/O, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	if(!status && O.is_refillable())
		reagents.trans_to(O, reagents.total_volume)
		to_chat(user, "<span class='notice'>You empty [src]'s fuel tank into [O].</span>")
		update_icon()
	if(isOn())
		use(1)
		var/turf/location = get_turf(user)
		location.hotspot_expose(550, 10, 1)
		if(get_fuel() <= 0)
			set_light(0)

		if(isliving(O))
			var/mob/living/L = O
			if(L.IgniteMob())
				message_admins("[ADMIN_LOOKUPFLW(user)] set [key_name_admin(L)] on fire with [src] at [AREACOORD(user)]")
				log_game("[key_name(user)] set [key_name(L)] on fire with [src] at [AREACOORD(user)]")


/obj/item/weldingtool/attack_self(mob/user)
	if(src.reagents.has_reagent(/datum/reagent/toxin/plasma))
		message_admins("[ADMIN_LOOKUPFLW(user)] activated a rigged welder at [AREACOORD(user)].")
		explode()
	switched_on(user)
	if(welding)
		set_light(light_intensity, 0.75, LIGHT_COLOR_FIRE)

	update_icon()


// Returns the amount of fuel in the welder
/obj/item/weldingtool/proc/get_fuel()
	return reagents.get_reagent_amount(/datum/reagent/fuel)


// Uses fuel from the welding tool.
/obj/item/weldingtool/use(used = 0)
	if(!isOn() || !check_fuel())
		return FALSE

	if(used)
		burned_fuel_for = 0
	if(get_fuel() >= used)
		reagents.remove_reagent(/datum/reagent/fuel, used)
		check_fuel()
		return TRUE
	else
		return FALSE


//Turns off the welder if there is no more fuel (does this really need to be its own proc?)
/obj/item/weldingtool/proc/check_fuel(mob/user)
	if(get_fuel() <= 0 && welding)
		switched_on(user)
		update_icon()
		return FALSE
	return TRUE

//Switches the welder on
/obj/item/weldingtool/proc/switched_on(mob/user)
	if(!status)
		if(user)
			to_chat(user, "<span class='warning'>[src] can't be turned on while unsecured!</span>")
		return
	welding = !welding
	if(welding)
		if(get_fuel() >= 1)
			if(user)
				to_chat(user, "<span class='notice'>You switch [src] on.</span>")
			playsound(loc, acti_sound, 50, 1)
			force = 15
			damtype = "fire"
			hitsound = 'sound/items/welder.ogg'
			update_icon()
			START_PROCESSING(SSobj, src)
		else
			to_chat(user, "<span class='warning'>You need more fuel!</span>")
			switched_off(user)
	else
		to_chat(user, "<span class='notice'>You switch [src] off.</span>")
		playsound(loc, deac_sound, 50, 1)
		switched_off(user)

//Switches the welder off
/obj/item/weldingtool/proc/switched_off(mob/user)
	welding = 0
	set_light(0)

	force = 3
	damtype = "brute"
	hitsound = "swing_hit"
	update_icon()


/obj/item/weldingtool/examine(mob/user)
	. = ..()
	. += "It contains [get_fuel()] unit\s of fuel out of [max_fuel]."

/obj/item/weldingtool/get_temperature()
	return welding * heat

//Returns whether or not the welding tool is currently on.
/obj/item/weldingtool/proc/isOn()
	return welding

// When welding is about to start, run a normal tool_use_check, then flash a mob if it succeeds.
/obj/item/weldingtool/tool_start_check(mob/living/user, amount=0)
	. = tool_use_check(user, amount)
	if(. && user && !HAS_TRAIT(user, TRAIT_ROBOTIC_ORGANISM)) // BLUEMOON ADD - сварочный аппарат не наносит урон глазам синтетиков
		user.flash_act(light_intensity)

// Flash the user during welding progress
/obj/item/weldingtool/tool_check_callback(mob/living/user, amount, datum/callback/extra_checks)
	. = ..()
	if(. && user)
		if (progress_flash_divisor == 0)
			if(!HAS_TRAIT(user, TRAIT_ROBOTIC_ORGANISM)) // BLUEMOON ADD - сварочный аппарат не наносит урон глазам синтетиков
				user.flash_act(min(light_intensity,1))
			progress_flash_divisor = initial(progress_flash_divisor)
		else
			progress_flash_divisor--

// If welding tool ran out of fuel during a construction task, construction fails.
/obj/item/weldingtool/tool_use_check(mob/living/user, amount)
	if(!isOn() || !check_fuel())
		to_chat(user, "<span class='warning'>[src] has to be on to complete this task!</span>")
		return FALSE

	if(get_fuel() >= amount)
		return TRUE
	else
		to_chat(user, "<span class='warning'>You need more welding fuel to complete this task!</span>")
		return FALSE


/obj/item/weldingtool/proc/flamethrower_screwdriver(obj/item/I, mob/user)
	if(welding)
		to_chat(user, "<span class='warning'>Turn it off first!</span>")
		return
	status = !status
	if(status)
		to_chat(user, "<span class='notice'>You resecure [src] and close the fuel tank.</span>")
		reagents.reagents_holder_flags &= ~(OPENCONTAINER)
	else
		to_chat(user, "<span class='notice'>[src] can now be attached, modified, and refuelled.</span>")
		reagents.reagents_holder_flags |= OPENCONTAINER
	add_fingerprint(user)

/obj/item/weldingtool/proc/flamethrower_rods(obj/item/I, mob/user)
	if(!status)
		var/obj/item/stack/rods/R = I
		if (R.use(1))
			var/obj/item/flamethrower/F = new /obj/item/flamethrower(user.loc)
			if(!remove_item_from_storage(F))
				user.transferItemToLoc(src, F, TRUE)
			F.weldtool = src
			add_fingerprint(user)
			to_chat(user, "<span class='notice'>You add a rod to a welder, starting to build a flamethrower.</span>")
			user.put_in_hands(F)
		else
			to_chat(user, "<span class='warning'>You need one rod to start building a flamethrower!</span>")

/obj/item/weldingtool/ignition_effect(atom/A, mob/user)
	if(use_tool(A, user, 0, amount=1))
		return "<span class='notice'>[user] casually lights [A] with [src], what a badass.</span>"
	else
		return ""

/obj/item/weldingtool/largetank
	name = "industrial welding tool"
	desc = "A slightly larger welder with a larger tank."
	icon_state = "indwelder"
	item_state = "upindwelder"
	max_fuel = 40
	custom_materials = list(/datum/material/glass=60)
	toolspeed = 0.95 // BLUEMOOD ADD

/obj/item/weldingtool/largetank/cyborg
	name = "integrated welding tool"
	desc = "An advanced welder designed to be used in robotic systems."
	icon = 'icons/obj/items_cyborg.dmi'
	icon_state = "indwelder_cyborg"
	toolspeed = 0.5

/obj/item/weldingtool/largetank/flamethrower_screwdriver()
	return

/obj/item/weldingtool/mini
	name = "emergency welding tool"
	desc = "A miniature welder used during emergencies."
	icon_state = "miniwelder"
	item_state = "miniwelder"
	max_fuel = 10
	w_class = WEIGHT_CLASS_TINY
	custom_materials = list(/datum/material/iron=30, /datum/material/glass=10)
	change_icons = 0

/obj/item/weldingtool/mini/flamethrower_screwdriver()
	return

/obj/item/weldingtool/hugetank
	name = "upgraded industrial welding tool"
	desc = "An upgraded welder based of the industrial welder."
	icon_state = "upindwelder"
	item_state = "upindwelder"
	max_fuel = 80
	custom_materials = list(/datum/material/iron=70, /datum/material/glass=120)
	toolspeed = 0.85 // BLUEMOOD ADD

/obj/item/weldingtool/bronze
	name = "bronze plated welding tool"
	desc = "A bronze plated welder."
	max_fuel = 21
	toolspeed = 0.95
	icon_state = "brasswelder"
	item_state = "brasswelder"

//Self filling welders below

/obj/item/weldingtool/experimental
	name = "experimental welding tool"
	desc = "An experimental welder capable of self-fuel generation and less harmful to the eyes."
	icon_state = "exwelder"
	item_state = "exwelder"
	max_fuel = 40
	custom_materials = list(/datum/material/iron=70, /datum/material/glass=120)
	change_icons = 0
	self_fueling = TRUE
	can_off_process = TRUE
	light_intensity = 1
	toolspeed = 0.5

/obj/item/weldingtool/experimental/brass
	name = "brass welding tool"
	desc = "A brass welder that seems to constantly refuel itself. It is faintly warm to the touch."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	refueling_interval = 5
	icon_state = "clockwelder"
	item_state = "brasswelder"

/obj/item/weldingtool/experimental/ashwalker
	name = "necropolis welding torch"
	desc = "A mysterious welding tool with its origins in the depths of the necropolis. A mysterious force keeps replenishing its fuel."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	refueling_interval = 5
	toolspeed = 0.75
	max_fuel = 20
	icon = 'icons/obj/mining.dmi'
	icon_state = "ashwelder"

/obj/item/weldingtool/abductor
	name = "alien welding tool"
	desc = "An alien welding tool. Whatever fuel it uses, it never runs out."
	icon = 'icons/obj/abductor.dmi'
	icon_state = "welder"
	item_state = "alienwelder"
	self_fueling = TRUE
	can_off_process = TRUE
	refueling_interval = 1
	toolspeed = 0.1
	light_intensity = 0
	change_icons = 0

/obj/item/weldingtool/advanced
	name = "advanced welding tool"
	desc = "A modern welding tool combined with an alien welding tool, it almost never runs out of fuel and works nearly as fast."
	icon = 'icons/obj/advancedtools.dmi'
	icon_state = "welder"
	item_state = "alienwelder"
	self_fueling = TRUE
	can_off_process = TRUE
	refueling_interval = 2
	toolspeed = 0.2
	light_intensity = 0
	change_icons = 0
// BLUEMOON ADD START black skin
	unique_reskin = list(
		"Carbonized" = list(
			RESKIN_ICON_STATE_FILE = 'modular_bluemoon/icons/obj/advancedtools_black.dmi',
		),
		"Titanium" = list(
			RESKIN_ICON_STATE = "welder",
		)
	)
// BLUEMOON ADD END

#undef WELDER_FUEL_BURN_INTERVAL
