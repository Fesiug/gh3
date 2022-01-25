
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Automag"
SWEP.Name_The			= "the automag"
SWEP.Name_A				= "an automag"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/automag.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_pist_usp_silencer.mdl" )
SWEP.ViewModelFOV = 54+10

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= { seq = "posing1", snd_p = "GH3.Magnum.Posing1" },
	["fire"]			= {
		{ seq = "fire1" },
		{ seq = "fire2" },
		{ seq = "fire3" },
	},
	["melee"]			= { seq = "melee1", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) },
	["reload_empty"]	= { seq = "reload_empty", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["reload_full"]		= { seq = "reload_full", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.Magnum.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (12/30) },
}
SWEP.Sound = {
	Firing = { "GH3.Automag.Fire", "GH3.Magnum.Eject" },
	Dryfire = "GH3.Magnum.Dryfire",
	Ammo = "GH3.Magnum.Ammo",
	ZoomIn = "GH3.BR.ZoomIn",
	ZoomOut = "GH3.BR.ZoomOut",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 60,
		["Rounds Total Maximum"] = 72,
		["Rounds Loaded Maximum"] = 12,
		["Rounds Inventory Maximum"] = 60,
		["Rounds Reloaded"] = 12,
	},
	["Firing"] = {
		["Rounds Per Second"] = FRange( 30, 30 ),
		["Shots Per Fire"] = FRange( 1, 1 ),
		["Fire Recovery Time"] = 0.075,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 6, 6 ),
		["Force"] = 1,
		["Air Damage Range"] = FRange( 0, 0 ),
		["Spread"] = 0,
		["Can Headshot"] = true,
	},
	["Error"] = {
		["Acceleration Time"] = 1000,
		["Deceleration Time"] = 1000,
		["Minimum Error"] = 0,
		["Error Angle"] = FRange( 0.5, 0.5 ),
	},
	["Appearance"] = {
		["Holdtype"] = "pistol",
	},
	["Zoom"] = {
		["Magnification Levels"] = 2,
		["Magnification Range"] = FRange( 3, 9 ),
		["Zoom Time"] = 0.2,
	},
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/GH3.U_Halo,
	}
}
if CLIENT then
	SWEP.ReticleData = {
		{
			mat = Material("gh3/ui/reticles/magnum.png", "mips smooth"),
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
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/automag.png", "mips smooth")
	--SWEP.VMOffset = Vector(0, 6, 2)
	--SWEP.VMOffset = Vector(0, 3, 1)
end