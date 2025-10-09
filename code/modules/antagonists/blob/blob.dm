#define OVERMIND_STARTING_AUTO_PLACE_TIME (6 MINUTES) // After this time, randomly place the core somewhere viable

/datum/antagonist/blob
	name = "Blob"
	roundend_category = "blobs"
	antagpanel_category = "Blob"
	show_to_ghosts = TRUE
	job_rank = ROLE_BLOB
	threat = 50
	var/datum/action/innate/blobpop/pop_action
	var/starting_points_human_blob = 60
	var/point_rate_human_blob = 2
	var/datum/team/blob_infection/blob_team

/datum/antagonist/blob/threat()
	. = ..()
	if(isovermind(owner.current))
		var/mob/camera/blob/overmind = owner.current
		. *= (overmind.blobs_legit.len / overmind.max_count)

/datum/antagonist/blob/roundend_report()
	var/basic_report = ..()
	//Display max blobpoints for blebs that lost
	if(isovermind(owner.current)) //embarrasing if not
		var/mob/camera/blob/overmind = owner.current
		if(!overmind.victory_in_progress) //if it won this doesn't really matter
			var/point_report = "<br><b>[owner.name]</b> took over [overmind.max_count] tiles at the height of its growth."
			return basic_report+point_report
	return basic_report

/datum/antagonist/blob/greet()
	if(!isovermind(owner.current))
		to_chat(owner,"<span class='userdanger'>You feel bloated.</span>")

/datum/antagonist/blob/on_gain()
	create_objectives()
	. = ..()

/datum/antagonist/blob/proc/create_objectives()
	var/datum/objective/blob_takeover/main = new
	main.owner = owner
	objectives += main

/datum/antagonist/blob/apply_innate_effects(mob/living/mob_override)
	if(!isovermind(owner.current))
		if(!pop_action)
			pop_action = new
		pop_action.Grant(owner.current)

/datum/objective/blob_takeover
	explanation_text = "Reach critical mass!"

//Non-overminds get this on blob antag assignment
/datum/action/innate/blobpop
	name = "Pop"
	desc = "Unleash the blob"
	icon_icon = 'icons/mob/blob.dmi'
	button_icon_state = "blob"
	/// The time taken before this ability is automatically activated.
	var/autoplace_time = OVERMIND_STARTING_AUTO_PLACE_TIME

/datum/action/innate/blobpop/Grant(Target)
	. = ..()
	if(owner)
		addtimer(CALLBACK(src, PROC_REF(Activate), TRUE), autoplace_time, TIMER_UNIQUE|TIMER_OVERRIDE)
		to_chat(owner, span_boldannounce("You will automatically pop and place your blob core in [DisplayTimeText(autoplace_time)]."))

/datum/action/innate/blobpop/Activate()
	var/mob/old_body = owner
	var/datum/antagonist/blob/blobtag = owner.mind.has_antag_datum(/datum/antagonist/blob)
	if(!blobtag)
		Remove()
		return
	var/mob/camera/blob/B = new /mob/camera/blob(get_turf(old_body), blobtag.starting_points_human_blob)
	owner.mind.transfer_to(B)
	old_body.gib()
	B.place_blob_core(blobtag.point_rate_human_blob, pop_override = TRUE)

/datum/antagonist/blob/antag_listing_status()
	. = ..()
	if(owner && owner.current)
		var/mob/camera/blob/B = owner.current
		if(istype(B))
			. += "(Progress: [B.blobs_legit.len]/[B.blobwincount])"

/datum/antagonist/blob/create_team(/datum/antagonist/blob/new_team)
	if(!new_team)
		for(var/datum/antagonist/blob/B in GLOB.antagonists)
			if(!B.owner || !B.blob_team)
				continue
			blob_team = B.blob_team
			return
		blob_team = new
	else
		if(!istype(new_team))
			CRASH("Wrong blob team type provided to create_team")
		blob_team = new_team

/datum/antagonist/blob/get_team()
	return blob_team

///////////////////////////////////////////////////

/datum/antagonist/blobbernaut
	name = "Blobbernaut"
	roundend_category = "blobs"
	antagpanel_category = "Blob"
	show_to_ghosts = TRUE
	job_rank = ROLE_BLOB
	objectives = list("Помочь сверхразуму блоба разрастись до критической массы.")
	var/datum/team/blob_infection/blobbernaut_team

/datum/antagonist/blobbernaut/proc/addMemories()
	antag_memory += "Я - блоббернаут. <font color='red'><B>Я выращен сверхразумом блоба. Я обязан защищать его и подчиняться его приказам</B></font>!<br>"

/datum/antagonist/blobbernaut/on_gain()
	. = ..()
	addMemories()

/datum/antagonist/blobbernaut/create_team(datum/team/terror_spiders/new_team)
	if(!new_team)
		for(var/datum/antagonist/blobbernaut/blobber in GLOB.antagonists)
			if(!blobber.owner || !blobber.blobbernaut_team)
				continue
			blobbernaut_team = blobber.blobbernaut_team
			return
		blobbernaut_team = new
	else
		if(!istype(new_team))
			CRASH("Wrong blobbernaut team type provided to create_team")
		blobbernaut_team = new_team

///////////////////////////////////////////////////

/datum/team/blob_infection
	name = "Blob Infection"

/datum/team/blob_infection/roundend_report()
	var/list/parts = list()
	parts += "<span class='header'>The [name] were:</span>"
	parts += printplayerlist(members)
	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"
