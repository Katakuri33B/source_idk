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

	pos = pos + oang:Forward() * 40 + oang:Up() * -60 + oang:Right() * 0

	if dist > 200 then return end
		cam.Start3D2D( pos, ang, 0.025 )
			draw.SimpleText("Antiker Schrein...", "Schrein.Header", 0, 0, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
			draw.SimpleText("Drücke [E]", "Schrein.Header", 0, 230, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		cam.End3D2D()

end
net.Receive("Bossschrein", function(len, ply)
	if IsValid(Progress) then return end
	Progress = vgui.Create("DProgress")
	Progress:SetSize( 800, ScrH() * .025)
	Progress:SetPos(ScrW() * .5 - 400, ScrH() * .7)
	
	timer.Create("ProgressGet", 3, 10, function()
		Progress:SetFraction(Progress:GetFraction() + .1)
	
	end)

	timer.Simple(30, function()
			Progress:Remove()

			timer.Create("GetBoss", 13, 1, function()
				net.Start("GetBossSpawn")
				net.SendToServer()
			end )
		end)
	
end)