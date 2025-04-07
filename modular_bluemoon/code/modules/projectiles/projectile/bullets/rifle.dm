// 5.8mm (ACR-5m30 Rifle)

/obj/item/projectile/bullet/a58
	name = "5.8mm bullet"
	damage = 22
	armour_penetration = 5
	wound_bonus = -2
	bare_wound_bonus = 3

/obj/item/projectile/bullet/a58/ap
	name = "5.8mm armor-piercing bullet"
	damage = 18
	armour_penetration = 50
	wound_bonus = -5 // Идут навылет
	embedding = null

/obj/item/projectile/bullet/incendiary/a58
	name = "5.8mm incendiary bullet"
	damage = 19
	armour_penetration = 0
	fire_stacks = 2

/obj/item/projectile/bullet/a58/hp
	name = "5.8mm hollow-point bullet"
	damage = 55
	armour_penetration = -40
	wound_bonus = 8
	embedding = list(embed_chance = 60, fall_chance = 4, jostle_chance = 3, pain_stam_pct = 0.6)

/obj/item/projectile/bullet/a58/he
	name = "5.8mm high-explosive bullet"
	damage = 25
	armour_penetration = 10
	wound_bonus = 15
	embedding = list(embed_chance = 60, fall_chance = 4, jostle_chance = 3, pain_stam_pct = 0.6)
	knockdown = 5

////////////////////////////////////////////////////////////////////
