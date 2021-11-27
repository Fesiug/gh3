
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "rocket launcher"
SWEP.Name_The			= "the rocket launcher"
SWEP.Name_A				= "a rocket launcher"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/rocket launcher.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_rocket_launcher.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_REVOLVER, ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW }

SWEP.Animations = {
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.RocketLauncher.Posing1" },
		{ seq = "posing2", snd_p = "GH3.RocketLauncher.Posing2" },
		{ seq = "posing3", snd_p = "GH3.RocketLauncher.Posing3" }
	},
	["fire"]			= {
		{ seq = "fire1", snd_p = "GH3.RocketLauncher.Anim", tpanim = tpa[2] },
		{ seq = "fire2", snd_p = "GH3.RocketLauncher.Anim", tpanim = tpa[2] },
		{ seq = "fire3", snd_p = "GH3.RocketLauncher.Anim", tpanim = tpa[2] }
	},
	["melee"]			= { seq = "melee1", snd_p = "GH3.RocketLauncher.Melee", delay_m = (30/30), delay_ms = (5/30) },
	["reload_empty"]	= { seq = "reload_empty", snd_p = "GH3.RocketLauncher.Reload", delay_rl = (80/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "reload_full", snd_p = "GH3.RocketLauncher.Reload", delay_rl = (80/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.RocketLauncher.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (11/30) },
}
SWEP.Animations_E = {
	["idle"]			= { seq = "e idle" },
	["posing"]			= {
		{ seq = "e posing1", snd_p = "GH3.RocketLauncher.Posing1" },
		{ seq = "e posing2", snd_p = "GH3.RocketLauncher.Posing2" },
		{ seq = "e posing3", snd_p = "GH3.RocketLauncher.Posing3" }
	},
	["fire"]			= {
		{ seq = "e fire1", snd_p = "GH3.RocketLauncher.Anim_E", tpanim = tpa[2] },
		{ seq = "e fire2", snd_p = "GH3.RocketLauncher.Anim_E", tpanim = tpa[2] },
		{ seq = "e fire3", snd_p = "GH3.RocketLauncher.Anim_E", tpanim = tpa[2] }
	},
	["melee"]			= { seq = "e melee1", snd_p = "GH3.RocketLauncher.Melee_E", delay_m = (30/30), delay_ms = (5/30) },
	["reload_empty"]	= { seq = "e reload_empty", snd_p = "GH3.RocketLauncher.Reload_E", delay_rl = (80/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "e reload_full", snd_p = "GH3.RocketLauncher.Reload_E", delay_rl = (80/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "e put_away" },
	["ready"]			= { seq = "e ready", snd_p = "GH3.RocketLauncher.Ready" },
	["throw_equipment"]	= { seq = "e throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "e throw_grenade", delay_tg = (11/30) },
}
SWEP.Sound = {
	Firing = "GH3.RocketLauncher.Fire",
	Dryfire = "GH3.BR.Dryfire",
	Ammo = "GH3.RocketLauncher.Ammo",
	ZoomIn = "GH3.RocketLauncher.ZoomIn",
	ZoomOut = "GH3.RocketLauncher.ZoomOut",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 4,
		["Rounds Total Maximum"] = 8,
		["Rounds Loaded Maximum"] = 2,
		["Rounds Inventory Maximum"] = 6,
		["Rounds Reloaded"] = 2,
	},
	["Firing"] = {
		["Rounds Per Second"] = { min = 30, max = 30 },
		["Shots Per Fire"] = { min = 1, max = 1 },
		["Fire Recovery Time"] = 0.8,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Class"] = "gh3_proj_rocket",
		["Velocity"] = 1500,
		["Offset"] = Vector(4, 0, 0),
		["Spread"] = 0,
	},
	["Error"] = {
		["Acceleration Time"] = 1000,
		["Deceleration Time"] = 1000,
		["Minimum Error"] = 0,
		["Error Angle"] = { min = 0, max = 0 },
	},
	["Appearance"] = {
		["Holdtype"] = "ar2",
	},
	["Zoom"] = {
		["Magnification Levels"] = 1,
		["Magnification Range"] = { min = 1.8, max = 1.8 },
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
			mat = Material("gh3/ui/reticles/rocket_launcher.png", "mips smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		}
	}
	SWEP.ScopeData = {
		{
			mat = Material("gh3/ui/scopes/rocket__launcher_scope.png", "mips smooth"),
			mattype = 0,
			border = true,
			w = ScreenScale(96),
			h = ScreenScale(96),
			borderclr = Color(0, 0, 0, 122),
		},
		{
			mat = Material("gh3/ui/scopes/rocket_dimming.png", "mips smooth"),
			mattype = 0,
			border = true,
			w = ScrH(),
			h = ScrH(),
			borderclr = Color(0, 0, 0, 125),
		},
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/rocket.png", "mips smooth")
	SWEP.VMOffset = Vector(0, 0.02*100, 0)
end