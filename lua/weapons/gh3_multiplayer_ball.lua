
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "The Oddball"
SWEP.Name_The			= "the oddball"
SWEP.Name_A				= "the oddball"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/multiplayer ball.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_shotgun.mdl" )

SWEP.Animations = {
	[0] = { -- Essentials
		{ 21 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.MP_Ball.Posing1" },
		{ seq = "posing2", snd_p = "GH3.MP_Ball.Posing2" }
	},
	["melee"]			= {
		{ seq = "melee1", snd_p = "GH3.MP_Ball.Melee1", delay_m = (14/30), delay_ms = (5/30) },
		{ seq = "melee2", snd_p = "GH3.MP_Ball.Melee2", delay_m = (14/30), delay_ms = (4/30) },
		{ seq = "melee3", snd_p = "GH3.MP_Ball.Melee3", delay_m = (14/30), delay_ms = (5/30) }
	},
	["putaway"]			= { seq = "put_away", snd_p = "GH3.MP_Ball.Putaway" },
	["ready"]			= { seq = "ready", snd_p = "GH3.MP_Ball.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
}
SWEP.Animations_E = {
	["idle"]			= { seq = "e idle" },
	["posing"]			= {
		{ seq = "e posing1", snd_p = "GH3.MP_Ball.Posing1" },
		{ seq = "e posing2", snd_p = "GH3.MP_Ball.Posing2" }
	},
	["melee"]			= {
		{ seq = "e melee1", snd_p = "GH3.MP_Ball.Melee1", delay_m = (14/30), delay_ms = (5/30) },
		{ seq = "e melee2", snd_p = "GH3.MP_Ball.Melee2", delay_m = (14/30), delay_ms = (5/30) },
		{ seq = "e melee3", snd_p = "GH3.MP_Ball.Melee3", delay_m = (14/30), delay_ms = (5/30) }
	},
	["putaway"]			= { seq = "e put_away", snd_p = "GH3.MP_Ball.Putaway" },
	["ready"]			= { seq = "e ready", snd_p = "GH3.MP_Ball.Ready" },
	["throw_equipment"]	= { seq = "e throw_equipment", delay_te = (12/30) },
}
SWEP.Sound = {
	Firing = "GH3.Shotgun.Fire",
	Dryfire = "GH3.Magnum.Dryfire",
	Ammo = "GH3.Shotgun.Ammo",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 0,
		["Rounds Total Maximum"] = 0,
		["Rounds Loaded Maximum"] = 0,
		["Rounds Inventory Maximum"] = 0,
		["Rounds Reloaded"] = 0,
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
		["Acceleration Time"] = 0,
		["Deceleration Time"] = 0,
		["Minimum Error"] = 0,
		["Error Angle"] = { min = 0, max = 0 },
	},
	["Appearance"] = {
		["Holdtype"] = "slam",
		["Third Person"] = false,
	},
	["Melee"] = {
		["Damage"] = 150,
		["Range"] = 0.6/units.halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/unarmed.png", "smooth"),
			w = ScreenScale(14),
			h = ScreenScale(14)
		}
	}
end