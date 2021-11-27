
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "missile pod"
SWEP.Name_The			= "the missile pod"
SWEP.Name_A				= "a missile pod"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/assault rifle.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_physics.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_REVOLVER, ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER }

SWEP.Animations = {
	["idle"]			= { seq = "idle" },
	["fire"]			= { seq = "fire1", tpanim = tpa[2] },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready" },
}
SWEP.Sound = {
	Firing = "GH3.MissilePod.Fire",
	Dryfire = "GH3.BR.Dryfire",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 8,
		["Rounds Total Maximum"] = 8,
		["Rounds Loaded Maximum"] = 8,
		["Rounds Inventory Maximum"] = 0,
		["Rounds Reloaded"] = 0,
	},
	["Firing"] = {
		["Rounds Per Second"] = { min = 30, max = 30 },
		["Shots Per Fire"] = { min = 1, max = 1 },
		["Fire Recovery Time"] = 0.45,
		["Rounds Per Shot"] = 0,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Class"] = "gh3_proj_missile",
		["Velocity"] = 1500,
		["Offset"] = Vector(4, 0, 0),
		["Spread"] = 0,
	},
	["Error"] = {
		["Acceleration Time"] = 0,
		["Deceleration Time"] = 0,
		["Minimum Error"] = 0.15,
		["Error Angle"] = { min = 0.4, max = 0.4 },
	},
	["Appearance"] = {
		["Holdtype"] = "physgun",
		["Third Person"] = true,
	},
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/missile.png", "mips smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		},
		{
			mat = Material("gh3/ui/reticles/missile1.png", "mips smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		}
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/missile.png", "mips smooth")
end