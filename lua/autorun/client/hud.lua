
local ss = ScreenScale(1) * 0.8

surface.CreateFont( "gh3_debug1", {
	font = "Consolas",
	size = ss*64*0.4,
} )
surface.CreateFont( "gh3_debug2", {
	font = "Consolas",
	size = ss*32*0.4,
} )
surface.CreateFont( "gh3_debug3", {
	font = "Consolas",
	size = ss*24*0.4,
} )
surface.CreateFont( "gh3_debug4", {
	font = "Consolas",
	size = ss*48*0.4,
} )
surface.CreateFont( "gh3_debug5", {
	font = "Consolas",
	size = ss*14*0.4,
} )

local quickie = {
	"F",
	"P",
	"S",
	"I",
}

hook.Add("HUDPaint", "GH3_HUD", function()
	--do return end
	local p = LocalPlayer()
	local we = p:GetActiveWeapon()

	--if !IsValid(we) then return end
	if p:GetMoveType() == MOVETYPE_NOCLIP then return end
	if !GetConVar("gh3g_hud"):GetBool() then return end

	local s_w, s_h = 0, 0--ScrW()/2, ScrH()/2
	local e_w, e_h = ScrW(), ScrH()--ScrW()/2, ScrH()/2
	local border = ss*26--8

	--surface.SetDrawColor( Color(0, 0, 0, 63) )
	--surface.DrawOutlinedRect(s_w, s_h, e_w, e_h, border)

	if IsValid(we) then	-- Right gun
		local x, y, w, h = s_w + e_w - border - ss*80, s_h + border, ss*80, ss*26
		local bun = 0

		surface.SetDrawColor( Color(0, 0, 0, 127) )
		surface.DrawRect( x, y, w, h )
		surface.SetTextColor( color_white )

		surface.SetFont( "gh3_debug1" )
		bun = surface.GetTextSize( we:Clip1() ) / 2
		surface.SetTextPos( x + ( w * (1/4) ) - bun, y + ss*0 )
		surface.DrawText( we:Clip1() )

		surface.SetDrawColor( color_white )
		surface.DrawRect( x + ( w * (2/4) ) - (ss*1/2), y + (h*(1/6)), ss*1, h*(2/3))

		local amo = we.GH3 and we:GetAmmo() or p:GetAmmoCount( we:GetPrimaryAmmoType() )
		surface.SetFont( "gh3_debug4" ) 
		bun = surface.GetTextSize( amo ) / 2
		surface.SetTextPos( x + ( w * (3/4) ) - bun, y + ss*3.5 )
		surface.DrawText( amo )
	end

	if false then	-- Left gun
		local x, y, w, h = s_w + border, s_h + border, ss*80, ss*26
		local bun = 0

		surface.SetDrawColor( Color(0, 0, 0, 127) )
		surface.DrawRect( x, y, w, h )
		surface.SetTextColor( color_white )

		surface.SetFont( "gh3_debug1" )
		bun = surface.GetTextSize( we:Clip1() ) / 2
		surface.SetTextPos( x + ( w * (1/4) ) - bun, y + ss*0 )
		surface.DrawText( we:Clip1() )

		surface.SetDrawColor( color_white )
		surface.DrawRect( x + ( w * (2/4) ) - (ss*1/2), y + (h*(1/6)), ss*1, h*(2/3))

		surface.SetFont( "gh3_debug4" ) 
		bun = surface.GetTextSize( we:GetAmmo() ) / 2
		surface.SetTextPos( x + ( w * (3/4) ) - bun, y + ss*3.5 )
		surface.DrawText( we:GetAmmo() )
	elseif false then
		local x, y, w, h = s_w + border, s_h + border, ss*35, ss*22
		for i=1, 4 do
			surface.SetDrawColor( Color(0, 0, 0, 127) )
			surface.DrawRect( x, y, w, h )

			surface.SetFont( "gh3_debug2" )
			surface.SetTextPos( x + ss*3, y + ss*0 )
			surface.DrawText( quickie[i] )

			local amt = 0
			surface.SetFont( "gh3_debug4" )
			bun = surface.GetTextSize( amt ) / 2
			surface.SetTextPos( x + ( w * (2/4) ) - bun, y + ss*1.25 )
			surface.DrawText( amt )

			x = x + (ss*35) + (ss*1)
		end
		

	end

	do	-- Shield
		local x, y, w, h = s_w + e_w/2 - ss*60, s_h + border, ss*120, ss*14
		local bun = 0

		surface.SetDrawColor( Color(0, 0, 0, 127) )
		surface.DrawRect( x, y, w, h )
		surface.SetTextColor( color_white )

		surface.SetFont( "gh3_debug2" )
		bun = surface.GetTextSize( math.Round(p:Armor()/p:GetMaxArmor()*100) .. "%" ) / 2
		surface.SetTextPos( x + ( w * (1/2) ) - bun, y + ss*0 )
		surface.DrawText( math.Round(p:Armor()/p:GetMaxArmor()*100) .. "%" )

		
		x = x + (w/6)
		w = w*0.6667
		y = y + h + ss*1
		h = h*0.75
		surface.SetDrawColor( Color(0, 0, 0, 127) )
		surface.DrawRect( x, y, w, h )

		surface.SetFont( "gh3_debug3" )
		bun = surface.GetTextSize( math.Round(p:Health()/p:GetMaxHealth()*100) .. "%" ) / 2
		surface.SetTextPos( x + ( w * (1/2) ) - bun, y + ss*0 )
		surface.DrawText( math.Round(p:Health()/p:GetMaxHealth()*100) .. "%" )
	end

	if false then	-- Motion tracker
		local x, y, w, h = s_w + border, s_h + e_h - border - ss*90, ss*90, ss*90
		local bun = 0

		surface.SetDrawColor( Color(0, 0, 0, 127) )
		surface.DrawRect( x, y, w, h )
		surface.SetTextColor( color_white )

		surface.SetFont( "gh3_debug2" )
		bun = surface.GetTextSize( "25m" ) / 2
		surface.SetTextPos( x + ss*18 - bun, y + ss*90 - ss*16 )
		surface.DrawText( "25m" )
	end

	do	-- Score
		local x, y, w, h = s_w + e_w - border - ss*80, s_h + e_h - border - ss*26, ss*80, ss*26
		local bun = 0
		
		local time = CurTime()
		local dop = ents.FindByClass( "gh3r_info" )
		if IsValid(dop[1]) then
			local en = dop[1]
			time = en:GetRoundEnd() - (CurTime() - en:GetRoundStart())
		end

		surface.SetDrawColor( Color(0, 0, 0, 127) )
		surface.DrawRect( x, y, w, h )
		surface.SetTextColor( color_white )

		surface.SetFont( "gh3_debug2" )
		local sg = string.FormattedTime(time)--{ h = 0, m = 9, s = 49 }
		local stre = string.format( ":%02i", sg.s )
		if sg.h > 0 then
			stre = sg.h .. ":" .. string.format( "%02i", sg.m ) .. stre
		elseif sg.m > 0 then
			stre = sg.m .. stre
		end
		--local stre = string.FormattedTime( (360*60)-CurTime() )
		--stre = ( stre.h and stre.h .. ":" or "" ) .. string.format( "%02i:%02i", stre.m, stre.s )
		bun = surface.GetTextSize( stre ) / 2
		surface.SetTextPos( x + w - bun*2 - ss*4, y - ss*(12+10) )
		surface.DrawText( stre )

		surface.SetFont( "gh3_debug2" )
		local stre = gmod.GetGamemode().Name
		bun = surface.GetTextSize( stre ) / 2
		surface.SetTextPos( x + w - bun*2 - ss*4, y - ss*12 )
		surface.DrawText( stre )

		surface.SetDrawColor( Color(167, 59, 59, 255) )
		surface.DrawRect( x + ss*2, y + ss*2, w - ss*4, h/2 - ss*4 )
		surface.SetDrawColor( Color(167*1.25, 59*1.25, 59*1.25, 255) )
		surface.DrawRect( x + ss*2, y + ss*2, Lerp( p:Frags()/math.huge, ss*2, w - ss*4), h/2 - ss*4 )

		surface.SetFont( "gh3_debug3" )
		local stre = p:Frags()
		bun = surface.GetTextSize( stre ) / 2
		surface.SetTextPos( x + ss*5, y + ss*1.75 )
		surface.DrawText( stre )

		surface.SetDrawColor( Color(61, 105, 167, 255) )
		surface.DrawRect( x + ss*2, y + ss*2 + h/2, w - ss*4, h/2 - ss*4 )
		surface.SetDrawColor( Color(61*1.25, 105*1.25, 167*1.25, 255) )
		surface.DrawRect( x + ss*2, y + ss*2 + h/2, Lerp( p:Deaths()/math.huge, ss*2, w - ss*4), h/2 - ss*4 )

		surface.SetFont( "gh3_debug3" )
		local stre = p:Deaths()
		bun = surface.GetTextSize( stre ) / 2
		surface.SetTextPos( x + ss*5, y + ss*1.75 + h/2 )
		surface.DrawText( stre )
	end
end)
















hook.Add("HUDDrawScoreBoard", "GH3_Scoreboard", function() end)

hook.Add("HUDPaintBackground", "LOL", function()
	--[[local frac = 0.5
	local sw, sh = 1600, 900

	surface.SetDrawColor(0, 0, 0, 255)

	surface.DrawRect(0, 0, ScrW(), ScrH())

	-- coop 1
	render.RenderView( {
		origin = EyePos(),
		angles = EyeAngles(),
		x = sw*0.5/2, y = 0,
		w = sw*0.5, h = sh*0.5
	} )

	-- coop 2
	local p2 = Player(3)
	if p2 then
		render.RenderView( {
			origin = p2:EyePos(),
			angles = p2:EyeAngles(),
			x = sw*0.5/2, y = ScrH()/2,
			w = sw*0.5, h = sh*0.5
		} )
	end]]
end)

function ScaleFOVByWidthRatio( fovDegrees, ratio )
	local halfAngleRadians = fovDegrees * ( 0.5 * math.pi / 180 )
	local t = math.tan( halfAngleRadians )
	t = t * ratio
	local retDegrees = ( 180 / math.pi ) * math.atan( t )
	return retDegrees * 2
end

concommand.Add("gh3_debug_fov", function( ply, cmd, args )
	print( args[1] or 90, ScaleFOVByWidthRatio( args[1] or 90, ( (args[2] or 4) / (args[3] or 3) ) / (4/3) ) )
end)

function woob( fovDegrees, ratio )
	return ScaleFOVByWidthRatio( fovDegrees, ratio )
end

gameevent.Listen( "player_spawn" )
hook.Add("player_spawn", "BEEP!", function( data )
	if data.userid == LocalPlayer():UserID() then
		LocalPlayer():ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 0.25, 0.06 )
	end
end)

hook.Add("HUDPaint", "GH3_Info", function()
	local dop = ents.FindByClass( "gh3r_info" )
	if IsValid(dop[1]) then
		local en = dop[1]

		surface.SetFont("DermaDefault")
		surface.SetTextColor(color_white)

		surface.SetTextPos(16, 72)
		surface.DrawText("Found " .. #dop .. " GH3Rs")

		surface.SetTextPos(16, 72+16)
		surface.DrawText(" - Round start " .. en:GetRoundStart() or 0)

		surface.SetTextPos(16, 72+32)
		surface.DrawText(" - Round duration " .. en:GetRoundEnd() or 0)
	end
end)

--[[local gloa = {}

gloa.res = {}
gloa.res.w = 1280
gloa.res.h = 720

gloa.d = {}
gloa.d.border = 32


gloa.f = {}
gloa.f.Score = function() end
gloa.f.Health = function() end
gloa.f.Ammo = function() end]]