// 5.8x40mm boxes

/obj/item/ammo_box/a58mm
	name = "ammo box (5.8x40mm)"
	desc = "A box full of standart 5.8mm ammo."
	icon = 'modular_bluemoon/icons/obj/ammo.dmi'
	icon_state = "5.8x40mmbox"
	ammo_type = /obj/item/ammo_casing/a58mm
	max_ammo = 30

/obj/item/ammo_box/a58mm/update_icon_state()
	..()
	if(stored_ammo.len < 30)
		icon_state = "[initial(icon_state)]-used"
	if(stored_ammo.len == 0)
		icon_state = "[initial(icon_state)]-empty"

/obj/item/ammo_box/a58mm/ap
	name = "ammo box (Armor Piercing 5.8x40mm)"
	desc = "A box full of armor piercing 5.8mm ammo."
	icon_state = "5.8x40mmbox_ap"
	ammo_type = /obj/item/ammo_casing/a58mm/ap

/obj/item/ammo_box/a58mm/hs
	name = "ammo box (HOTSHOT 5.8x40mm)"
	desc = "A box full of incendiary 5.8mm ammo."
	icon_state = "5.8x40mmbox_hs"
	ammo_type = /obj/item/ammo_casing/a58mm/hotshot

/obj/item/ammo_box/a58mm/hp
	name = "ammo box (Hollow Point 5.8x40mm)"
	desc = "A box full of expansive hollow-pointed 5.8mm ammo."
	icon_state = "5.8x40mmbox_hp"
	ammo_type = /obj/item/ammo_casing/a58mm/hollowpoint

////////////////////////////////////////////////////////////////////
