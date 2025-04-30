/datum/hud/qareen/New(mob/owner)
	..()

	healths = new /atom/movable/screen/healths/qareen(null, src)
	infodisplay += healths
