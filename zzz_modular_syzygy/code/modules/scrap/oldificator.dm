/obj/item/weapon/computer_hardware/hard_drive/portable/design/make_old()
	.=..()
	if(license > 0 && prob(90))
		license = rand(3, (license - 3))
