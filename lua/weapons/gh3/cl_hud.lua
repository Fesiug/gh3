
-- yeha

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )

	-- Set us up the texture
	surface.SetDrawColor( 255, 255, 255, alpha )
	if self.WepSelect then
		surface.SetMaterial( self.WepSelect )
	else
		surface.SetTexture( self.WepSelectIcon )
	end

	-- Borders
	--[[y = y + 10
	x = x + 10
	wide = wide - 20]]

	--x = x - wide
	--y = y - wide
	wide = wide * 1
	y = y + (wide*0.05)

	-- Draw that mother
	surface.DrawTexturedRect( x, y, wide, ( wide / 2 ) )

	-- Draw weapon info box
	self:PrintWeaponInfo( x + wide + 20, y + tall * 0.95, alpha )

end