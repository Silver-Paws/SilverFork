/datum/hud/larva/New(mob/owner)
	. = ..()
	var/atom/movable/screen/using

	using = new /atom/movable/screen/navigate
	using.screen_loc = ui_alien_navigate_menu

	static_inventory += using
