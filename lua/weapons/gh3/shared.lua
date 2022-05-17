
AddCSLuaFile()

local ICL = {
	"cl_hud.lua",
	"cl_view.lua",
}

local ISV = {
--	"",
}

local ISH = {
	"sh_hold.lua",
	"sh_firing.lua",
	"frange.lua"
}

-- Client
for i, X in ipairs(ICL) do
	AddCSLuaFile(X)
	if CLIENT then
		include(X)
	end
end

-- Server
for i, X in ipairs(ISV) do
	if SERVER then
		include(X)
	end
end

-- Shared
for i, X in ipairs(ISH) do
	AddCSLuaFile(X)
	include(X)
end

-- Here it goes

SWEP.Base				= "weapon_base"
SWEP.Category			= "Halo 3"
SWEP.Spawnable			= false

SWEP.Weight = 1000
SWEP.AutoSwitchFrom = false
SWEP.AutoSwitchTo = false

SWEP.LastSound = nil
SWEP.GH3_NoDSP = true

SWEP.UseHands = false
SWEP.m_bPlayPickupSound	= false
SWEP.m_WeaponDeploySpeed = 10
SWEP.BobScale = 0
SWEP.SwayScale = 0
SWEP.ViewModelFOV = 54
SWEP.GH3 = true

-- dumb shit from weapon base
SWEP.RenderGroup		= RENDERGROUP_OPAQUE
function SWEP:DrawWorldModel() self:DrawModel() end
function SWEP:DrawWorldModelTranslucent() self:DrawModel() end
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 0
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= 0
SWEP.Secondary.Automatic	= true
SWEP.Secondary.Ammo			= "none"
function SWEP:Ammo1() return self:GetAmmo() end

local a_spartan = Model("models/gh3/fp/arms spartan.mdl")
local a_chief = Model("models/gh3/fp/arms chief.mdl")
local a_odst = Model("models/gh3/fp/arms odst.mdl")
local a_chands = Model("models/gh3/fp/arms chands.mdl")
local a_elite = Model("models/gh3/fp/arms elite.mdl")
local a_dervish = Model("models/gh3/fp/arms dervish.mdl")

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
		["Rounds Per Second"] = FRange( 10, 10 ),
		["Acceleration Time"] = 1*1000,
		["Deceleration Time"] = 1*1000,
		["Shots Per Fire"] = FRange( 1, 1 ),
		["Fire Recovery Time"] = 0,
		["Rounds Per Shot"] = 1,
	},
	["Projectiles"] = {
		["Projectiles Per Shot"] = 1,
		["Damage"] = FRange( 1, 1 ),
		["Force"] = 1,
		["Air Damage Range"] = FRange( 0, 0 ),
		["Spread"] = 0,
		["Can Headshot"] = false,
	},
	["Error"] = {
		["Acceleration Time"] = 1,
		["Deceleration Time"] = 1,
		["Minimum Error"] = 0,
		["Error Angle"] = FRange( 0, 0 ),
	},
	["Appearance"] = {
		["Holdtype"] = "pistol",
	},
	--[[["Zoom"] = {
		["Magnification Levels"] = 1,
		["Magnification Range"] = FRange( 3, 3 ),
		["Zoom Time"] = 0.2,
	},]]
	["Melee"] = {
		["Damage"] = 70,
		["Range"] = 0.6/GH3.U_Halo,
	}
}
SWEP.Sound = {
	Firing = "Common.Null",
	Dryfire = "Common.Null",
	Ammo = "Common.Null",
}

function SWEP:SetupDataTables()
	self:NetworkVar("Float", 0, "FireDelay")
	self:NetworkVar("Float", 1, "MeleeDelay")
	self:NetworkVar("Float", 2, "MeleeStrikeDelay")
	self:NetworkVar("Float", 3, "Age")
	self:NetworkVar("Float", 4, "ReloadDelay")
	self:NetworkVar("Float", 5, "ReloadLoadDelay")
	self:NetworkVar("Float", 6, "AccelFirerate")
	self:NetworkVar("Float", 7, "AccelInaccuracy")
	self:NetworkVar("Float", 8, "FireRecoveryDelay")
	self:NetworkVar("Float", 9, "Holster_Time")
	self:NetworkVar("Float", 10, "GrenadeDelay")
	self:NetworkVar("Float", 11, "NextIdle")
	self:NetworkVar("Float", 12, "TGrenade_Time")
	self:NetworkVar("Float", 13, "TEquipment_Time")
	self:NetworkVar("Float", 14, "ZoomTime") -- This doesn't need to be networked
	self:NetworkVar("Float", 15, "FidgetAnimTime")
	self:NetworkVar("Float", 16, "Zoom2Time") -- This doesn't need to be networked
	self:NetworkVar("Float", 17, "Fire2Delay")
	self:NetworkVar("Float", 17, "Fire2RecoveryDelay")
	self:NetworkVar("Float", 18, "AccelHeat")
	self:NetworkVar("Float", 19, "AccelRecoil")

	self:NetworkVar("Entity", 0, "Holster_Entity")

	self:NetworkVar("Int", 0, "MagnificationLevel")
	self:NetworkVar("Int", 1, "BurstCount")
	self:NetworkVar("Int", 2, "Ammoo")

	self:NetworkVar("Bool", 0, "Meleed")
	self:NetworkVar("Bool", 1, "Zoomed")
	self:NetworkVar("Bool", 2, "Overheated")
	self:NetworkVar("Bool", 3, "ReloadingState")
end

function SWEP:GetStat( ... )
	local lookop = self.Stats
	for _, v in ipairs( { ... } ) do
		if lookop[v] then
			lookop = lookop[v]
		else
			return false
		end
	end

	return lookop
end


local c_ammo = CreateConVar("gh3w_cheat_ammo", 0, 0, "0 for default, 1 for spare, 2 for bottomless")
function SWEP:SetAmmo(v)
	if c_ammo:GetInt() == 1 then return end
	return self:SetAmmoo(v)
end

function SWEP:GetAmmo()
	if c_ammo:GetInt() == 1 then return 999 end
	return self:GetAmmoo()
end

function SWEP:SelHands()
	if !IsValid(self:GetOwner()) then return a_spartan end
	local sele = string.lower(self:GetOwner():GetInfo("gh3w_cl_hands")  or "spartan")
	if sele == "dervish" then
		return a_dervish
	elseif sele == "elite" then
		return a_elite
	elseif sele == "odst" then
		return a_odst
	elseif sele == "chief" then
		return a_chief
	elseif sele == "chands" then
		return a_chands
	else
		return a_spartan
	end
end

local human = {
	[a_spartan] = true,
	[a_chief] = true,
	[a_odst] = true,
	[a_chands] = true,
}
function SWEP:SelAnims()
	if !human[self:SelHands()] then
		return self.Animations_E or self.Animations
	else
		return self.Animations--self.Animations_D or self.Animations
	end
end

function SWEP:DebugDualWielding()
	return true
end

function SWEP:DeployFix()
	
end

function SWEP:Deploy(aye)
	if CLIENT and aye != "aye" then return false end
	if SERVER then self:CallOnClient("Deploy", "aye") end

	if !IsValid(self:GetOwner()) then return false end


	self:SetFidgetAnimTime(math.huge)

	self:GetOwner():DrawViewModel( true, 1 )
	self:GetVM(1):SetWeaponModel("models/weapons/v_pistol.mdl", self)
	--self:GetVM(0):SetWeaponModel("models/weapons/v_pistol.mdl", self)
	self:GetVM(0):SetWeaponModel(self:SelHands(), self)
	self:GetVM(1):SetWeaponModel(self.ViewModel, self)
	

	if !IsValid(self:GetOwner()) then return end
	if !self:GetOwner():Alive() then return end
	
	self:SetBurstCount(0)
	self:SetZoomTime(0)

	self:Anim_Play( "ready" )
	self:SetReloadDelay(CurTime() + self:GetVM(1):SequenceDuration())

	self:SetHoldType( self.Stats["Appearance"]["Holdtype"] )
	self:SetWeaponHoldType( self.Stats["Appearance"]["Holdtype"] )

	return true
end

function SWEP:Initialize()
	local ma = self.Stats["Magazines"]
	self:SetClip1( ma["Rounds Loaded Maximum"] )
	self:SetAmmo( math.max( 0, ma["Rounds Total Initial"] - ma["Rounds Loaded Maximum"] ) )

	self.ViewModelFOV_Init = self.ViewModelFOV
end

function SWEP:GetHolsterProgress()
	if IsValid(self:GetHolster_Entity()) then
		if !self.starttime then self.starttime = 1 end
		if !self.fintime then self.fintime = 1 end
		return 1 - math.max( ( self:GetHolster_Time() - CurTime() ) / self.fintime, 0 )
	end
	return 0
end

function SWEP:Holster(wep)
	if wep == self then return false end
	if self:GetHolster_Time() > CurTime() then self:SetHolster_Entity(wep) return false end
	self:ExitZoom()
	--if IsValid(wep) and !weapons.IsBasedOn(wep:GetClass(), "gh3") then return true end

	if (self:GetHolster_Time() != 0 and self:GetHolster_Time() <= CurTime()) or !IsValid(wep) then
		self:SetHolster_Time(0)
		self:SetHolster_Entity(NULL)

		self:GetOwner():DrawViewModel( false, 1 )
		self:GetVM(1):SetWeaponModel(self.ViewModel, NULL)
		self:GetVM(0):SetWeaponModel(self:SelHands(), NULL)

		return true
	else
		self:SetHolster_Entity(wep)

		self:SetReloadLoadDelay(0)
		self:SetReloadingState( false )
		self:SetBurstCount(0)
		self:Anim_Play( "putaway" )
		self:SetHolster_Time( CurTime() + self:GetVM(1):SequenceDuration() )
		self.starttime = ( CurTime() )
		self.fintime = ( self:GetVM(1):SequenceDuration() )
		self:SetNextIdle(math.huge)
	end
end

function SWEP:OnDrop()
	print(self, self:GetOwner())
	if SERVER then
		self:CallOnClient("DropFix")
	end
end

if CLIENT then
	function SWEP:DropFix()
		self:GetVM(0):SetWeaponModel(self:SelHands(), NULL)
		self:GetVM(1):SetWeaponModel(self.ViewModel, NULL)
	end
end

function SWEP:GetVM(ind)
	if self:GetOwner():IsPlayer() then
		return self:GetOwner():GetViewModel(ind or 0)
	else
		--print("GETVM called on a not-player! Get to it, marine!!")
	end
end


local l_s_3 = true
local l_s_4 = 0
function SWEP:Think()
		local p = self:GetOwner()
		local ft = FrameTime()

	if CLIENT then
		local fft = FrameTime() * 8
		if !self.bopset then self.bopset = Vector() end
		if !self.bapset then self.bapset = Angle() end
		self.bopset.x = math.Approach(self.bopset.x, 0, fft)
		self.bopset.y = math.Approach(self.bopset.y, 0, fft)
		self.bopset.z = math.Approach(self.bopset.z, 0, fft)
		self.bapset.x = math.Approach(self.bapset.x, 0, fft)
		self.bapset.y = math.Approach(self.bapset.y, 0, fft)
		self.bapset.z = math.Approach(self.bapset.z, 0, fft)
	end

	if self.Sound.FiringLoop then
		local gaming = (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and true)

		local hmnga = ( CurTime() - ( 1 / self.Stats["Firing"]["Rounds Per Second"].max ) )
		if gaming and p:KeyReleased(IN_ATTACK) or self:GetFireDelay() < hmnga and !l_s_3 then
			l_s_3 = true
			self:StopSound( self.Sound.FiringLoop )
			self:EmitSound( self.Sound.FiringOut )
		end

		if gaming and self:GetFireDelay() <= CurTime() and p:KeyPressed(IN_ATTACK) and self:CanPrimaryAttack(true) then
			l_s_3 = false

			self:EmitSound( self.Sound.FiringIn )
			l_s_4 = CurTime() + self.Sound.FiringIn_T - 0.05
		end

		if gaming and self:GetFireDelay() >= ( hmnga + 0.01 ) and ( l_s_4 <= CurTime() + 0.01 ) then
			self:EmitSound( self.Sound.FiringLoop )
			l_s_4 = CurTime() + self.Sound.FiringLoop_T - 0.05
		end

	end

	if self:Clip1() == 0 and self:GetFireDelay() < CurTime() and self:GetFireRecoveryDelay() < CurTime() and self:GetReloadDelay() < CurTime() and self:GetMeleeDelay() < CurTime() then self:Reload(true) end

	if self:GetReloadingState() and self:Clip1() > 0 and ( self:GetOwner():KeyDown(IN_ATTACK) or self:GetOwner():KeyDown(IN_ATTACK2) ) then
		self:FinishReload()
	end

	if self:GetReloadLoadDelay() != 0 and self:GetReloadLoadDelay() <= CurTime() then
		self:SetReloadLoadDelay(0)
		self:Load()
	end
	
	if self:GetTGrenade_Time() != 0 and self:GetTGrenade_Time() <= CurTime() then
		self:SetTGrenade_Time(0)
		self:T_ThrowGrenade()
	end
	
	if self:GetTEquipment_Time() != 0 and self:GetTEquipment_Time() <= CurTime() then
		self:SetTEquipment_Time(0)
		self:T_ThrowGrenade()
	end

	if self:GetReloadingState() and self:GetReloadDelay() < CurTime() then
		if self:SelAnims().reload_insert and !self:WeaponFull() and self:GetAmmo() > 0 then
			self:InsertReload()
		else
			self:FinishReload()
		end
	end

	if self:GetMeleeStrikeDelay() != 0 and self:GetMeleeStrikeDelay() < CurTime() then self:SetMeleeStrikeDelay(0) self:MeleeStrike() end

	local doo = ( self:GetFireDelay() >= ( CurTime() - engine.TickInterval() ) ) or ( self:GetFireRecoveryDelay() >= ( CurTime() - engine.TickInterval() ) )
	if self.Stats["Error"]["Acceleration Time"] then
		self:SetAccelInaccuracy( math.Approach(self:GetAccelInaccuracy(), ( doo and 1 or 0 ), FrameTime() / ( doo and self.Stats["Error"]["Acceleration Time"] or self.Stats["Error"]["Deceleration Time"] ) ) )
	end
	if self.Stats["Firing"]["Acceleration Time"] then
		self:SetAccelFirerate( math.Approach(self:GetAccelFirerate(), ( doo and 1 or 0 ), FrameTime() / ( doo and self.Stats["Firing"]["Acceleration Time"] or self.Stats["Firing"]["Deceleration Time"] ) ) )
	end
	if self.Stats["Recoil"] then
		self:SetAccelRecoil( math.Approach(self:GetAccelRecoil(), ( doo and 1 or 0 ), FrameTime() / ( doo and self.Stats["Recoil"]["Acceleration Time"] or self.Stats["Recoil"]["Deceleration Time"] ) ) )
	end
	if self.Stats["Heat"] then
		if true then self:SetAccelHeat( math.Approach(self:GetAccelHeat(), 0, FrameTime() * ( self:GetOverheated() and self.Stats["Heat"]["Deceleration Overheated Time"] or self.Stats["Heat"]["Deceleration Time"] ) ) ) end
		if !self:GetOverheated() and self:GetAccelHeat() >= self.Stats["Heat"]["Overheated Threshold"] then
			if self:SelAnims().oh_enter then self:SendAnim(self:SelAnims().oh_enter, 1) end
			self:SetOverheated(true)
		end
		if self:GetOverheated() and self:GetAccelHeat() <= self.Stats["Heat"]["Recovery Threshold"] then
			if self:SelAnims().oh_exit then self:SendAnim(self:SelAnims().oh_exit, 1) end
			self:SetOverheated(false)
		end
	end

	if self:GetBurstCount() != 0 and self.Stats["Firing"]["Shots Per Fire"].max != 0 and self:GetBurstCount() < self.Stats["Firing"]["Shots Per Fire"].max then
		if self:Clip1() <= 0 then
			self:SetBurstCount(0)
		elseif (game.SinglePlayer() and SERVER) or (!game.SinglePlayer() and true) then
			self:PrimaryAttack(true)
		end
	end

	if self:GetBurstCount() >= self.Stats["Firing"]["Shots Per Fire"].min and !self:GetOwner():KeyDown(IN_ATTACK) then
		self:SetBurstCount(0)
	end

	if self:GetNextIdle() <= CurTime() then
		if self:GetOverheated() then
			self:SendAnim(self:SelAnims().idle_oh, 1)
		else
			self:SendAnim(self:SelAnims().idle, 1)
		end
	end

	if self:GetMeleed() and !self:GetOwner():KeyDown(IN_ATTACK2) then
		self:SetMeleed(false)
	end

	if self.Stats["Zoom"] then
		self:SetZoomTime( math.Approach( self:GetZoomTime(), ( self:GetZoomed() and 1 or 0 ), FrameTime() / self.Stats["Zoom"]["Zoom Time"] ) )
		self:SetZoom2Time( math.Approach( self:GetZoom2Time(), ( self:GetZoomed() and 1 or 0 ), FrameTime() / self.Stats["Zoom"]["Zoom Time"] ) )
	end

	if self:SelAnims().posing and self:GetFidgetAnimTime() < CurTime() then
		self:SendAnim(self:SelAnims().posing, 1)
	end
end

function SWEP:ShouldBeLowered()
	--[[if self:GetOwner():ShouldDrawLocalPlayer() then
		return false
	end]]

	if self.Stats["Appearance"]["Third Person"] then
		return false
	end

	if self:GetOwner():GetMoveType() == MOVETYPE_NOCLIP then
		return false
	end

	--[[if IsValid(self:GetHolster_Entity()) and !self:GetHolster_Entity().GH3 then
		return false
	end]]

	return true
end

function SWEP:WeaponFull()
	return 0 >= math.min( self:GetAmmo(), self.Stats["Magazines"]["Rounds Reloaded"], self.Stats["Magazines"]["Rounds Loaded Maximum"] - self:Clip1() )
end

function SWEP:Reload(auto)
	if self:GetReloadDelay() > CurTime() then return false end
	if self:GetFireDelay() > CurTime() then return false end
	if self:GetFireRecoveryDelay() > CurTime() then return false end
	if self:GetHolster_Time() != 0 then return false end
	if self:GetOwner():KeyDown(IN_WALK) then return false end
	if self.Stats["Magazines"]["Rounds Reloaded"] <= 0 and !auto and SERVER then self:GetOwner():DropWeapon(self) return false end
	if self:WeaponFull() then return false end

	return self:StartReload()
end

function SWEP:StartReload()
	if self:GetReloadingState() then return end

	local selanim = nil
	if self:SelAnims().reload_enter then
		selanim = self:SelAnims().reload_enter
	elseif self:Clip1() == 0 and self:SelAnims().reload_empty then
		selanim = self:SelAnims().reload_empty
	elseif self:SelAnims().reload_full then
		selanim = self:SelAnims().reload_full
	else
		return
	end

	self:SendAnim( self:SelAnims().reload_enter or (self:Clip1() == 0 and self:SelAnims().reload_empty or self:SelAnims().reload_full), 1 )
	self:SetReloadingState( true )
	self:SetBurstCount(0)
	self:SetReloadDelay( CurTime() + self:GetVM(1):SequenceDuration() )
	self:ExitZoom()
end

function SWEP:InsertReload()
	if self:SelAnims().reload_insert then self:SendAnim( self:SelAnims().reload_insert, 1 ) self:SetReloadDelay( CurTime() + self:GetVM(1):SequenceDuration() ) end
end

function SWEP:FinishReload()
	if self:SelAnims().reload_exit then self:SendAnim( self:SelAnims().reload_exit, 1 ) self:SetReloadDelay( CurTime() + self:GetVM(1):SequenceDuration() ) end
	self:SetReloadingState( false )
end

function SWEP:Load()
	local thing = math.min( self:GetAmmo(), self.Stats["Magazines"]["Rounds Reloaded"], self.Stats["Magazines"]["Rounds Loaded Maximum"] - self:Clip1() )
	self:SetAmmo( self:GetAmmo() - thing )
	self:SetClip1( self:Clip1() + thing )
end

function SWEP:PlaySound(name)
	--if IsFirstTimePredicted() and self.LastSound then self:StopSound(self.LastSound) end
	self:EmitSound(name)
end

if SERVER then util.AddNetworkString("GH3_NetworkTP") end
local ga = (1/30)

local VM_GUN = 1
local VM_HAND = 0

function SWEP:Anim_Play(name)
	self:SendAnim( self:SelAnims()[name], VM_GUN )
end

function SWEP:Anim_Exists(name)
	return self:SelAnims()[name] != nil
	--self:SendAnim( self:SelAnims()[name], VM_GUN )
end

function SWEP:SendAnim(name, ind)
	if !name.seq and istable(name) then name = name[math.Round(util.SharedRandom("quambo", 1, #name, math.sin(CurTime()/24292)))] end

	local ani = self:GetVM(ind)
	if !IsValid(ani) then return end
	local anim = ani:LookupSequence( name.seq)
	ani:SendViewModelMatchingSequence(anim)
	ani:SetPlaybackRate(name.rate or 1)
	local dur = ani:SequenceDuration() / ( name.rate or 1 )
	self:SetNextIdle( CurTime() + dur )
	self.AnimTimeStart = CurTime()
	self.AnimTime = CurTime() + dur
	self.Anim_Current = anim

	if SERVER and name.tpanim and self:GetOwner():IsPlayer() then 
		net.Start("GH3_NetworkTP")
			net.WriteEntity(self:GetOwner())
			net.WriteUInt(self:GetOwner():SelectWeightedSequence(name.tpanim), 16)
			net.WriteFloat(name.tpanim_starttime or 0)
		net.Broadcast()
	end

	if name.seq != "idle" then
		self:SetFidgetAnimTime(CurTime() + dur + math.random(15, 60))
	end

	if name.snd_p then self:PlaySound(name.snd_p) end
	if name.snd_e then self:EmitSound(name.snd_e) end

	-- Firing
	-- Melee delay
	-- Time until strike
	-- Reloading delay
	-- Mag tops off
	-- Time until holster
	-- Throw grenade
	-- Throw equipment
	if name.delay_f then self:SetFireDelay( CurTime() + name.delay_f - ga ) end
	if name.delay_m then self:SetMeleeDelay( CurTime() + name.delay_m - ga ) end
	if name.delay_ms then self:SetMeleeStrikeDelay( CurTime() + name.delay_ms - ga ) end
	if name.delay_r then self:SetReloadDelay( CurTime() + name.delay_r - ga ) end
	if name.delay_rl then self:SetReloadLoadDelay( CurTime() + name.delay_rl - ga ) end
	if name.delay_h then self:SetHolster_Time( CurTime() + name.delay_h - ga ) end
	if name.delay_tg then self:SetTGrenade_Time( CurTime() + name.delay_tg - ga ) end
	if name.delay_te then self:SetTEquipment_Time( CurTime() + name.delay_te - ga ) end
end

if CLIENT then
	net.Receive("GH3_NetworkTP", function()
		local ent = net.ReadEntity()
		local seq = net.ReadUInt(16)
		local starttime = net.ReadFloat()
		--if ent != LocalPlayer() then
			ent:AddVCDSequenceToGestureSlot( GESTURE_SLOT_ATTACK_AND_RELOAD, seq, starttime, true )
		--end
	end)
end

local sndbo = {
	[HITGROUP_HEAD]     = 1 / 2,
	[HITGROUP_LEFTARM]  = 1 / 0.25,
	[HITGROUP_RIGHTARM] = 1 / 0.25,
	[HITGROUP_LEFTLEG]  = 1 / 0.25,
	[HITGROUP_RIGHTLEG] = 1 / 0.25,
	[HITGROUP_GEAR]     = 1 / 0.25,
}

hook.Add("ScalePlayerDamage", "!", function( ply, hitgroup, dmginfo )
	if weapons.IsBasedOn(dmginfo:GetInflictor():GetClass(), "gh3") then return false end
end)

-- damage rounds down

function SWEP:ThrowGrenade(equipment)
	if self:GetGrenadeDelay() > CurTime() then return false end
	
	if !equipment and self:SelAnims().throw_grenade then
		self:SendAnim( self:SelAnims().throw_grenade, 1 )
		self:PlaySound("GH3.Gren.Frag")
	elseif self:SelAnims().throw_equipment then
		self:SendAnim( self:SelAnims().throw_equipment, 1 )
	else
		return false
	end

	self:SetReloadDelay( CurTime() + 1 )
	self:SetReloadLoadDelay( 0 )
	self:SetGrenadeDelay( CurTime() + 1 )
end

function SWEP:T_ThrowGrenade()
	if SERVER then
		local tg = self:GetOwner()
		local bull = ents.Create("gh3_grenade")
		bull:SetPos(tg:EyePos() + (tg:EyeAngles():Forward() * 0)+  (tg:EyeAngles():Right() * -4))
		bull:SetAngles(tg:EyeAngles() + Angle(0, 0, 15))
		bull:SetOwner(tg)
		bull:Spawn()

		bull:GetPhysicsObject():SetVelocityInstantaneous( tg:GetVelocity() + ( tg:EyeAngles():Forward()*700 ) )
		bull:GetPhysicsObject():AddAngleVelocity( Vector(322, 122, 22) )
	end
end

if SERVER then
	function SWEP:Equip( ply )
		if !IsValid(ply) then return end
		if !ply:IsPlayer() then return end

		ply:ChatPrint("Picked up " .. self.Name_A)
	end

	function SWEP:EquipAmmo( ply )
		-- this function sucks
	end

	hook.Add( "PlayerCanPickupWeapon", "GH3_PickupAmmo", function( ply, take )
		if !IsValid(take) then return end
		if !take.GH3 then return end
		if !IsValid(ply) then return end
		if !ply:IsPlayer() then return end

		local giveto = ply:GetWeapon( take:GetClass() )
		if !IsValid(giveto) then return end

		local totalyoinked = 0

		local aadd = math.min( take:GetAmmo(), giveto.Stats["Magazines"]["Rounds Inventory Maximum"] - giveto:GetAmmo() )
		if aadd > 0 then
			take:SetAmmo(take:GetAmmo() - aadd)
			giveto:SetAmmo( giveto:GetAmmo() + aadd )
			totalyoinked = totalyoinked + aadd
		end
		aadd = math.min( take:Clip1(), giveto.Stats["Magazines"]["Rounds Inventory Maximum"] - giveto:GetAmmo() )
		if aadd > 0 then
			take:SetClip1(take:Clip1() - aadd)
			giveto:SetAmmo( giveto:GetAmmo() + aadd )
			totalyoinked = totalyoinked + aadd
		end

		if take:Clip1() <= 0 and take:GetAmmo() <= 0 then take:Remove() end

		if totalyoinked > 0 then ply:ChatPrint("Picked up " .. totalyoinked .. " round" .. ( totalyoinked == 1 and "" or "s" ) ..  " for " .. giveto.Name_The or giveto.PrintName )
		giveto:CallOnClient("PickupAmmo") end

		return false
	end )



end