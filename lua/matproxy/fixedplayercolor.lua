
matproxy.Add( {
	name = "GH3_PlayerColor",

	init = function( self, mat, values )
		-- Store the name of the variable we want to set
		self.ResultTo = values.resultvar
	end,

	bind = function( self, mat, ent )

		if ( !IsValid( ent ) ) then return end

		local owner = ent:GetOwner()
		if ( !IsValid( owner ) or !owner:IsPlayer() ) then return end
		
		local col = owner:GetPlayerColor()
		if ( isvector( col ) ) then
			mat:SetVector( self.ResultTo, col )
		end
	end
} )
