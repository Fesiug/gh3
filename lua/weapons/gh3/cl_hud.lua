

function SWEP:PickupAmmo()
	if self.Sound.Ammo then self:EmitSound(self.Sound.Ammo) end
end

function SWEP:DoDrawCrosshair(x, y)
	local bz = 10
	local buz = Vector(bz,bz,bz)
	local p = LocalPlayer()
	local tr = util.TraceHull( {
		start = p:EyePos(),
		endpos = p:EyePos() + ( p:EyeAngles():Forward() * ((1000)) ),
		filter = p,
		mins = -buz,
		maxs = buz,
		mask = MASK_SHOT_HULL
	} )

	surface.SetDrawColor(Color(110, 188, 250))
	if IsValid(tr.Entity) then
		if tr.Entity.Team and tr.Entity:Team() == LocalPlayer():Team() then
			surface.SetDrawColor(Color(0, 255, 0))
		elseif tr.Entity:Health() > 0 then
			surface.SetDrawColor(Color(246, 6, 6))
		end
	end
	

	local hp
	if p:ShouldDrawLocalPlayer() then
		hp = p:GetEyeTraceNoCursor().HitPos:ToScreen()
	else
		local vmc = Angle()
		if self:GetVM(1):GetAttachment(1) then vmc = self:GetVM(1):GetAttachment(1).Ang end
		hp = ((self.soup or EyePos()) + util.AimVector(p:EyeAngles() + (self:GetVM(1):GetAngles() - vmc) + ( p:GetViewPunchAngles() ), p:GetFOV(), ScrW()/2, (ScrH()/2), ScrW(), ScrH())):ToScreen()
	end
	hp.x = ScrW()/2
	hp.y = math.Round(hp.y)

	if self.ReticleData then
		for i, sd in ipairs(self.ReticleData) do
			surface.SetMaterial( sd.mat )
			local x = hp.x + ( sd.x or 0 )
			local y = hp.y + ( sd.y or 0 )

			local w = sd.w
			local h = sd.h
			surface.DrawTexturedRect( ( hp.x ) - w/2, ( hp.y ) - h/2, w, h)
		end
	end

	do return true end

	local col_s = Color(0, 0, 0, 127)
	local wid = 4
	local len = 120
	local dist = 100

	hp.x = 0
	hp.y = 200


	surface.SetTextColor(255, 255, 255, 255)
	surface.SetTextPos(hp.x + (wid/2) + dist, hp.y + len/2)
	surface.SetFont("DermaDefault")
	surface.DrawText("heat, fire, inac, recoil, rec2")

	prog = self:GetAccelHeat()
	if self:GetOverheated() then
		col_s = Color(255, 0, 0, 200)
	end
	surface.SetDrawColor(col_s)
	surface.DrawRect(hp.x - (wid/2) + dist + 4, hp.y - (len/2), wid, len)

	col_s = Color(0, 0, 0, 127)
	surface.SetDrawColor(Color(255, 55, 55))
	surface.DrawRect(hp.x - (wid/2) + dist, hp.y - (len/2) + (len - (len*prog)), wid, len * prog)

	dist = dist + 20
	prog = self:GetAccelFirerate()
	surface.SetDrawColor(col_s)
	surface.DrawRect(hp.x - (wid/2) + dist + 4, hp.y - (len/2), wid, len)

	surface.SetDrawColor(Color(255, 55, 55))
	surface.DrawRect(hp.x - (wid/2) + dist, hp.y - (len/2) + (len - (len*prog)), wid, len * prog)

	dist = dist + 20
	prog = self:GetAccelInaccuracy()
	surface.SetDrawColor(col_s)
	surface.DrawRect(hp.x - (wid/2) + dist + 4, hp.y - (len/2), wid, len)

	surface.SetDrawColor(Color(255, 55, 55))
	surface.DrawRect(hp.x - (wid/2) + dist, hp.y - (len/2) + (len - (len*prog)), wid, len * prog)

	dist = dist + 20
	prog = self:GetAccelRecoil()
	surface.SetDrawColor(col_s)
	surface.DrawRect(hp.x - (wid/2) + dist + 4, hp.y - (len/2), wid, len)

	surface.SetDrawColor(Color(255, 55, 55))
	surface.DrawRect(hp.x - (wid/2) + dist, hp.y - (len/2) + (len - (len*prog)), wid, len * prog)

	if self.Stats["Recoil"] then
		if self.Stats["Recoil"]["Function"] then
			dist = dist + 20
			prog = funks[self.Stats["Recoil"]["Function"]](self:GetAccelRecoil())
			surface.SetDrawColor(col_s)
			surface.DrawRect(hp.x - (wid/2) + dist + 4, hp.y - (len/2), wid, len)

			surface.SetDrawColor(Color(255, 55, 55))
			surface.DrawRect(hp.x - (wid/2) + dist, hp.y - (len/2) + (len - (len*prog)), wid, len * prog)
		end
	end

	return true
end


function SWEP:DrawHUDBackground()
	local p = LocalPlayer()
	local vmc = Angle()
	if self:GetVM(1):GetAttachment(1) then vmc = self:GetVM(1):GetAttachment(1).Ang end
	local hp = ((self.soup or EyePos()) + util.AimVector(p:EyeAngles() + (self:GetVM(1):GetAngles() - vmc), p:GetFOV(), ScrW()/2, (ScrH()/2), ScrW(), ScrH())):ToScreen()
	hp.x = math.Round(hp.x)
	hp.y = math.Round(hp.y)

	if self:GetZoomed() and self.ScopeData then
		for i, sd in ipairs(self.ScopeData) do
			local x = hp.x + ( sd.x or 0 )
			local y = hp.y + ( sd.y or 0 )

			surface.SetMaterial( sd.mat )
			local w = sd.w
			local h = sd.h
			surface.SetDrawColor(0, 0, 0, 255)

			if mattype == 1 then
				surface.DrawTexturedRectRotated( ( x ) - w/2, ( y ) - h/2, w, h, 180 )
				surface.DrawTexturedRectRotated( ( x ) + w/2, ( y ) - h/2, w, h, 90 )
				surface.DrawTexturedRectRotated( ( x ) - w/2, ( y ) + h/2, w * 1, h, 270 )
				surface.DrawTexturedRectRotated( ( x ) + w/2, ( y ) + h/2, w, h, 0 )
			else
				surface.DrawTexturedRectRotated( ( x ), ( y ), w*2, h*2, 0 )
			end

			if sd.border then
				surface.SetDrawColor( sd.borderclr )
				surface.DrawRect( 0, 0, ScrW(), y - (h) )
				surface.DrawRect( 0, y + (h), ScrW(), ( ScrH() - y - h ) )

				surface.DrawRect( 0, y - h, x - w, h*2 )
				surface.DrawRect( x + w, y - h, ScrW() - x - w, h*2 )
			end

		end
	end
end

function SWEP:CustomAmmoDisplay()
	self.AmmoDisplay = self.AmmoDisplay or {}

	self.AmmoDisplay.Draw = true

	self.AmmoDisplay.PrimaryClip = self:Clip1()
	self.AmmoDisplay.PrimaryAmmo = self:GetAmmo()

	return self.AmmoDisplay
end

function SWEP:GetTracerOrigin()
	local posang = self:GetVM(1):GetAttachment(self:GetVM(1):LookupAttachment("m_primary_trigger"))
	if !posang then return self:GetVM(1):GetPos() end
	local pos = posang.Pos

	return pos
end

function SWEP:DrawHUD()
	do return end -----------------------------------

	surface.SetTextColor(color_white)

	surface.SetFont("gh3_debug2")
	surface.SetTextPos(300, ScrH()/2)
	surface.DrawText(self:GetAccelInaccuracy()*100)
end



-- yeha

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	-- Set us up the texture
	surface.SetDrawColor( 255, 255, 255, alpha )
	if self.WepSelect then
		surface.SetMaterial( self.WepSelect )
	else
		surface.SetTexture( self.WepSelectIcon )
	end

	-- Borders
	--[[y = y + 10
	x = x + 10
	wide = wide - 20]]

	--x = x - wide
	--y = y - wide
	wide = wide * 1
	y = y + (wide*0.05)

	-- Draw that mother
	surface.DrawTexturedRect( x, y, wide, ( wide / 2 ) )

	-- Draw weapon info box
	self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )

end


-- yuh

hook.Add( "GetMotionBlurValues", "GH3_MotionBlur", function( horizontal, vertical, forward, rotational )
	if (IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon().GH3) then
		local wep = LocalPlayer():GetActiveWeapon()
		local z1, z2 = wep:GetZoomTime(), wep:GetZoom2Time()
		z1 = math.sin(z1*math.pi/2)
		z2 = math.sin(z2*math.pi/2)
		if z1 > 0 then forward = (1-z1)*1*z1 end
		if z2 > 0 then forward = (1-z2)*1*z2 end
		return horizontal, vertical, forward, rotational
	end
end )