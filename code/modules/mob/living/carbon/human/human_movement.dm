/mob/living/carbon/human/get_movespeed_modifiers()
	var/list/considering = ..()
	if(HAS_TRAIT(src, TRAIT_IGNORESLOWDOWN))
		. = list()
		for(var/id in considering)
			var/datum/movespeed_modifier/M = considering[id]
			if(M.flags & IGNORE_NOSLOW || M.multiplicative_slowdown < 0)
				.[id] = M
		return
	return considering

/mob/living/carbon/human/slip(knockdown_amount, obj/O, lube)
	if(HAS_TRAIT(src, TRAIT_NOSLIPALL))
		return FALSE
	if (!(lube & GALOSHES_DONT_HELP))
		if(HAS_TRAIT(src, TRAIT_NOSLIPWATER))
			return FALSE
		if(shoes && istype(shoes, /obj/item/clothing))
			var/obj/item/clothing/CS = shoes
			if (CS.clothing_flags & NOSLIP)
				return FALSE
	if (lube & SLIDE_ICE)
		if(shoes && istype(shoes, /obj/item/clothing))
			var/obj/item/clothing/CS = shoes
			if (CS.clothing_flags & NOSLIP_ICE)
				return FALSE
	return ..()

/mob/living/carbon/human/experience_pressure_difference(pressure_difference, direction, pressure_resistance_prob_delta = 0, throw_target)
	if(prob(pressure_difference * 2.5))
		playsound(src, 'sound/effects/space_wind.ogg', 50, 1)
	if(shoes && istype(shoes, /obj/item/clothing))
		var/obj/item/clothing/S = shoes
		if (S.clothing_flags & NOSLIP)
			return FALSE
	return ..()

/mob/living/carbon/human/mob_has_gravity()
	. = ..()
	if(!.)
		if(mob_negates_gravity())
			. = 1

/mob/living/carbon/human/mob_negates_gravity()
	return ((shoes && shoes.negates_gravity()) || (dna.species.negates_gravity(src)))

/mob/living/carbon/human/Move(NewLoc, direct)
	var/oldpseudoheight = pseudo_z_axis
	. = ..()
	for(var/datum/mutation/human/HM in dna.mutations)
		HM.on_move(NewLoc)
	if(. && (combat_flags & COMBAT_FLAG_SPRINT_ACTIVE) && !(movement_type & FLYING) && CHECK_ALL_MOBILITY(src, MOBILITY_MOVE|MOBILITY_STAND) && m_intent == MOVE_INTENT_RUN && has_gravity(loc) && (!pulledby || (pulledby.pulledby == src)))
		if(!HAS_TRAIT(src, TRAIT_FREESPRINT))
			var/datum/movespeed_modifier/equipment_speedmod/MM = get_movespeed_modifier_datum(/datum/movespeed_modifier/equipment_speedmod)
			var/amount = 1
			if(MM?.multiplicative_slowdown >= 1)
				amount *= (1 + (6 - (3 / MM.multiplicative_slowdown)))
			doSprintLossTiles(amount)
		if((oldpseudoheight - pseudo_z_axis) >= 8)
			to_chat(src, "<span class='warning'>You trip off of the elevated surface!</span>")
			for(var/obj/item/I in held_items)
				accident(I)
			DefaultCombatKnockdown(80)
	if(shoes)
		if(!lying && !buckled)
			if(loc == NewLoc)
				if(!has_gravity(loc))
					return
				var/obj/item/clothing/shoes/S = shoes

				//Bloody footprints
				var/turf/T = get_turf(src)
				if(istype(S))
					if(S.bloody_shoes && S.bloody_shoes[S.blood_state])
						var/obj/effect/decal/cleanable/blood/footprints/oldFP = locate(/obj/effect/decal/cleanable/blood/footprints) in T
						if(oldFP && (oldFP.blood_state == S.blood_state && oldFP.color == S.last_blood_color))
							return
						S.bloody_shoes[S.blood_state] = max(0, S.bloody_shoes[S.blood_state] - BLOOD_LOSS_PER_STEP)
						var/obj/effect/decal/cleanable/blood/footprints/FP = new /obj/effect/decal/cleanable/blood/footprints(T)
						FP.blood_state = S.blood_state
						FP.entered_dirs |= dir
						FP.bloodiness = S.bloody_shoes[S.blood_state]
						if(S.last_bloodtype)
							FP.blood_DNA[S.last_blood_DNA] = S.last_bloodtype
							if(!FP.blood_DNA["color"])
								FP.blood_DNA["color"] = S.last_blood_color
							else
								FP.blood_DNA["color"] = BlendRGB(FP.blood_DNA["color"], S.last_blood_color)
							FP.blood_DNA["blendmode"] = S.last_blood_blend
						FP.update_icon()
						update_inv_shoes()
				//End bloody footprints

				if(istype(S))
					S.step_action()
	if(movement_type & GROUND && dirtyness_maker)
		dirt_buildup()

/mob/living/carbon/human/Process_Spacemove(movement_dir = 0) //Temporary laziness thing. Will change to handles by species reee.
	if(dna.species.space_move(src))
		return TRUE
	return ..()

/mob/living/carbon/human/proc/dirt_buildup(strength = 1)
	if(!shoes || !(shoes.body_parts_covered & FEET))
		return	// barefoot advantage
	var/turf/open/T = loc
	if(!istype(T) || !T.dirt_buildup_allowed)
		return
	var/area/A = T.loc
	if(!A.dirt_buildup_allowed)
		return
	var/multiplier = CONFIG_GET(number/turf_dirty_multiplier)
	strength *= multiplier
	var/obj/effect/decal/cleanable/dirt/D = locate() in T
	if(D)
		D.dirty(strength)
	else
		T.dirtyness += strength
		if(T.dirtyness >= (isnull(T.dirt_spawn_threshold)? CONFIG_GET(number/turf_dirt_threshold) : T.dirt_spawn_threshold))
			D = new /obj/effect/decal/cleanable/dirt(T)
			D.dirty(T.dirt_spawn_threshold - T.dirtyness)
			T.dirtyness = 0		// reset.
