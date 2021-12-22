surface.CreateFont( "xg.notify.ui", {
    font = "Montserrat",
    size = 25,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "xg.notify.ui2", {
    font = "Montserrat",
    size = 23,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "xg.notify.ui3", {
    font = "Montserrat",
    size = 18,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "xg.notify.ui.cls", {
    font = "Montserrat",
    size = 32,
    weight = 100,
    antialias = true,
} )

local function TOMenuPaint(s, w, h)
    surface.SetDrawColor(color.bg)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(color.akzent)
    surface.DrawRect(0, 0, 3, h)
    surface.DrawRect(3, 0, w - 6, 3)
    surface.DrawRect(3, h - 3, w - 6, 3)
    surface.DrawRect(w - 3, 0, 3, h)

    surface.SetDrawColor(color.ecke)
    surface.DrawRect(0, 0, 15, 3)
    surface.DrawRect(0, h - 3, 15, 3)
    surface.DrawRect(0, 0, 3, 15)
    surface.DrawRect(0, h - 15, 3, 15)
    surface.DrawRect(w - 15, 0, 15, 3)
    surface.DrawRect(w - 15, h - 3, 15, 3)
    surface.DrawRect(w - 3, 0, 3, 15)
    surface.DrawRect(w - 3, h - 15, 3, 15)

    draw.SimpleText("XG Tryout Menu", "xg.notify.ui", w / 2, h * 0 + 20, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText("Welche Einheit?", "xg.notify.ui2", w / 2, h * 0 + 100, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText("Wo wird es Stattfinden?", "xg.notify.ui2", w / 2, h * 0 + 180, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    draw.SimpleText("In wie vielen Minuten?", "xg.notify.ui2", w / 2, h * 0 + 260, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end


function OpenTOMenu()
    if IsValid(TOMenu) then return end
    TOMenu = vgui.Create("DFrame")
    TOMenu:SetSize(400, 500)
    TOMenu:Center()
    TOMenu:SetTitle("")
    TOMenu:ShowCloseButton(false)
    TOMenu:MakePopup()
    TOMenu.Paint = TOMenuPaint

    local cls = vgui.Create("DButton", TOMenu)
    cls:SetSize(48, 48) 
    cls:SetPos(400 - 58, 10)
    cls:SetText("")
    cls.Paint = function(s, w, h)
        surface.SetDrawColor(color.akzent)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(3, 0, w - 6, 3)
        surface.DrawRect(3, h - 3, w - 6, 3)
        surface.DrawRect(w - 3, 0, 3, h)

        if s:IsHovered() then
            draw.SimpleText("X", "xg.notify.ui.cls", w / 2, h / 2, color.akzent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else 
            draw.SimpleText("X", "xg.notify.ui.cls", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        
    end
    cls.DoClick = function()
        TOMenu:Remove()
    end


    einheit = vgui.Create("DTextEntry", TOMenu)
    einheit:SetSize(300, 30)
    einheit:SetPos(50, 117)
    einheit:SetFont("xg.notify.ui")
    einheit:SetTextColor(Color(0, 0, 0))
    einheit:SetEditable( true )
    einheit:SetPlaceholderText("Einheit Eingeben")
    einheit.OnEnter = function(s)
        s:SetValue()
    end

    ort = vgui.Create("DTextEntry", TOMenu)
    ort:SetSize(300, 30)
    ort:SetPos(50, 197)
    ort:SetFont("xg.notify.ui")
    ort:SetTextColor(Color(0, 0, 0))
    ort:SetEditable( true )
    ort:SetPlaceholderText("Ort Eingeben (' im... ')")
    ort.OnEnter = function(s)
        s:SetValue()
    end

    wann = vgui.Create("DTextEntry", TOMenu)
    wann:SetSize(300, 30)
    wann:SetPos(50, 277)
    wann:SetFont("xg.notify.ui")
    wann:SetTextColor(Color(0, 0, 0))
    wann:SetEditable( true )
    wann:SetPlaceholderText("In wie vielen Minuten?")
    wann.OnEnter = function(s)
        s:SetValue()
    end


    local Bestätigen = vgui.Create("DButton", TOMenu)
    Bestätigen:SetSize(128, 128)
    Bestätigen:SetPos(TOMenu:GetWide() / 2 - 64, TOMenu:GetTall() - 150)
    Bestätigen:SetText("")
    Bestätigen.Paint = function(s, w, h)
        surface.SetDrawColor(255,255,255) 
        if s:IsHovered() then
            surface.SetMaterial(Material("materials/icons/clone_y.png"))
        else
            surface.SetMaterial(Material("materials/icons/clone.png"))
        end
        surface.DrawTexturedRect(0, 0, w, h)
    end 
    Bestätigen.DoClick = function()
        if einheit:GetValue() == " " or wann:GetValue() ==" " or ort:GetValue() == "" then LocalPlayer():ChatPrint("Du musst alles Ausfüllen") return end
        net.Start("TryOutMenuSend")
            net.WriteString(einheit:GetValue())
            net.WriteString(wann:GetValue())
            net.WriteString(ort:GetValue())
        net.SendToServer()
        TOMenu:Close()
    end

end 


net.Receive("TryOutMenuOpen", function(len, ply)
    OpenTOMenu()
end)

net.Receive("TryOutMenuBroadcast", function()
    local einheit_txt = net.ReadString()
    local wann_txt = net.ReadString()
    local ort_txt = net.ReadString()

    if IsValid(Notify) then return end
    Notify = vgui.Create("DPanel")
    Notify:SetPos(ScrW() * .5 - 175, ScrH() * 0 + 75)
    Notify:SizeTo(350, 100, .5, 0, -1, function() end)
    Notify.Paint = function(s, w, h)
        surface.SetDrawColor(color.bg)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(color.akzent)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(3, 0, w - 6, 3)
        surface.DrawRect(3, h - 3, w - 6, 3)
        surface.DrawRect(w - 3, 0, 3, h)

        surface.SetDrawColor(color.ecke)
        surface.DrawRect(0, 0, 15, 3)
        surface.DrawRect(0, h - 3, 15, 3)
        surface.DrawRect(0, 0, 3, 15)
        surface.DrawRect(0, h - 15, 3, 15)
        surface.DrawRect(w - 15, 0, 15, 3)
        surface.DrawRect(w - 15, h - 3, 15, 3)
        surface.DrawRect(w - 3, 0, 3, 15)
        surface.DrawRect(w - 3, h - 15, 3, 15)

        draw.SimpleText("In "..wann_txt.." Minuten", "xg.notify.ui3", w / 2, h / 2 - 25 , color_akzent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.SimpleText("Wird ein TryOut der "..einheit_txt.." stattfinden", "xg.notify.ui3", w / 2, h / 2  , color_akzent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.SimpleText("Sammelt euch dafür "..ort_txt, "xg.notify.ui3", w / 2, h / 2 + 25, color_akzent, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    surface.PlaySound("alert/sci_fi_alert.mp3")

    timer.Simple(10, function()
        Notify:SizeTo(1, 1, .3, 0, -1, function() end)
        timer.Simple(0.3, function()
            Notify:Remove()
        end)
    end)

end)