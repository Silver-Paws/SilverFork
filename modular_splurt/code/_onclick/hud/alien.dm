/datum/hud/alien/New(mob/living/carbon/alien/humanoid/owner)
	. = ..()
	var/atom/movable/screen/using

	using = new /atom/movable/screen/navigate
	using.screen_loc = ui_alien_navigate_menu

	static_inventory += using
