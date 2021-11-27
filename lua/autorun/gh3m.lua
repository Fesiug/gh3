


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

	[33]	= "extermination",	-- wipe out an enemy team with an overkill
}

local m_stats = {
	["doublekill"]		= {
		name = "Double Kill!",
		snd = "flavor/double_kill[double_kill]",
	},
	["triplekill"]		= {
		name = "Triple Kill!",
		snd = "flavor/triple_kill[triple_kill]",
	},
	["overkill"]		= {
		name = "Overkill!",
		snd = "flavor/overkill[overkill]",
	},
	["killtacular"]		= {
		name = "Killtacular!",
		snd = "flavor/killtacular[killtacular]",
	},
	["killtrocity"]		= {
		name = "Killtrocity!",
		snd = "flavor/killtrocity[killtrocity]",
	},
	["killmanjaro"]		= { 
		name = "Killimanjaro!",
		snd = "flavor/killimanjaro[killimanjaro]",
	},
	["killtastrophe"]	= {
		name = "Killtastrophe!",
		snd = "flavor/killtastrophe[killtastrophe]",
	},
	["killpocalypse"]	= {
		name = "Killpocalypse!",
		snd = "flavor/killpocalypse[killpocalypse]",
	},
	["killionaire"]		= {
		name = "Killionaire!",
		snd = "flavor/killionaire[killionaire]",
	},

	["perfection"]		= {
		name = "Perfection!",
		snd = "misc/perfection[perfection]",
	},

	["killingspree"]	= {
		name = "Killing Spree!",
		snd = "flavor/killing_spree[killing_spree]",
	},
	["killingfrenzy"]	= {
		name = "Killing Frenzy!",
		snd = "flavor/killing_frenzy[killing_frenzy]",
	},
	["runningriot"]		= {
		name = "Running Riot!",
		snd = "flavor/running_riot[running_riot]",
	},
	["rampage"]			= {
		name = "Rampage!",
		snd = "flavor/rampage[rampage]",
	},
	["untouchable"]		= {
		name = "Untouchable!",
		snd = "flavor/untouchable[untouchable]",
	},
	["invincible"]		= {
		name = "Invincible!",
		snd = "flavor/invincible[invincible]",
	},

	["suicide"]			= { 
		--name = "Suicide...",
		snd = "general/suicide[suicide]",
	},
	["killjoy"]			= {
		name = "Killjoy!",
		snd = "flavor/killjoy[killjoy]",
	},
	["extermination"]	= {
		name = "Extermination!",
		snd = "flavor/extermination[extermination]",
	},
}



if SERVER then
	util.AddNetworkString("GH3M_SendMedal")

	function MedalSend(ply, medal)
		--print(medal)
		net.Start("GH3M_SendMedal")
			net.WriteUInt(medal, 8)
		net.Send(ply)
	end

	function AddKill(ply)
		ply.DoubleKill = CurTime()
		ply.DoubleCount = ( ply.DoubleCount and ply.DoubleCount + 1 ) or 1
		ply.KillingSpree = ( ply.KillingSpree and ply.KillingSpree + 1 ) or 1
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
	end

	hook.Add("PlayerSpawn", "GH3M_PlayerSpawn", function(ply)
		ply.KillingSpree = 0
		ply.DoubleKill = CurTime()
		ply.DoubleCount = 0
	end)

	hook.Add("PlayerDeath", "GH3M_PlayerDeath", function( ply, inf, atk )
		if atk:IsPlayer() then
			if atk == ply then
				MedalSend(atk, 16)
			else
				AddKill(atk)
				CheckCools(atk)
				if ply.KillingSpree >= 5 then
					MedalSend(atk, 17)
				end
			end
		end
		ply.KillingSpree = 0
		ply.DoubleKill = CurTime()
		ply.DoubleCount = 0
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
	net.Receive("GH3M_SendMedal", function()
		local uint = net.ReadUInt(8)

		if m_stats[ m_id[uint] ].name then LocalPlayer():ChatPrint( m_stats[ m_id[uint] ].name ) end
		table.insert(queue, { t = CurTime(), medal = uint } )
	end)
	hook.Add("Think", "GH3M_ThinkCL", function()
		--PrintTable(queue)
		for i, v in SortedPairsByMemberValue(queue, t, false) do
			if v.t > CurTime() then continue end
			if lockout > CurTime() then continue end
			LocalPlayer():EmitSound(prefix .. m_stats[m_id[v.medal]].snd .. ".wav", 0, 100, 1, CHAN_VOICE2)
			queue[i] = nil
			lockout = CurTime() + 1.5
		end
	end)
end