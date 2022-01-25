
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Plasma Rifle"
SWEP.Name_The			= "the plasma rifle"
SWEP.Name_A				= "a plasma rifle"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/plasma_rifle.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_rif_aug.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_AR2, ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2 }

SWEP.Animations = {
	[0] = { -- Essentials
		{ 21 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.PR.Posing1" },
		{ seq = "posing2", snd_p = "GH3.PR.Posing2" }
	},
	["fire"]			= {
		{ seq = "fire1", tpanim = tpa[2] },
		{ seq = "fire2", tpanim = tpa[2] },
		{ seq = "fire3", tpanim = tpa[2] }
	},
	["melee"]			= { seq = "melee1", snd_p = "GH3.PR.Melee1", delay_m = (23/30), delay_ms = (4/30) },
	["oh_enter"]		= { seq = "oh_heating", snd_p = "GH3.PR.OH_Enter" },
	["idle_oh"]			= { seq = "oh_heated" },
	["oh_exit"]			= { seq = "oh_exit", snd_p = "GH3.PR.OH_Exit" },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.PR.Ready" },
	["ready_oh"]			= { seq = "ready_oh", snd_p = "GH3.PR.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (12/30) },
}
SWEP.Sound = {
	Firing = "GH3.PR.Fire",
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
		["Rounds Per Second"] = FRange( 6, 9 ),
		["Acceleration Time"] = 0.8*1.25,
		["Deceleration Time"] = 0.6*1.666667,
		["Shots Per Fire"] = FRange( 0, 0 ),
		["Fire Recovery Time"] = 0,
		["Rounds Per Shot"] = 0,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 7.5, 7.5 ),
		["Air Damage Range"] = FRange( 0, 0 ),
		["Spread"] = 0,
		["Can Headshot"] = false,
	},
	["Error"] = {
		["Acceleration Time"] = 0.8*1.25,
		["Deceleration Time"] = 0.6*1.666667,
		["Minimum Error"] = 0,
		["Error Angle"] = FRange( 0.5, 1.25 ),
	},
	["Heat"] = {
		["Heat Generated Per Round"] = 0.15,
		["Deceleration Time"] = 0.8525,
		["Deceleration Overheated Time"] = 0.35,
		["Recovery Threshold"] = 0.1,
		["Overheated Threshold"] = 1,
	},
	["Age"] = {
		["Age Generated Per Round"] = 0.0025,
	},
	["Appearance"] = {
		["Holdtype"] = "rpg",
	},
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/GH3.U_Halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/plasma_rifle.png", "smooth"),
			w = ScreenScale(58),
			h = ScreenScale(58)
		}
	}
	
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/pr.png", "mips smooth")
	SWEP.VMOffset = Vector(0, 0.075*100, 0)
end