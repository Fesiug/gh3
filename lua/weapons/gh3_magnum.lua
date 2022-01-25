
-- Basics
SWEP.Base				= "gh3"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= true

-- Stuff
SWEP.PrintName			= "Magnum"
SWEP.Name_The			= "the magnum"
SWEP.Name_A				= "a magnum"
SWEP.Slot				= 1
SWEP.SlotPos			= 0

-- View
SWEP.ViewModel			= Model( "models/gh3/fp/magnum.mdl" )
SWEP.ViewModelL			= Model( "models/gh3/fp/l/magnum.mdl" )
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
		{ seq = "fire1" },
		{ seq = "fire2" },
		{ seq = "fire3" },
		{ seq = "fire4" },
	},
	["melee"]			= {
		{ seq = "melee1", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) },
		{ seq = "melee2", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) }
	},
	["reload_empty"]	= { seq = "reload_empty", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["reload_full"]		= { seq = "reload_full", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["putaway"]			= { seq = "put_away" },
	["ready"]			= { seq = "ready", snd_p = "GH3.Magnum.Ready" },
	["throw_equipment"]	= { seq = "throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "throw_grenade", delay_tg = (12/30) },
}
SWEP.Animations_E = {
	["idle"]			= { seq = "e idle" },
	["posing"]			= {
		{ seq = "e posing1", snd_p = "GH3.Magnum.Posing1" },
		{ seq = "e posing2", snd_p = "GH3.Magnum.Posing2" }
	},
	["fire"]			= {
		{ seq = "e fire1" },
		{ seq = "e fire2" },
		{ seq = "e fire3" },
		{ seq = "e fire4" },
	},
	["melee"]			= {
		{ seq = "e melee1", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) },
		{ seq = "e melee2", snd_p = "GH3.Magnum.Melee", delay_m = (23/30), delay_ms = (3/30) }
	},
	["reload_empty"]	= { seq = "e reload_empty", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["reload_full"]		= { seq = "e reload_full", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	["putaway"]			= { seq = "e put_away" },
	["ready"]			= { seq = "e ready", snd_p = "GH3.Magnum.Ready" },
	["throw_equipment"]	= { seq = "e throw_equipment", delay_te = (12/30) },
	["throw_grenade"]	= { seq = "e throw_grenade", delay_tg = (12/30) },
}
SWEP.Animations_D = {
	["idle"]			= {
		{ seq = "dual idle1" },
		{ seq = "dual idle2" },
		{ seq = "dual idle3" }
	},
	["posing"]			= {
		{ seq = "dual posing1", snd_p = "GH3.Magnum.Posing1" },
		{ seq = "dual posing2", snd_p = "GH3.Magnum.Posing2" }
	},
	["fire"]			= {
		{ seq = "dual fire1" },
		{ seq = "dual fire2" },
		{ seq = "dual fire3" },
	},
	["reload_empty"]	= {
		{ seq = "dual reload_empty1", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
		{ seq = "dual reload_empty2", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	},
	["reload_full"]		= {
		{ seq = "dual reload_full1", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
		{ seq = "dual reload_full2", snd_p = "GH3.Magnum.Reload", delay_rl = (34/30) },
	},
	["putaway"]			= { seq = "dual put_away" },
	["ready"]			= {
		{ seq = "dual ready1", snd_p = "GH3.Magnum.Ready" },
		{ seq = "dual ready2", snd_p = "GH3.Magnum.Ready" },
		{ seq = "dual ready3", snd_p = "GH3.Magnum.Ready" },
	}
}
SWEP.Sound = {
	Firing = { "GH3.Magnum.Fire", "GH3.Magnum.Eject" },
	Dryfire = "GH3.Magnum.Dryfire",
	Ammo = "GH3.Magnum.Ammo",
}
SWEP.Stats = {
	["Magazines"] = {
		["Rounds Recharged"] = 0,
		["Rounds Total Initial"] = 32,
		["Rounds Total Maximum"] = 48,
		["Rounds Loaded Maximum"] = 8,
		["Rounds Inventory Maximum"] = 40,
		["Rounds Reloaded"] = 8,
	},
	["Firing"] = {
		["Rounds Per Second"] = FRange( 30, 30 ),
		["Shots Per Fire"] = FRange( 1, 1 ),
		["Fire Recovery Time"] = 0.4,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 15, 15 ),
		["Force"] = 20,
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
	SWEP.WepSelect = Material("gh3/ui/schematics/po2/magnum.png", "mips smooth")
end