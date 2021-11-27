matproxy.Add( {
	name = "GH3_AmmoCounter",
	init = function( self, mat, values )
		self.ResultTo = values.resultvar
		self.Prefix = values.prefixstring
	end,
	bind = function( self, mat, ent )
		if ( !IsValid( ent ) ) then return end
		if ( !IsValid( ent:GetOwner() ) ) then return end
			local Place = self.ResultTo
			local texture
			
			if IsValid(ent:GetOwner():GetActiveWeapon()) then
				local OurWeapon = ent:GetOwner():GetActiveWeapon()
				local KnowYourPlace = string.sub(string.reverse(OurWeapon:Clip1()), Place, Place)
				local digits = string.format( tonumber(KnowYourPlace) or 0 )

				texture = self.Prefix .. digits
			end
			
			if texture then
				mat:SetTexture( "$basetexture", texture )
				mat:SetTexture( "$selfillummask", texture )
			else end
	end
} )