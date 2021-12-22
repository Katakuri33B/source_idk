resource.AddFile("resource/fonts/skyrim.ttf")


///////////
// Icons //
///////////
local bg = Material("materials/vgui/bg.png")
local yes = Material("materials/vgui/id_gr.png")
local no = Material("materials/vgui/id_r.png")
local balken = Material("materials/vgui/balken.png")
local titel = Material("materials/vgui/titel.png")

///////////
// Fonts //
///////////
surface.CreateFont( "screen.zeit", {
    font = "typo3",
    size = 30,
    weight = 1000,
    antialias = true,
} )

surface.CreateFont( "screen.ui", {
    font = "typo3",
    size = 25,
    weight = 1000,
    antialias = true,
} )

surface.CreateFont( "screen.ui.small", {
    font = "typo3",
    size = 23,
    weight = 1000,
    antialias = true,
} )

//////////////////////// 
// Spielzeit Function // 
////////////////////////
function timeToStr( time )
	local tmp = time
	local s = tmp % 60
	tmp = math.floor( tmp / 60 )
	local m = tmp % 60
	tmp = math.floor( tmp / 60 )
	local h = tmp % 24
	tmp = math.floor( tmp / 24 )
	local d = tmp % 7
	local w = math.floor( tmp / 7 )

	return string.format( "%02iw %id %02ih %02im %02is", w, d, h, m, s )
end

local rules = false
local klick = "weapons/start/klick.mp3"

function bgPaint(s, w, h)
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(bg) 
    surface.DrawTexturedRect(0, 0, w, h)
end

function clsPaint(s, w, h)
    surface.SetDrawColor(255, 255, 255)
    if rules then
        surface.SetMaterial(yes) 
    else
        surface.SetMaterial(no) 
    end
    surface.DrawTexturedRect(0, 0, w, h)
    if rules then
        if s:IsHovered() then 
            draw.SimpleText("Drücke zum Spielen", "screen.ui", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Drücke zum Spielen", "screen.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    else 
        if s:IsHovered() then 
            draw.SimpleText("Akzeptiere erst die Regeln", "screen.ui", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Akzeptiere erst die Regeln", "screen.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
end

function TitelPaint(s, w, h) 
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(titel) 
    surface.DrawTexturedRect(0, 0, w, h) 
    draw.SimpleText("KingdomRP by Frost Gaming", "screen.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function RegelnPaint(s, w, h)
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

    draw.SimpleText(" §1 - RDM ist nicht gestattet", "screen.ui", 15, h * 0 + 15, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §2 - ErotikRP ist untersagt", "screen.ui", 15, h * 0 + 50, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §3 - Starke OOC beleidigungen sind Verboten", "screen.ui", 15, h * 0 + 85, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §3.2 - Leichte beleidigungen?  wenn dann nur im RP bitte", "screen.ui", 15, h * 0 + 120, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §4 - Betreibe kein PowerRP", "screen.ui", 15, h * 0 + 155, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §5 - Trolling ist unerwünscht", "screen.ui", 15, h * 0 + 190, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §6 - Kein MIC Spam", "screen.ui", 15, h * 0 + 225, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §7 - Höre auf die Teammitglieder", "screen.ui", 15, h * 0 + 260, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §8 - Suche nicht zwanghaft Stress", "screen.ui", 15, h * 0 + 295, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §9 - Halte FearRP ein", "screen.ui", 15, h * 0 + 330, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §10 - Kein Bug using oder Grauzonen Ausnutzen", "screen.ui", 15, h * 0 + 365, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §11 - Verbannung werden nicht Kommentiert", "screen.ui", 15, h * 0 + 405, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §12 - Bei bugs, bitte ein Admin+ bescheid geben", "screen.ui", 15, h * 0 + 440, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §12.2 - Pro gefundenen und bestätigten bug gibt es ein Geschenk", "screen.ui.small", 15, h * 0 + 475, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" §13 - Custom chars gibt es nur in Giveaways", "screen.ui", 15, h * 0 + 510, Color(255, 255, 255), TEXT_ALIGN_LEFT)
    draw.SimpleText(" Für mehr Regeln, suche den Discord auf", "screen.ui", w / 2, h * 0 + 625, Color(255, 25, 25), TEXT_ALIGN_CENTER)
end 

function acceptPaint(s, w, h) 
    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(balken) 
    surface.DrawTexturedRect(0, 0, w, h) 
    if s:IsHovered() then 
        draw.SimpleText("Akzeptieren", "screen.ui", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else
        draw.SimpleText("Akzeptieren", "screen.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end

function zeitPaint(s, w, h)
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

    draw.SimpleText("DEINE SPIELZEIT :", "screen.zeit", w / 2, h * 0 + 55, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText((timeToStr( LocalPlayer():GetUTimeTotalTime() )), "screen.zeit", w / 2, h * 0 + 100, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end 

function StartscreenUI()
    
    if IsValid(startscreen) then return end
    startscreen = vgui.Create("DFrame")
    startscreen:SetSize(ScrW(), ScrH())
    startscreen:Center()
    startscreen:MakePopup()
    startscreen:SetDraggable(false)
    startscreen:ShowCloseButton(false)
    startscreen:SetTitle("")
    startscreen.Paint = bgPaint

    local titel = vgui.Create("DPanel", startscreen)
    titel:SetSize(425, 125)
    titel:SetPos(startscreen:GetWide() *.5 - 212.5, ScrH() * 0 + 50)
    titel.Paint = TitelPaint

    local regeln = vgui.Create("DPanel", startscreen)
    regeln:SetSize(700, 750)
    regeln:SetPos(startscreen:GetWide() - 725, startscreen:GetTall() * .5 - 360)
    regeln.Paint = RegelnPaint


    local cls = vgui.Create("DButton", startscreen)
    cls:SetSize(300, 50)
    cls:SetPos(ScrW() * .5 - 150, ScrH() - 100)
    cls:SetText("")
    cls.Paint = clsPaint
    cls.DoClick = function()
        if rules then
            surface.PlaySound(klick)
            startscreen:Remove()
        else 
            surface.PlaySound("UI/buttonclickrelease.wav")
        end
    end 

    local accept = vgui.Create("DButton", regeln)
    accept:SetSize(200, 50)
    accept:SetPos(regeln:GetWide() * .5 - 100, regeln:GetTall() - 75)
    accept:SetText("")
    accept.Paint = acceptPaint
    accept.DoClick = function()
        if rules then 
        else
            rules = true
            surface.PlaySound("UI/buttonclick.wav")
        end
    end

    local zeit = vgui.Create("DPanel", startscreen)
    zeit:SetSize(400, 150)
    zeit:SetPos(25, startscreen:GetTall() * .5 - 75)
    zeit.Paint = zeitPaint

end 

net.Receive("GetStartscreenUI", function(len, ply)
    StartscreenUI()
end)

concommand.Add("screen_test_dev", function()
    StartscreenUI()
end)