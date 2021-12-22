include("shared.lua")

resource.AddFile("resource/fonts/skyrim.ttf")

surface.CreateFont( "werkbank.title", {
	font = "Typo3", 
	size = 200,
	weight = 1000,
})

surface.CreateFont( "werkbank.ui", {
	font = "Typo3", 
	size = 25,
	weight = 1000,
})

surface.CreateFont( "werkbank.ui.small", {
	font = "Typo3", 
	size = 17,
	weight = 1000,
})

local Damageboost_dauer = 300
local VerbessernCooldown = 1800
local yes = Material("materials/vgui/id_gr.png")
local no = Material("materials/vgui/id_r.png")
local titel = Material("materials/vgui/titel.png")
local verbessernstatus = true
local klick = "weapons/sounds/klickk.mp3"

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

	pos = pos + oang:Forward() * 15 + oang:Up() * 40 + oang:Right() * 20

	if dist > 200 then return end
	cam.Start3D2D( pos, ang, 0.025 )
		surface.SetDrawColor(0, 0, 0, 200) 
		surface.DrawRect(300, 900, 1000, 200)
		draw.SimpleText("Goldtruhe", "werkbank.title", 800, 1000, Color(225, 177, 44), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)	
	cam.End3D2D()
end