


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
	
	[25]	= "ks_sg_5",		-- shotgun spree 5
	[26]	= "ks_sg_10",		-- shotgun spree 10
	
	[27]	= "ks_sword_5",		-- sword spree 5
	[28]	= "ks_sword_10",	-- sword spree 10
	
	--[29]	= "ks_sn_1",		-- sniper headshot
	[30]	= "ks_sn_5",		-- sniper spree 5
	[31]	= "ks_sn_10",		-- sniper spree 10
	
	[32]	= "ks_vehicle",		-- hit and run
	[33]	= "ks_vehicle_5",	-- vehicle kill 5
	[34]	= "ks_vehicle_10",	-- vehicle kill 10
	[35]	= "ks_wheelman",	-- your passenger killed someone

	[99]	= "extermination",	-- wipe out an enemy team with an overkill

	[100]	= "melee",			-- melee kill 
	[101]	= "melee_ninja",	-- melee kill ninja style
}

local clr_ks = Color(244, 189, 5)
local clr_lt = Color(192, 191, 230)
local clr_gr = Color(230, 230, 230)
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

	["melee"]		= {
		name = "Beat Down!",
		desc = "Hit and kill an opponent with a melee attack.",
		color = clr_mi,
	},
	["melee_ninja"]		= {
		name = "Assassin!",
		desc = "Hit and kill an opponent with a melee attack from behind.",
		color = clr_mi,
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

	["ks_sg_5"]	= {
		name = "Shotgun Spree!",
		desc = "5 kills in a row with a shotgun.",
		color = clr_lt,
		snd = "flavor/shotgun_spree[shotgun_spree]",
	},
	["ks_sg_10"]	= {
		name = "Open Season!",
		desc = "10 kills in a row with a shotgun!",
		color = clr_lt,
		snd = "flavor/open_season[open_season]",
	},

	["ks_sword_5"]	= {
		name = "Sword Spree!",
		desc = "5 kills in a row with a sword.",
		color = clr_lt,
		snd = "flavor/sword_spree[sword_spree]",
	},
	["ks_sword_10"]	= {
		name = "Slice 'N Dice!",
		desc = "10 kills in a row with a sword!",
		color = clr_lt,
		snd = "flavor/slice_n_dice[slice_n_dice]",
	},

	["ks_vehicle"]	= {
		name = "Splatter!",
		desc = "Hit and kill an opponent with a vehicle.",
		color = clr_ks,
	},
	["ks_vehicle_5"]	= {
		name = "Splatter Spree!",
		desc = "Splatter 5 opponents in a row without dying.",
		color = clr_lt,
		snd = "flavor/splatter_spree[splatter_spree]",
	},
	["ks_vehicle_10"]	= {
		name = "Vehicular Manslaughter!",
		desc = "Splatter 10 opponents in a row without dying!",
		color = clr_lt,
		snd = "flavor/vehicular_manslaughter[vehicular_manslaughter]",
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
		desc = "Kill an opponent after you have died."
	},
	["extermination"]	= {
		name = "Extermination!",
		color = clr_gr,
		snd = "flavor/extermination[extermination]",
		desc = "Wipe out an enemy team with at least an Overkill.",
	},
	["perfection"]		= {
		name = "Perfection!",
		desc = "Win with over 15 kills without dying.",
		color = clr_gr,
		snd = "misc/perfection[perfection]",
	},
}

CreateConVar("gh3m_killstreaktime", "4", FCVAR_ARCHIVE + FCVAR_REPLICATED)
CreateConVar("gh3m_enabled", "0", FCVAR_ARCHIVE + FCVAR_REPLICATED)

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
				-- unused net.WriteUInt(ply.KillingSpree, 16)
			net.Send(ply)
		end
	end

	function AddKill(ply)
		ply.DoubleKill = CurTime()
		ply.DoubleCount = ( ply.DoubleCount or 0 ) + 1
		ply.KillingSpree = ( ply.KillingSpree or 0 ) + 1
		MedalUpdate(ply)
	end
	
	local lastinfo = {
		dmg			=	false,
		dmgtype		=	false,
		inflictor	=	false,
		attacker	=	false,
	}

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

	local sta_kilspre_shotgun = {
		[5] 	= 25,
		[10] 	= 26,
	}

	local sta_kilspre_sword = {
		[5] 	= 27,
		[10] 	= 28,
	}

	local sta_kilspre_vehicle = {
		[5] 	= 33,
		[10] 	= 34,
	}

	function CheckCools(ply)
		if sta_dblkils[ply.DoubleCount] then
			MedalSend(ply, sta_dblkils[ply.DoubleCount])
		end
		if sta_kilspre[ply.KillingSpree] then
			MedalSend(ply, sta_kilspre[ply.KillingSpree])
		end
		if sta_kilspre_shotgun[ply.KillingSpree_Shotgun] then
			MedalSend(ply, sta_kilspre_shotgun[ply.KillingSpree_Shotgun])
		end
		if sta_kilspre_sword[ply.KillingSpree_Sword] then
			MedalSend(ply, sta_kilspre_sword[ply.KillingSpree_Sword])
		end
		if sta_kilspre_vehicle[ply.KillingSpree_Vehicle] then
			MedalSend(ply, sta_kilspre_vehicle[ply.KillingSpree_Vehicle])
		end
		
		if player.GetCount() >= 2 then
			local extermination = false
			for i, v in ipairs( player.GetAll() ) do
				if v == ply then continue end
				if v:Alive() then extermination = true end
			end
			if !extermination and !ply.ExterminationGot and ply.DoubleCount >= 4 then ply.ExterminationGot = false MedalSend(ply, 99) end
		end
	end
	
	function MedalReset(ply)
		ply.KillingSpree = 0
		ply.KillingSpree_Shotgun = 0
		ply.KillingSpree_Sword = 0
		ply.KillingSpree_Vehicle = 0
		ply.DoubleKill = -math.huge
		ply.DoubleCount = 0
		ply.ExterminationGot = false
		MedalUpdate(ply)
	end

	hook.Add("PlayerSpawn", "GH3M_PlayerSpawn", function(ply)
		MedalReset(ply)
	end)
	
	local function check( f1, f2 )
		return bit.band( f1, f2 ) == f2
	end
	
	local function kst()
		return GetConVar("gh3m_killstreaktime") and GetConVar("gh3m_killstreaktime"):GetFloat() or 4
	end

	hook.Add("PlayerDeath", "GH3M_PlayerDeath", function( ply, inf, atk )
		PrintTable(lastinfo)
		if atk:IsPlayer() then
			if atk == ply then
				MedalSend(atk, 16) -- Fool
			else
				AddKill(atk)
				if ply.KillingSpree and ply.KillingSpree >= 5 then
					MedalSend(atk, 17)
				end
				if !atk:Alive() then
					MedalSend(atk, 18)
				end
				if check( lastinfo.dmgtype, DMG_CLUB ) then -- Melee kills
					if IsValid(lastinfo.target) then
						local tary = lastinfo.target:EyeAngles().y
						local atky = lastinfo.attacker:EyeAngles().y
						local diff = math.abs(tary-atky) < 90
						if diff then
							MedalSend(atk, 101)
						else
							MedalSend(atk, 100)
						end
					end
					atk.KillingSpree_Sword = ( atk.KillingSpree_Sword or 0 ) + 1
				end
				if check( lastinfo.dmgtype, DMG_BUCKSHOT ) then -- Shotgun sprees
					atk.KillingSpree_Shotgun = ( atk.KillingSpree_Shotgun or 0 ) + 1
				end
				if (IsValid(lastinfo.inflictor) and lastinfo.inflictor:IsVehicle()) or check( lastinfo.dmgtype, DMG_VEHICLE ) then -- Splatter sprees
					MedalSend(atk, 32)
					atk.KillingSpree_Vehicle = ( atk.KillingSpree_Vehicle or 0 ) + 1
				end
				CheckCools(atk)
			end
		elseif atk:IsVehicle() then -- fuck you, whoever's responsible for this
			if IsValid(atk:GetDriver()) then
				local new = atk:GetDriver()
				if check( lastinfo.dmgtype, DMG_VEHICLE ) then -- Splatter sprees
					MedalSend(new, 32)
					new.KillingSpree_Vehicle = ( new.KillingSpree_Vehicle or 0 ) + 1
					CheckCools(new)
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
			if !atk:Alive() then
				MedalSend(atk, 18)
			end
			if npc.KillingSpree and npc.KillingSpree >= 5 then
				MedalSend(atk, 17)
			end
			CheckCools(atk)
		else
			AddKill(atk)
		end
	end)

	hook.Add("Think", "GH3M_Think", function()
		for i, ply in ipairs(player.GetAll()) do
			if ply.DoubleKill and ply.DoubleKill + kst() < CurTime() then
				ply.DoubleCount = 0
			end
		end
		
		if false and lastinfo then
			print(" \n")
			print("dmg: "			.. "\t\t\t",		lastinfo.dmg)
			print("dmgtype: "		.. "\t\t\t",		lastinfo.dmgtype)
			print("attacker: "		.. "\t\t\t",		lastinfo.attacker)
			print("inflictor: "		.. "\t\t\t",		lastinfo.inflictor)
			print("target: "		.. "\t\t\t",		lastinfo.target)
		end
	end)

	hook.Remove( "PostEntityTakeDamage", "GH3M_PostEntityTakeDamage")
	hook.Add( "EntityTakeDamage", "GH3M_EntityTakeDamage", function( target, dmginfo, took )
		if dmginfo then
			-- it isn't preserved
			lastinfo.dmg		=	dmginfo:GetDamage()
			lastinfo.dmgtype	=	dmginfo:GetDamageType()
			lastinfo.attacker	=	dmginfo:GetAttacker()
			lastinfo.inflictor	=	dmginfo:GetInflictor()
			lastinfo.target		=	target
			--print(target:Health())
		end
		
	end )
else
	local queue = {}
	local lockout = 0
	
	local function kst()
		return GetConVar("gh3m_killstreaktime") and GetConVar("gh3m_killstreaktime"):GetFloat() or 4
	end

	net.Receive("GH3M_GetDoubleKill", function()
		LocalPlayer().DoubleKill = net.ReadFloat()
		LocalPlayer().DoubleCount = net.ReadUInt(8)
		-- unused LocalPlayer().KillingSpree = net.ReadUInt(16)
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
		if ( (LocalPlayer().DoubleKill or 0 ) + kst()) > CurTime() then
			local cs = Color(63, 63, 63, 127)
			local text = math.Round( 10 * (kst() - (CurTime() - (LocalPlayer().DoubleKill or 0)) ))
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