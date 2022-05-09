
local function se(p)
	p.DeathTime2 = CurTime()
	p.doob = {
		[3] = true,
		[2] = true,
		[1] = true,
		[0] = true,
	}
end

hook.Add("PlayerSilentDeath", "BEEP!_PlayerSilentDeath", function( p )
	se(p)
end)

hook.Add("DoPlayerDeath", "BEEP!_DoPlayerDeath", function( p )
	if GetConVar("gh3g_dropallondeath"):GetBool() then
		--p:ShouldDropWeapon(true)
		-- do i need it uhh
	end
end)

hook.Add("PlayerDeath", "BEEP!_PlayerDeath", function( p )
	se(p)
	if GetConVar("gh3g_dropallondeath"):GetBool() then
		for i, v in pairs(p:GetWeapons()) do
			p:DropWeapon(v, Vector(1000, 0, -1))
		end
	end
end)

hook.Add("PlayerDeathThink", "BEEP!_PlayerDeathThink", function( pl )

	if GetConVar("gh3g_deathcam"):GetBool() then
		local retime = GetConVar("gh3g_deathcam"):GetFloat()
		if pl.DeathTime2 and (pl.DeathTime2+retime+0.1) <= CurTime() then
			pl:Spawn()
			pl.LastArmor = pl:Armor()
			net.Start("BEEP!_SetDSP")
				net.WriteUInt(0, 8)
				net.WriteBool(true)
			net.Send(pl)
			return true
		else
			local wham = math.floor( ( ( pl.DeathTime2 or 0 ) - CurTime()) + (retime+1) )
			if !pl.doob then 
				pl.doob = {
					[3] = true,
					[2] = true,
					[1] = true,
					[0] = true,
				}
			end
			if pl.doob[wham] then
				net.Start("BEEP!")
					net.WriteBool(wham == 0)
				net.Send(pl)
				if pl.doob[wham] then
					if wham == 1 then
						pl:ScreenFade( SCREENFADE.OUT, Color( 0, 0, 0, 255 ), 1, 1 )
						net.Start("BEEP!_SetDSP")
							net.WriteUInt(32, 8)
							net.WriteBool(true)
					net.Send(pl)
					end
				end
				pl.doob[wham] = false
			end
			return false
		end

		if pl:IsBot() then
			pl:Spawn()
		end
	end
	
end)

if SERVER then
	util.AddNetworkString("BEEP!")
	util.AddNetworkString("BEEP!_SetDSP")
else
	net.Receive("BEEP!", function(len, pl)
		EmitSound( net.ReadBool() and "GH3U.Respawn" or "GH3U.RespawnCountdown", vector_origin, -1, CHAN_AUTO, 1, 75, 0, 100, 0 )
	end)
	net.Receive("BEEP!_SetDSP", function(len, pl)
		LocalPlayer():SetDSP( net.ReadUInt(8), net.ReadBool() )
	end)
end





local XD = {
	["GH3S.Depleted"]	= (102400/44100),
	["GH3S.Depleted.E"]	= (62464/44100),
	["GH3S.Charge"]		= (107008/44100),
	["GH3S.Charge.E"]	= (124928/44100),
	["GH3S.Low"]		= (160768/44100),
	["GH3S.Low.E"]		= (70144/44100),
}

CreateConVar( "gh3s_enabled", 0, FCVAR_ARCHIVE+FCVAR_REPLICATED+FCVAR_NOTIFY )
CreateConVar( "gh3s_speed", (70/2), FCVAR_ARCHIVE+FCVAR_REPLICATED+FCVAR_NOTIFY )
CreateConVar( "gh3s_delay", 5, FCVAR_ARCHIVE+FCVAR_REPLICATED+FCVAR_NOTIFY )

CreateConVar( "gh3s_h_enabled", 0, FCVAR_ARCHIVE+FCVAR_REPLICATED+FCVAR_NOTIFY )
CreateConVar( "gh3s_h_speed", (45/5), FCVAR_ARCHIVE+FCVAR_REPLICATED+FCVAR_NOTIFY )
CreateConVar( "gh3s_h_delay", 10, FCVAR_ARCHIVE+FCVAR_REPLICATED+FCVAR_NOTIFY )

local fuckow = 0
if SERVER then
	hook.Add("PlayerLoadout", "GH3_Starts", function(ply)
	
		if false then
			timer.Simple(0, function()
				if !IsValid(ply) or !ply:Alive() then return end
				ply:Give( "gh3_battlerifle" )
				ply:Give( "gh3_assaultrifle" )
			end)

			return true
		end
		
	end)
	--[[local models = {
		"black",
		"blue",
		"brown",
		"cobalt",
		"cyan",
		"gray",
		"green",
		"maroon",
		"orange",
		"pink",
		"purple",
		"red",
		"sage",
		"salmon",
		"tan",
		"teal",
		"white",
		"yellow",
	}]]
	local models = {
		"blue",
		"red",
	}
	hook.Add("PlayerSetModel", "GH3_Model", function(ply)
		if false then
			timer.Simple(0, function()
				if !IsValid(ply) or !ply:IsBot() or !ply:Alive() then return end
				ply:SetModel("models/halo1/spartan_" .. models[math.Round(math.random(1, #models))] .. ".mdl" )
			end)
		end
	end)

	local function Think()
		local enabled = GetConVarNumber( "gh3s_enabled" ) > 0
		local speed = 1 / GetConVarNumber( "gh3s_speed" )
		local time = FrameTime()
		
		for _, ply in pairs( player.GetAll() ) do
			if ( ply:Alive() ) then
				local armor = ply:Armor()
		
				if ( armor < ( ply.LastArmor or 0 ) ) then
					ply.ArmorRegenNext = CurTime() + GetConVarNumber( "gh3s_delay" )
					ply:EmitSound("GH3S.Hit")
				end
				
				if ( CurTime() > ( ply.ArmorRegenNext or 0 ) && enabled ) then
					ply.ArmorRegen = ( ply.ArmorRegen or 0 ) + time
					if ( ply.ArmorRegen >= speed ) then
						local add = math.floor( ply.ArmorRegen / speed )
						ply.ArmorRegen = ply.ArmorRegen - ( add * speed )
						if ( armor < ply:GetMaxArmor() || speed < 0 ) then
							ply:SetArmor( math.min( armor + add, ply:GetMaxArmor() ) )
						end
					end
				end
				
				ply.LastArmor = ply:Armor()
			end
		end
	end
	hook.Add( "Think", "armorRegen.Think", Think )
	local function Think2()
		local enabled = GetConVarNumber( "gh3s_h_enabled" ) > 0
		local speed = 1 / GetConVarNumber( "gh3s_h_speed" )
		local time = FrameTime()
		
		for _, ply in pairs( player.GetAll() ) do
			if ( ply:Alive() ) then
				local health = ply:Health()
		
				if ( health < ( ply.LastHealth or 0 ) ) then
					ply.HealthRegenNext = CurTime() + GetConVarNumber( "gh3s_h_delay" )
				end
				
				if ( CurTime() > ( ply.HealthRegenNext or 0 ) && enabled ) then
					ply.HealthRegen = ( ply.HealthRegen or 0 ) + time
					if ( ply.HealthRegen >= speed ) then
						local add = math.floor( ply.HealthRegen / speed )
						ply.HealthRegen = ply.HealthRegen - ( add * speed )
						if ( health < ply:GetMaxHealth() || speed < 0 ) then
							ply:SetHealth( math.min( health + add, ply:GetMaxHealth() ) )
						end
					end
				end
				
				ply.LastHealth = ply:Health()
			end
		end
	end
	hook.Add( "Think", "armorRegen.Think2", Think2 )
else
	local function Think()
		local enabled = GetConVarNumber( "gh3s_enabled" ) > 0
		
		local ply = LocalPlayer()
		if ( ply:Alive() ) then
			local armor = ply:Armor()
	
			if ( armor < ( ply.LastArmor or 0 ) ) then
				fuckow = CurTime() + GetConVarNumber( "gh3s_delay" )
			end
			
			ply.LastArmor = ply:Armor()
		end
	end
	hook.Add( "Think", "armorRegen.Think", Think )
end

if CLIENT then
	CreateConVar("gh3g_shielddown", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)
	CreateConVar("gh3g_deathcam", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)
	CreateConVar("gh3g_monitormode", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)
	CreateConVar("gh3g_hud", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)
	local nextpl = SysTime()
	local lastso = nil
	local lockout = SysTime()
	hook.Add("Think", "GH3_ShieldDown", function()
	
		if GetConVar("gh3g_shielddown"):GetBool() then
			local p = LocalPlayer()
			local sooound = nil

			if !p:Alive() then lockout = SysTime() + 0.1 end

			if (lockout < SysTime()) and p:Armor() < p:GetMaxArmor() then
				if p:Armor() < (p:GetMaxArmor()*0.5) then
					sooound = "GH3S.Low"
				end
				if p:Armor() <= 0 then
					sooound = "GH3S.Depleted"
				end
				if (fuckow or 0) < CurTime() then
					sooound = "GH3S.Charge"
				end
			end
			if false then sooound = sooound .. ".E" end
			if lastso and (lastso != sooound or !p:Alive()) then nextpl = SysTime() p:StopSound(lastso) end
			lastso = sooound
			if sooound and sooound != "NOPE" and p:Alive() then
				if nextpl <= SysTime() then
					p:EmitSound(sooound)
					nextpl = SysTime() + XD[sooound]
				end
			end
		end
		
	end)
	
	local hide = {
		["CHudAmmo"] = true,
		["CHudSecondaryAmmo"] = true,
		["CHudHealth"] = true,
		["CHudBattery"] = true
	}

	local hide_mon = {
		["CHudCrosshair"] = true
	}

	hook.Add( "HUDShouldDraw", "GH3_HideHUD", function( name )
	
		if GetConVar("gh3g_hud"):GetBool() then
			if hide[ name ] then return false end
			if IsValid(LocalPlayer()) and LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP and hide_mon[ name ] then return false end
		end
		
	end )

	hook.Add( "HUDPaint", "GH3_EditorReticle", function()
	
		if GetConVar("gh3g_monitormode"):GetBool() and LocalPlayer():GetMoveType() == MOVETYPE_NOCLIP then
			local x, y = ScrW()/2, ScrH()/2

			if false then--if IsValid(tr.Entity) then
				surface.SetDrawColor(Color(246, 6, 6))
			elseif friendly then
				surface.SetDrawColor(Color(0, 255, 0))
			else
				surface.SetDrawColor(Color(75, 177, 255))
			end
			surface.SetMaterial( Material("gh3/ui/reticles/editor.png", "smooth") )

			local w = ScreenScale(60)
			local h = w
			surface.DrawTexturedRect( ( x ) - w/2, ( y ) - h/2, w, h)
		end
	end )

	local timelastlived = CurTime()
	local lasteyes = vector_origin
	local lasteyesa = angle_zero
	local deead = lasteyes
	hook.Add( "CalcView", "GH3_DeadCam", function( ply, pos, angles, fov )
	
		if GetConVar("gh3g_deathcam"):GetBool() then
			if !ply:Alive() then
				local view = {
					origin = pos,--pos - ( angles:Forward() * 100 ),
					angles = angles,
					fov = fov,
					drawviewer = true
				}

				if IsValid(ply:GetRagdollEntity()) then
					local heuh = ( ( CurTime() - timelastlived ) )
					local hooh = math.min(math.Remap(heuh, 0, 6, 0, 1), 1)
					local rge = ply:GetRagdollEntity()
					local rgel = rge:GetPos() + rge:OBBCenter()

					local tr = util.TraceLine( {
						start = rgel,
						endpos = rgel + view.angles:Forward() * ( -1 * Lerp( hooh, 24, 128 ) ) + LerpVector( hooh, vector_origin, Vector(0, 0, 32) ),
						filter = {ply, ply:GetRagdollEntity()},
					} )

					view.origin = LerpVector( math.pow(math.sin(hooh*math.pi*0.5), 4), deead or vector_origin, tr.HitPos )
					deead = LerpVector( FrameTime()*2, deead, tr.HitPos )
					view.fov = fov + Lerp( math.pow(math.sin(hooh*math.pi*0.5), 4), 0, -30 )
				end

				return view
			else
				timelastlived = CurTime()
				local eyes = ply:GetAttachment(ply:LookupAttachment("eyes"))
				if eyes then
					lasteyes = eyes.Pos--LocalPlayer():EyePos()
					lasteyesa = eyes.Ang--LocalPlayer():EyeAngles()
					deead = lasteyes
				end
			end
		end
		
	end )
else
	CreateConVar("gh3g_dropallondeath", 0, FCVAR_ARCHIVE + FCVAR_REPLICATED)
end

local SV_lastwep = nil
hook.Add( "PlayerNoClip", "Monitor", function( ply, desire )

	if GetConVar("gh3g_monitormode"):GetBool() then
		ply:ScreenFade( SCREENFADE.IN, Color( 0, 0, 0, 255 ), 0.5, 0.06 )
		ply:DrawViewModel( !desire, 0 )
		ply:DrawViewModel( !desire, 1 )
		ply:DrawViewModel( !desire, 2 )
	end
	
end )

hook.Add("PlayerTick", "GH3_HolsterFix", function(ply)
	if !game.SinglePlayer() then
		if !IsValid(ply:GetActiveWeapon()) or ( IsValid(ply:GetActiveWeapon()) and !ply:GetActiveWeapon().GH3 ) then
			if IsValid(ply:GetViewModel(1)) and ply:GetViewModel(1):GetModel() and ply:GetViewModel(1):GetModel():Left(10) == "models/gh3" then
				ply:DrawViewModel( false, 1 )
			end
		end
	end
end)


--[[

if CLIENT then
	hook.Add( "InitPostEntity", "GH3_FullInit", function()
		net.Start( "GH3_FullInit" )
		net.SendToServer()
	end )
end

if SERVER then
	util.AddNetworkString( "GH3_FullInit" )

	net.Receive( "GH3_FullInit", function( len, ply )
		ply:ChatPrint
	end )
end

]]