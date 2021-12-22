surface.CreateFont( "menu.title", {
    font = "Montserrat",
    size = 30,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "menu.ui", {
    font = "Montserrat",
    size = 20,
    weight = 100,
    antialias = true,
} )

local hirsch_c = false
local bear_c = false 
local croc_c = false

function MenuPanelPaint(s, w, h)
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

function HirschBtnPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
    else
        surface.SetDrawColor(0, 0, 0, 220)
    end
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
    draw.SimpleText("Hirsche Spawnen", "menu.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function BearBtnPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
    else
        surface.SetDrawColor(0, 0, 0, 220)
    end
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
    draw.SimpleText("Bären Spawnen", "menu.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function CrocBtnPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
    else
        surface.SetDrawColor(0, 0, 0, 220)
    end
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
    draw.SimpleText("Krokodile Spawnen", "menu.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function RespawnBtnPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
    else
        surface.SetDrawColor(0, 0, 0, 220)
    end
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
    draw.SimpleText("Shops Respawnen", "menu.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function MehrBtnPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
    else
        surface.SetDrawColor(0, 0, 0, 220)
    end
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(255, 25, 255)
    surface.DrawOutlinedRect(0, 0, w, h)
    surface.DrawRect(0, 0, 7, 3) --oben links
    surface.DrawRect(0, 0, 3, 7) --oben links
    surface.DrawRect(w - 7, 0, 7, 3) --oben rechts
    surface.DrawRect(w - 3, 0, 3, 7) --oben rechts
    surface.DrawRect(0, h - 3, 7, 3) --unten links
    surface.DrawRect(0, h - 7, 3, 7) --unten links
    surface.DrawRect(w - 7, h - 3, 7, 3) --unten rechts
    surface.DrawRect(w - 3, h - 7, 3, 7) --unten rechts
    draw.SimpleText("Bald ist mehr Verfügbar", "menu.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function clsBtnPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
    else
        surface.SetDrawColor(0, 0, 0, 220)
    end
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
    draw.SimpleText("Schließen", "menu.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function OpenKatasMenu()
    if LocalPlayer():IsAdmin() then
        if IsValid(MenuPanel) then return end
        MenuPanel = vgui.Create("DPanel")
        MenuPanel:SetSize(400, 300)
        MenuPanel:Center()
        MenuPanel:MakePopup()
        MenuPanel.Paint = MenuPanelPaint

        local cls = vgui.Create("DButton", MenuPanel)
        cls:Dock(BOTTOM)
        cls:SetText("")
        cls.Paint = clsBtnPaint
        cls.DoClick = function()
            surface.PlaySound("UI/buttonclick.wav")
            MenuPanel:Remove()
        end

        local hirsch = vgui.Create("DButton", MenuPanel)
        hirsch:SetSize(MenuPanel:GetWide(), 30)
        hirsch:SetPos(0, 10)
        hirsch:SetText("")
        hirsch.Paint = HirschBtnPaint
        hirsch.DoClick = function()
            if hirsch_c then
                surface.PlaySound("UI/buttonclick.wav")
                chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast einen Cooldown von "..timer.TimeLeft("CooldownHirsch"))
                MenuPanel:Remove()
            else
                surface.PlaySound("UI/buttonclick.wav")
                net.Start("SpawnDeers")
                    net.SendToServer()
                hirsch_c = true
                timer.Create("CooldownHirsch",120, 1 ,function()
                    hirsch_c = false
                end)
                chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast 6 Hirsche gespawnt")
                MenuPanel:Remove()
            end
        end

        local bear = vgui.Create("DButton", MenuPanel)
        bear:SetSize(MenuPanel:GetWide(), 30)
        bear:SetPos(0, 50)
        bear:SetText("")
        bear.Paint = BearBtnPaint
        bear.DoClick = function()
            if bear_c then
                surface.PlaySound("UI/buttonclick.wav")
                chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast einen Cooldown")
                MenuPanel:Remove()
            else
                surface.PlaySound("UI/buttonclick.wav")
                net.Start("SpawnBears")
                    net.SendToServer()
                bear_c = true
                timer.Create("CooldownBear",120, 1 ,function()
                    bear_c = false
                end)
                chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast 6 Bären gespawnt")
                MenuPanel:Remove()
            end
        end

        local croc = vgui.Create("DButton", MenuPanel)
        croc:SetSize(MenuPanel:GetWide(), 30)
        croc:SetPos(0, 90)
        croc:SetText("")
        croc.Paint = CrocBtnPaint
        croc.DoClick = function()
            if croc_c then
                surface.PlaySound("UI/buttonclick.wav")
                chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast einen Cooldown")
                MenuPanel:Remove()
            else
                surface.PlaySound("UI/buttonclick.wav")
                net.Start("SpawnCrocs")
                    net.SendToServer()
                croc_c = true
                timer.Create("CooldownCroc",120, 1 ,function()
                    croc_c = false
                end)
                chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast 6 Krokodile gespawnt")
                MenuPanel:Remove()
            end
        end

        local respawnshops = vgui.Create("DButton", MenuPanel)
        respawnshops:SetSize(MenuPanel:GetWide(), 30)
        respawnshops:SetPos(0, 130)
        respawnshops:SetText("")
        respawnshops.Paint = RespawnBtnPaint
        respawnshops.DoClick = function()
            surface.PlaySound("UI/buttonclick.wav")
            net.Start("Shop::RespawnAllShops")
                net.SendToServer()
            chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast alle Shops neu Gespawnt")
            MenuPanel:Remove()
        end

        local mehr = vgui.Create("DButton", MenuPanel)
        mehr:SetSize(MenuPanel:GetWide(), 30)
        mehr:SetPos(0, 170)
        mehr:SetText("")
        mehr.Paint = MehrBtnPaint
        mehr.DoClick = function()
            surface.PlaySound("UI/buttonclick.wav")
            chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Es wird bald noch mehr kommen ... ;)")
            MenuPanel:Remove()
        end
    else 
        chat.AddText(Color(255, 255, 255),"[Katas Menu] ",Color(255,50,50),"Du hast keine Admin rechte")
    end
end 


concommand.Add("open_katas_menu", function(ply)
    OpenKatasMenu()
end)

timer.Simple(2, function()
    print("__________________________________")
    print("~~ Katakuris Admin menu Geladen ~~")
    print("__________________________________")
end)

