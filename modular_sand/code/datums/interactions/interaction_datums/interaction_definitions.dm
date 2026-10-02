/datum/interaction/handshake
	description = "Пожать руку."
	simple_message = "USER пожимает руку TARGET."
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/pat
	description = "Похлопать по плечу."
	simple_message = "USER хлопает TARGET по плечу."
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/cheer
	description = "Подбодрить посвистыванием!"
	required_from_user = INTERACTION_REQUIRE_MOUTH
	simple_message = "USER подбадривает TARGET радостным посвистыванием!"
	interaction_sound = 'modular_bluemoon/sound/emotes/svist.ogg'
	max_distance = 25
	interaction_flags = NONE

/datum/interaction/highfive
	description = "Дать пять!"
	simple_message = "USER даёт пять TARGET!"
	interaction_sound = 'sound/effects/snap.ogg'
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/headpat
	description = "Погладить по голове"
	simple_message = "USER гладит TARGET по голове." //BLUEMOON EDIT
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

	p13target_emote = PLUG13_EMOTE_BASIC
	p13target_strength = PLUG13_STRENGTH_LOW_PLUS
	p13target_duration = PLUG13_DURATION_SHORT
	hearts_effect = FALSE

//BLUEMOON ADD START
/datum/interaction/headpat/post_interaction(mob/living/user, mob/living/target, apply_cooldown, is_hidden)
	. = ..()
	if(HAS_TRAIT(target, TRAIT_DISTANT))
		to_chat(user, span_warning("[capitalize(target.name)] отстраняется от тебя, не желая таких прикосновений."))
		to_chat(target, span_warning("Ты чувствуешь раздражение, когда [user] трогает тебя за голову."))
		if(distant_punishment_interaction(user, target))
			return TRUE

	if(HAS_TRAIT(target, TRAIT_HEADPAT_SLUT))
		SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "lewd_headpat", /datum/mood_event/lewd_headpat)
		target.handle_post_sex(5, null, target)
		new /obj/effect/temp_visual/heart(target.loc)

	else
		SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "headpat", /datum/mood_event/headpat)


/datum/interaction/headpat/proc/distant_punishment_interaction(mob/living/user, mob/living/target)
	if(HAS_TRAIT(target, TRAIT_PACIFISM) || HAS_TRAIT(user, TRAIT_PACIFISM))
		return FALSE

	switch(rand(1, 100))
		if(1 to 20)
			if((!target.get_bodypart(BODY_ZONE_L_ARM) && !target.get_bodypart(BODY_ZONE_R_ARM)) || target.incapacitated())
				return FALSE

			user.visible_message(
				span_warning("<b>[target]</b> внезапно выкручивает руку <b>[user]</b>!"),
				span_boldwarning("Ты чувствуешь, как <b>[target]</b> резко выкручивает тебе руку! Лучше не трогать [target.ru_ego()]!"),
				target = target,
				target_message = span_warning("Ты ловко выкручиваешь руку <b>[user]</b> за попытку прикоснуться к тебе.")
			)
			if(!HAS_TRAIT(user, TRAIT_ROBOTIC_ORGANISM)) // роботы не кричат от боли
				user.emote(pick("realagony", "scream"))
			user.dropItemToGround(user.get_active_held_item())
			var/hand = pick(BODY_ZONE_PRECISE_L_HAND, BODY_ZONE_PRECISE_R_HAND)
			user.apply_damage(50, STAMINA, hand)
			user.apply_damage(5, BRUTE, hand)
			user.Knockdown(60) // STOP TOUCHING ME!
			if(HAS_TRAIT(user, TRAIT_MODULAR_LIMBS) && prob(33))
				var/obj/item/bodypart/arm = user.get_bodypart(check_zone(hand))
				arm?.drop_limb()
			return TRUE

		if(21 to 25) // Да, это беспонтовая версия подсечки кравмаг
			if((!target.get_bodypart(BODY_ZONE_L_LEG) && !target.get_bodypart(BODY_ZONE_R_LEG)) || target.incapacitated())
				return FALSE

			if(user.body_position == STANDING_UP)
				user.visible_message(
					span_warning("<b>[target]</b> внезапно делает подсечку <b>[user]</b>!"),
					span_boldwarning("Ты внезапно летишь на землю, как <b>[target]</b> резко делает по тебе подсечку! Лучше не трогать [target.ru_ego()]!"),
					target = target,
					target_message = span_warning("Ты даёшь <b>[user]</b> мощную подсечку за попытку прикоснуться к тебе.")
				)
				user.Paralyze(5 DECISECONDS)
				user.DefaultCombatKnockdown(1 SECONDS, override_hardstun = 1, override_stamdmg = 0)
			else
				user.visible_message(
					span_warning("<b>[target]</b> даёт мощнейший пинок в челюсть <b>[user]</b>, нокаутируя [user.ru_ego()]!"),
					span_boldwarning("У тебя мутнеет в глазах после того, как <b>[target]</b> со всей силы заряжает тебе по челюсти после касаний!"),
					target = target,
					target_message = span_warning("Ты даёшь <b>[user]</b> пинок со всей силы за попытку прикоснуться к тебе.")
				)
				user.SetSleeping(4 SECONDS)
				user.apply_damage(12, BRUTE, BODY_ZONE_HEAD)
			playsound(get_turf(user), 'sound/effects/hit_kick.ogg', 50, 1, -1)
			return TRUE

		else // Терпим
			return FALSE


/datum/interaction/headpat/display_interaction(mob/living/user, mob/living/target, is_hidden)
	. = ..()
	var/distance = 7
	var/picked_hidden = pick(hidden_additional)
	if(is_hidden)
		distance = 1
	if(HAS_TRAIT(target, TRAIT_DISTANT))
		user.visible_message(
			span_warning("[is_hidden ? (picked_hidden) : null]<b>[user]</b> тянется, чтобы погладить <b>[target]</b> по голове, но он[target.ru_a()] раздражённо отстраняется."),
			span_warning("[is_hidden ? (picked_hidden) : null]Вы пытаетесь погладить <b>[target]</b> по голове, но он[target.ru_a()] отстраняется и выглядит недовольно."),
			target_message = span_warning("[is_hidden ? (picked_hidden) : null]<b>[user]</b> тянется к твоей голове, но ты раздражённо отстраняешься.")
		, vision_distance = distance)
		return

	if(!is_hidden && HAS_TRAIT(target, TRAIT_HEADPAT_SLUT))
		new /obj/effect/temp_visual/heart(target.loc)

//BLUEMOON ADD END

/datum/interaction/fistbump
	description = "Удариться кулачками!"
	simple_message = "USER бьётся кулачком о кулачком TARGET! О да!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/pinkypromise
	description = "Пообещать что-то на мизинчиках."
	simple_message = "USER хватается своим мизинчиком за мизинчик TARGET! Клятва Мизинчиками! Давно пора!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS

/datum/interaction/holdhand
	description = "Взяться за руку."
	simple_message = "USER хватается за руку TARGET."
	required_from_user = INTERACTION_REQUIRE_HANDS
	required_from_target = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/weapons/thudswoosh.ogg'

/datum/interaction/salute
	description = "Исполнить Воинское Приветствие!"
	simple_message = "USER исполняет воинское приветствие при виде TARGET!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'sound/voice/salute.ogg'
	max_distance = 25
	interaction_flags = NONE

/datum/interaction/handwave
	description = "Помахать рукой."
	simple_message = "USER приветливо машет TARGET."
	required_from_user = INTERACTION_REQUIRE_HANDS
	max_distance = 25
	interaction_flags = NONE

/datum/interaction/bird
	description = "Показать Средний Палец"
	simple_message = "USER демонстрирует TARGET средний палец!"
	required_from_user = INTERACTION_REQUIRE_HANDS
	interaction_sound = 'modular_splurt/sound/voice/vineboom.ogg'
	max_distance = 25
	interaction_flags = NONE
