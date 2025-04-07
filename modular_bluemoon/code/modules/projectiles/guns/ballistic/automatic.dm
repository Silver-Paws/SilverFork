/obj/item/gun/ballistic/automatic/acr5m30
	name = "ACR-5m30"
	desc = "A military bullpup rifle, outdated by modern standarts. It is still robust enough to deal with assigned combat tasks."
	icon_state = "acr5"
	item_state = "acr5"
	icon = 'modular_bluemoon/icons/obj/guns/projectile.dmi'
	lefthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_bluemoon/icons/mob/inhands/weapons/guns_righthand.dmi'
	mag_type = /obj/item/ammo_box/magazine/acr5m30
	pin = /obj/item/firing_pin/implant/mindshield
	can_suppress = FALSE
	slot_flags = ITEM_SLOT_BACK
	weapon_weight = WEAPON_HEAVY
	w_class = WEIGHT_CLASS_BULKY
	burst_size = 2
	burst_shot_delay = 1
	fire_delay = 2
	fire_sound = "modular_bluemoon/sound/weapons/acr_fire.ogg"

/obj/item/gun/ballistic/automatic/acr5m30/update_icon_state()
	..()
	icon_state = "acr5[magazine ? "-[CEILING(((get_ammo(FALSE) / magazine.max_ammo) * 30) /5, 1)*5]" : ""]"
	item_state = "acr5[magazine ? "" : "e"]"

////////////////////////////////////////////////////////////////////
