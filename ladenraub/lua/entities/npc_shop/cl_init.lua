include('shared.lua')

surface.CreateFont( "ladenraub.3d2d", { font = "Montserrat", size = 60, weight = 100, antialias = true, } )



function ENT:Draw()

	self:DrawModel()

	local oang = self:GetAngles()
	local opos = self:GetPos()

	local ang = self:GetAngles()
	local pos = self:GetPos()
	local dist = LocalPlayer():EyePos():Distance( self:GetPos() )

	ang:RotateAroundAxis( oang:Up(), 90 )
	ang:RotateAroundAxis( oang:Right(), -90 )
	ang:RotateAroundAxis( oang:Up(), 5)

	pos = pos + oang:Forward() * 2 + oang:Up() * 82 + oang:Right() * 0

	if dist > 200 then return end
		cam.Start3D2D( pos, ang, 0.1 )
			draw.SimpleText("Angestellte", "ladenraub.3d2d", 0, 70, Color(255,25,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		cam.End3D2D()

end


