AddCSLuaFile()

ENT.Type = "anim"
ENT.Category = "Halo 3 - grenades"
ENT.Spawnable = true
ENT.PrintName = "Frag grenade"
ENT.Model = "models/weapons/w_grenade.mdl"
ENT.SpawnTime = 0
ENT.GH3_NoDSP = true
ENT.FuseTime = 1.3

function ENT:Initialize()
	-- Sets what model to use
	self:SetModel(self.Model)
	self:SetModelScale( 1 )

	-- Init physics only on server, so it doesn't mess up physgun beam
	if SERVER then self:PhysicsInit( SOLID_VPHYSICS ) end
	self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )

	local phys = self:GetPhysicsObject()
	
	-- Make prop to fall on spawn
	self:PhysWake()
end

function ENT:SetupDataTables()
	self:NetworkVar("Bool", 0, "Primed")
end

local goob = {}
goob.dirt = {
	["grass"] = true,
	["dirt"] = true,
	["sand"] = true,
}
goob.stone = {
	["concrete"] = true,
}

function ENT:PhysicsCollide( data, phys )
	if data.Speed > 100 then
		local sp = util.GetSurfacePropName(data.TheirSurfaceProps)
		if goob.dirt[sp] then
			self:EmitSound( "GH3.Gren.Frag.Collide.Dirt" )
		elseif goob.stone[sp] then
			self:EmitSound( "GH3.Gren.Frag.Collide.Stone" )
		else
			self:EmitSound( "GH3.Gren.Frag.Collide.Metal" )
		end
	end
	
	if !self:GetPrimed() then
		self.SpawnTime = CurTime()
		self:SetPrimed(true)
	end
end

function ENT:Detonate()
	local fx = EffectData()
	fx:SetOrigin(self:GetPos())
	if self:WaterLevel() > 0 then
		util.Effect("WaterSurfaceExplosion", fx)
	else
		util.Effect("cball_explode", fx)
		fx:SetFlags(4)--64+4)
		util.Effect("Explosion", fx)
	end

	if self:WaterLevel() > 0 then
		self:EmitSound("GH3.Gren.Frag.ExplodeWater")
	else
		self:EmitSound("GH3.Gren.Frag.Explode")
	end

	GH3.Explosion(self:GetPos(), self:GetOwner(), self, 1.75/units.halo,
	{
		dmin = 60,
		dmax = 160,
		rmin = 0.5/units.halo,
		rmax = 1.75/units.halo,
		velocity = 2.25/units.halo,
		dmgvelocity = 100*2.25/units.halo,
		physvelocity = 10*2.25/units.halo
	} )

	timer.Simple(0, function() if IsValid(self) then self:Remove() end end)
end

function ENT:Think()
	if SERVER and self:GetPrimed() and self.SpawnTime < CurTime() - self.FuseTime then self:Detonate() end
end

function ENT:Draw()
	-- client sees a not moving thing for a sec
	if self:GetPrimed() or self:GetVelocity():LengthSqr() > 0 then
		self:DrawModel()
	end
end