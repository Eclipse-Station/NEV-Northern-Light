/mob/verb/eastshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_x <= 16)
		pixel_x++

/mob/verb/westshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_x >= -16)
		pixel_x--

/mob/verb/northshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_y <= 16)
		pixel_y++

/mob/verb/southshift()
	set hidden = TRUE
	if(!canface())
		return FALSE
	if(pixel_y >= -16)
		pixel_y--


