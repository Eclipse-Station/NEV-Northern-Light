#define Clamp(x, y, z) 	(x <= y ? y : (x >= z ? z : x))

#define CLAMP01(x) 		(Clamp(x, 0, 1))

#define span(class, text) ("<span class='[class]'>[text]</span>")

#define isTaurTail(A)	istype(A, /datum/sprite_accessory/tail/taur)


#define LAZYLEN(L) length(L)