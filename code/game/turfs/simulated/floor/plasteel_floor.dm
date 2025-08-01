/turf/open/floor/plasteel
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/plasteel
	broken_states = list("damaged1", "damaged2", "damaged3", "damaged4", "damaged5")
	burnt_states = list("floorscorched1", "floorscorched2")

/turf/open/floor/plasteel/examine(mob/user)
	. = ..()
	. += "<span class='notice'>There's a <b>small crack</b> on the edge of it.</span>"
// BLUEMOON ADD ROTATION
	. += "<span class='notice'>There's a <b>bolt</b> helping in rotary system.</span>"

/turf/open/floor/plasteel/wrench_act(mob/living/user, obj/item/I)
	I.play_tool_sound(src, 20)
	return setDir(turn(dir, -90))
// BLUEMOON ADD END

/turf/open/floor/plasteel/rust_heretic_act()
	if(prob(70))
		new /obj/effect/temp_visual/glowing_rune(src)
	ChangeTurf(/turf/open/floor/plating/rust)

/turf/open/floor/plasteel/update_icon_state()			//sandstorm change - tile floofing
	if(broken || burnt)									//included - tile floofing
		return											//included - tile floofing
	icon_state = base_icon_state						//included - tile floofing

/turf/open/floor/plasteel/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/telecomms
	initial_gas_mix = TCOMMS_ATMOS

/turf/open/floor/plasteel/dark
	icon_state = "darkfull"

/turf/open/floor/plasteel/dark/airless
	initial_gas_mix = AIRLESS_ATMOS

/turf/open/floor/plasteel/dark/lavaland
	initial_gas_mix = LAVALAND_DEFAULT_ATMOS

/turf/open/floor/plasteel/dark/telecomms
	initial_gas_mix = TCOMMS_ATMOS
/turf/open/floor/plasteel/airless/dark
	icon_state = "darkfull"
/turf/open/floor/plasteel/dark/side
	icon_state = "dark"
/turf/open/floor/plasteel/dark/corner
	icon_state = "darkcorner"
/turf/open/floor/plasteel/checker
	icon_state = "checker"


/turf/open/floor/plasteel/white
	icon_state = "white"
/turf/open/floor/plasteel/white/side
	icon_state = "whitehall"
/turf/open/floor/plasteel/white/corner
	icon_state = "whitecorner"
/turf/open/floor/plasteel/airless/white
	icon_state = "white"
/turf/open/floor/plasteel/airless/white/side
	icon_state = "whitehall"
/turf/open/floor/plasteel/airless/white/corner
	icon_state = "whitecorner"
/turf/open/floor/plasteel/white/telecomms
	initial_gas_mix = TCOMMS_ATMOS


/turf/open/floor/plasteel/yellowsiding
	icon_state = "yellowsiding"
/turf/open/floor/plasteel/yellowsiding/corner
	icon_state = "yellowcornersiding"

/turf/open/floor/plasteel/showroomfloor
	icon_state = "showroomfloor"


/turf/open/floor/plasteel/solarpanel
	icon_state = "solarpanel"
/turf/open/floor/plasteel/airless/solarpanel
	icon_state = "solarpanel"

/turf/open/floor/plasteel/freezer
	icon_state = "freezerfloor"

/turf/open/floor/plasteel/grimy
	icon_state = "grimy"
	tiled_dirt = FALSE

/turf/open/floor/plasteel/cafeteria
	icon_state = "cafeteria"

/turf/open/floor/plasteel/airless/cafeteria
	icon_state = "cafeteria"


/turf/open/floor/plasteel/cult
	icon_state = "cult"
	name = "engraved floor"

/turf/open/floor/plasteel/vaporwave
	icon_state = "pinkblack"

/* BLUEMOON DELETE переход на декали
/turf/open/floor/plasteel/goonplaque
	icon_state = "plaque"
	name = "commemorative plaque"
	desc = "\"This is a plaque in honour of our comrades on the G4407 Stations. Hopefully TG4407 model can live up to your fame and fortune.\" Scratched in beneath that is a crude image of a meteor and a spaceman. The spaceman is laughing. The meteor is exploding."
	tiled_dirt = FALSE
*/

/turf/open/floor/plasteel/cult/narsie_act()
	return

/turf/open/floor/plasteel/stairs
	icon_state = "stairs"
	tiled_dirt = FALSE
/turf/open/floor/plasteel/stairs/left
	icon_state = "stairs-l"
/turf/open/floor/plasteel/stairs/medium
	icon_state = "stairs-m"
/turf/open/floor/plasteel/stairs/right
	icon_state = "stairs-r"
/turf/open/floor/plasteel/stairs/old
	icon_state = "stairs-old"


/turf/open/floor/plasteel/rockvault
	icon_state = "rockvault"
/turf/open/floor/plasteel/rockvault/alien
	icon_state = "alienvault"
/turf/open/floor/plasteel/rockvault/sandstone
	icon_state = "sandstonevault"


/turf/open/floor/plasteel/elevatorshaft
	icon_state = "elevatorshaft"

/turf/open/floor/plasteel/bluespace
	icon_state = "bluespace"

/turf/open/floor/plasteel/sepia
	icon_state = "sepia"
