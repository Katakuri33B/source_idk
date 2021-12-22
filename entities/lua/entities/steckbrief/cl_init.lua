include("shared.lua")

resource.AddFile("resource/fonts/skyrim.ttf")

surface.CreateFont( "steckbrief.title", {
	font = "Typo3", 
	size = 200,
	weight = 1000,
})

surface.CreateFont( "steckbrief.ui", {
	font = "Typo3", 
	size = 25,
	weight = 1000,
})

surface.CreateFont( "steckbrief.ui.small", {
	font = "Typo3", 
	size = 17,
	weight = 1000,
})

surface.CreateFont( "steckbrief.ui.text", {
	font = "Montserrat", 
	size = 20,
	weight = 1000,
})

local gesucht = false

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

function steckbriefuipaint(s, w, h)
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
		draw.SimpleText("X", "steckbrief.ui", w / 2, h / 2, Color(255,25,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText("X", "steckbrief.ui", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function schreibenpaint(s, w, h)
	surface.SetDrawColor(30, 30, 30, 230)
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(230, 126, 34)
    surface.DrawOutlinedRect(0, 0, w, h)
    surface.DrawRect(0, 0, 7, 3) --oben links
    surface.DrawRect(0, 0, 3, 7) --oben links
    surface.DrawRect(w - 7, 0, 7, 3) --oben rechts
    surface.DrawRect(w - 3, 0, 3, 7) --oben rechts
    surface.DrawRect(0, h - 3, 7, 3) --unten links
    surface.DrawRect(0, h - 7, 3, 7) --unten links
    surface.DrawRect(w - 7, h - 3, 7, 3) --unten rechts
    surface.DrawRect(w - 3, h - 7, 3, 7) --unten rechts

	if s:IsHovered() then
		draw.SimpleText("Brief schreiben", "steckbrief.ui", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText("Brief schreiben", "steckbrief.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function SteckbriefUI()
		if IsValid(steckbriefui) then return end
		steckbriefui = vgui.Create("DFrame")
		steckbriefui:SetSize(600, 400)
		steckbriefui:Center()
		steckbriefui:MakePopup()
		steckbriefui:SetTitle("")
		steckbriefui:ShowCloseButton(false)
		steckbriefui:SetDraggable(false)
		steckbriefui.Paint = steckbriefuipaint

		local cls = vgui.Create("DButton", steckbriefui)
		cls:SetSize(20, 30)
		cls:SetPos(steckbriefui:GetWide() - 30, steckbriefui:GetTall() * 0 + 5)
		cls:SetText("")
		cls.Paint = clspaint
		cls.DoClick = function()
			surface.PlaySound("UI/buttonclick.wav")
			steckbriefui:Remove()
		end 

			local gesucht_txt = vgui.Create("DButton", steckbriefui)
			gesucht_txt:SetSize(400, 75)
			gesucht_txt:SetPos( steckbriefui:GetWide() * .5 - 200, steckbriefui:GetTall() * 0 + 50)
			gesucht_txt:SetFont("steckbrief.ui")
			gesucht_txt:SetTextColor(Color(255,50,50))
			if not gesucht then
				gesucht_txt:SetText("Es wird niemand Gesucht")
			end
			gesucht_txt.Paint = function(s, w, h)
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

			if gesucht then
				local wieso_txt = vgui.Create("DButton", steckbriefui)
				wieso_txt:SetSize(400, 75)
				wieso_txt:SetPos( steckbriefui:GetWide() * .5 - 200, steckbriefui:GetTall() * 0 + 140)
				wieso_txt:SetFont("steckbrief.ui.small")
				wieso_txt:SetTextColor(Color(255,50,50))
				wieso_txt.Paint = function(s, w, h)
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

				local preis_txt = vgui.Create("DButton", steckbriefui)
				preis_txt:SetSize(400, 75)
				preis_txt:SetPos( steckbriefui:GetWide() * .5 - 200, steckbriefui:GetTall() * 0 + 230)
				preis_txt:SetFont("steckbrief.ui")
				preis_txt:SetTextColor(Color(25,255,50))
				preis_txt.Paint = function(s, w, h)
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
			end

end

net.Receive("SteckbriefUINET", function(len, ply)
	SteckbriefUI()
end)