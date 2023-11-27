// Species flags.
#define NO_BLOOD          0x1    // Vessel var is not filled with blood, cannot bleed out.
#define NO_BREATHE        0x2    // Cannot suffocate or take oxygen loss.
#define NO_SCAN           0x4    // Cannot be scanned in a DNA machine/genome-stolen.
#define NO_PAIN           0x8    // Cannot suffer halloss/recieves deceptive health indicator.
#define NO_SLIP           0x10   // Cannot fall over.
#define NO_POISON         0x20   // Cannot not suffer toxloss.
#define IS_PLANT          0x40   // Is a treeperson.
#define NO_MINOR_CUT      0x80   // Can step on broken glass with no ill-effects. Either thick skin, cut resistant (slimes) or incorporeal (shadows)
// unused: 0x8000 - higher than this will overflow

// Languages.
#define LANGUAGE_COMMON "Galactic Common"
#define LANGUAGE_CYRILLIC "Techno-Russian"
#define LANGUAGE_SERBIAN "Serbian"
#define LANGUAGE_JIVE	"Jive"
#define LANGUAGE_GERMAN "German"
#define LANGUAGE_NEOHONGO "Neohongo"
#define LANGUAGE_LATIN "Latin"


#define LANGUAGE_ROBOT "Robot Talk"
#define LANGUAGE_DRONE "Drone Talk"
#define LANGUAGE_MONKEY "Chimpanzee"

#define LANGUAGE_HIVEMIND "Hivemind"
#define LANGUAGE_CORTICAL "Cortical Link"
#define LANGUAGE_CULT "Cult"
#define LANGUAGE_OCCULT "Occult"
#define LANGUAGE_BLITZ "Blitzshell Communique"

// Language flags.
#define WHITELISTED  1   // Language is available if the speaker is whitelisted.
#define RESTRICTED   2   // Language can only be acquired by spawning or an admin.
#define NONVERBAL    4   // Language has a significant non-verbal component. Speech is garbled without line-of-sight.
#define SIGNLANG     8   // Language is completely non-verbal. Speech is displayed through emotes for those who can understand.
#define HIVEMIND     16  // Broadcast to all mobs with this language.
#define NONGLOBAL    32  // Do not add to general languages list.
#define INNATE       64  // All mobs can be assumed to speak and understand this language. (audible emotes)
#define NO_TALK_MSG  128 // Do not show the "\The [speaker] talks into \the [radio]" message
#define NO_STUTTER   256 // No stuttering, slurring, or other speech problems

// Languages.
#define LANGUAGE_GALCOM "Galactic Common"
#define LANGUAGE_EAL "Encoded Audio Language"
#define LANGUAGE_SOL_COMMON "Sol Common"
#define LANGUAGE_UNATHI "Sinta'unathi"
#define LANGUAGE_SIIK "Siik"
#define LANGUAGE_SKRELLIAN "Common Skrellian"
#define LANGUAGE_TRADEBAND "Tradeband"
#define LANGUAGE_GUTTER "Gutter"
#define LANGUAGE_SIGN "Sign Language"
#define LANGUAGE_SCHECHI "Schechi"
#define LANGUAGE_ROOTLOCAL "Local Rootspeak"
#define LANGUAGE_ROOTGLOBAL "Global Rootspeak"
#define LANGUAGE_YUELDISCH "Yueldisch"
#define LANGUAGE_VOX "Vox-Pidgin"
#define LANGUAGE_TERMINUS "Terminus"
#define LANGUAGE_SKRELLIANFAR "High Skrellian"
#define LANGUAGE_MINBUS "Minbus"
#define LANGUAGE_EVENT1 "Occursus"
#define LANGUAGE_LANIUS "Scraptalk"
#define LANGUAGE_AKHANI "Akhani"
#define LANGUAGE_ALAI "Alai"
#define LANGUAGE_BIRDSONG "Birdsong"
#define LANGUAGE_SAGARU "Sagaru"

// Species flags.
#define SPECIES_FLAG_NO_MINOR_CUT               0x0001  // Can step on broken glass with no ill-effects. Either thick skin (diona/vox), cut resistant (slimes) or incorporeal (shadows)
#define SPECIES_FLAG_IS_PLANT                   0x0002  // Is a treeperson.
#define SPECIES_FLAG_NO_SCAN                    0x0004  // Cannot be scanned in a DNA machine/genome-stolen.
#define SPECIES_FLAG_NO_PAIN                    0x0008  // Cannot suffer halloss/recieves deceptive health indicator.
#define SPECIES_FLAG_NO_SLIP                    0x0010  // Cannot fall over.
#define SPECIES_FLAG_NO_POISON                  0x0020  // Cannot not suffer toxloss.
#define SPECIES_FLAG_NO_EMBED                   0x0040  // Can step on broken glass with no ill-effects and cannot have shrapnel embedded in it.
#define SPECIES_FLAG_NO_TANGLE                  0x0080  // This species wont get tangled up in weeds
#define SPECIES_FLAG_NO_BLOCK                   0x0100  // Unable to block or defend itself from attackers.
#define SPECIES_FLAG_NEED_DIRECT_ABSORB         0x0200  // This species can only have their DNA taken by direct absorption.

// unused: 0x8000 - higher than this will overflow

// Species spawn flags
#define SPECIES_IS_WHITELISTED               0x1    // Must be whitelisted to play.
#define SPECIES_IS_RESTRICTED                0x4    // Is not a core/normally playable species. (castes, mutantraces)
#define SPECIES_CAN_JOIN                     0x2    // Species is selectable in chargen.
#define SPECIES_NO_FBP_CONSTRUCTION          0x8    // FBP of this species can't be made in-game.
#define SPECIES_NO_FBP_CHARGEN               0x10   // FBP of this species can't be selected at chargen.
#define SPECIES_NO_ROBOTIC_INTERNAL_ORGANS   0x20   // Species cannot start with robotic organs or have them attached.

// Species appearance flags
#define HAS_SKIN_TONE_NORMAL                                                      0x1    // Skin tone selectable in chargen for baseline humans (0-220)
#define HAS_SKIN_TONE		                                                      0x1    // Skin tone selectable in chargen for baseline humans (0-220)
#define HAS_SKIN_COLOR                                                            0x2    // Skin colour selectable in chargen. (RGB)
#define HAS_LIPS                                                                  0x4    // Lips are drawn onto the mob icon. (lipstick)
#define HAS_UNDERWEAR                                                             0x8    // Underwear is drawn onto the mob icon.
#define HAS_EYE_COLOR                                                             0x10   // Eye colour selectable in chargen. (RGB)
#define HAS_HAIR_COLOR                                                            0x20   // Hair colour selectable in chargen. (RGB)
#define RADIATION_GLOWS                                                           0x40   // Radiation causes this character to glow.
#define HAS_SKIN_TONE_GRAV                                                        0x80   // Skin tone selectable in chargen for grav-adapted humans (0-100)
#define HAS_SKIN_TONE_SPCR                                                        0x100  // Skin tone selectable in chargen for spacer humans (0-165)
#define HAS_SKIN_TONE_TRITON                                                      0x200
#define HAS_BASE_SKIN_COLOURS                                                     0x400  // Has multiple base skin sprites to go off of
#define HAS_A_SKIN_TONE (HAS_SKIN_TONE_NORMAL | HAS_SKIN_TONE_GRAV | HAS_SKIN_TONE_SPCR | HAS_SKIN_TONE_TRITON) // Species has a numeric skintone



// Skin Defines
#define SKIN_NORMAL 0
#define SKIN_THREAT 1

// Darkvision Levels these are inverted from normal so pure white is the darkest
// possible and pure black is none
#define DARKTINT_NONE      "#ffffff"
#define DARKTINT_MODERATE  "#f9f9f5"
#define DARKTINT_GOOD      "#ebebe6"
