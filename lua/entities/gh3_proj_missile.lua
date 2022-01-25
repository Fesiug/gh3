AddCSLuaFile()

ENT.Type = "anim"
ENT.Category = "Halo 3 - projectiles"
ENT.Spawnable = true
ENT.PrintName = "Rocket propelled grenade"
ENT.Model = "models/gh3/proj/rocket launcher projectile.mdl"
ENT.SpawnTime = 0
ENT.next = 0
ENT.Weaap = NULL
ENT.GH3_NoDSP = true
ENT.Ignited = false

function ENT:Initialize()
	-- Sets what model to use
	self:SetModel(self.Model)

	-- Init physics only on server, so it doesn't mess up physgun beam
	if SERVER then self:PhysicsInitSphere( 4 ) end

	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	timer.Simple(0.05, function()
		if IsValid(self) then
			self:SetCollisionGroup( COLLISION_GROUP_PROJECTILE )
		end
	end)

	if SERVER then
		local phys = self:GetPhysicsObject()
		phys:EnableGravity(false)
	end
	
	-- Make prop to fall on spawn
	self:PhysWake()
	self.SpawnTime = CurTime()

	self:EmitSound("GH3.Missile.Loop")
end

function ENT:PhysicsCollide( data, phys )
	self:Detonate()
end

function ENT:Think()
	if SERVER and self.SpawnTime < CurTime() - 3 then self:Detonate() end
	
	if self.SpawnTime < CurTime() - 0.35 then
		if self.next <= CurTime() then 
			local fx = EffectData()
			local att = self:GetAttachment(self:LookupAttachment("exhaust"))
			--fx:SetEntity(self)
			--fx:SetAttachment(1)
			fx:SetOrigin(att.Pos)
			fx:SetAngles(att.Ang)
			fx:SetScale(4)
				util.Effect("MuzzleEffect", fx)
			self.next = CurTime() + 0.01
		end
		if !self.Ignited then
			self:EmitSound("GH3.Missile.Ignite")
			self.Ignited = true
		end
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

	self:EmitSound("GH3.Missile.Explode")
	self:EmitSound("GH3.Missile.ExplodeFar")

	GH3.Explosion(self:GetPos(), self:GetOwner(), self.Weaap, 0.75/GH3.U_Halo,
	{
		dmin = 50,
		dmax = 105,
		rmin = 0.25/GH3.U_Halo,
		rmax = 0.75/GH3.U_Halo,
		velocity = 1/GH3.U_Halo,
		dmgvelocity = 100*1/GH3.U_Halo,
		physvelocity = 10*1/GH3.U_Halo,
		transferdamageusesminimum = true
	} )

	self:Remove()
end

function ENT:OnRemove()
	self:StopSound("GH3.Missile.Loop")
end

function ENT:Draw()
	-- client sees a not moving thing for a sec
	if self:GetVelocity():LengthSqr() > 0 then
		self:DrawModel()
	end
end