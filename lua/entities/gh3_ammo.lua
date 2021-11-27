AddCSLuaFile()

ENT.Type = "anim"
ENT.Category = "Halo 3 - ammo"
ENT.Spawnable = false
ENT.PrintName = "Ammo base"
ENT.Model = "models/Items/BoxMRounds.mdl"
ENT.AmmoRemaining = 240
ENT.WeaponTo = "gh3_"
ENT.Color = Color(255, 255, 255)

function ENT:Initialize()
    self:SetModel(self.Model)
	self:SetColor(self.Color)
	self:SetRenderMode( RENDERMODE_TRANSCOLOR )
	self:DrawShadow(true)
	if SERVER then self:PhysicsInit(SOLID_VPHYSICS) end

	self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	self.AmmoSpawnedWith = self.AmmoRemaining

	-- Make prop to fall on spawn
	self:PhysWake()

	if SERVER then
		self:SetTrigger(true)
	end
end

function ENT:PhysicsCollide( data, phys )
end

function ENT:Think()
end

function ENT:Touch(ply)
	if !IsValid(ply) then return end
	if !ply:IsPlayer() then return end

	local w = ply:GetWeapon(self.WeaponTo)
	if !IsValid(w) then return end

	-- w.Stats["Magazines"]["Rounds Total Maximum"]
	-- w.Stats["Magazines"]["Rounds Loaded Maximum"]
	-- w.Stats["Magazines"]["Rounds Inventory Maximum"]

	local aadd = math.min( self.AmmoRemaining, w.Stats["Magazines"]["Rounds Inventory Maximum"] - w:GetAmmo() )
	if aadd < 1 then return end

	w:SetAmmo(w:GetAmmo() + aadd)
	self.AmmoRemaining = self.AmmoRemaining - aadd

	self.Color.a = math.max( ( self.AmmoRemaining / self.AmmoSpawnedWith ) * 255, 20 )
	self:SetColor(self.Color)

	ply:ChatPrint("Picked up " .. aadd .. " round" .. ( aadd == 1 and "" or "s" ) ..  " for " .. w.Name_The or w.PrintName )
	--ply:ChatPrint( string.format( "Picked up %i round" .. ( aadd == 1 and "" or "s" ) ..  " for %s", aadd, w.Name_The or w.PrintName ) )
	w:CallOnClient("PickupAmmo")

	if self.AmmoRemaining <= 0 then self:Remove() end
end