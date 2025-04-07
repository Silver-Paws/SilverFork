// ACR-5m30 magazines

/obj/item/ammo_box/magazine/acr5m30
	name = "ACR-5 magazine (5.8x40mm)"
	desc = "A standart magazine for ACR rifle."
	icon = 'modular_bluemoon/icons/obj/ammo.dmi'
	icon_state = "acr58mm"
	ammo_type = /obj/item/ammo_casing/a58mm
	caliber = "5.8x40mm"
	max_ammo = 26

/obj/item/ammo_box/magazine/acr5m30/update_icon_state()
	..()
	icon_state = "[initial(icon_state)]-[ammo_count() ? "30" : "0"]"

/obj/item/ammo_box/magazine/acr5m30/empty
	start_empty = TRUE

/obj/item/ammo_box/magazine/acr5m30/ap
	name = "ACR-5 magazine (AP 5.8x40mm)"
	desc = "A magazine for ACR rifle with armor piercing bullets."
	icon_state = "acr58mm_ap"
	ammo_type = /obj/item/ammo_casing/a58mm/ap

/obj/item/ammo_box/magazine/acr5m30/hp
	name = "ACR-5 magazine (HP 5.8x40mm)"
	desc = "A magazine for ACR rifle with expansive bullets."
	icon_state = "acr58mm_hp"
	ammo_type = /obj/item/ammo_casing/a58mm/hollowpoint

// Admin abuse ammo
/obj/item/ammo_box/magazine/acr5m30/he
	name = "ACR-5 magazine (HE 5.8x40mm)"
	desc = "A magazine for ACR rifle with explosive bullets."
	icon_state = "acr58mm_he"
	ammo_type = /obj/item/ammo_casing/a58mm/he

////////////////////////////////////////////////////////////////////
