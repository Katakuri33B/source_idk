include("shared.lua")


surface.CreateFont( "Schrein.Header", {
	font = "Montserrat", 
	size = 200,
	weight = 100,
})

resource.AddFile("sound/bell/bell.wav")

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

	pos = pos + oang:Forward() * 10 + oang:Up() * 26 + oang:Right() * -13

	if dist > 200 then return end
		cam.Start3D2D( pos, ang, 0.025 )
			draw.SimpleText("Tython Monster...", "Schrein.Header", 0, 0, Color(25, 25, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Drücke [E]", "Schrein.Header", 0, 230, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		cam.End3D2D()

end
	
