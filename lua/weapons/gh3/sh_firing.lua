
-- Firing



function SWEP:CanPrimaryAttack(simulation, lsound, commanded)
	if self:GetHolster_Time() != 0 then return false end
	if !lsound and !commanded and self:GetFireRecoveryDelay() > CurTime() then
		return false
	end
	
	--[[if self:GetOwner():KeyDown(IN_USE) then
		if !simulation then
			--self:ThrowGrenade()
			--self:ExitZoom()
		end
		return false
	end]]

	if !lsound and self:GetFireDelay() > CurTime() then return false end
	if self:GetReloadDelay() > CurTime() then return false end
	if self:GetOverheated() then return false end
	
	if self:Clip1() <= 0 then
		if !simulation then
			self:EmitSound(self.Sound.Dryfire)
			self:SetFireDelay( CurTime() + (1/5) )
		end
		return false
	end


	if	self.Stats["Firing"]["Shots Per Fire"].min != 0 and
		self.Stats["Firing"]["Shots Per Fire"].max != 0 and
		self:GetBurstCount() >= self.Stats["Firing"]["Shots Per Fire"].max and
		!lsound then
		return false
	end

	return true
end

funks = {
	["Linear"] = function(i)
		return Lerp( i, 0, 1 )
	end,
	["Very Early"] = function(i)
		return Lerp( math.pow( math.sin( i * math.pi * 0.5 ), 0.5 ), 0, 1 )
	end,
	["Early"] = function(i)
		return Lerp( math.pow( math.sin( i * math.pi * 0.5 ), 1 ), 0, 1 )
	end,
	["Late"] = function(i)
		return Lerp( math.pow( math.sin( i * math.pi * 0.5 ), 2 ), 0, 1 )
	end,
	["Very Late"] = function(i)
		return Lerp( math.pow( math.sin( i * math.pi * 0.5 ), 3 ), 0, 1 )
	end,
	["Cosine"] = function(i)
		return Lerp( math.pow( math.cos( i * math.pi * 0.5 ), 1 ), 0, 1 )
	end,
	["Zero"] = function(i)
		return 0
	end,
	["One"] = function(i)
		return 1
	end,
}

function SWEP:PrimaryAttack(commanded)
	if !self:CanPrimaryAttack( false, false, commanded ) then return end
	self:SetReloadingState( false )
	local tg = self:GetOwner()

	local howmany = self.Stats["Projectiles"]["Projectiles Per Shot"]
	for i=1, howmany do
		local rnd = util.SharedRandom(CurTime()/239, 0, 360, 21212121*i)
		local rnd2 = util.SharedRandom(CurTime()/2134, 0, 1, 123*i)
		local deviat = ( Angle( math.cos(rnd), math.sin(rnd), 0) * ( math.max( self.Stats["Error"]["Minimum Error"] or 0, rnd2 * ( Lerp(self:GetAccelInaccuracy(), self.Stats["Error"]["Error Angle"].min, self.Stats["Error"]["Error Angle"].max ) + self.Stats["Projectiles"]["Spread"] ) ) ) )

		if !self.Stats["Projectiles"]["Class"] then
			self:FireBullets( {
				Attacker = self:GetOwner(),
				Damage = 0, -- We will be making physical bullets
				Force = self.Stats["Projectiles"]["Force"] or 1,
				Dir = (self:GetOwner():EyeAngles() + deviat):Forward(),
				Spread = vector_origin,
				Tracer = 1,
				TracerName = "tracer",
				Src = self:GetOwner():EyePos(),
				IgnoreEntity = self:GetOwner(),
				Callback = function( atk, tr, dmg )
					-- Thank you Arctic, very cool
					local ent = tr.Entity

					dmg:SetDamage( self.Stats["Projectiles"]["Damage"].max )
					dmg:SetDamageType(DMG_BULLET)

					if IsValid(ent) then
						local d = dmg:GetDamage()
						local min, max = self.Stats["Projectiles"]["Air Damage Range"].min, self.Stats["Projectiles"]["Air Damage Range"].max
						local range = atk:GetPos():Distance(ent:GetPos())
						local XD = 0
						if range < min then
							XD = 0
						else
							XD = math.Clamp((range - min) / (max - min), 0, 1)
						end

						dmg:SetDamage( Lerp(XD, self.Stats["Projectiles"]["Damage"].max, self.Stats["Projectiles"]["Damage"].min) )
					end

					if ent:IsPlayer() then
						local d = dmg:GetDamage()
						if ent:Armor() >= d then
							dmg:SetDamage(0)
							if SERVER then ent:SetArmor(ent:Armor() - d + 1) end--print(ent:Armor(), ent:Armor() - d) ent:SetArmor(ent:Armor() - d + 1) print(ent:Armor()) end
						elseif ent:Armor() >= 0 then
							dmg:SetDamage(d - ent:Armor())
							if self.Stats["Projectiles"]["Can Headshot"] and tr.HitGroup == HITGROUP_HEAD then dmg:ScaleDamage(9000) end
							if SERVER then ent:SetArmor(0) end
						end
					end
					return
				end
			} )
		else
			if SERVER then
				tg:LagCompensation(true)
				local bull = ents.Create(self.Stats["Projectiles"]["Class"])
				local offs = self.Stats["Projectiles"]["Offset"] or vector_origin
				local po = tg:EyePos()
				local pa = (tg:EyeAngles() + deviat)
				bull:SetPos( po + (pa:Right() * offs.x) + (pa:Forward() * offs.y) + (pa:Up() * offs.z) )
				bull:SetAngles( tg:EyeAngles() + deviat )
				bull:SetOwner( tg )
				bull.Weaap = self
				bull:Spawn()

				bull:GetPhysicsObject():SetVelocityInstantaneous((tg:EyeAngles() + deviat):Forward()*self.Stats["Projectiles"]["Velocity"])
				tg:LagCompensation(false)
			end
		end
	end

	if self.Sound.Firing then
		if istable(self.Sound.Firing) then
			for i, v in pairs(self.Sound.Firing) do
				self:EmitSound(v)
			end
		else
			self:EmitSound(self.Sound.Firing)
		end
	end

	self:SetFireDelay( CurTime() + ( 1 / Lerp( self:GetAccelFirerate(), self.Stats["Firing"]["Rounds Per Second"].min, self.Stats["Firing"]["Rounds Per Second"].max ) ) )
	self:SetFireRecoveryDelay( CurTime() + self.Stats["Firing"]["Fire Recovery Time"] )
	self:SetClip1(self:Clip1() - self.Stats["Firing"]["Rounds Per Shot"] )
	self:SetBurstCount(self:GetBurstCount() + 1)
	if self.Stats["Heat"] and self.Stats["Heat"]["Heat Generated Per Round"] then
		self:SetAccelHeat( math.Clamp(self:GetAccelHeat() + self.Stats["Heat"]["Heat Generated Per Round"], 0, 11) )
	end

	self:SendAnim( self:SelAnims().fire, 1 )
	self.bopset = VectorRand() * (self.Stats["Firing"]["Recoil mult"] or 2)

	if self:GetOwner() and self:GetOwner():IsPlayer() then
		local p = self:GetOwner()
		local fun = funks["Linear"]
		local fuckly = 0

		if self.Stats["Recoil"] then
			local trolly = self.Stats["Recoil"]["Change Per Shot"]
			fun = funks[ self.Stats["Recoil"]["Function"] ]

			-- 
			--fuckly() fun( trolly["Acceleration Rate"], trolly["Deceleration Rate"], )

			fuckly = Lerp( fun(self:GetAccelRecoil()), trolly.min, trolly.max )
		end

		p:SetEyeAngles( p:EyeAngles() + Angle( fuckly * (-1), 0, 0 ) )
	end
	--bapset = AngleRand()/180 * 0.33


end

function SWEP:Melee()
	if self:GetHolster_Time() != 0 then return false end
	if !self.Stats["Melee"] then return false end
	self:ExitZoom()
	if self:GetMeleeDelay() > CurTime() then return false end
	if self:GetMeleed() then return false end
	if !(self:SelAnims().melee) then return false end
	self:SetMeleed(true)

	self:SendAnim( self:SelAnims().melee, 1 )
	self:SetReloadDelay( CurTime() + self:GetVM(1):SequenceDuration() )
	self:SetReloadLoadDelay( 0 )
	self:SetReloadingState( false )
end

function SWEP:SecondaryAttack()
end
function SWEP:EnterZoom()
	if !self.Stats["Zoom"] then return false end
	--if self:GetZoomed() and ( self:GetZoomTime() != 1 and self:GetZoomTime() != 0 ) and ( self:GetZoom2Time() != 1 and self:GetZoom2Time() != 0 ) then return false end
	if self:GetZoomed() then
		local next = self:GetMagnificationLevel() + 1
		if self.Stats["Zoom"]["Magnification Levels"] <= next then
			self:ExitZoom()
			return false
		else
			self:SetMagnificationLevel(next)
			self:SetZoom2Time(0)
		end
	end
	if self:GetReloadDelay() > CurTime() then return false end
	if self:GetGrenadeDelay() > CurTime() then return false end
	if self:GetHolster_Time() != 0 then return false end
	self:SetFidgetAnimTime(math.huge)
	
	if self.Sound.ZoomIn then self:EmitSound(self.Sound.ZoomIn) end
	self:SetZoomed(true)
end

function SWEP:ExitZoom()
	if !self:GetZoomed() then return end
	self:SetMagnificationLevel(0)
	self:SetFidgetAnimTime(CurTime()+10)

	if self.Sound.ZoomOut then self:EmitSound(self.Sound.ZoomOut) end
	self:SetZoomed(false)
end

function SWEP:ShouldDrawViewModel()
	return !self:GetZoomed()
end

function SWEP:MeleeStrike()
	local bz = 8
	self:GetOwner():LagCompensation(true)
	local tr = util.TraceHull( {
		start = self:GetOwner():EyePos(),
		endpos = self:GetOwner():EyePos() + ( self:GetOwner():EyeAngles():Forward() * self.Stats["Melee"]["Range"] ),
		filter = self:GetOwner(),
		mins = vector_origin,
		maxs = Vector( bz, bz, bz ),
		mask = MASK_SHOT_HULL
	} )
	self:GetOwner():LagCompensation(false)

	if tr.Hit then
		if tr.Entity:IsValid() then
			local ent = tr.Entity

			if SERVER then
				local dmg = DamageInfo()
				dmg:SetAttacker( self:GetOwner() or self )
				ent:EmitSound( "physics/body/body_medium_break2.wav" )
				dmg:SetDamage( self.Stats["Melee"]["Damage"] )
				dmg:SetDamageType( DMG_CLUB )
				dmg:SetDamageForce( self:GetOwner():GetAngles():Forward()*30000 )

				if ent:IsPlayer() then
					local d = dmg:GetDamage()
					if ent:Armor() >= d then
						dmg:SetDamage(0)
						ent:SetArmor(ent:Armor() - d + 1)
					elseif ent:Armor() >= 0 then
						dmg:SetDamage(d - ent:Armor())
						ent:SetArmor(0)
					end
				end

				ent:TakeDamageInfo( dmg )
			end

			local effectdata = EffectData()
			effectdata:SetOrigin( tr.HitPos )
			util.Effect( "BloodImpact", effectdata )			
		end

		self:EmitSound("Flesh.ImpactHard")
		
		if !tr.HitSky and IsFirstTimePredicted() then
			local effectdata = EffectData()
			effectdata:SetOrigin( tr.HitPos )
			effectdata:SetStart( tr.StartPos )
			effectdata:SetEntity( IsValid(tr.Entity) and tr.Entity or tr.HitWorld and game.GetWorld() )
			effectdata:SetDamageType( DMG_CLUB )
			effectdata:SetSurfaceProp( tr.SurfaceProps )
			util.Effect( "Impact", effectdata )
		end
	end

end