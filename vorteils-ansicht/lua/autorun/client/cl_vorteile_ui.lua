surface.CreateFont( "vorteile.ui.normal", {
    font = "Montserrat",
    size = 20,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "vorteile.ui.cls", {
    font = "Montserrat",
    size = 32,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "vorteile.ui.header", {
    font = "Montserrat",
    size = 25,
    weight = 100,
    antialias = true,
} )

local mount_cooldown = false

local function VTPnlPNT(s, w, h)
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

    draw.SimpleText("Level Vorteile", "vorteile.ui.header", w / 2, h * 0 + 20, Color(255,100,0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end 

local function clsPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(40, 40, 40, 140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        draw.SimpleText("X", "vorteile.ui.cls", w / 2, h / 2, Color(255,255,255),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    else
        surface.SetDrawColor(30, 30, 30, 140)
        surface.DrawRect(0, 0, w, h)
        surface.SetDrawColor(190, 126, 34, 200)
        surface.DrawRect(0, 0, 3, h)
        surface.DrawRect(0, 0, w, 3)
        surface.DrawRect(0, h - 3, w, 3)
        surface.DrawRect(w - 3, 0, 3, h)
        draw.SimpleText("X", "vorteile.ui.cls", w / 2, h / 2, Color(200,200,200),TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    end
end 

function OpenVorteilsPanel()
    if IsValid(VTPnl) then return end
    VTPnl = vgui.Create("DPanel")
    VTPnl:SetSize(400, 500)
    VTPnl:Center()
    VTPnl:MakePopup()
    VTPnl.Paint = VTPnlPNT

    local cls = vgui.Create("DButton", VTPnl)
    cls:SetSize(32,32)
    cls:SetPos(VTPnl:GetWide() - 40, VTPnl:GetTall() * 0 + 8)
    cls:SetText("")
    cls.Paint = clsPaint
    cls.DoClick = function()
        VTPnl:Remove()
    end 

    local bg = vgui.Create("DPanel", VTPnl)
    bg:SetSize(VTPnl:GetWide() - 6, VTPnl:GetTall() * .9 - 3)
    bg:SetPos(VTPnl:GetWide() * 0 + 3, VTPnl:GetTall() * .1 - 3)
    bg.Paint = function() end

    for k, v in pairs(Vorteile) do
        local vorteil = vgui.Create("DButton", bg)
        vorteil:SetSize(0, 30)
        vorteil:Dock(TOP)
        vorteil:DockMargin(0, 0, 0, 15)
        vorteil:SetText("")
        vorteil.Paint = function(s, w, h)
            if s:IsHovered() then
                surface.SetDrawColor(40, 40, 40, 140)
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
                draw.SimpleText(tostring(v.name), "vorteile.ui.normal", w / 2, h / 2, Color(230,230,230), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            else
                surface.SetDrawColor(30, 30, 30, 140)
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
                draw.SimpleText(tostring(v.name), "vorteile.ui.normal", w / 2, h / 2, Color(200,200,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end 
        vorteil.DoClick = v.func

    end
end



net.Receive("ShowVorteilsPanel", function()
    OpenVorteilsPanel()
end)

net.Receive("ClientChatPrint", function()
    local str = net.ReadString()
    
    if str == "DailyPrint" then
        chat.AddText(Color(255,25,25),"[Vorteile] ",Color(255,255,25),"Du hast einen Cooldown hier drauf [24Std].")
    end
end)