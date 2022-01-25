
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Silenced SMG"
SWEP.Name_The			= "the silenced smg"
SWEP.Name_A				= "a silenced smg"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/smg.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_smg_tmp.mdl" )
SWEP.ViewModelFOV = 54+10

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
	Firing = { "GH3.SMG_Silenced.Fire", "GH3.SMG_Silenced.Fire2" },
	Dryfire = "GH3.BR.Dryfire",
	Ammo = "GH3.BR.Ammo",
	ZoomIn = "GH3.BR.ZoomIn",
	ZoomOut = "GH3.BR.ZoomOut",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 144,
		["Rounds Total Maximum"] = 240,
		["Rounds Loaded Maximum"] = 48,
		["Rounds Inventory Maximum"] = 192,
		["Rounds Reloaded"] = 48,
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
		["Acceleration Time"] = 3,
		["Deceleration Time"] = 0.25,
		["Minimum Error"] = 0.25,
		["Error Angle"] = FRange( 0.25, 5.5 ),
	},
	["Appearance"] = {
		["Holdtype"] = "smg",
	},
	["Zoom"] = {
		["Magnification Levels"] = 1,
		["Magnification Range"] = FRange( 2, 2 ),
		["Zoom Time"] = 0.2,
	},
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/units.halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/smg_silenced.png", "smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		}
	}
	SWEP.ScopeData = {
		{
			mat = Material("gh3/ui/scopes/battle_rifle_scope.png", "mips smooth"),
			mattype = 0,
			border = true,
			w = ScreenScale(72),
			h = ScreenScale(72),
			borderclr = Color(0, 0, 0, 133),
		},
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/smg_silenced.png", "mips smooth")
	--SWEP.VMOffset = Vector(0, -0.015*100, -0.005*100)
end