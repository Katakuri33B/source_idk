
surface.CreateFont( "ladenraub.title", { font = "Montserrat", size = 22, weight = 100, antialias = true, } )

surface.CreateFont( "ladenraub.items", { font = "Montserrat", size = 18, weight = 100, antialias = true, } )

surface.CreateFont( "ladenraub.items2", { font = "Montserrat", size = 16, weight = 100, antialias = true, } )

surface.CreateFont( "ladenraub.ui", { font = "Montserrat", size = 20, weight = 100, antialias = true } )

local function ItemBGPaint(s, w, h)
    surface.SetDrawColor(20, 20, 20, 180)
    surface.DrawRect(0, 0, w, h)
end 

local function clsPaint(s, w, h)

    if s:IsHovered() then 
        draw.SimpleText("Close", "ladenraub.ui", w / 2, h / 2, Color(235, 235, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(25,255,255)
        surface.DrawRect(0, h - 2, w, 2)
    else
        draw.SimpleText("Close", "ladenraub.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

end

local function raubPaint(s, w, h)

    if s:IsHovered() then 
        draw.SimpleText("Ausrauben", "ladenraub.ui", w / 2, h / 2, Color(235, 235, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        surface.SetDrawColor(25,255,255)
        surface.DrawRect(0, h - 2, w, 2)
    else
        draw.SimpleText("Ausrauben", "ladenraub.ui", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

end

local function LadenUIPaint(s, w, h) 

    draw.RoundedBox(7.5, 0, 0, w, h, Color(40, 40, 40, 220))

    draw.SimpleText("Sortiment", "ladenraub.ui", w  / 2, h * .1, Color(255,35,35), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

end

local function TitelPaint(s, w, h) 

    draw.RoundedBoxEx(7.5, 0, 0, w, h, Color(50, 50, 50, 240), true, true, false, false)

    draw.SimpleText("Laden an der Tanke", "ladenraub.title", w * .25 , h / 2, Color(255,35,35), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function LadenUIOpen()

    if IsValid(LadenUII) then return end
    LadenUII = vgui.Create("DPanel")
    LadenUII:SetSize(400, 550)
    LadenUII:Center()
    LadenUII:MakePopup()
    LadenUII.Paint = LadenUIPaint

    local Titel = vgui.Create("DPanel", LadenUII)
    Titel:SetSize(0, 30)
    Titel:Dock(TOP)
    Titel.Paint = TitelPaint

    local cls = vgui.Create("DButton", Titel)
    cls:SetSize(50, 42)
    cls:Dock(RIGHT)
    cls:DockMargin(0, 0, 10, 0)
    cls:SetText("")
    cls.Paint = clsPaint
    cls.DoClick = function() 
        LadenUII:Remove()
    end

    local ItemBG = vgui.Create("DPanel", LadenUII)
    ItemBG:SetSize(LadenUII:GetWide(), LadenUII:GetTall() * .75)
    ItemBG:Center()
    ItemBG.Paint = ItemBGPaint

        local scroll = vgui.Create("DScrollPanel", ItemBG)
        scroll:SetPos(0, ItemBG:GetTall() * 0.03)
        scroll:SetSize(ItemBG:GetWide(), ItemBG:GetTall() * 0.9)
        function scroll:Paint(w, h) end
        local vbar = scroll:GetVBar()
	
		function vbar:Paint(w, h)
			
		end
		
		function vbar.btnUp:Paint(w, h)
			draw.RoundedBox(2, w / 2 - 1, 0, 2, h - 2, Color(255, 25, 25))
		end
		
		function vbar.btnDown:Paint(w, h)
			draw.RoundedBox(2, w / 2 - 1, 2, 2, h, Color(255, 25, 25))
		end
		
		function vbar.btnGrip:Paint(w, h)
			draw.RoundedBox(2, w / 2 - 1, 0, 2, h, Color(255,10,10))
		end


        for k, v in pairs(Sortiment) do 
            local SortimentPanel = vgui.Create("DPanel", scroll)
            SortimentPanel:SetSize(0, 40)
            SortimentPanel:Dock(TOP)
            SortimentPanel:DockMargin(0, 0, 0, 15)
            SortimentPanel.Paint = function(s, w, h)
                draw.RoundedBox(5, 0, 0, w, h, Color(20, 20, 20, 180))
                draw.SimpleText(v.Name, "ladenraub.items", 50, h / 2 - 10, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText("Gibt dir "..v.Leben.." Leben", "ladenraub.items2", 50, h / 2 + 10, Color(255,25,25), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end

            local icon = vgui.Create("SpawnIcon", SortimentPanel)
            icon:SetSize(40, 40)
            icon:Dock(LEFT)
            icon:SetModel(v.Icon)

            local buy = vgui.Create("DButton", SortimentPanel)
            buy:SetSize(120, 40)
            buy:Dock(RIGHT)
            buy:DockMargin(0, 10, 10, 10)
            buy:SetText("")
            buy.Paint = function(s, w, h)
                if s:IsHovered() then 
                    surface.SetDrawColor(50, 50, 50, 220)
                else
                    surface.SetDrawColor(20, 20, 20, 220)
                end
                surface.DrawRect(0, 0, w, h)
                if LocalPlayer():getDarkRPVar("money") < v.Price then 
                    draw.SimpleText("Zu wenig Geld", "ladenraub.items2", w / 2, h / 2, Color(255,25,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else 
                    draw.SimpleText("Kaufen", "ladenraub.items2", w / 2, h / 2, Color(25,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end
            buy.DoClick = function()
                if LocalPlayer():getDarkRPVar("money") < v.Price then return end
                surface.PlaySound("UI/buttonclick.wav")
                net.Start("BuyItem")         
                    net.WriteString(tostring(k))
                    net.WriteUInt(v.Leben, 64)
                net.SendToServer()

            end 

        end



    if ladenraub.räuber[team.GetName(LocalPlayer():Team())] then
        local raub = vgui.Create("DButton", Titel)
        raub:SetSize(90, 42)
        raub:Dock(RIGHT)
        raub:DockMargin(0, 0, 10, 0)
        raub:SetText("")
        raub.Paint = raubPaint
        raub.DoClick = function() 
            LadenUII:Remove()
            net.Start("broadcastNET")
                net.WriteEntity(LocalPlayer())
                net.SendToServer()
        end
    end

end 


net.Receive("LadenUI", function()
    LadenUIOpen()
end)


net.Receive("Alert", function()
    local ply = net.ReadEntity()
    if not ladenraub.cops[team.GetName(LocalPlayer():Team())] then return end 

    LocalPlayer():ChatPrint(ply:Nick().." raubt gerade eine Tankstelle aus!!")
    LocalPlayer():ChatPrint("Die sind Höchstwahrscheinlich Bewaffnet!!")
end)
