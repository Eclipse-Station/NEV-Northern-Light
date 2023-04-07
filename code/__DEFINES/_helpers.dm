// Stuff that is relatively "core" and is used in other defines/helpers
#define isdatum(thing) (istype(thing, /datum))

/// Takes a datum as input, returns its ref string, or a cached version of it
/// This allows us to cache \ref creation, which ensures it'll only ever happen once per datum, saving string tree time
/// It is slightly less optimal then a []'d datum, but the cost is massively outweighed by the potential savings
/// It will only work for datums mind, for datum reasons
/// : because of the embedded typecheck
#define text_ref(datum) (isdatum(datum) ? (datum:cached_ref ||= "\ref[datum]") : ("\ref[datum]"))
//Eclipse Edit: Port of /tg/'s JSON file system for our persistence use