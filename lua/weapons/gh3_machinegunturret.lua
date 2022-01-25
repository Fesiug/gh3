
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Machine Gun Turret"
SWEP.Name_The			= "the machine gun turret"
SWEP.Name_A				= "a machine gun turret"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/assault rifle.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_smg1.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_REVOLVER, ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL }

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["fire"]			= { seq = "fire1", tpanim = tpa[2] },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready" },
}
SWEP.Sound = {
	Firing = "GH3.MachineGunTurret.Fire",
	Dryfire = "GH3.BR.Dryfire",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 200,
		["Rounds Total Maximum"] = 400,
		["Rounds Loaded Maximum"] = 400,
		["Rounds Inventory Maximum"] = 0,
		["Rounds Reloaded"] = 0,
	},
	["Firing"] = {
		["Rounds Per Second"] = FRange( 5, 10 ),
		["Acceleration Time"] = 1.25,
		["Deceleration Time"] = 2,
		["Shots Per Fire"] = FRange( 0, 0 ),
		["Fire Recovery Time"] = 0,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 16, 16 ),
		["Air Damage Range"] = FRange( 0, 80 ),
		["Spread"] = 0,
		["Can Headshot"] = false,
	},
	["Error"] = {
		["Acceleration Time"] = 0,
		["Deceleration Time"] = 0,
		["Minimum Error"] = 0.15,
		["Error Angle"] = FRange( 1, 2 ),
	},
	["Appearance"] = {
		["Holdtype"] = "physgun",
		["Third Person"] = true,
	},
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/smg.png", "mips smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		},
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/missile.png", "mips smooth")
end