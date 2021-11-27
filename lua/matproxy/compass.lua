matproxy.Add( {
	name = "GH3_Compass",
	init = function( self, mat, values )
	end,
	bind = function( self, mat, ent )
		if ( !IsValid( ent ) ) then return end
		if ( !IsValid( ent:GetOwner() ) ) then return end
		local texture
		
		if IsValid(ent:GetOwner():GetActiveWeapon()) then
			local OurWeapon = ent:GetOwner():GetActiveWeapon()
			local dir = ent:GetOwner():EyeAngles()
			dir = math.Round(dir.y)
			if dir < 0 then
				dir = dir + 360
			end
			dir = dir / 360
			dir = dir * 8
			dir = math.Round(dir)

			texture = math.Round(dir)
		end
		
		if texture then
			mat:SetInt( "$frame", texture )
		else end
	end
} )