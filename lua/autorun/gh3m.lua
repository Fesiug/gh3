


local langu = "en"
local prefix = "gh3m/multiplayer_" .. langu .. "/"

local m_id = {
	[0]		= "doublekill",		-- 2 kills in 4 seconds
	[1]		= "triplekill",		-- 3 kills in 4 seconds
	[2]		= "overkill",		-- 4 kills in 4 seconds
	[3]		= "killtacular",	-- 5 kills in 4 seconds
	[4]		= "killtrocity",	-- 6 kills in 4 seconds
	[5]		= "killmanjaro",	-- 7 kills in 4 seconds
	[6]		= "killtastrophe",	-- 8 kills in 4 seconds
	[7]		= "killpocalypse",	-- 9 kills in 4 seconds
	[8]		= "killionaire",	-- 10 kills in 4 seconds

	[9]		= "perfection",		-- win a slayer with 15+ kills with no deaths
	
	[10]	= "killingspree",	-- 5 kills in a row without dying
	[11]	= "killingfrenzy",	-- 10 kills in a row without dying
	[12]	= "runningriot",	-- 15 kills in a row without dying
	[13]	= "rampage",		-- 20 kills in a row without dying
	[14]	= "untouchable",	-- 25 kills in a row without dying
	[15]	= "invincible",		-- 30 kills in a row without dying

	[16]	= "suicide",		-- killed by self
	[17]	= "killjoy",		-- end someones killing spree
	[18]	= "grave",			-- kill someone while you're dead

	[33]	= "extermination",	-- wipe out an enemy team with an overkill
}

local clr_ks = Color(244, 189, 5)
local clr_lt = Color(192, 191, 230)
local clr_mi = Color(255, 160, 68)

local m_stats = {
	["doublekill"]		= {
		name = "Double Kill!",
		desc = "2 kills within 4 seconds.",
		color = clr_ks,
		snd = "flavor/double_kill[double_kill]",
	},
	["triplekill"]		= {
		name = "Triple Kill!",
		desc = "3 kills within 4 seconds.",
		color = clr_ks,
		snd = "flavor/triple_kill[triple_kill]",
	},
	["overkill"]		= {
		name = "Overkill!",
		desc = "4 kills within 4 seconds!",
		color = clr_ks,
		snd = "flavor/overkill[overkill]",
	},
	["killtacular"]		= {
		name = "Killtacular!",
		desc = "5 kills within 4 seconds!",
		color = clr_ks,
		snd = "flavor/killtacular[killtacular]",
	},
	["killtrocity"]		= {
		name = "Killtrocity!",
		desc = "6 kills within 4 seconds!",
		color = clr_ks,
		snd = "flavor/killtrocity[killtrocity]",
	},
	["killmanjaro"]		= { 
		name = "Killimanjaro!",
		desc = "7 kills within 4 seconds!",
		color = clr_ks,
		snd = "flavor/killimanjaro[killimanjaro]",
	},
	["killtastrophe"]	= {
		name = "Killtastrophe!",
		desc = "8 kills within 4 seconds!",
		color = clr_ks,
		snd = "flavor/killtastrophe[killtastrophe]",
	},
	["killpocalypse"]	= {
		name = "Killpocalypse!",
		desc = "9 kills within 4 seconds!",
		color = clr_ks,
		snd = "flavor/killpocalypse[killpocalypse]",
	},
	["killionaire"]		= {
		name = "Killionaire!",
		desc = "10 kills within 4 seconds!!",
		color = clr_ks,
		snd = "flavor/killionaire[killionaire]",
	},

	["perfection"]		= {
		name = "Perfection!",
		desc = "Win with over 15 kills without dying.",
		snd = "misc/perfection[perfection]",
	},

	["killingspree"]	= {
		name = "Killing Spree!",
		desc = "5 kills in a row without dying.",
		color = clr_lt,
		snd = "flavor/killing_spree[killing_spree]",
	},
	["killingfrenzy"]	= {
		name = "Killing Frenzy!",
		desc = "10 kills in a row without dying!",
		color = clr_lt,
		snd = "flavor/killing_frenzy[killing_frenzy]",
	},
	["runningriot"]		= {
		name = "Running Riot!",
		desc = "15 kills in a row without dying!",
		color = clr_lt,
		snd = "flavor/running_riot[running_riot]",
	},
	["rampage"]			= {
		name = "Rampage!",
		desc = "20 kills in a row without dying!",
		color = clr_lt,
		snd = "flavor/rampage[rampage]",
	},
	["untouchable"]		= {
		name = "Untouchable!",
		desc = "25 kills in a row without dying!!",
		color = clr_lt,
		snd = "flavor/untouchable[untouchable]",
	},
	["invincible"]		= {
		name = "Invincible!",
		desc = "30 kills in a row without dying!!",
		color = clr_lt,
		snd = "flavor/invincible[invincible]",
	},

	["suicide"]			= { 
		--name = "Suicide...",
		snd = "general/suicide[suicide]",
	},
	["killjoy"]			= {
		name = "Killjoy!",
		color = clr_mi,
		desc = "End an opponent's killing spree.",
		snd = "flavor/killjoy[killjoy]",
	},
	["grave"]			= {
		name = "Death from the Grave!",
		color = clr_mi,
	},
	["extermination"]	= {
		name = "Extermination!",
		color = clr_mi,
		snd = "flavor/extermination[extermination]",
	},
}



if SERVER then
	util.AddNetworkString("GH3M_SendMedal")
	util.AddNetworkString("GH3M_GetDoubleKill")

	function MedalSend(ply, medal)
		--print(medal)
		net.Start("GH3M_SendMedal")
			net.WriteUInt(medal, 8)
		net.Send(ply)
	end

	function MedalUpdate(ply)
		if ply:IsPlayer() then
			net.Start("GH3M_GetDoubleKill")
				net.WriteFloat(ply.DoubleKill)
				net.WriteUInt(ply.DoubleCount, 8)
				net.WriteUInt(ply.KillingSpree, 16)
			net.Send(ply)
		end
	end

	function AddKill(ply)
		ply.DoubleKill = CurTime()
		ply.DoubleCount = ( ply.DoubleCount and ply.DoubleCount + 1 ) or 1
		ply.KillingSpree = ( ply.KillingSpree and ply.KillingSpree + 1 ) or 1
		MedalUpdate(ply)
	end

	local sta_dblkils = {
		[2] 	= 0,
		[3] 	= 1,
		[4] 	= 2,
		[5] 	= 3,
		[6] 	= 4,
		[7] 	= 5,
		[8]		= 6,
		[9]		= 7,
		[10]	= 8,
		--[15]	= 9,
	}

	local sta_kilspre = {
		[5] 	= 10,
		[10] 	= 11,
		[15] 	= 12,
		[20] 	= 13,
		[25] 	= 14,
		[30]	= 15,
	}

	function CheckCools(ply)
		if sta_dblkils[ply.DoubleCount] then
			MedalSend(ply, sta_dblkils[ply.DoubleCount])
		end
		if sta_kilspre[ply.KillingSpree] then
			MedalSend(ply, sta_kilspre[ply.KillingSpree])
		end
		
		if player.GetCount() >= 2 then
			local extermination = false
			for i, v in ipairs( player.GetAll() ) do
				if v == ply then continue end
				if v:Alive() then extermination = true end
			end
			if !extermination and !ply.ExterminationGot and ply.DoubleCount >= 4 then ply.ExterminationGot = false MedalSend(ply, 33) end
		end
	end
	
	function MedalReset(ply)
		ply.KillingSpree = 0
		ply.DoubleKill = -math.huge
		ply.DoubleCount = 0
		ply.ExterminationGot = false
		MedalUpdate(ply)
	end

	hook.Add("PlayerSpawn", "GH3M_PlayerSpawn", function(ply)
		MedalReset(ply)
	end)

	hook.Add("PlayerDeath", "GH3M_PlayerDeath", function( ply, inf, atk )
		if atk:IsPlayer() then
			if atk == ply then
				MedalSend(atk, 16)
			else
				AddKill(atk)
				CheckCools(atk)
				if ply.KillingSpree and ply.KillingSpree >= 5 then
					MedalSend(atk, 17)
				end
				if !atk:Alive() then
					MedalSend(atk, 18)
				end
			end
		else
			AddKill(atk)
		end
		MedalReset(ply)
	end)
	
	hook.Add( "OnNPCKilled", "ExplosionEffectOnNPCDeath", function( npc, atk, inf )
		if atk:IsPlayer() then
			AddKill(atk)
			CheckCools(atk)
			if !atk:Alive() then
				MedalSend(atk, 18)
			end
			if npc.KillingSpree and npc.KillingSpree >= 5 then
				MedalSend(atk, 17)
			end
		else
			AddKill(atk)
		end
	end)

	hook.Add("Think", "GH3M_Think", function()
		for i, ply in ipairs(player.GetAll()) do

			if ply.DoubleKill and ply.DoubleKill + 4 < CurTime() then
				ply.DoubleCount = 0
			end
		end
	end)
else
	local queue = {}
	local lockout = 0
	net.Receive("GH3M_GetDoubleKill", function()
		LocalPlayer().DoubleKill = net.ReadFloat()
		LocalPlayer().DoubleCount = net.ReadUInt(8)
		LocalPlayer().KillingSpree = net.ReadUInt(16)
	end)
	net.Receive("GH3M_SendMedal", function()
		local uint = net.ReadUInt(8)
		local medal = m_stats[ m_id[uint] ]

		if medal.name then
			chat.AddText( medal.color, medal.name )
		end
		if medal.desc then
			chat.AddText( Color( Lerp( 0.7, medal.color.r, 190 ), Lerp( 0.7, medal.color.g, 190 ), Lerp( 0.7, medal.color.b, 190 ) ), " - " .. medal.desc )
		end
		table.insert(queue, { t = CurTime(), medal = uint } )
	end)
	hook.Add("Think", "GH3M_ThinkCL", function()
		--PrintTable(queue)
		for i, v in SortedPairsByMemberValue(queue, t, false) do
			if m_stats[m_id[v.medal]].snd then
				if v.t > CurTime() then continue end
				if lockout > CurTime() then continue end
				LocalPlayer():EmitSound(prefix .. m_stats[m_id[v.medal]].snd .. ".wav", 0, 100, 1, CHAN_VOICE2)
				queue[i] = nil
				lockout = CurTime() + 1.5
			end
		end
	end)
	hook.Add("HUDPaint", "GH3M_Medals", function()
		if (LocalPlayer().DoubleKill + 4) > CurTime() then
			local cs = Color(63, 63, 63, 127)
			local text = math.Round( 10 * (4 - (CurTime() - (LocalPlayer().DoubleKill or 0)) ))
			text = tostring(text)
			if #text == 1 then
				text = "0" .. text
			end
			text = string.Left( text, #text-1 ) .. "." .. string.Right(text, 1)
			text = "[ " .. text .. " ]"
			surface.SetFont("DermaLarge")
			surface.SetTextPos( ScrW()/2 - (surface.GetTextSize(text)*0.5) + 1, 200 + 1 )
			surface.SetTextColor(cs)
			surface.DrawText(text)

			surface.SetTextPos( ScrW()/2 - (surface.GetTextSize(text)*0.5), 200 )
			surface.SetTextColor(color_white)
			surface.DrawText(text)

			text = "KILLSTREAK"
			surface.SetFont("DermaDefaultBold")
			surface.SetTextPos( ScrW()/2 - (surface.GetTextSize(text)*0.5) + 1 + 1, 200-11 + 1 )
			surface.SetTextColor(cs)
			surface.DrawText(text)

			surface.SetTextPos( ScrW()/2 - (surface.GetTextSize(text)*0.5) + 1, 200-11 )
			surface.SetTextColor(color_white)
			surface.DrawText(text)
		end
	end)
end