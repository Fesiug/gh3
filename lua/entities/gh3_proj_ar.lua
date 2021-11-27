AddCSLuaFile()

ENT.Type = "anim"
ENT.Category = "Halo 3 - projectiles"
ENT.Spawnable = true
ENT.PrintName = "Assault rifle projectile"
ENT.Model = "models/weapons/rifleshell.mdl"
ENT.SpawnTime = 0

function ENT:Initialize()
	-- Sets what model to use
	self:SetModel(self.Model)
	self:SetModelScale( 1 )
	self:SetNoDraw(false)
	self:DrawShadow(false)

	-- Init physics only on server, so it doesn't mess up physgun beam
	if SERVER then self:PhysicsInitSphere( 0.1 ) end

	self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	--timer.Simple(0.05, function()
		--self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
	--end)

	if SERVER then local phys = self:GetPhysicsObject()
	phys:EnableGravity(false) end
	
	-- Make prop to fall on spawn
	self:PhysWake()
	self.SpawnTime = CurTime()
end

function ENT:PhysicsCollide( data, phys )
	self:FireBullets( {
		Attacker = self:GetOwner(),
		Damage = 7.5, -- curse you, INTs!!
		Tracer = 0,
		Dir = self:GetAngles():Forward(),
		Src = self:GetPos() + (self:GetAngles():Forward()*-1)
	} )

	self:Remove()
end

function ENT:Think()
	if self.SpawnTime > CurTime() + 3 then self:Remove() end
end

function ENT:Draw()
	-- client sees a not moving thing for a sec
	if self:GetVelocity():LengthSqr() > 0 then
		self:DrawModel()
	end
end