/obj/machinery/atmospherics/pipe
	var/datum/gas_mixture/air_temporary //used when reconstructing a pipeline that broke
	var/volume = 0

	level = 1

	use_power = NO_POWER_USE
	can_unwrench = 1
	var/datum/pipeline/parent = null

	//Buckling
	can_buckle = 1
	buckle_requires_restraints = 1
	buckle_lying = -1

/obj/machinery/atmospherics/pipe/New()
	add_atom_colour(pipe_color, FIXED_COLOUR_PRIORITY)
	volume = 35 * device_type
	..()

/obj/machinery/atmospherics/pipe/nullifyNode(i)
	var/obj/machinery/atmospherics/oldN = nodes[i]
	..()
	if(oldN)
		SSair.add_to_rebuild_queue(oldN)

/obj/machinery/atmospherics/pipe/destroy_network()
	QDEL_NULL(parent)

/obj/machinery/atmospherics/pipe/build_network()
	if(QDELETED(parent))
		parent = new
		parent.build_pipeline(src)

/obj/machinery/atmospherics/pipe/atmosinit()
	var/turf/T = loc			// hide if turf is not intact
	hide(T.intact)
	..()

/obj/machinery/atmospherics/pipe/hide(i)
	if(level == 1 && isturf(loc))
		invisibility = i ? INVISIBILITY_MAXIMUM : 0
	update_icon()

/obj/machinery/atmospherics/pipe/proc/releaseAirToTurf()
	if(air_temporary)
		var/turf/T = loc
		T.assume_air(air_temporary)
		air_update_turf()

/obj/machinery/atmospherics/pipe/return_air()
	return parent.air

/obj/machinery/atmospherics/pipe/return_analyzable_air()
	if(air_temporary)
		return air_temporary
	return parent.air

/obj/machinery/atmospherics/pipe/remove_air(amount)
	return parent.air.remove(amount)

/obj/machinery/atmospherics/pipe/remove_air_ratio(ratio)
	return parent.air.remove_ratio(ratio)

/obj/machinery/atmospherics/pipe/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/pipe_meter))
		var/obj/item/pipe_meter/meter = W
		user.dropItemToGround(meter)
		meter.setAttachLayer(piping_layer)
	else
		return ..()

/obj/machinery/atmospherics/pipe/analyzer_act(mob/living/user, obj/item/I)
	atmosanalyzer_scan(parent.air, user, src)
	return TRUE

/obj/machinery/atmospherics/pipe/returnPipenet()
	return parent

/obj/machinery/atmospherics/pipe/setPipenet(datum/pipeline/P)
	parent = P

/obj/machinery/atmospherics/pipe/zap_act(power, zap_flags)
	return FALSE // they're not really machines in the normal sense, probably shouldn't explode

/obj/machinery/atmospherics/pipe/Destroy()
	QDEL_NULL(parent)

	releaseAirToTurf()
	QDEL_NULL(air_temporary)

	var/turf/T = loc
	for(var/obj/machinery/meter/meter in T)
		if(meter.target == src)
			var/obj/item/pipe_meter/PM = new (T)
			meter.transfer_fingerprints_to(PM)
			qdel(meter)
	. = ..()

/obj/machinery/atmospherics/pipe/update_icon()
	. = ..()
	update_alpha()

/obj/machinery/atmospherics/pipe/proc/update_alpha()
	alpha = invisibility ? 64 : 255

/obj/machinery/atmospherics/pipe/proc/update_node_icon()
	for(var/i in 1 to device_type)
		if(nodes[i])
			var/obj/machinery/atmospherics/N = nodes[i]
			N.update_icon()

/obj/machinery/atmospherics/pipe/returnPipenets()
	. = list(parent)

/obj/machinery/atmospherics/pipe/run_obj_armor(damage_amount, damage_type, damage_flag = 0, attack_dir)
	if(damage_flag == MELEE && damage_amount < 12)
		return FALSE
	. = ..()

/obj/machinery/atmospherics/pipe/proc/paint(paint_color)
	add_atom_colour(paint_color, FIXED_COLOUR_PRIORITY)
	pipe_color = paint_color
	update_node_icon()
	return TRUE

/obj/machinery/atmospherics/pipe/attack_ghost(mob/dead/observer/O)
	. = ..()
	if(parent)
		atmosanalyzer_scan(parent.air, O, src, FALSE)
	else
		to_chat(O, "<span class='warning'>[src] doesn't have a pipenet, which is probably a bug.</span>")
