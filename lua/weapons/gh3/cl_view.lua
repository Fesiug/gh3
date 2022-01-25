
-- Viewmodel, adjust mouse sens


function SWEP:AdjustMouseSensitivity(def)
	if self:GetZoomed() then
		local levels = self.Stats["Zoom"]["Magnification Range"]
		return ( def or 1 ) / ( Lerp( self:GetMagnificationLevel()/self.Stats["Zoom"]["Magnification Levels"], levels.min, levels.max ) or 1 )
	end
end

CreateConVar("gh3_crosshair_lowered", "0.17", FCVAR_ARCHIVE, "Lower your crosshair and weapon, just like in Halo")
CreateConVar("gh3_vm_offset", "0 0 0", FCVAR_ARCHIVE, "viewmodel offset xyz")
CreateConVar("gh3_vm_angle", "0 0 0", FCVAR_ARCHIVE, "viewmodel angle pyr")
CreateConVar("gh3_vm_fov", "0", FCVAR_ARCHIVE, "viewmodel fov")
CreateConVar("gh3_cl_hands", "spartan", FCVAR_ARCHIVE + FCVAR_USERINFO, "hands to use, \"spartan\", \"elite\", \"dervish\"")

local reesult = angle_zero
function SWEP:GetViewModelPosition(pos, ang)
	local p = LocalPlayer()

	local offset = Vector(0, 0, 0)
	local wantset = Vector(0, 0, 0)
	if self.bopset then wantset = wantset + self.bopset end
	wantset = wantset + (self.VMOffset or vector_origin)
	local hm = string.Explode(" ", GetConVar("gh3_vm_offset"):GetString())
	wantset = wantset + Vector(hm[1], hm[2], hm[3])
	offset:Add(wantset.x * ang:Right())
	offset:Add(wantset.y * ang:Forward())
	offset:Add(wantset.z * ang:Up())

	-- apply
	pos = pos + offset

	local angset = Angle(0, 0, 0)
	local xd = ( p:GetFOV() * (ScrH()/ScrW()) )
	local oldang = ang
	local wagtset = Angle( (reesult) * -0.5, 0, 0 )
	hm = string.Explode(" ", GetConVar("gh3_vm_angle"):GetString())
	wagtset = wagtset + Angle(hm[1], hm[2], hm[3])
	ang:RotateAroundAxis(oldang:Right(), wagtset.p)
	ang:RotateAroundAxis(oldang:Up(), wagtset.y)
	ang:RotateAroundAxis(oldang:Forward(), wagtset.r)

	return pos, ang
end

function SWEP:CalcView( p, pos, ang, fov )
	if self.bopset then
		pos = pos + self.bopset.x * ang:Right()
		pos = pos + self.bopset.y * ang:Forward()
		pos = pos + self.bopset.z * ang:Up()
	end

	self.dopset = GetConVar("gh3_crosshair_lowered"):GetFloat() * math.pow(math.sin((p.currentdop or 1)*math.pi*0.5), 2)
	p.currentdop = math.Approach(p.currentdop or 0, self:ShouldBeLowered() and 1 or 0, FrameTime()*3)
	if IsValid(self:GetHolster_Entity()) and !self:GetHolster_Entity().GH3 then
		if !self.fintime then self.fintime = 0 end
		local thing = math.Clamp( 1 - ( ( CurTime() - (self:GetHolster_Time()- self.fintime ) ) / self.fintime ), 0, 1 )
		p.currentdop = p.currentdop * ( thing )
	end

	self.ViewModelFOV = self.ViewModelFOV_Init
	if self.Stats["Zoom"] then
		local levels = self.Stats["Zoom"]["Magnification Range"]
		local rang = self:GetMagnificationLevel()/self.Stats["Zoom"]["Magnification Levels"]
		local rang2 = (self:GetMagnificationLevel()-1)/self.Stats["Zoom"]["Magnification Levels"]

		local cool = math.sin(self:GetZoomTime()*math.pi*0.5)
		cool = math.pow(cool, 2)
		local cool2 = math.sin(self:GetZoom2Time()*math.pi*0.5)
		cool2 = math.pow(cool2, 2)

		fov = Lerp( cool, fov, fov/Lerp( rang*cool2, levels.min, levels.max ) )

		self.ViewModelFOV = self.ViewModelFOV * Lerp(cool, 1, 1.25)
	end
	self.ViewModelFOV = self.ViewModelFOV + GetConVar("gh3_vm_fov"):GetFloat()

	local vmc = Angle()
	if self:GetVM(1):GetAttachment(1) then vmc = self:GetVM(1):GetAttachment(1).Ang end
	safsaf = (self:GetVM(1):GetAngles() - vmc)

	local ree
	ree = util.AimVector(angle_zero, fov, ScrW()/2, (ScrH()/2) - (ScrH()*self.dopset), ScrW(), ScrH())
	ree = ree:Angle()
	if ree.x > 180 then
		ree.x = ree.x - 360
	end
	if ree.y > 180 then
		ree.y = ree.y - 360
	end
	ang = ang + (ree) + safsaf
	reesult = ree
	self.reesult = reesult
	self.soup = pos

	return pos, ang, fov
end

local cuurve = 1
hook.Add( "CalcView", "GH3_CalcView", function( ply, pos, angles, fov )
	if !(IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon().GH3) then return end
	local p = ply
	local w = ply:GetActiveWeapon()
	local wh = w:GetHolster_Entity()

	p.currentdop = math.Approach(p.currentdop or 0, w:ShouldBeLowered() and 1 or 0, FrameTime() * 3)

	if IsValid(wh) and wh.Stats then
		if wh.Stats["Appearance"]["Third Person"] then
			tpt = 1 - w:GetHolsterProgress()
		else
			return--tpt = 0--w:GetHolsterProgress()
		end
	elseif w.Stats and w.Stats["Appearance"]["Third Person"] then
		tpt = 0
	else
		return
	end

	cuurve = math.pow( math.sin( tpt * math.pi/2 ), 3 )--tpt--math.pow(math.sin(tpt*math.pi*0.5), 2)
	local view = {
		origin = pos,--LerpVector( (cuurve or 1), pos, p:EyePos() ),
		angles = angles,
		fov = fov,
		drawviewer = true
	}

	local dingledong = Vector(18, -34, -6) * ( 1 - ( (cuurve or 1) or 1 ) )
	view.origin = view.origin + dingledong.x * view.angles:Right()
	view.origin = view.origin + dingledong.y * view.angles:Forward()
	view.origin = view.origin + dingledong.z * view.angles:Up()

	return view
end )



function SWEP:CalcViewModelView( vm )
end

local LHIKBonesL = {
	"l_upperarm",
	"l_forearm",
	"l_hand",
	"l_index_low",
	"l_index_mid",
	"l_index_tip",
	"l_middle_low",
	"l_middle_mid",
	"l_middle_tip",
	"l_pinky_low",
	"l_pinky_mid",
	"l_pinky_tip",
	"l_ring_low",
	"l_ring_mid",
	"l_ring_tip",
	"l_thumb_low",
	"l_thumb_mid",
	"l_thumb_tip",
}
local LHIKBonesR = {
	"r_upperarm",
	"r_forearm",
	"r_hand",
	"r_index_low",
	"r_index_mid",
	"r_index_tip",
	"r_middle_low",
	"r_middle_mid",
	"r_middle_tip",
	"r_pinky_low",
	"r_pinky_mid",
	"r_pinky_tip",
	"r_ring_low",
	"r_ring_mid",
	"r_ring_tip",
	"r_thumb_low",
	"r_thumb_mid",
	"r_thumb_tip",
}

--[[local LHIK2BonesL = {
	"ValveBiped.Bip01_L_UpperArm",
	"ValveBiped.Bip01_L_Forearm",
	"ValveBiped.Bip01_L_Wrist",
	"ValveBiped.Bip01_L_Ulna",
	"ValveBiped.Bip01_L_Hand",
	"ValveBiped.Bip01_L_Finger4",
	"ValveBiped.Bip01_L_Finger41",
	"ValveBiped.Bip01_L_Finger42",
	"ValveBiped.Bip01_L_Finger3",
	"ValveBiped.Bip01_L_Finger31",
	"ValveBiped.Bip01_L_Finger32",
	"ValveBiped.Bip01_L_Finger2",
	"ValveBiped.Bip01_L_Finger21",
	"ValveBiped.Bip01_L_Finger22",
	"ValveBiped.Bip01_L_Finger1",
	"ValveBiped.Bip01_L_Finger11",
	"ValveBiped.Bip01_L_Finger12",
	"ValveBiped.Bip01_L_Finger0",
	"ValveBiped.Bip01_L_Finger01",
	"ValveBiped.Bip01_L_Finger02"
}

local LHIK2BonesR = {
	"ValveBiped.Bip01_R_UpperArm",
	"ValveBiped.Bip01_R_Forearm",
	"ValveBiped.Bip01_R_Wrist",
	"ValveBiped.Bip01_R_Ulna",
	"ValveBiped.Bip01_R_Hand",
	"ValveBiped.Bip01_R_Finger4",
	"ValveBiped.Bip01_R_Finger41",
	"ValveBiped.Bip01_R_Finger42",
	"ValveBiped.Bip01_R_Finger3",
	"ValveBiped.Bip01_R_Finger31",
	"ValveBiped.Bip01_R_Finger32",
	"ValveBiped.Bip01_R_Finger2",
	"ValveBiped.Bip01_R_Finger21",
	"ValveBiped.Bip01_R_Finger22",
	"ValveBiped.Bip01_R_Finger1",
	"ValveBiped.Bip01_R_Finger11",
	"ValveBiped.Bip01_R_Finger12",
	"ValveBiped.Bip01_R_Finger0",
	"ValveBiped.Bip01_R_Finger01",
	"ValveBiped.Bip01_R_Finger02"
}]]

function SWEP:DoLHIK()
	local lhik_model = self:GetVM(1)
	local vm = self:GetVM(0)

	local delta = 1
	for _, bone in pairs(LHIKBonesL) do
		local vmbone = vm:LookupBone(bone)
		local lhikbone = lhik_model:LookupBone(bone)

		if !vmbone then continue end
		if !lhikbone then continue end

		vm:GetBonePosition(vmbone)
		lhik_model:GetBonePosition(lhikbone)

		local vmtransform = vm:GetBoneMatrix(vmbone)
		local lhiktransform = lhik_model:GetBoneMatrix(lhikbone)

		if !vmtransform then continue end
		if !lhiktransform then continue end

		local vm_pos = vmtransform:GetTranslation()
		local vm_ang = vmtransform:GetAngles()
		local lhik_pos = lhiktransform:GetTranslation()
		local lhik_ang = lhiktransform:GetAngles()

		local matrix = Matrix()

		matrix:SetTranslation(LerpVector(delta, vm_pos, lhik_pos))
		matrix:SetAngles(LerpAngle(delta, vm_ang, lhik_ang))

		vm:SetBoneMatrix(vmbone, matrix)
	end
	for _, bone in pairs(LHIKBonesR) do
		local vmbone = vm:LookupBone(bone)
		local lhikbone = lhik_model:LookupBone(bone)

		if !vmbone then continue end
		if !lhikbone then continue end

		vm:GetBonePosition(vmbone)
		lhik_model:GetBonePosition(lhikbone)

		local vmtransform = vm:GetBoneMatrix(vmbone)
		local lhiktransform = lhik_model:GetBoneMatrix(lhikbone)

		if !vmtransform then continue end
		if !lhiktransform then continue end

		local vm_pos = vmtransform:GetTranslation()
		local vm_ang = vmtransform:GetAngles()
		local lhik_pos = lhiktransform:GetTranslation()
		local lhik_ang = lhiktransform:GetAngles()

		local matrix = Matrix()

		matrix:SetTranslation(LerpVector(delta, vm_pos, lhik_pos))
		matrix:SetAngles(LerpAngle(delta, vm_ang, lhik_ang))

		vm:SetBoneMatrix(vmbone, matrix)
	end
end

local heldx = 0
local heldy = 0
local roony = 0

local LookY = 0
local LastY = 0

local MoveCy = 0

local PPtime = 0.25

function SWEP:PreDrawViewModel( vm, wep, p )
	local ft = FrameTime()

	if vm == self:GetVM(0) and !frick then
		self:DoLHIK()
	end

	if vm == self:GetVM(1) then
		do
			self.wedonot = math.Approach(self.wedonot or 0, ( self.Animations[0][2] and self.Animations[0][2][vm:GetSequence()] or (self:GetReloadDelay() - PPtime) > CurTime() ) and 1 or 0, FrameTime()*(1/PPtime))
		end

		do
			local wedonot = self.wedonot or 0

			local keyd = p:KeyDown(IN_FORWARD) or p:KeyDown(IN_BACK) or p:KeyDown(IN_MOVELEFT) or p:KeyDown(IN_MOVERIGHT)
			roony = math.Approach(roony, p:OnGround() and math.Clamp(p:GetVelocity():Length()/200, 0, 1) or 0, ft * 10)
			vm:SetPoseParameter("overlay_moving", roony * (1-wedonot) )--Lerp( wedonot, ( p:OnGround() and keyd ) and 1 or 0, 0 ) )--roony, 0))

			MoveCy = ( MoveCy + ( FrameTime() * ( 30 / self.Animations[0][1][1] ) * p:GetVelocity():Length()/200 ) ) % 1
			vm:SetPoseParameter("overlay_movingcy", MoveCy )

			local claim = 0
			if p:KeyDown(IN_FORWARD) then claim = 1
			elseif p:KeyDown(IN_BACK) then claim = -1
			end

			heldx = math.Approach(heldx, claim, ft * 10)
			vm:SetPoseParameter("overlay_move_x", Lerp(wedonot, heldx, 0))

			claim = 0
			if p:KeyDown(IN_MOVELEFT) then claim = -1
			elseif p:KeyDown(IN_MOVERIGHT) then claim = 1
			end

			heldy = math.Approach(heldy, claim, ft * 5)
			vm:SetPoseParameter("overlay_move_y", Lerp(wedonot, heldy, 0))

			vm:SetPoseParameter("overlay_pat2", Lerp(wedonot, p:EyeAngles().p/-90, 0))

			local y = p:EyeAngles().y
			LookY = math.Approach( LookY, (y - LastY), ft * 5 )
			LookY = math.Clamp(LookY, -1, 1)
			LastY = y
			vm:SetPoseParameter("overlay_pat1", Lerp(wedonot, LookY, 0))
		end
	end

end

function SWEP:PostDrawViewModel( vm, wep, p )
end
