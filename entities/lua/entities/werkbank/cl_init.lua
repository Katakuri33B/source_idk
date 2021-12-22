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

	pos = pos + oang:Forward() * 20 + oang:Up() * 40 + oang:Right() * 20

	if dist > 200 then return end
	cam.Start3D2D( pos, ang, 0.025 )
			
	cam.End3D2D()
end

function werkbankuipaint(s, w, h)
	surface.SetDrawColor(30, 30, 30, 230)
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(230, 126, 34)
    surface.DrawOutlinedRect(0, 0, w, h)
    surface.DrawRect(0, 0, 15, 3) --oben links
    surface.DrawRect(0, 0, 3, 15) --oben links
    surface.DrawRect(w - 15, 0, 15, 3) --oben rechts
    surface.DrawRect(w - 3, 0, 3, 15) --oben rechts
    surface.DrawRect(0, h - 3, 15, 3) --unten links
    surface.DrawRect(0, h - 15, 3, 15) --unten links
    surface.DrawRect(w - 15, h - 3, 15, 3) --unten rechts
    surface.DrawRect(w - 3, h - 15, 3, 15) --unten rechts
end

function clspaint(s, w, h)
	if s:IsHovered() then
		draw.SimpleText("X", "werkbank.ui", w / 2, h / 2, Color(255,25,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText("X", "werkbank.ui", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wbgpaint(s, w, h)
	surface.SetDrawColor(0, 0, 0, 220)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(230, 126, 34)
    surface.DrawOutlinedRect(0, 0, w, h)
    surface.DrawRect(0, 0, 15, 3) --oben links
    surface.DrawRect(0, 0, 3, 15) --oben links
    surface.DrawRect(w - 15, 0, 15, 3) --oben rechts
    surface.DrawRect(w - 3, 0, 3, 15) --oben rechts
    surface.DrawRect(0, h - 3, 15, 3) --unten links
    surface.DrawRect(0, h - 15, 3, 15) --unten links
    surface.DrawRect(w - 15, h - 3, 15, 3) --unten rechts
    surface.DrawRect(w - 3, h - 15, 3, 15) --unten rechts
end 

function titlepaint(s, w, h)
	surface.SetDrawColor(255, 255, 255)
	surface.SetMaterial(titel)
	surface.DrawTexturedRect(0, 0, w, h)
	draw.SimpleText(LocalPlayer():GetActiveWeapon():GetPrintName(), "werkbank.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end 

function verbessernpaint(s, w, h)
	surface.SetDrawColor(255, 255, 255)
	if LocalPlayer():getDarkRPVar("money") < 15000 then
		surface.SetMaterial(no)
	else 
		surface.SetMaterial(yes)
	end
	surface.DrawTexturedRect(0, 0, w, h)
	if LocalPlayer():getDarkRPVar("money") < 15000 then
		draw.SimpleText("Du hast nicht genug Gold", "werkbank.ui", w / 2, h / 2 , Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else 
		draw.SimpleText("Waffen verbessern", "werkbank.ui", w / 2, h / 2 - 10, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		draw.SimpleText("' Gilt für jede Waffe die du gerade hast ' (15.000 Gold)", "werkbank.ui.small", w / 2, h / 2 + 20, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function verbessernDoClick()
	if LocalPlayer():getDarkRPVar("money") < 15000 then
		surface.PlaySound("UI/buttonclickrelease.wav")
		chat.AddText("Du hast nicht genügend ",Color(255,50,50),"Gold")
	else 
		net.Start("WaffeVerbessern")
			net.WriteEntity(LocalPlayer():GetActiveWeapon())
		net.SendToServer()
		verbessernstatus = false
		werkbankui:Remove()
		surface.PlaySound(klick)
		chat.AddText("Du kannst wieder in ",Color(255,0,0),VerbessernCooldown,Color(255,255,255)," Sekunden Upgraden")
		timer.Simple(VerbessernCooldown, function()
			verbessernstatus = true
			chat.AddText("Du kannst wieder ",Color(255,25,255),"deine Waffen verbessern")
		end)
		timer.Simple(Damageboost_dauer, function()
            chat.AddText("Dein ",Color(255,25,255),"Damageboost ",Color(255,255,255),"ist abgeklungen")
        end)
	end
end

function WerkbankUI()
	if verbessernstatus then
		if IsValid(werkbankui) then return end
		werkbankui = vgui.Create("DFrame")
		werkbankui:SetSize(800, 600)
		werkbankui:Center()
		werkbankui:MakePopup()
		werkbankui:SetTitle("")
		werkbankui:ShowCloseButton(false)
		werkbankui:SetDraggable(false)
		werkbankui.Paint = werkbankuipaint

		local cls = vgui.Create("DButton", werkbankui)
		cls:SetSize(20, 30)
		cls:SetPos(werkbankui:GetWide() - 30, werkbankui:GetTall() * 0 + 5)
		cls:SetText("")
		cls.Paint = clspaint
		cls.DoClick = function()
			surface.PlaySound("UI/buttonclick.wav")
			werkbankui:Remove()
		end 

		local wbg = vgui.Create("DPanel", werkbankui)
		wbg:SetSize(500, 300)
		wbg:SetPos(werkbankui:GetWide() * .5 - 250, werkbankui:GetTall() * .5 - 150)
		wbg.Paint = wbgpaint

		local waffe = vgui.Create("DModelPanel", wbg)
		waffe:SetSize(400, 350)
		waffe:SetPos(75, -130)
		waffe:SetModel(LocalPlayer():GetActiveWeapon():GetModel())

		local title = vgui.Create("DPanel", werkbankui)
		title:SetSize(500, 175)
		title:SetPos(werkbankui:GetWide() * .5 - 250, werkbankui:GetTall() * 0)
		title.Paint = titlepaint

		local verbessern = vgui.Create("DButton", werkbankui)
		verbessern:SetSize(500, 75)
		verbessern:SetPos(werkbankui:GetWide() * .5 - 250, werkbankui:GetTall() - 110)
		verbessern:SetText("")
		verbessern.Paint = verbessernpaint
		verbessern.DoClick = verbessernDoClick
	end
end

net.Receive("WorkbenchUI", function(len, ply)
	WerkbankUI()
end)