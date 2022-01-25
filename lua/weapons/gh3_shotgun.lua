
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Shotgun"
SWEP.Name_The			= "the shotgun"
SWEP.Name_A				= "a shotgun"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/shotgun.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_shotgun.mdl" )

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
		{
			[1] = true,
			[2] = true,
			[3] = true,
			[10] = true,
			[12] = true,
		}, -- Sequences with no funny business
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.Shotgun.Posing1" },
		{ seq = "posing2", snd_p = "GH3.Shotgun.Posing2" }
	},
	["fire"]			= {
		{ seq = "fire1", snd_p = "GH3.Shotgun.Pump" },
		{ seq = "fire2", snd_p = "GH3.Shotgun.Pump" },
		{ seq = "fire3", snd_p = "GH3.Shotgun.Pump" }
	},
	["melee"]			= { { seq = "melee1", snd_p = "GH3.Shotgun.Melee1", delay_m = (20/30), delay_ms = (3/30) }, { seq = "melee2", snd_p = "GH3.Shotgun.Melee2", delay_m = (20/30), delay_ms = (3/30) } },
	["reload_enter"]	= { seq = "reload_enter" },
	["reload_exit"]		= { seq = "reload_exit", snd_p = "GH3.Shotgun.ReloadExit", },
	["reload_insert"]	= { seq = "reload_insert", snd_p = "GH3.Shotgun.Reload", delay_rl = (13/30) },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.Shotgun.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (10/30) },
}
SWEP.Sound = {
	Firing = "GH3.Shotgun.Fire",
	Dryfire = "GH3.Magnum.Dryfire",
	Ammo = "GH3.Shotgun.Ammo",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 18,
		["Rounds Total Maximum"] = 36,
		["Rounds Loaded Maximum"] = 6,
		["Rounds Inventory Maximum"] = 30,
		["Rounds Reloaded"] = 1,
	},
	["Firing"] = {
		["Rounds Per Second"] = { min = 30, max = 30 },
		["Shots Per Fire"] = { min = 1, max = 1 },
		["Fire Recovery Time"] = 1,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 15,
		["Damage"] = { min = 3, max = 10 },
		["Force"] = 2,
		["Air Damage Range"] = { min = 2 / units.meters, max = 4 / units.meters }, -- the fuck are the units
		["Spread"] = 7.5,
		["Can Headshot"] = true,
	},
	["Error"] = {
		["Acceleration Time"] = 1000,
		["Deceleration Time"] = 4,
		["Minimum Error"] = 0,
		["Error Angle"] = { min = 0, max = 0 },
	},
	["Appearance"] = {
		["Holdtype"] = "shotgun",
	},
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/units.halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/shotgun.png", "mips smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		}
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/shotgun.png", "mips smooth")
end