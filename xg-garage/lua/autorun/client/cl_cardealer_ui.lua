surface.CreateFont( "xg.Dialog", {
	font = "Montserrat", 
	size = 20,
    weight = 10,
} )

local hi = "dealer/hi.mp3"

local function AusparkMenu(s, w, h)
    surface.SetDrawColor(0, 0, 0, 220)
    surface.DrawRect(0, 0, w, h)
    draw.SimpleText("Was wollen sie Ausparken?", "xg.Dialog", 25, h * 0 + 10, Color(255,255,255), TEXT_ALIGN_LEFT)
end 

local function LAATPaint(s, w, h) 
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        draw.NoTexture()
        surface.DrawPoly(cursor)

        draw.SimpleText("Einen LAAT!", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Einen LAAT!", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function SpeederPaint(s, w, h) 
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        draw.NoTexture()
        surface.DrawPoly(cursor)

        draw.SimpleText("Einen Speeder!", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Einen Speeder!", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function PanzerPaint(s, w, h) 
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        draw.NoTexture()
        surface.DrawPoly(cursor)

        draw.SimpleText("Einen Panzer!", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Einen Panzer!", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function closePaint(s, w, h) 
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        draw.NoTexture()
        surface.DrawPoly(cursor)

        draw.SimpleText("Doch Nichts", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Doch Nichts", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function DialogPaint(s, w, h)
    surface.SetDrawColor(0, 0, 0, 220)
    surface.DrawRect(0, 0, w, h)
    draw.SimpleText("Guten Tag!", "xg.Dialog", 25, h * 0 + 10, Color(255,255,255), TEXT_ALIGN_LEFT)
    draw.SimpleText("Was kann ich für sie tun Soldat?", "xg.Dialog", 25, h * 0 + 35, Color(255,255,255), TEXT_ALIGN_LEFT)
end

local function KaufenPaint(s, w, h) 
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawPoly(cursor)

        draw.SimpleText("Etwas Ausparken!", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Etwas Ausparken!", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function GehenPaint(s, w, h) 
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawPoly(cursor)

        draw.SimpleText("Gehen", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Gehen!", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function clsPaint(s, w, h)
    if s:IsHovered() then

        local cursor = {
        { x = 5, y = 5},
        { x = 25, y = 15},
        { x = 5, y = 25},
        }

        surface.SetDrawColor(255, 255, 255, 255)
        surface.DrawPoly(cursor)

        draw.SimpleText("Schließen", "xg.Dialog", 35, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    else 
        draw.SimpleText("Schließen!", "xg.Dialog", 0, h / 2, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
    end
end

local function Kaufmenuu()
    if IsValid(Kaufmenu) then return end
    Kaufmenu = vgui.Create("DPanel")
    Kaufmenu:SetSize(10, 135)
    Kaufmenu:Dock(BOTTOM)
    Kaufmenu:MakePopup()
    Kaufmenu.Paint = AusparkMenu

    local shopmodelpanell = vgui.Create("DPanel")
    shopmodelpanell:SetSize(270, 200)
    shopmodelpanell:SetPos(ScrW() - 305, ScrH() - 135 - 200)
    shopmodelpanell.Paint = function() end

    local shopmodel_ = vgui.Create("DModelPanel", shopmodelpanell)
    shopmodel_:SetPos(0, 0)
    shopmodel_:Dock(FILL)
    shopmodel_:SetModel(XGCardealer.NPCModel)

    function shopmodel_:LayoutEntity( Entity ) return end	

    local headpos = shopmodel_.Entity:GetBonePosition(shopmodel_.Entity:LookupBone("ValveBiped.Bip01_Head1"))
    shopmodel_:SetLookAt(headpos)

    shopmodel_:SetCamPos(headpos-Vector(-15, 0, 0))	

    local LAAT = vgui.Create("DButton", Kaufmenu)
    LAAT:SetSize(190, 30)
    LAAT:SetPos(Kaufmenu:GetWide() * 0 + 30, Kaufmenu:GetTall() * 0 + 60)
    LAAT:SetText("")
    LAAT.Paint = LAATPaint
    LAAT.DoClick = function()
        net.Start("Ausparken")
            net.WriteString("LaatAusparken")
        net.SendToServer()
        Kaufmenu:Remove()
        shopmodelpanell:Remove()
        shopmodel_:Remove()
    end

    local Speeder = vgui.Create("DButton", Kaufmenu)
    Speeder:SetSize(190, 30)
    Speeder:SetPos(Kaufmenu:GetWide() * 0 + 30, Kaufmenu:GetTall() * 0 + 100)
    Speeder:SetText("")
    Speeder.Paint = SpeederPaint
    Speeder.DoClick = function()
        net.Start("Ausparken")
            net.WriteString("SpeederAusparken")
        net.SendToServer()
        Kaufmenu:Remove()
        shopmodelpanell:Remove()
        shopmodel_:Remove()
    end

    local Panzer = vgui.Create("DButton", Kaufmenu)
    Panzer:SetSize(190, 30)
    Panzer:SetPos(Kaufmenu:GetWide() * 0 + 230, Kaufmenu:GetTall() * 0 + 60)
    Panzer:SetText("")
    Panzer.Paint = PanzerPaint
    Panzer.DoClick = function()
        net.Start("Ausparken")
            net.WriteString("PanzerAusparken")
        net.SendToServer()
        Kaufmenu:Remove()
        shopmodelpanell:Remove()
        shopmodel_:Remove()
    end

    local close = vgui.Create("DButton", Kaufmenu)
    close:SetSize(190, 30)
    close:SetPos(Kaufmenu:GetWide() * 0 + 230, Kaufmenu:GetTall() * 0 + 100)
    close:SetText("")
    close.Paint = closePaint
    close.DoClick = function()
        Kaufmenu:Remove()
        shopmodelpanell:Remove()
        shopmodel_:Remove()
    end
end

function XGCarDealer()
    if IsValid(Dialog) then return end
    surface.PlaySound(hi)
    Dialog = vgui.Create("DPanel")
    Dialog:SetSize(10, 135)
    Dialog:Dock(BOTTOM)
    Dialog:MakePopup()
    Dialog.Paint = DialogPaint

    local shopmodelpanel = vgui.Create("DPanel")
    shopmodelpanel:SetSize(270, 200)
    shopmodelpanel:SetPos(ScrW() - 305, ScrH() - 135 - 200)
    shopmodelpanel.Paint = function() end

    local shopmodel_ = vgui.Create("DModelPanel", shopmodelpanel)
    shopmodel_:SetPos(0, 0)
    shopmodel_:Dock(FILL)
    shopmodel_:SetModel(XGCardealer.NPCModel)

    
    function shopmodel_:LayoutEntity( Entity ) return end	

    local headpos = shopmodel_.Entity:GetBonePosition(shopmodel_.Entity:LookupBone("ValveBiped.Bip01_Head1"))
    shopmodel_:SetLookAt(headpos)

    shopmodel_:SetCamPos(headpos-Vector(-15, 0, 0))	


    local Kaufen = vgui.Create("DButton", Dialog)
    Kaufen:SetSize(190, 30)
    Kaufen:SetPos(Dialog:GetWide() * 0 + 30, Dialog:GetTall() * 0 + 60)
    Kaufen:SetText("")
    Kaufen.Paint = KaufenPaint
    Kaufen.DoClick = function()
        Dialog:Remove()
        shopmodelpanel:Remove()
        Kaufmenuu()
    end

    local Gehen = vgui.Create("DButton", Dialog)
    Gehen:SetSize(190, 30)
    Gehen:SetPos(Dialog:GetWide() * 0 + 30, Dialog:GetTall() * 0 + 100)
    Gehen:SetText("")
    Gehen.Paint = GehenPaint

    local cls = vgui.Create("DButton", Dialog)
    cls:SetSize(180, 30)
    cls:SetText("")
    cls:SetPos(ScrW() - 130, Dialog:GetTall() - 40)
    cls.Paint = clsPaint
    cls.DoClick = function()
        Dialog:Remove()
        shopmodelpanel:Remove()
        shopmodel_:Remove()
    end

end

net.Receive("DealerUI", function()
    XGCarDealer()
end)