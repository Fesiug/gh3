
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Magnum (CE)"
SWEP.Name_The			= "the magnum"
SWEP.Name_A				= "a magnum"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/magnum.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_pistol.mdl" )

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.Magnum.Posing1" },
		{ seq = "posing2", snd_p = "GH3.Magnum.Posing2" }
	},
	["fire"]			= {
		{ seq = "fire1", rate = 0.8 },
		{ seq = "fire2", rate = 0.8 },
		{ seq = "fire3", rate = 0.8 },
		{ seq = "fire4", rate = 0.8 }
	},
	["melee"]			= { { seq = "melee1", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) }, { seq = "melee2", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) } },
	["reload_empty"]	= { seq = "reload_empty", rate = 0.8, snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["reload_full"]		= { seq = "reload_full", rate = 0.8, snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.Magnum.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (12/30) },
}
SWEP.Sound = {
	Firing = "GH3.Magnum.Fire",
	Dryfire = "GH3.Magnum.Dryfire",
	Ammo = "GH3.Magnum.Ammo",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 60,
		["Rounds Total Maximum"] = 138,
		["Rounds Loaded Maximum"] = 12,
		["Rounds Inventory Maximum"] = 120,
		["Rounds Reloaded"] = 12,
	},
	["Firing"] = {
		["Rounds Per Second"] = FRange( 3.5, 3.5 ),
		["Shots Per Fire"] = FRange( 0, 0 ),
		["Fire Recovery Time"] = 0,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 25, 25 ),
		["Air Damage Range"] = FRange( 0, 0 ),
		["Spread"] = 0,
		["Can Headshot"] = true,
	},
	["Error"] = {
		["Acceleration Time"] = 0.5,
		["Deceleration Time"] = 0.2,
		["Minimum Error"] = 0,
		["Error Angle"] = FRange( 0, 2 ),
	},
	["Appearance"] = {
		["Holdtype"] = "pistol",
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
			mat = Material("gh3/ui/reticles/magnum.png", "smooth"),
			w = ScreenScale(28),
			h = ScreenScale(28)
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
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/magnum.png", "mips smooth")
	SWEP.VMOffset = Vector(-1, 0, -1)
end