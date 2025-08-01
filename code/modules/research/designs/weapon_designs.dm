///////////////////////////////
///////Weapons & Ammo//////////
///////////////////////////////

//////////////
//Ammo Boxes//
//////////////

/datum/design/c38/sec
	id = "sec_38"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38/sec/lethal
	name = "Speed Loader (.38)"
	id = "sec_38lethal"
	build_path = /obj/item/ammo_box/c38/lethal
	min_security_level = SEC_LEVEL_AMBER

/datum/design/c38_trac
	name = "Speed Loader (.38 TRAC)"
	desc = "Designed to quickly reload revolvers. TRAC bullets embed a tracking implant within the target's body."
	id = "c38_trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/silver = 5000, /datum/material/gold = 1000)
	build_path = /obj/item/ammo_box/c38/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/c38_hotshot
	name = "Speed Loader (.38 Hot Shot)"
	desc = "Designed to quickly reload revolvers. Hot Shot bullets contain an incendiary payload."
	id = "c38_hotshot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/datum/design/c38_iceblox
	name = "Speed Loader (.38 Iceblox)"
	desc = "Designed to quickly reload revolvers. Iceblox bullets contain a cryogenic payload."
	id = "c38_iceblox"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/iceblox
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

//////////////////
//Mag-Rifle Mags//
//////////////////

/datum/design/mag_magrifle
	name = "Magrifle Magazine (Lethal)"
	desc = "A 24-round magazine for the Magrifle."
	id = "mag_magrifle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 8000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/magazine/mmag/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER

/datum/design/mag_magrifle/nl
	name = "Magrifle Magazine (Non-Lethal)"
	desc = "A 24- round non-lethal magazine for the Magrifle."
	id = "mag_magrifle_nl"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 500, /datum/material/titanium = 500)
	build_path = /obj/item/ammo_box/magazine/mmag
	min_security_level = SEC_LEVEL_BLUE

/datum/design/mag_magpistol
	name = "Magpistol Magazine"
	desc = "A 14 round magazine for the Magpistol."
	id = "mag_magpistol"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/silver = 500)
	build_path = /obj/item/ammo_box/magazine/mmag/small/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER

/datum/design/mag_magpistol/nl
	name = "Magpistol Magazine (Non-Lethal)"
	desc = "A 14 round non-lethal magazine for the Magpistol."
	id = "mag_magpistol_nl"
	materials = list(/datum/material/iron = 3000, /datum/material/silver = 250, /datum/material/titanium = 250)
	build_path = /obj/item/ammo_box/magazine/mmag/small
	min_security_level = SEC_LEVEL_BLUE

//////////////
//WT550 Mags//
//////////////

/datum/design/mag_oldsmg
	name = "WT-550 Semi-Auto SMG Magazine (4.6x30mm)"
	desc = "A 32 round magazine for the out of date security WT-550 Semi-Auto SMG."
	id = "mag_oldsmg"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/item/ammo_box/magazine/wt550m9
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER

/datum/design/mag_oldsmg/ap_mag
	name = "WT-550 Semi-Auto SMG Armour Piercing Magazine (4.6x30mm AP)"
	desc = "A 32 round armour piercing magazine for the out of date security WT-550 Semi-Auto SMG."
	id = "mag_oldsmg_ap"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 600)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtap
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/datum/design/mag_oldsmg/ic_mag
	name = "WT-550 Semi-Auto SMG Incendiary Magazine (4.6x30mm IC)"
	desc = "A 32 round armour piercing magazine for the out of date security WT-550 Semi-Auto SMG."
	id = "mag_oldsmg_ic"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 600, /datum/material/glass = 1000)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtic
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/datum/design/mag_oldsmg/tx_mag
	name = "WT-550 Semi-Auto SMG Uranium Magazine (4.6x30mm TX)"
	desc = "A 32 round uranium tipped magazine for the out of date security WT-550 Semi-Auto SMG."
	id = "mag_oldsmg_tx"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 600, /datum/material/uranium = 2000)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wttx
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/datum/design/mag_oldsmg/rubber_mag
	name = "WT-550 Semi-Auto SMG rubberbullets Magazine (4.6x30mm rubber)"
	desc = "A 32 round rubber shots magazine for the out of date security WT-550 Semi-Auto SMG"
	id = "mag_oldsmg_rubber"
	materials = list(/datum/material/iron = 6000)
	build_path = /obj/item/ammo_box/magazine/wt550m9/wtrubber
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

//////////////
//Ammo Shells/
//////////////

/datum/design/shell_clip
	name = "stripper clip (shotgun shells)"
	id = "sec_shellclip"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000)
	build_path = /obj/item/ammo_box/shotgun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/beanbag_slug/sec
	id = "sec_beanbag"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_GREEN //SEC_LEVEL_BLUE - Этот снаряд напечатать в не взломанном автолате можно

/datum/design/rubbershot/sec
	id = "sec_rshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_GREEN //SEC_LEVEL_AMBER - Вы реально на приколе резину в ембер сувать ?

/datum/design/shotgun_slug/sec
	id = "sec_slug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED -Этот снаряд напечатать в взломанном автолате можно и не ждать кода, как и другие патроны :/

/datum/design/buckshot_shell/sec
	id = "sec_bshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE //SEC_LEVEL_AMBER - Взломанный Автолат не требует кода чтобы печатать дробь.

/datum/design/shotgun_dart/sec
	id = "sec_dart"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE //SEC_LEVEL_RED - ( ͡° ͜ʖ ͡°)

/datum/design/incendiary_slug/sec
	id = "sec_islug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/ammo_casing/shotgun/stunslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY //| DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_GREEN //SEC_LEVEL_BLUE

/datum/design/techshell
	name = "Unloaded Technological Shotshell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshotshell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 200)
	build_path = /obj/item/ammo_casing/shotgun/techshell
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_AMBER

/datum/design/cryostatis_shotgun_dart
	name = "Cryostasis Shotgun Dart"
	desc = "A shotgun dart designed with similar internals to that of a cryostatis beaker, allowing reagents to not react when inside."
	id = "shotgundartcryostatis"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3500)
	build_path = /obj/item/ammo_casing/shotgun/dart/noreact
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

//////////////
//Firing Pins/
//////////////

/datum/design/pin_testing
	name = "Test-Range Firing Pin"
	desc = "This safety firing pin allows firearms to be operated within proximity to a firing range."
	id = "pin_testing"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_GREEN

/datum/design/pin_mindshield
	name = "Mindshield Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are mindshield-implanted."
	id = "pin_loyalty"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/pin_explorer
	name = "Outback Firing Pin"
	desc = "This firing pin only shoots while ya ain't on station, fair dinkum!"
	id = "pin_explorer"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 1000, /datum/material/gold = 1000, /datum/material/iron = 500)
	build_path = /obj/item/firing_pin/explorer
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_GREEN //SEC_LEVEL_BLUE - Зачем ставить лок на пин что не работает на станции ?

//////////////
//Guns////////
//////////////

/datum/design/lasercarbine
	name = "Laser Carbine"
	desc = "Beefed up version of a standard laser gun."
	id = "lasercarbine"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 10000, /datum/material/gold = 2500, /datum/material/silver = 2500)
	build_path = /obj/item/storage/lockbox/weapon
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon
	name = "Lockbox with Laser Carbine"
	req_access = list(ACCESS_ARMORY)

/obj/item/storage/lockbox/weapon/PopulateContents()
	new /obj/item/gun/energy/laser/carbine/nopin(src)

/datum/design/stunrevolver
	name = "Tesla Revolver"
	desc = "A high-tech revolver that fires internal, reusable shock cartridges in a revolving cylinder. The cartridges can be recharged using conventional rechargers."
	id = "stunrevolver"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 10000, /datum/material/silver = 10000)
	build_path = /obj/item/storage/lockbox/weapon/tesla_revolver
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/tesla_revolver
	name = "Lockbox with Tesla Revolver"

/obj/item/storage/lockbox/weapon/tesla_revolver/PopulateContents()
	new /obj/item/gun/energy/tesla_revolver(src)

/datum/design/nuclear_gun
	name = "Advanced Energy Gun"
	desc = "An energy gun with an experimental miniaturized reactor."
	id = "nuclear_gun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/uranium = 3000, /datum/material/titanium = 1000)
	build_path = /obj/item/storage/lockbox/weapon/nuclear_gun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/nuclear_gun
	name = "Lockbox with Advanced Energy Gun"

/obj/item/storage/lockbox/weapon/nuclear_gun/PopulateContents()
	new /obj/item/gun/energy/e_gun/nuclear(src)

/datum/design/beamrifle
	name = "Beam Marksman Rifle"
	desc = "A powerful long ranged anti-material rifle that fires charged particle beams to obliterate targets."
	id = "beamrifle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 5000, /datum/material/diamond = 5000, /datum/material/uranium = 8000, /datum/material/silver = 4500, /datum/material/gold = 5000)
	build_path = /obj/item/storage/lockbox/weapon/beamrifle
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/beamrifle
	name = "Lockbox with Beam Marksman Rifle"

/obj/item/storage/lockbox/weapon/beamrifle/PopulateContents()
	new /obj/item/gun/energy/beam_rifle(src)

/datum/design/decloner
	name = "Decloner"
	desc = "Your opponent will bubble into a messy pile of goop."
	id = "decloner"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 5000,/datum/material/uranium = 10000)
	reagents_list = list(/datum/reagent/toxin/mutagen = 40)
	build_path = /obj/item/storage/lockbox/weapon/decloner
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/decloner
	name = "Lockbox with Decloner"

/obj/item/storage/lockbox/weapon/decloner/PopulateContents()
	new /obj/item/gun/energy/decloner(src)

/datum/design/rapidsyringe
	name = "Rapid Syringe Gun"
	desc = "A gun that fires many syringes."
	id = "rapidsyringe"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path = /obj/item/storage/lockbox/weapon/rapidsyringe
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/rapidsyringe
	name = "Lockbox with Rapid Syringe Gun"

/obj/item/storage/lockbox/weapon/rapidsyringe/PopulateContents()
	new /obj/item/gun/syringe/rapidsyringe(src)

/datum/design/temp_gun
	name = "Temperature Gun"
	desc = "A gun that shoots temperature beam like projectiles to change temperature."
	id = "temp_gun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 500, /datum/material/silver = 3000)
	build_path = /obj/item/storage/lockbox/weapon/temp_gun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/temp_gun
	name = "Lockbox with Temperature Gun"

/obj/item/storage/lockbox/weapon/temp_gun/PopulateContents()
	new /obj/item/gun/energy/temperature(src)

/datum/design/xray
	name = "X-ray Laser Gun"
	desc = "Not quite as menacing as it sounds"
	id = "xray_laser"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 5000, /datum/material/uranium = 4000, /datum/material/iron = 5000, /datum/material/titanium = 2000, /datum/material/bluespace = 2000)
	build_path = /obj/item/storage/lockbox/weapon/xray
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/xray
	name = "Lockbox with X-ray Laser Gun"

/obj/item/storage/lockbox/weapon/xray/PopulateContents()
	new /obj/item/gun/energy/xray(src)

/datum/design/ioncarbine
	name = "Ion Carbine"
	desc = "How to dismantle a cyborg : The gun."
	id = "ioncarbine"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 6000, /datum/material/iron = 8000, /datum/material/uranium = 2000)
	build_path = /obj/item/storage/lockbox/weapon/ioncarbine
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_AMBER //SEC_LEVEL_RED - Банально Ионка может понадобится при обезвреживании антагов с синди теле, киборгов, и прочего что можно ушатать ЭМИ

/obj/item/storage/lockbox/weapon/ioncarbine
	name = "Lockbox with Ion Carbine"

/obj/item/storage/lockbox/weapon/ioncarbine/PopulateContents()
	new /obj/item/gun/energy/ionrifle/carbine(src)

/datum/design/largecrossbow
	name = "Energy Crossbow"
	desc = "A reverse-engineered energy crossbow favored by syndicate infiltration teams and carp hunters."
	id = "largecrossbow"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1500, /datum/material/uranium = 1500, /datum/material/silver = 1500)
	build_path = /obj/item/storage/lockbox/weapon/largecrossbow
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/largecrossbow
	name = "Lockbox with Energy Crossbow"

/obj/item/storage/lockbox/weapon/largecrossbow/PopulateContents()
	new /obj/item/gun/energy/kinetic_accelerator/crossbow/large(src)

/datum/design/magpistol
	name = "Magpistol"
	desc = "A weapon which fires ferromagnetic slugs."
	id = "magpistol"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 7500, /datum/material/glass = 1000, /datum/material/uranium = 1000, /datum/material/titanium = 5000, /datum/material/silver = 2000)
	build_path = /obj/item/storage/lockbox/weapon/magpistol
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/obj/item/storage/lockbox/weapon/magpistol
	name = "Lockbox with Magpistol"

/obj/item/storage/lockbox/weapon/magpistol/PopulateContents()
	new /obj/item/gun/ballistic/automatic/magrifle/pistol/nopin(src)

/datum/design/magrifle
	name = "Magrifle"
	desc = "An upscaled Magpistol in rifle form."
	id = "magrifle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/uranium = 2000, /datum/material/titanium = 10000, /datum/material/silver = 4000, /datum/material/gold = 2000)
	build_path = /obj/item/storage/lockbox/weapon/magrifle
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/obj/item/storage/lockbox/weapon/magrifle
	name = "Lockbox with Magrifle"

/obj/item/storage/lockbox/weapon/magrifle/PopulateContents()
	new /obj/item/gun/ballistic/automatic/magrifle/nopin(src)

/datum/design/wormhole_projector
	name = "Bluespace Wormhole Projector"
	desc = "A projector that emits high density quantum-coupled bluespace beams."
	id = "wormholeprojector"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 2000, /datum/material/iron = 5000, /datum/material/diamond = 2000, /datum/material/bluespace = 3000)
	build_path = /obj/item/gun/energy/wormhole_projector
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/gravitygun
	name = "One-point Bluespace-gravitational Manipulator"
	desc = "A multi-mode device that blasts one-point bluespace-gravitational bolts that locally distort gravity."
	id = "gravitygun"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 8000, /datum/material/uranium = 8000, /datum/material/glass = 12000, /datum/material/iron = 12000, /datum/material/diamond = 3000, /datum/material/bluespace = 3000)
	build_path = /obj/item/gun/energy/gravity_gun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/flora_gun
	name = "Floral Somatoray"
	desc = "A tool that discharges controlled radiation which induces mutation in plant cells. Harmless to other organic life."
	id = "flora_gun"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 500, /datum/material/uranium = 2000)
	build_path = /obj/item/gun/energy/floragun
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_SCIENCE

///////////
//Grenades/
///////////

/datum/design/large_grenade
	name = "Large Grenade"
	desc = "A grenade that affects a larger area and use larger containers."
	id = "large_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_BLUE

/datum/design/pyro_grenade
	name = "Pyro Grenade"
	desc = "An advanced grenade that is able to self ignite its mixture."
	id = "pyro_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/plasma = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_BLUE

/datum/design/cryo_grenade
	name = "Cryo Grenade"
	desc = "An advanced grenade that rapidly cools its contents upon detonation."
	id = "cryo_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_BLUE

/datum/design/adv_grenade
	name = "Advanced Release Grenade"
	desc = "An advanced grenade that can be detonated several times, best used with a repeating igniter."
	id = "adv_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
	min_security_level = SEC_LEVEL_BLUE

///////////
//Shields//
///////////

/datum/design/tele_shield
	name = "Telescopic Riot Shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	id = "tele_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 4000, /datum/material/silver = 300, /datum/material/titanium = 200)
	build_path = /obj/item/shield/riot/tele
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/energy_shield
	name = "Energy Resistant Shield"
	desc = "An ablative shield designed to stop energy-based attacks dead in their tracks, but shatter easily against kinetic blows."
	id = "laser_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/plastic = 4000, /datum/material/silver = 800, /datum/material/titanium = 600, /datum/material/plasma = 5000)
	build_path = /obj/item/shield/riot/energy_proof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/kinetic_shield
	name = "Kinetic Resistant Shield"
	desc = "An advanced polymer shield designed to stop kinetic-based attacks with ease, but splinter apart against energy-based attacks."
	id = "bullet_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/silver = 2000, /datum/material/titanium = 1200, /datum/material/plastic = 2500)
	build_path = /obj/item/shield/riot/kinetic_proof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/lasercarbine/immolator
	name = "Immolator Laser"
	desc = "Millitary oriented laser gun with new systems what make laser more deadlier."
	id = "immolator"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 25000, /datum/material/glass = 25000, /datum/material/gold = 15000, /datum/material/silver = 14500, /datum/material/diamond = 15000, /datum/material/titanium = 16000)
	build_path = /obj/item/storage/lockbox/weapon/immolator
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_RED

/obj/item/storage/lockbox/weapon/immolator
	name = "Lockbox with Immolator Laser"
	req_access = list(ACCESS_ARMORY)

/obj/item/storage/lockbox/weapon/immolator/PopulateContents()
	new /obj/item/gun/energy/laser/hellgun/immolator/nopin(src)

//////////
//MISC////
//////////

/datum/design/suppressor
	name = "Suppressor"
	desc = "A reverse-engineered suppressor that fits on most small arms with threaded barrels."
	id = "suppressor"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE

/datum/design/cleric_mace
	name = "Cleric Mace"
	desc = "A mace fit for a cleric. Useful for bypassing plate armor, but too bulky for much else."
	id = "cleric_mace"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 12000)
	build_path = /obj/item/melee/cleric_mace
	category = list("Imported")

/datum/design/stun_boomerang
	name = "OZtek Boomerang"
	desc = "Uses reverse flow gravitodynamics to flip its personal gravity back to the thrower mid-flight. Also functions similar to a stun baton."
	id = "stun_boomerang"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 4000, /datum/material/silver = 10000, /datum/material/gold = 2000)
	build_path = /obj/item/melee/baton/boomerang
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
	min_security_level = SEC_LEVEL_BLUE
