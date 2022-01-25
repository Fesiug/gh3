
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Battle Rifle"
SWEP.Name_The			= "the battle rifle"
SWEP.Name_A				= "a battle rifle"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/battle_rifle.mdl" )
SWEP.WorldModel			= Model( "models/weapons/w_rif_famas.mdl" )

local tpa = { ACT_HL2MP_GESTURE_RELOAD_AR2, ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW }

SWEP.Animations = {
	[0] = { -- Essentials
		{ 20 }, -- Sprinting anim length in frames
	},
	["idle"]			= { seq = "idle" },
	["posing"]			= {
		{ seq = "posing1", snd_p = "GH3.BR.Posing1" },
		{ seq = "posing2", snd_p = "GH3.BR.Posing2" }
	},
	["fire"]			= {
		{ seq = "fire1", snd_e = "GH3.BR.Eject", tpanim = tpa[2] },
		{ seq = "fire2", snd_e = "GH3.BR.Eject", tpanim = tpa[2] },
		{ seq = "fire3", snd_e = "GH3.BR.Eject", tpanim = tpa[2] }
	},
	["melee"]			= { { seq = "melee1", snd_p = "GH3.BR.Melee1", delay_m = (23/30), delay_ms = (4/30) }, { seq = "melee2", snd_p = "GH3.BR.Melee2", delay_m = (23/30), delay_ms = (4/30) } },
	["reload_empty"]	= { seq = "reload_empty", snd_p = "GH3.BR.Reload_Full", delay_rl = (34/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "reload_full", snd_p = "GH3.BR.Reload_Full", delay_rl = (34/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.BR.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (12/30) },
}
SWEP.Animations_E = {
	["idle"]			= { seq = "e idle" },
	["posing"]			= { seq = "e posing1", snd_p = "GH3.BR.Posing1" },
	["fire"]			= {
		{ seq = "e fire1", snd_e = "GH3.BR.Eject", tpanim = tpa[2] },
		{ seq = "e fire2", snd_e = "GH3.BR.Eject", tpanim = tpa[2] },
		{ seq = "e fire3", snd_e = "GH3.BR.Eject", tpanim = tpa[2] }
	},
	["melee"]			= { seq = "e melee1", snd_p = "GH3.BR.Melee1", delay_m = (23/30), delay_ms = (4/30) },
	["reload_empty"]	= { seq = "e reload_empty", snd_p = "GH3.BR.Reload_Empty", delay_rl = (34/30), tpanim = tpa[1] },
	["reload_full"]		= { seq = "e reload_full", snd_p = "GH3.BR.Reload_Empty", delay_rl = (34/30), tpanim = tpa[1] },
	["putaway"]			= { seq = "e put_away" },
	["ready"]			= { seq = "e ready", snd_p = "GH3.BR.Ready" },
	["throw_equipment"]	= { seq = "e throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "e throw_grenade", delay_tg = (12/30) },
}
SWEP.Sound = {
	Firing = "GH3.BR.Fire",
	Dryfire = "GH3.BR.Dryfire",
	Ammo = "GH3.BR.Ammo",
	ZoomIn = "GH3.BR.ZoomIn",
	ZoomOut = "GH3.BR.ZoomOut",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 108,
		["Rounds Total Maximum"] = 144,
		["Rounds Loaded Maximum"] = 36,
		["Rounds Inventory Maximum"] = 108,
		["Rounds Reloaded"] = 36,
	},
	["Firing"] = {
		["Rounds Per Second"] = FRange( 15, 15 ),
		["Shots Per Fire"] = FRange( 3, 3 ),
		["Fire Recovery Time"] = 0.28,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 6, 6 ),
		["Force"] = 10,
		["Air Damage Range"] = FRange( 0, 0 ),
		["Spread"] = 0,
		["Can Headshot"] = true,
	},
	["Error"] = {
		["Acceleration Time"] = 0.2*5,
		["Deceleration Time"] = 0.1*10,
		["Minimum Error"] = 0,
		["Error Angle"] = FRange( 0.15, 0.5 ),
	},
	["Appearance"] = {
		["Holdtype"] = "rpg",
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
			mat = Material("gh3/ui/reticles/br.png", "mips smooth"),
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
		{
			mat = Material("gh3/ui/scopes/br/1.png", "smooth"),
			mattype = 0,
			x = ScreenScale( -40 ),
			y = ScreenScale( 10 * 0.28 * 0.9 ),
			w = ScreenScale( 97 * (0.28) ),
			h = ScreenScale( 30 * (0.28)),
		},
		{
			mat = Material("gh3/ui/scopes/br/1r.png", "smooth"),
			mattype = 0,
			x = ScreenScale( 40 ),
			y = ScreenScale( 10 * 0.28 * 0.9 ),
			w = ScreenScale( 97 * (0.28) ),
			h = ScreenScale( 30 * (0.28)),
		},
		{
			mat = Material("gh3/ui/scopes/br/2.png", "smooth"),
			mattype = 0,
			x = ScreenScale( -0.4 ),
			y = ScreenScale( -40 ),
			w = ScreenScale( 21 * (0.28) ),
			h = ScreenScale( 96 * (0.28)),
		},
		{
			mat = Material("gh3/ui/scopes/br/2r.png", "smooth"),
			mattype = 0,
			x = ScreenScale( -0.4 ),
			y = ScreenScale( 40 ),
			w = ScreenScale( 21 * (0.28) ),
			h = ScreenScale( 96 * (0.28)),
		},
		{
			mat = Material("gh3/ui/scopes/br/3.png", "smooth"),
			mattype = 0,
			x = ScreenScale( -30 ),
			y = ScreenScale( 31.5 ),
			w = ScreenScale( 81 * (0.28) ),
			h = ScreenScale( 62 * (0.28)),
		},
	}
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/br.png", "mips smooth")
	SWEP.VMOffset = Vector(0, 0.025*100, 0)
end