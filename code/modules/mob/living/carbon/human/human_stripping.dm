#define INTERNALS_TOGGLE_DELAY (4 SECONDS)
#define POCKET_EQUIP_DELAY (1 SECONDS)

GLOBAL_LIST_INIT(strippable_human_items, create_strippable_list(list(
	/datum/strippable_item/mob_item_slot/head,
	/datum/strippable_item/mob_item_slot/back,
	/datum/strippable_item/mob_item_slot/mask,
	/datum/strippable_item/mob_item_slot/neck,
	/datum/strippable_item/mob_item_slot/eyes,
	/datum/strippable_item/mob_item_slot/ears,
	/datum/strippable_item/mob_item_slot/jumpsuit,
	/datum/strippable_item/mob_item_slot/suit,
	/datum/strippable_item/mob_item_slot/gloves,
	/datum/strippable_item/mob_item_slot/feet,
	/datum/strippable_item/mob_item_slot/suit_storage,
	/datum/strippable_item/mob_item_slot/id,
	/datum/strippable_item/mob_item_slot/belt,
	/datum/strippable_item/mob_item_slot/pocket/left,
	/datum/strippable_item/mob_item_slot/pocket/right,
	/datum/strippable_item/hand/left,
	/datum/strippable_item/hand/right,
	/datum/strippable_item/mob_item_slot/handcuffs,
	/datum/strippable_item/mob_item_slot/legcuffs,

	// Sandstorm content
	/datum/strippable_item/mob_item_slot/ears_extra,
	/datum/strippable_item/mob_item_slot/wrists,
	/datum/strippable_item/mob_item_slot/socks,
	/datum/strippable_item/mob_item_slot/underwear,
	/datum/strippable_item/mob_item_slot/undershirt,
)))

/mob/living/carbon/human/proc/should_strip(mob/user)
	if (user.pulling != src || user.grab_state != GRAB_AGGRESSIVE)
		return TRUE

	if (ishuman(user))
		var/mob/living/carbon/human/human_user = user
		return !human_user.can_be_firemanned(src)

	return TRUE

/datum/strippable_item/mob_item_slot/eyes
	key = STRIPPABLE_ITEM_EYES
	item_slot = ITEM_SLOT_EYES

/datum/strippable_item/mob_item_slot/ears
	key = STRIPPABLE_ITEM_EARS
	item_slot = ITEM_SLOT_EARS_LEFT

/datum/strippable_item/mob_item_slot/jumpsuit
	key = STRIPPABLE_ITEM_JUMPSUIT
	item_slot = ITEM_SLOT_ICLOTHING

/datum/strippable_item/mob_item_slot/jumpsuit/get_alternate_action(atom/source, mob/user)
	if(..() == FALSE)
		return null
	var/obj/item/clothing/under/jumpsuit = get_item(source)
	if (!istype(jumpsuit))
		return null
	return jumpsuit?.can_adjust ? "adjust_jumpsuit" : null

/datum/strippable_item/mob_item_slot/jumpsuit/alternate_action(atom/source, mob/user)
	if (!..())
		return null
	var/obj/item/clothing/under/jumpsuit = get_item(source)
	if (!istype(jumpsuit))
		return null
	to_chat(source, "<span class='notice'>[user] is trying to adjust your [jumpsuit.name].")
	if (!do_mob(user, source, jumpsuit.strip_delay * 0.5, timed_action_flags = IGNORE_HELD_ITEM))
		return
	to_chat(source, "<span class='notice'>[user] successfully adjusted your [jumpsuit.name].")
	jumpsuit.toggle_jumpsuit_adjust()

	if (!ismob(source))
		return null

	var/mob/mob_source = source
	mob_source.update_inv_w_uniform()
	mob_source.update_body()
	return TRUE

/datum/strippable_item/mob_item_slot/suit
	key = STRIPPABLE_ITEM_SUIT
	item_slot = ITEM_SLOT_OCLOTHING

/datum/strippable_item/mob_item_slot/suit/get_alternate_action(atom/source, mob/user)
	if(..() == FALSE)
		return null
	var/obj/item/clothing/suit/space/hardsuit/suit = get_item(source)
	if(istype(suit))
		if(!suit.helmettype)
			return null
		return suit?.suittoggled ? "disable_helmet" : "enable_helmet"
	return null

/datum/strippable_item/mob_item_slot/suit/alternate_action(mob/living/carbon/human/source, mob/user)
	if(!..())
		return null
	if(ishuman(source))
		var/obj/item/clothing/suit/space/hardsuit/hardsuit = get_item(source)
		var/obj/item/clothing/head/helmet/space/hardsuit/hardsuit_head = hardsuit.helmet
		source.visible_message("<span class='danger'>[user] tries to [hardsuit.suittoggled ? "retract" : "extend"] [source]'s helmet.</span>", \
							"<span class='userdanger'>[user] tries to [hardsuit.suittoggled ? "retract" : "extend"] [source]'s helmet.</span>", \
							target = user, target_message = "<span class='danger'>You try to [hardsuit.suittoggled ? "retract" : "extend"] [source]'s helmet.</span>")
		if(!do_mob(user, source, hardsuit_head ? hardsuit_head.strip_delay : POCKET_STRIP_DELAY, timed_action_flags = IGNORE_HELD_ITEM))
			return null
		if((source.head != hardsuit_head) && source.head)
			return null
		if(hardsuit.ToggleHelmet(FALSE))
			source.visible_message("<span class='danger'>[user] [hardsuit_head ? "retract" : "extend"] [source]'s helmet</span>", \
									"<span class='userdanger'>[user] [hardsuit_head ? "retract" : "extend"] [source]'s helmet</span>", \
									target = user, target_message = "<span class='danger'>You [hardsuit_head ? "retract" : "extend"] [source]'s helmet.</span>")
		return TRUE

/datum/strippable_item/mob_item_slot/gloves
	key = STRIPPABLE_ITEM_GLOVES
	item_slot = ITEM_SLOT_GLOVES

/datum/strippable_item/mob_item_slot/feet
	key = STRIPPABLE_ITEM_FEET
	item_slot = ITEM_SLOT_FEET

/datum/strippable_item/mob_item_slot/feet/get_alternate_action(atom/source, mob/user)
	if(..() == FALSE)
		return null
	var/obj/item/clothing/shoes/shoes = get_item(source)
	if (!istype(shoes) || !shoes.can_be_tied)
		return null

	switch (shoes.tied)
		if (SHOES_UNTIED)
			return "knot"
		if (SHOES_TIED)
			return "untie"
		if (SHOES_KNOTTED)
			return "unknot"

/datum/strippable_item/mob_item_slot/feet/alternate_action(atom/source, mob/user)
	if(!..())
		return null
	var/obj/item/clothing/shoes/shoes = get_item(source)
	if (!istype(shoes))
		return null

	shoes.handle_tying(user)
	return TRUE

/datum/strippable_item/mob_item_slot/suit_storage
	key = STRIPPABLE_ITEM_SUIT_STORAGE
	item_slot = ITEM_SLOT_SUITSTORE

/datum/strippable_item/mob_item_slot/suit_storage/get_alternate_action(atom/source, mob/user)
	if(..() == FALSE)
		return null
	return get_strippable_alternate_action_internals(get_item(source), source)

/datum/strippable_item/mob_item_slot/suit_storage/alternate_action(atom/source, mob/user)
	if (!..())
		return null
	return strippable_alternate_action_internals(get_item(source), source, user)

/datum/strippable_item/mob_item_slot/id
	key = STRIPPABLE_ITEM_ID
	item_slot = ITEM_SLOT_ID

/datum/strippable_item/mob_item_slot/belt
	key = STRIPPABLE_ITEM_BELT
	item_slot = ITEM_SLOT_BELT

/datum/strippable_item/mob_item_slot/belt/get_alternate_action(atom/source, mob/user)
	if(..() == FALSE)
		return null
	return get_strippable_alternate_action_internals(get_item(source), source)

/datum/strippable_item/mob_item_slot/belt/alternate_action(atom/source, mob/user)
	if (!..())
		return null
	return strippable_alternate_action_internals(get_item(source), source, user)

/datum/strippable_item/mob_item_slot/pocket
	/// Which pocket we're referencing. Used for visible text.
	var/pocket_side

/datum/strippable_item/mob_item_slot/pocket/get_obscuring(atom/source)
	return isnull(get_item(source)) \
		? STRIPPABLE_OBSCURING_NONE \
		: STRIPPABLE_OBSCURING_HIDDEN

/datum/strippable_item/mob_item_slot/pocket/get_equip_delay(obj/item/equipping)
	return POCKET_EQUIP_DELAY

/datum/strippable_item/mob_item_slot/pocket/start_equip(atom/source, obj/item/equipping, mob/user)
	. = ..()
	if (!.)
		warn_owner(source)

/datum/strippable_item/mob_item_slot/pocket/start_unequip(atom/source, mob/user)
	var/obj/item/item = get_item(source)
	if (isnull(item))
		return FALSE

	to_chat(user, span_notice("Вы пробуете обчистить [pocket_side] карман [source]."))

	var/log_message = "[key_name(user)] обчистил [pocket_side] карман [key_name(source)]. Наградой стал следующий предмет - [item]."
	user.log_message(log_message, LOG_ATTACK, color="red")
	source.log_message(log_message, LOG_VICTIM, color="red", log_globally=FALSE)
	item.add_fingerprint(source)

	var/strip_silence
	var/obj/item/clothing/gloves/gloves = user.get_item_by_slot(ITEM_SLOT_GLOVES)
	if(istype(gloves))
		strip_silence = gloves.strip_silence

	if(!strip_silence)
		source.visible_message(
			span_warning("[user] пробует обчистить [pocket_side] карман [source]."),
			span_userdanger("[user] пробует обчистить твой [pocket_side] карман."),
			ignored_mobs = user,
		)

	var/result = start_unequip_mob(item, source, user, POCKET_STRIP_DELAY)

	if (!result)
		warn_owner(source)

	return result

/datum/strippable_item/mob_item_slot/pocket/proc/warn_owner(atom/owner)
	to_chat(owner, span_warning("Кто-то пытался обчистить ваш [pocket_side] карман!"))

/datum/strippable_item/mob_item_slot/pocket/left
	key = STRIPPABLE_ITEM_LPOCKET
	item_slot = ITEM_SLOT_LPOCKET
	pocket_side = "левый"

/datum/strippable_item/mob_item_slot/pocket/right
	key = STRIPPABLE_ITEM_RPOCKET
	item_slot = ITEM_SLOT_RPOCKET
	pocket_side = "правый"

/proc/get_strippable_alternate_action_internals(obj/item/item, atom/source)
	if (!iscarbon(source))
		return null

	var/mob/living/carbon/carbon_source = source
	var/obj/item/clothing/mask
	var/internals = FALSE

	for(mask in GET_INTERNAL_SLOTS(carbon_source))
		if(istype(mask, /obj/item/clothing/mask))
			var/obj/item/clothing/mask/M = mask
			if(M.mask_adjusted)
				if(M.adjustmask(carbon_source))
					internals = TRUE
			else
				internals = TRUE
		if((mask.clothing_flags & ALLOWINTERNALS))
			internals = TRUE

	if(carbon_source.getorganslot(ORGAN_SLOT_BREATHING_TUBE))
		internals = TRUE

	if (internals && istype(item, /obj/item/tank))
		return isnull(carbon_source.internal) ? "enable_internals" : "disable_internals"

/proc/strippable_alternate_action_internals(obj/item/item, atom/source, mob/user)
	var/obj/item/tank/tank = item
	if (!istype(tank))
		return null

	var/mob/living/carbon/carbon_source = source
	if (!istype(carbon_source))
		return null

	var/obj/item/clothing/mask
	var/internals = FALSE

	for(mask in GET_INTERNAL_SLOTS(carbon_source))
		if(istype(mask, /obj/item/clothing/mask))
			var/obj/item/clothing/mask/M = mask
			if(M.mask_adjusted)
				if(M.adjustmask(carbon_source))
					internals = TRUE
			else
				internals = TRUE
		if((mask.clothing_flags & ALLOWINTERNALS))
			internals = TRUE

	if(!internals)
		return null

	carbon_source.visible_message(
		span_danger("[user] tries to [isnull(carbon_source.internal) ? "open": "close"] the valve on [source]'s [item.name]."),
		span_userdanger("[user] tries to [isnull(carbon_source.internal) ? "open": "close"] the valve on your [item.name]."),
		ignored_mobs = user,
	)

	to_chat(user, span_notice("You try to [isnull(carbon_source.internal) ? "open": "close"] the valve on [source]'s [item.name]..."))

	if(!do_mob(user, carbon_source, INTERNALS_TOGGLE_DELAY, timed_action_flags = IGNORE_HELD_ITEM))
		return null

	if(carbon_source.internal)
		carbon_source.internal = null

	else if (!QDELETED(item))
		if(internals || carbon_source.getorganslot(ORGAN_SLOT_BREATHING_TUBE))
			carbon_source.internal = item

	carbon_source.visible_message(
		span_danger("[user] [isnull(carbon_source.internal) ? "closes": "opens"] the valve on [source]'s [item.name]."),
		span_userdanger("[user] [isnull(carbon_source.internal) ? "closes": "opens"] the valve on your [item.name]."),
		ignored_mobs = user,
	)

	to_chat(user, span_notice("You [isnull(carbon_source.internal) ? "close" : "open"] the valve on [source]'s [item.name]."))

	return TRUE

#undef INTERNALS_TOGGLE_DELAY
#undef POCKET_EQUIP_DELAY
