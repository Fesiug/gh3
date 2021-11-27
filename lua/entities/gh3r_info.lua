

AddCSLuaFile()

concommand.Add("gh3r_initialize", function()
	local ent = ents.Create("gh3r_info")
	ent:Spawn()
end)

concommand.Add("gh3r_remove", function()
	for i, ent in ipairs( ents.FindByClass("gh3r_info") ) do ent:Remove() end
end)

ENT.Base = "base_point"
ENT.Type = "point"
ENT.DisableDuplicator = true

function ENT:Initialize()
	self:AddEFlags( EFL_FORCE_CHECK_TRANSMIT )
	if SERVER then PrintMessage(HUD_PRINTTALK, "GH3 Game info initialized") end
	for i, ent in ipairs( ents.FindByClass("gh3r_info") ) do if ent != self then ent:Remove() end end

	self:SetRoundStart(math.ceil(CurTime()))
	self:SetRoundEnd(math.ceil((60*5)))
	self:SetGametype("slayer")
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "RoundStart")
	self:NetworkVar("Int", 1, "RoundEnd")
	
	self:NetworkVar("String", 1, "Gametype")
end

function ENT:KeyValue( key, value )
end

function ENT:Think()
end

function ENT:OnRemove()
	if SERVER then PrintMessage(HUD_PRINTTALK, "GH3 Game info Removed") end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end