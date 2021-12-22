
surface.CreateFont( "perks.ui.cls", {
    font = "Montserrat",
    size = 25,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "perks.ui.perk", {
    font = "Montserrat",
    size = 20,
    weight = 100,
    antialias = true,
} )

local perks = {
    "Gesund I",
    "Gesund II",
    "Stabil I",
    "Stabil II",
    "Spurt I",
    "Spurt II"
}

local cl = "UI/buttonclick.wav"

local function PerkMenuBasePaint(s, w, h)
    BSHADOWS.BeginShadow()
        surface.SetDrawColor(20, 20, 20, 170)
        surface.DrawRect(ScrW() * .5 - 400, ScrH() * .5 - 250, 800, 3)
        surface.DrawRect(ScrW() * .5 - 400, ScrH() * .5 + 250, 800, 3)
        surface.DrawRect(ScrW() * .5 - 400, ScrH() * .5 - 250, 3, 500)
        surface.DrawRect(ScrW() * .5 + 397, ScrH() * .5 - 250, 3, 500)
    BSHADOWS.EndShadow(8, 2, 2)

    surface.SetDrawColor(30, 30, 30, 140)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(190, 126, 34, 200)
    surface.DrawRect(0, 0, 3, h)
    surface.DrawRect(0, 0, w, 3)
    surface.DrawRect(0, h - 3, w, 3)
    surface.DrawRect(w - 3, 0, 3, h)
    surface.SetDrawColor(211, 84, 0)
    surface.DrawRect(0, 0, 15, 3)
    surface.DrawRect(0, h - 3, 15, 3)
    surface.DrawRect(0, 0, 3, 15)
    surface.DrawRect(0, h - 15, 3, 15)
    surface.DrawRect(w - 15, 0, 15, 3)
    surface.DrawRect(w - 15, h - 3, 15, 3)
    surface.DrawRect(w - 3, 0, 3, 15)
    surface.DrawRect(w - 3, h - 15, 3, 15)

    surface.DrawRect(w / 2 - 100, 15, 200 , 3)
    surface.DrawRect(w / 2 - 100, 38, 200 , 3)
    draw.SimpleText("Perk Level = "..LocalPlayer():getDarkRPVar("level"), "perks.ui.perk", w / 2, 27.5, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

   
    
end

local function ClosePaint(s, w, h)
    surface.SetDrawColor(25,255,255)
    if s:IsHovered() then
        surface.SetDrawColor(25,255,25)
        surface.DrawRect(0, h - 2, w, 2)
        draw.SimpleText("Schließen", "perks.ui.cls", w / 2, h / 2, Color(25,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    else 
        surface.SetDrawColor(190, 126, 34, 220)
        surface.DrawRect(0, h - 2, w, 2)
        draw.SimpleText("Schließen", "perks.ui.cls", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end 
end

local function modelpaint(s, w, h)
    surface.SetDrawColor(20, 20, 20,140)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(190, 126, 34, 200)
    surface.DrawRect(0, 0, 3, h)
    surface.DrawRect(0, 0, w, 3)
    surface.DrawRect(0, h - 3, w, 3)
    surface.DrawRect(w - 3, 0, 3, h)
    surface.SetDrawColor(211, 84, 0)
    surface.DrawRect(0, 0, 15, 3)
    surface.DrawRect(0, h - 3, 15, 3)
    surface.DrawRect(0, 0, 3, 15)
    surface.DrawRect(0, h - 15, 3, 15)
    surface.DrawRect(w - 15, 0, 15, 3)
    surface.DrawRect(w - 15, h - 3, 15, 3)
    surface.DrawRect(w - 3, 0, 3, 15)
    surface.DrawRect(w - 3, h - 15, 3, 15)
end

function OpenPerkMenu()
    if IsValid(perkmen) then return end
    perkmen = vgui.Create("DFrame")
    perkmen:SetSize(800, 500)
    perkmen:Center()
    perkmen:MakePopup()
    perkmen:SetDraggable(false)
    perkmen:SetTitle("")
    perkmen:ShowCloseButton(false)
    perkmen.Paint = PerkMenuBasePaint

    local perkbg = vgui.Create("DPanel", perkmen)
    perkbg:SetSize(300, 400)
    perkbg:SetPos(5, 50)
    perkbg.Paint = function() end

    local perkbgg = vgui.Create("DPanel", perkmen)
    perkbgg:SetSize(125, 400)
    perkbgg:SetPos(350, 50)
    perkbgg.Paint = function() end

    local modelp = vgui.Create("DPanel", perkmen)
    modelp:SetSize(200, 350)
    modelp:SetPos(550, 75)
    modelp.Paint = modelpaint

    local model = vgui.Create("DModelPanel", modelp)
    model:SetModel(LocalPlayer():GetModel())
    model:SetSize( 400, 550)
    model:SetPos( - 100, - 115)

    local cls = vgui.Create("DButton", perkmen)
    cls:SetSize(100, 30)
    cls:SetPos(perkmen:GetWide() - 115, 5)
    cls:SetText("") 
    cls.Paint = ClosePaint
    cls.DoClick = function()
        perkmen:Close()
    end

    
    for k, v in pairs(perks) do 
        local perks = vgui.Create("DPanel", perkbg)
        perks:SetSize(0, 30)
        perks:Dock(TOP)
        perks:DockMargin(5, 20, 5, 20)
        perks.Paint = function(s, w, h) 
            surface.SetDrawColor(20, 20, 20,140)
            surface.DrawRect(0, 0, w, h)
            surface.SetDrawColor(190, 126, 34, 200)
            surface.DrawRect(0, 0, 3, h)
            surface.DrawRect(0, 0, w, 3)
            surface.DrawRect(0, h - 3, w, 3)
            surface.DrawRect(w - 3, 0, 3, h)
            surface.SetDrawColor(211, 84, 0)
            surface.DrawRect(0, 0, 10, 3)
            surface.DrawRect(0, h - 3, 10, 3)
            surface.DrawRect(0, 0, 3, 10)
            surface.DrawRect(0, h - 10, 3, 10)
            surface.DrawRect(w - 10, 0, 10, 3)
            surface.DrawRect(w - 10, h - 3, 10, 3)
            surface.DrawRect(w - 3, 0, 3, 10)
            surface.DrawRect(w - 3, h - 10, 3, 10)
            draw.SimpleText(v, "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end

    local GesundI = vgui.Create("DButton", perkbgg)
    GesundI:SetSize(0, 30)
    GesundI:Dock(TOP)
    GesundI:DockMargin(5, 20, 5, 20)
    GesundI:SetText("")
    GesundI.Paint = function(s, w, h)
        surface.SetDrawColor(20, 20, 20,140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.SetDrawColor(211, 84, 0)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)
        if LocalPlayer():getDarkRPVar("level") >= 10 then
            if s:IsHovered() then
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else 
            draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    GesundI.DoClick = function()
        if LocalPlayer():getDarkRPVar("level") >= 10 then
            surface.PlaySound(cl)
            net.Start("Gesund1")
                net.SendToServer()
        else
            LocalPlayer():ChatPrint("Du braucht Level 10 oder Höher.")
        end
    end

    local GesundII = vgui.Create("DButton", perkbgg)
    GesundII:SetSize(0, 30)
    GesundII:Dock(TOP)
    GesundII:DockMargin(5, 20, 5, 20)
    GesundII:SetText("")
    GesundII.Paint = function(s, w, h)
        surface.SetDrawColor(20, 20, 20,140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.SetDrawColor(211, 84, 0)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)
        if LocalPlayer():getDarkRPVar("level") >= 20 then
            if s:IsHovered() then
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else 
            draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    GesundII.DoClick = function()
         if LocalPlayer():getDarkRPVar("level") >= 20 then
         surface.PlaySound(cl)
            net.Start("Gesund2")
                net.SendToServer()
        else
            LocalPlayer():ChatPrint("Du braucht Level 20 oder Höher.")
        end
    end

    local StabilI = vgui.Create("DButton", perkbgg)
    StabilI:SetSize(0, 30)
    StabilI:Dock(TOP)
    StabilI:DockMargin(5, 20, 5, 20)
    StabilI:SetText("")
    StabilI.Paint = function(s, w, h)
        surface.SetDrawColor(20, 20, 20,140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.SetDrawColor(211, 84, 0)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)
        if LocalPlayer():getDarkRPVar("level") >= 30 then
            if s:IsHovered() then
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else 
            draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    StabilI.DoClick = function()
         if LocalPlayer():getDarkRPVar("level") >= 30 then
         surface.PlaySound(cl)
            net.Start("Stabil1")
                net.SendToServer()
        else
            LocalPlayer():ChatPrint("Du braucht Level 30 oder Höher.")
        end
    end

    local StabilII = vgui.Create("DButton", perkbgg)
    StabilII:SetSize(0, 30)
    StabilII:Dock(TOP)
    StabilII:DockMargin(5, 20, 5, 20)
    StabilII:SetText("")
    StabilII.Paint = function(s, w, h)
        surface.SetDrawColor(20, 20, 20,140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.SetDrawColor(211, 84, 0)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)
        if LocalPlayer():getDarkRPVar("level") >= 40 then
            if s:IsHovered() then
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else 
            draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    StabilII.DoClick = function()
        if LocalPlayer():getDarkRPVar("level") >= 40 then
        surface.PlaySound(cl)
            net.Start("Stabil2")
                net.SendToServer()
        else
            LocalPlayer():ChatPrint("Du braucht Level 40 oder Höher.")
        end
    end

    local SpurtI = vgui.Create("DButton", perkbgg)
    SpurtI:SetSize(0, 30)
    SpurtI:Dock(TOP)
    SpurtI:DockMargin(5, 20, 5, 20)
    SpurtI:SetText("")
    SpurtI.Paint = function(s, w, h)
        surface.SetDrawColor(20, 20, 20,140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.SetDrawColor(211, 84, 0)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)
        if LocalPlayer():getDarkRPVar("level") >= 50 then
            if s:IsHovered() then
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else 
            draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    SpurtI.DoClick = function()
        if LocalPlayer():getDarkRPVar("level") >= 50 then
        surface.PlaySound(cl)
            net.Start("Sprint1")
                net.SendToServer()
        else
            LocalPlayer():ChatPrint("Du braucht Level 50 oder Höher.")
        end
    end

    local SpurtII = vgui.Create("DButton", perkbgg)
    SpurtII:SetSize(0, 30)
    SpurtII:Dock(TOP)
    SpurtII:DockMargin(5, 20, 5, 20)
    SpurtII:SetText("")
    SpurtII.Paint = function(s, w, h)
        surface.SetDrawColor(20, 20, 20,140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        surface.SetDrawColor(211, 84, 0)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)
        if LocalPlayer():getDarkRPVar("level") >= 60 then
            if s:IsHovered() then
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else 
            draw.SimpleText("Aktivieren", "perks.ui.perk", w / 2, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    SpurtII.DoClick = function()
        if LocalPlayer():getDarkRPVar("level") >= 60 then
        surface.PlaySound(cl)
            net.Start("Sprint2")
                net.SendToServer()
        else
            LocalPlayer():ChatPrint("Du braucht Level 60 oder Höher.")
        end
    end

end


hook.Add( "PlayerButtonDown", "PerkMenu", function( ply, button )
	if (button == KEY_F1) then 
        OpenPerkMenu()
        
    end
end)