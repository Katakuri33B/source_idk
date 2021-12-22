include('shared.lua')

surface.CreateFont( "xg.3d2d.dealer", {
	font = "Montserrat", 
	size = 60,
    weight = 10,
} )


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
			-- Falls was rein soll
		cam.End3D2D()

end


