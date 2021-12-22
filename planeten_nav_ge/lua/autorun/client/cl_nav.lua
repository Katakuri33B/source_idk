surface.CreateFont( "cls.font", {
	font = "Montserrat", 
	size = 20,
	weight = 500,
} )

surface.CreateFont( "btns.font", {
	font = "Montserrat", 
	size = 20,
	weight = 500,
} )

surface.CreateFont( "watermark.kat", {
	font = "Montserrat", 
	size = 11,
	weight = 500,
} )


function openNavfunction()
    if IsValid(GENavPNL) then return end
    surface.PlaySound("UI/buttonclick.wav")
    GENavPNL = vgui.Create("DPanel")
    GENavPNL:SetSize(ScrW(), 50)
    GENavPNL:SetPos(0, ScrH() - 50)
    GENavPNL:MakePopup()
    GENavPNL.Paint = function(s, w, h)
        surface.SetDrawColor(50, 50, 50, 200)
        surface.DrawRect(0, 0, w, h)

        surface.SetDrawColor(team.GetColor(LocalPlayer():Team()))
        surface.DrawRect(0, 0, w, 5)

        draw.SimpleText("- Made by Katakuri for GE", "watermark.kat", w - 10, h - 15, Color(255,255,255), TEXT_ALIGN_RIGHT)
    end 

    local cls = vgui.Create("DButton", GENavPNL)
    cls:SetSize(30, 20)
    cls:SetPos(GENavPNL:GetWide() - 35, GENavPNL:GetTall() * 0 + 10)
    cls:SetText("")
    cls.Paint = function(s, w, h)
        if s:IsHovered() then
            surface.SetDrawColor(60, 60, 60, 200)
            surface.DrawRect(0, 0, w, h)
            draw.SimpleText("X", "cls.font", w / 2, h / 2, Color(255,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            surface.SetDrawColor(50, 50, 50, 200)
            surface.DrawRect(0, 0, w, h)
            draw.SimpleText("X", "cls.font", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end 
    cls.DoClick = function()
        GENavPNL:Remove()
    end 

    for k, v in pairs(GENavigation.Planeten) do
        local planet = vgui.Create("DButton", GENavPNL)
        planet:SetSize(150, 0)
        planet:Dock(LEFT)
        planet:DockMargin(20, 10, 0, 10)
        planet:SetText("")
        planet.Paint = function(s, w, h)
            if s:IsHovered() then
                draw.RoundedBox(7.5, 0, 0, w, h, Color(70, 70, 70, 240))
                draw.SimpleText(tostring(k), "btns.font", w / 2, h / 2, Color(255,155,155), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else 
                draw.RoundedBox(7.5, 0, 0, w, h, Color(50, 50, 50, 240))
                draw.SimpleText(tostring(k), "btns.font", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        planet.DoClick = function()
            surface.PlaySound("Resource/warning.wav")
            LocalPlayer():ConCommand("say /akt Befindet ich im Anflug nach: "..tostring(k))
            GENavPNL:Remove()
        end 
        end 
    end
end

-- Resource/warning.wav    UI/buttonclick.wav



hook.Add( "PlayerButtonDown", "OpenNav", function(ply, btn) 
    if btn == KEY_COMMA then
        openNavfunction()
    end
end)
