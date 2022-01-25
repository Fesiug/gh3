
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "SMG"
SWEP.Name_The			= "the smg"
SWEP.Name_A				= "an smg"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/smg.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_smg_tmp.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_PISTOL, ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1 }

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.SMG.Posing1" },
		{ seq = "posing2", snd_p = "GH3.SMG.Posing2" }
	},
	["fire"]			= { seq = "fire1", tpanim = tpa[2] },
	["melee"]			= { seq = "melee1", snd_p = "GH3.SMG.Melee1", delay_m = (18/30), delay_ms = (3/30) },
	["reload_empty"]	= { seq = "reload_empty", snd_p = "GH3.SMG.Reload", delay_rl = (34/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "reload_full", snd_p = "GH3.SMG.Reload", delay_rl = (34/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.SMG.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (10/30) },
}
SWEP.Animations_E = {
	["idle"]			= { seq = "e idle" },
	["posing"]			= { seq = "e posing1", snd_p = "GH3.SMG.Posing1" },
	["fire"]			= { seq = "e fire1", tpanim = tpa[2] },
	["melee"]			= { seq = "e melee1", snd_p = "GH3.SMG.Melee1", delay_m = (18/30), delay_ms = (3/30) },
	["reload_empty"]	= { seq = "e reload_empty", snd_p = "GH3.SMG.Reload", delay_rl = (34/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "e reload_full", snd_p = "GH3.SMG.Reload", delay_rl = (34/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "e put_away" },
	["ready"]			= { seq = "e ready", snd_p = "GH3.SMG.Ready" },
	["throw_equipment"]	= { seq = "e throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "e throw_grenade", delay_tg = (10/30) },
}
SWEP.Sound = {
	Firing = "",

	FiringIn = "GH3.SMG.FireIn",
	FiringIn_T = (6144/44100),
	FiringLoop = "GH3.SMG.FireLoop",
	FiringLoop_T = (39936/44100),
	FiringOut = "GH3.SMG.FireOut",

	FiringFar = "GH3.AR.FireFar",
	Dryfire = "GH3.BR.Dryfire",
	Ammo = "GH3.BR.Ammo",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 180,
		["Rounds Total Maximum"] = 240,
		["Rounds Loaded Maximum"] = 60,
		["Rounds Inventory Maximum"] = 180,
		["Rounds Reloaded"] = 60,
	},
	["Firing"] = {
		["Rounds Per Second"] = FRange( 15, 15 ),
		["Shots Per Fire"] = FRange( 0, 0 ),
		["Fire Recovery Time"] = 0,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 5, 5 ),
		["Air Damage Range"] = FRange( 0, 0 ),
		["Spread"] = 0,
		["Can Headshot"] = false,
	},
	["Error"] = {
		["Acceleration Time"] = 3*(1/3),
		["Deceleration Time"] = 0.25*4,
		["Minimum Error"] = 0.25,
		["Error Angle"] = FRange( 1.25, 2.75 ),
	},
	["Recoil"] = {
		["Change Per Shot"] = FRange( 0, 0.4 ),
		["Acceleration Time"] = 1.1*0.9090909,
		["Deceleration Time"] = 0.3*3.333333,
		["Function"] = "Very Late", -- Linear, Early, Very Early, Late, Very Late, Cosine, Zero, One
	},
	["Appearance"] = {
		["Holdtype"] = "smg",
	},
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/units.halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/smg.png", "smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		}
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/smg.png", "mips smooth")
end