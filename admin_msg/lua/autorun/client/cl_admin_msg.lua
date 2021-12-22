
surface.CreateFont( "Adminmsg.UI", {
	font = "Montserrat", 
	size = 20,
	weight = 500,
} )

surface.CreateFont( "Adminmsg.msg", {
	font = "Montserrat", 
	size = 17,
	weight = 500,
} )

surface.CreateFont( "Adminmsg.cls", {
	font = "Montserrat", 
	size = 32,
	weight = 500,
} )

local akzent = Color(230, 126, 34)
local alert = "admin_msg/msg_alert.mp3"

local function MSGMenuPaint(s, w, h)
    surface.SetDrawColor(0, 0, 0, 220)
    surface.DrawRect(0, 0, w, h)
    --Ecken
    surface.SetDrawColor(akzent)
    surface.DrawOutlinedRect(0, 0, w, h)
    surface.DrawRect(0, 0, 15, 3)
    surface.DrawRect(0, h - 3, 15, 3)
    surface.DrawRect(0, 0, 3, 15)
    surface.DrawRect(0, h - 15, 3, 15)
    surface.DrawRect(w - 15, 0, 15, 3)
    surface.DrawRect(w - 15, h - 3, 15, 3)
    surface.DrawRect(w - 3, 0, 3, 15)
    surface.DrawRect(w - 3, h - 15, 3, 15)

    draw.SimpleText("Gamingecke Adminnachrichten", "Adminmsg.UI", w / 2, h * 0 + 20, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

local function sendenPaint(s, w, h)
    if s:IsHovered() then
        surface.SetDrawColor(30, 30, 30, 220)
        surface.DrawRect(0, 0, w, h)
        --Ecken
        surface.SetDrawColor(akzent)
        surface.DrawOutlinedRect(0, 0, w, h)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 10)

        draw.SimpleText("Broadcasten", "Adminmsg.UI", w / 2, h / 2, Color(255,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else 
        surface.SetDrawColor(0, 0, 0, 220)
        surface.DrawRect(0, 0, w, h)
        --Ecken
        surface.SetDrawColor(akzent)
        surface.DrawOutlinedRect(0, 0, w, h)
        surface.DrawRect(0, 0, 10, 3)
        surface.DrawRect(0, h - 3, 10, 3)
        surface.DrawRect(0, 0, 3, 10)
        surface.DrawRect(0, h - 10, 3, 10)
        surface.DrawRect(w - 10, 0, 10, 3)
        surface.DrawRect(w - 10, h - 3, 10, 3)
        surface.DrawRect(w - 3, 0, 3, 10)
        surface.DrawRect(w - 3, h - 10, 3, 1015)

        draw.SimpleText("Broadcasten", "Adminmsg.UI", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
end

function AdminMSGMenu()
    if IsValid(MSGMenu) then return end
    MSGMenu = vgui.Create("DFrame")
    MSGMenu:SetSize(600, 200)
    MSGMenu:Center()
    MSGMenu:MakePopup()
    MSGMenu:SetTitle("")
    MSGMenu:ShowCloseButton(false)
    MSGMenu.Paint = MSGMenuPaint

    local msg = vgui.Create("DTextEntry", MSGMenu)
    msg:SetSize(MSGMenu:GetWide() - 50, MSGMenu:GetTall() * .15)
    msg:SetPos(25, MSGMenu:GetTall() * .45)
    msg:SetFont("Adminmsg.UI")
    msg:SetPlaceholderText("Maximal 40 Zeichen!")
    msg.OnEnter = function( self )
		self:SetValue()
	end


    local senden = vgui.Create("DButton", MSGMenu)
    senden:SetSize(MSGMenu:GetWide() / 2, MSGMenu:GetTall() * .15)
    senden:SetPos(MSGMenu:GetWide() / 4, MSGMenu:GetTall() * .80)
    senden:SetText("")
    senden.Paint = sendenPaint
    senden.DoClick = function()
        if msg:GetValue() == "" then chat.AddText(Color(255,255,255),"Du musst auch eine Nachricht eingeben...")return end
        net.Start("AdminMSGSend")
            net.WriteString(msg:GetValue())
        net.SendToServer()
    end
    
    local cls = vgui.Create("DButton", MSGMenu)
    cls:SetSize(32, 32)
    cls:SetPos(MSGMenu:GetWide() - 35, 3)
    cls:SetText("")
    cls.Paint = function(s, w, h)
        if s:IsHovered() then
            draw.SimpleText("X", "Adminmsg.cls", w / 2, h / 2, Color(255,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else 
            draw.SimpleText("X", "Adminmsg.cls", w / 2, h / 2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
    cls.DoClick = function()
        MSGMenu:Close()
    end 
end



net.Receive("openAdminMSG", function()
    AdminMSGMenu()
end)




net.Receive("AdminBroadcast", function()

    local msg = net.ReadString()

    if IsValid(Brpnl) then return end
    surface.PlaySound(alert)
    Brpnl = vgui.Create("DPanel")
    Brpnl:SizeTo(550, 50, .5, 0, -1, function() end)
    Brpnl:SetPos(ScrW() / 2 - ( 550 / 2 ), ScrH() * 0 + 50)
    Brpnl.Paint = function(s, w, h)
        surface.SetDrawColor(0, 0, 0, 220)
        surface.DrawRect(0, 0, w, h)
        --Ecken
        surface.SetDrawColor(akzent)
        surface.DrawOutlinedRect(0, 0, w, h)
        surface.DrawRect(0, 0, 15, 3)
        surface.DrawRect(0, h - 3, 15, 3)
        surface.DrawRect(0, 0, 3, 15)
        surface.DrawRect(0, h - 15, 3, 15)
        surface.DrawRect(w - 15, 0, 15, 3)
        surface.DrawRect(w - 15, h - 3, 15, 3)
        surface.DrawRect(w - 3, 0, 3, 15)
        surface.DrawRect(w - 3, h - 15, 3, 15)

        draw.SimpleText("Admin Rundfunk", "Adminmsg.UI", w / 2, h / 2 - 10, HSVToColor(  ( CurTime() * 75 ) % 360, 1, 1 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText(tostring(msg), "Adminmsg.msg", w / 2, h / 2 + 10, Color(255,25,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end 

    timer.Simple(10, function()
        Brpnl:SizeTo(1, 1, .5, 0, -1, function() end)
        timer.Simple(.5, function()
            Brpnl:Remove()
        end)
    end)
end)