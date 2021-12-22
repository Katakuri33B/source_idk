include("shared.lua")

resource.AddFile("resource/fonts/skyrim.ttf")

surface.CreateFont( "Header", {
	font = "typo3", 
	size = 220,
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
	ang:RotateAroundAxis( oang:Up(), -90)

	pos = pos + oang:Forward() * 0 + oang:Up() * 25 + oang:Right() * 10

	if dist > 200 then return end
		cam.Start3D2D( pos, ang, 0.025 )
			draw.SimpleText("Schatztruhe", "Header", 10, 650, Color(25,255,25), TEXT_ALIGN_CENTER)
		cam.End3D2D()

end
