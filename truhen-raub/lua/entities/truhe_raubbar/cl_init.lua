include("shared.lua")

surface.CreateFont( "truhenraub.title", {
	font = "Montserrat", 
	size = 200,
	weight = 1000,
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
	ang:RotateAroundAxis( oang:Up(), 0)

	pos = pos + oang:Forward() * 0 + oang:Up() * 40 + oang:Right() * 22.5

	if dist > 100 then return end
	cam.Start3D2D( pos, ang, 0.025 )
		surface.SetDrawColor(0, 0, 0, 200) 
		surface.DrawRect(50, 400, 1725, 200)
		draw.SimpleText("Goldreserven Kiste", "truhenraub.title", 900, 500, Color(225, 177, 44), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	
	cam.End3D2D()
end