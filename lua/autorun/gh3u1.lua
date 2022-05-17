
GH3 = {}
GH3.U_Max = 1
GH3.U_Halo = 0.01
GH3.U_Meters = 0.03048

function GH3.Explosion(origin, attacker, inflictor, radius, info)

	local dettest = ents.FindInSphere(origin, radius)

	for i, ent in pairs(dettest) do
		if !IsValid(ent) then continue end
		--if ent:Health() > 0 then
			local dmg_m = info.dmin
			local dmg_a = info.dmax
			local ran_m = info.rmin
			local ran_a = info.rmax
			local asdsa = math.max( origin:Distance( ent:GetPos() + ent:OBBCenter() ) - vector_origin:Distance( ent:OBBCenter() ) - 8, 0 )

			local dmg = DamageInfo()
			dmg:SetDamage( dmg_a )
			dmg:SetDamageType(DMG_BLAST + DMG_PREVENT_PHYSICS_FORCE)
			dmg:SetDamagePosition(origin)
			if IsValid(attacker) then dmg:SetAttacker(attacker) end
			if IsValid(inflictor) then dmg:SetInflictor(inflictor) end

			local XD = 1
			local min, max = ran_m, ran_a
			local range = asdsa
			if range < min then
				XD = 0
			else
				XD = math.Clamp((range - min) / (max - min), 0, 1)
			end
			local entpos = (ent:GetPos() + ent:OBBCenter())
			if IsValid(ent:GetPhysicsObject()) then
				ent:GetPhysicsObject():SetVelocity( (entpos - origin):GetNormalized() * Lerp(1-XD, 0, info.physvelocity or info.velocity) )
			else
				ent:SetVelocity( (entpos - origin):GetNormalized() * Lerp(1-XD, 0, info.velocity) )
			end
			dmg:SetDamage( Lerp(XD, dmg_a, dmg_m) )
			dmg:SetDamageForce(	(entpos - origin):GetNormalized() * Lerp(1-XD, 0, info.dmgvelocity) )
				--debugoverlay.Line(entpos, origin, 3)
				--print(ent, dmg:GetDamage(), range)

			if ent:IsPlayer() then
				local d = dmg:GetDamage()
				if ent:Armor() >= d then
					dmg:SetDamage(0)
					if SERVER then ent:SetArmor(ent:Armor() - d + 1) end
				elseif ent:Armor() >= 0 then
					dmg:SetDamage(d - ent:Armor())
					if SERVER then ent:SetArmor(0) end
				end
			end

			ent:TakeDamageInfo(dmg)
		--end
	end

end

hook.Add("StartCommand", "GH3_StartCommand", function( ply, cmd )
	local wep = ply:GetActiveWeapon()
	if IsValid(wep) and wep.GH3 then

	-- Holstering
	if wep:GetHolster_Time() != 0 and wep:GetHolster_Time() <= CurTime() then
		if IsValid(wep:GetHolster_Entity()) then
			wep:SetHolster_Time(-math.huge)
			cmd:SelectWeapon(wep:GetHolster_Entity())
		end
	end

	end
end)

local hmne			= { false, false, true, false }

local lastzoom = 0
hook.Add("Move", "GH3_Move", function( ply, mv )
	local wep = ply:GetActiveWeapon()
	if IsValid(wep) and wep.GH3 then
		ply:SetCanZoom(false)
		local iu = mv:KeyDown(IN_USE)
		
		if iu then
			if mv:KeyDown(IN_ATTACK) then
				wep:ThrowGrenade()
			elseif mv:KeyDown(IN_ATTACK2) then
				wep:ThrowGrenade(true) -- Equipment
			end
		elseif mv:KeyDown(IN_ATTACK2) then
			wep:Melee()
		end

		-- Zoom
		if mv:KeyPressed(IN_ZOOM) then
			lastzoom = CurTime()
			wep:EnterZoom()
		end
		if mv:KeyReleased(IN_ZOOM) and lastzoom < CurTime() - 0.3 then
			wep:ExitZoom()
		end

		-- inspek
		if mv:KeyPressed(IN_RELOAD) and mv:KeyDown(IN_WALK) then
			wep:SetFidgetAnimTime(CurTime())
		end
	else
		ply:SetCanZoom(true)
	end
end)

hook.Add( "OnDamagedByExplosion", "GH3_OnDamagedByExplosion", function( ply, dmginfo )
	if IsValid(dmginfo:GetInflictor()) and dmginfo:GetInflictor().GH3_NoDSP then
		return true
	end
end )