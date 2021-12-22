include("shared.lua")

surface.CreateFont( "ausbilder", {
	font = "Montserrat", 
	size = 250,
	weight = 100,
})


function ENT:Draw()

  self:DrawModel()

	local oang = self:GetAngles()
	local opos = self:GetPos()

	local ang = self:GetAngles()
	local pos = self:GetPos()
	local dist = LocalPlayer():EyePos():Distance( self:GetPos() )

	ang:RotateAroundAxis( oang:Up(), 90 )
	ang:RotateAroundAxis( oang:Right(), -90 )
	ang:RotateAroundAxis( oang:Up(), -0)

	pos = pos + oang:Forward() * 20 + oang:Up() * 99 + oang:Right() * 1

	if dist > 200 then return end
		cam.Start3D2D( pos, ang, 0.025 )
			draw.SimpleText("Ausbilder", "ausbilder", 70, 0, Color(25,255,25), TEXT_ALIGN_CENTER)
		cam.End3D2D()

end
