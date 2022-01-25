
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Assault Rifle"
SWEP.Name_The			= "the assault rifle"
SWEP.Name_A				= "an assault rifle"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/assault_rifle.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_rif_aug.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_AR2, ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 }

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.AR.Posing1" },
		{ seq = "posing2", snd_p = "GH3.AR.Posing2" }
	},
	["fire"]			= {
		{ seq = "fire1", tpanim = tpa[2] },
		{ seq = "fire2", tpanim = tpa[2] },
		{ seq = "fire3", tpanim = tpa[2] }
	},
	["melee"]			= { { seq = "melee1", snd_p = "GH3.AR.Melee1", delay_m = (23/30), delay_ms = (4/30) }, { seq = "melee2", snd_p = "GH3.AR.Melee2", delay_m = (23/30), delay_ms = (4/30) } },
	["reload_empty"]	= { seq = "reload_empty", snd_p = "GH3.AR.Reload", delay_rl = (34/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "reload_full", snd_p = "GH3.AR.Reload", delay_rl = (34/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.AR.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (12/30) },
}
SWEP.Sound = {
	Firing = "GH3.AR.Fire",
	FiringFar = "GH3.AR.FireFar",
	Dryfire = "GH3.BR.Dryfire",
	Ammo = "GH3.BR.Ammo",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 96,
		["Rounds Total Maximum"] = 384,
		["Rounds Loaded Maximum"] = 32,
		["Rounds Inventory Maximum"] = 352,
		["Rounds Reloaded"] = 32,
	},
	["Firing"] = {
		["Rounds Per Second"] = { min = 10, max = 10 },
		["Shots Per Fire"] = { min = 0, max = 0 },
		["Fire Recovery Time"] = 0,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = { min = 7.5, max = 7.5 },
		["Air Damage Range"] = { min = 0, max = 0 },
		["Spread"] = 0,
		--[[
			["Class"] = "gh3_proj_ar",
			["Velocity"] = 15000,
			["Offset"] = Vector(2, 8, -2),
		]]
		["Can Headshot"] = false,
	},
	["Error"] = {
		["Acceleration Time"] = 0.5*2,
		["Deceleration Time"] = 0.5*2,
		["Minimum Error"] = 0.1,
		["Error Angle"] = { min = 0.1, max = 3 },
	},
	["Appearance"] = {
		["Holdtype"] = "rpg",
		["VM Right"] = Model( "models/gh3/fp/assault_rifle.mdl" ),
	},
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/units.halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/ar.png", "smooth"),
			w = ScreenScale(28),
			h = ScreenScale(28)
		}
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/ar.png", "mips smooth")
end