surface.CreateFont( "Header", {
    font = "Montserrat",
    size = 35,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "Playerpanel", {
    font = "Montserrat",
    size = 23,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "Commands2", {
    font = "Montserrat",
    size = 25,
    weight = 100,
    antialias = true,
    italic = false,

} )

surface.CreateFont( "cmdd", {
    font = "Montserrat",
    size = 22,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "Infos", {
    font = "Montserrat",
    size = 27,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "playeron", {
    font = "Montserrat",
    size = 18,
    weight = 1000,
    antialias = true,
} )

local function ScorebasePaint(s, w, h)
    surface.SetDrawColor(color.bg)
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(color.akzent)
    surface.DrawRect(0, 0, 3, h)
    surface.DrawRect(3, 0, w - 6, 3)
    surface.DrawRect(3, h - 3, w - 6, 3)
    surface.DrawRect(w - 3, 0, 3, h)
    surface.DrawRect(3, h * 0 + 50, w - 6, 3)

    surface.SetDrawColor(color.ecke)
    surface.DrawRect(0, 0, 15, 3)
    surface.DrawRect(0, h - 3, 15, 3)
    surface.DrawRect(0, 0, 3, 15)
    surface.DrawRect(0, h - 15, 3, 15)
    surface.DrawRect(w - 15, 0, 15, 3)
    surface.DrawRect(w - 15, h - 3, 15, 3)
    surface.DrawRect(w - 3, 0, 3, 15)
    surface.DrawRect(w - 3, h - 15, 3, 15)

    if #player.GetAll() == 1 then
        draw.SimpleText("Derzeit bist nur du Online", "playeron", w / 2, h - 25, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else
        draw.SimpleText("Es sind "..#player.GetAll().." Spieler online", "playeron", w / 2, h - 25, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end
    draw.SimpleText(" C W R P   B Y   X E N O N   G A M I N G", "Header", w / 2, h * 0 + 25, Color(200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("Name", "Infos", w * .1, h * 0 + 75, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("Einheit", "Infos", w * .4, h * 0 + 75, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("Gruppe", "Infos", w * .7, h * 0 + 75, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText("Ping", "Infos", w * .95, h * 0 + 75, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

local function ShowScore(toggle)
    if toggle then
        if IsValid(Scorebase) then return end
        Scorebase = vgui.Create("DPanel")
        Scorebase:SetSize(1000, 650)
        Scorebase:Center()
        Scorebase:MakePopup()
        Scorebase.Paint = ScorebasePaint

        bg = vgui.Create("DPanel", Scorebase)
        bg:SetSize(994, 547)
        bg:SetPos(3, 100)
        bg.Paint = function() end

        local scroll = vgui.Create("DScrollPanel", bg)
        scroll:SetPos(0, bg:GetTall() * 0.03)
        scroll:SetSize(bg:GetWide(), bg:GetTall() * 0.9)
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
			draw.RoundedBox(2, w / 2 - 1, 0, 2, h, color.ecke)
		end

        for k, v in pairs(player.GetAll()) do
            local pnl = vgui.Create("DButton", scroll)
            pnl:SetSize(0, 30)
            pnl:Dock(TOP)
            pnl:DockMargin(2, 2, 2, 2)
            pnl:SetText("")
            pnl.Paint = function(s, w, h)
                surface.SetDrawColor(color.bg)
                surface.DrawRect(0, 0, w, h)
                if s:IsHovered() then
                    surface.SetDrawColor(color.akzent)
                    surface.DrawRect(0, 0, 2, h)
                end
                draw.SimpleText(v:Nick(), "Playerpanel", w * .052, h / 2, color.schrift, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:getDarkRPVar("job"), "Playerpanel", w * .4, h / 2, team.GetColor(v:Team()), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                if v:IsUserGroup("user") or v:IsUserGroup("noaccess") then
                    draw.SimpleText("Spieler", "Playerpanel", w * .7, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif v:IsUserGroup("donator") then
                    draw.SimpleText("Donator", "Playerpanel", w * .7, h / 2, Color(255,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                elseif not (v:IsUserGroup("user") or v:IsUserGroup("operator")) then
                    draw.SimpleText("Teammitglied", "Playerpanel", w * .7, h / 2, Color(25,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                draw.SimpleText(v:Ping(), "Playerpanel", w * .98, h / 2, Color(255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            end
            pnl.DoClick = function()
                if not LocalPlayer():IsAdmin() then return end
                if IsValid(cmd) then return end
                cmd = vgui.Create("DPanel")
                cmd:SetSize(900, 40)
                cmd:SetPos(ScrW() / 2 - 450, ScrH() - 200)
                cmd.Paint = function(s, w, h)
                    surface.SetDrawColor(color.bg)
                    surface.DrawRect(0, 0, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawRect(0, 0, 3, h)
                    surface.DrawRect(3, 0, w - 6, 3)
                    surface.DrawRect(3, h - 3, w - 6, 3)
                    surface.DrawRect(w - 3, 0, 3, h)
                    surface.DrawRect(3, h * 0 + 50, w - 6, 3)
                end 

                local kick = vgui.Create("DButton", cmd)
                kick:SetSize(100, 30)
                kick:Dock(LEFT)
                kick:DockMargin(9, 3, 3, 3)
                kick:SetText("")
                kick.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Kick", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Kick", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                kick.DoClick = function()
                    LocalPlayer():ConCommand("ulx kick "..v:Nick())
                end 

                local freeze = vgui.Create("DButton", cmd)
                freeze:SetSize(100, 30)
                freeze:Dock(LEFT)
                freeze:DockMargin(9, 3, 3, 3)
                freeze:SetText("")
                freeze.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Freeze", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Freeze", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                freeze.DoClick = function()
                    LocalPlayer():ConCommand("ulx freeze "..v:Nick())
                end 

                local specatate = vgui.Create("DButton", cmd)
                specatate:SetSize(100, 30)
                specatate:Dock(LEFT)
                specatate:DockMargin(9, 3, 3, 3)
                specatate.Paint = function(s, w, h)
                specatate:SetText("")
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Spectate", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Spectate", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                specatate.DoClick = function()
                    LocalPlayer():ConCommand("ulx spectate "..v:Nick())
                end 
                

                local god = vgui.Create("DButton", cmd)
                god:SetSize(100, 30)
                god:Dock(LEFT)
                god:DockMargin(9, 3, 3, 3)
                god:SetText("")
                god.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Godmode", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Godmode", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                god.DoClick = function()
                    LocalPlayer():ConCommand("ulx god "..v:Nick())
                end 

                local slay = vgui.Create("DButton", cmd)
                slay:SetSize(100, 30)
                slay:Dock(LEFT)
                slay:DockMargin(9, 3, 3, 3)
                slay:SetText("")
                slay.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Slayen", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Slayen", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                slay.DoClick = function()
                    LocalPlayer():ConCommand("ulx slay "..v:Nick())
                end 

                local bring = vgui.Create("DButton", cmd)
                bring:SetSize(100, 30)
                bring:Dock(LEFT)
                bring:DockMargin(9, 3, 3, 3)
                bring:SetText("")
                bring.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Bring", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Bring", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                bring.DoClick = function()
                    LocalPlayer():ConCommand("ulx bring "..v:Nick())
                end 

                local gotoo = vgui.Create("DButton", cmd)
                gotoo:SetSize(100, 30)
                gotoo:Dock(LEFT)
                gotoo:DockMargin(9, 3, 3, 3)
                gotoo:SetText("")
                gotoo.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Goto", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Goto", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                gotoo.DoClick = function()
                    LocalPlayer():ConCommand("ulx goto "..v:Nick())
                end 

                local maul = vgui.Create("DButton", cmd)
                maul:SetSize(100, 30)
                maul:Dock(LEFT)
                maul:DockMargin(9, 3, 3, 3)
                maul:SetText("")
                maul.Paint = function(s, w, h)
                    surface.SetDrawColor(color.akzent)
                    surface.DrawOutlinedRect(0, 0, w, h)
                    if s:IsHovered() then 
                        draw.SimpleText("Maulen", "cmdd", w / 2, h / 2, color.schrifthv, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    else
                        draw.SimpleText("Maulen", "cmdd", w / 2, h / 2, color.schrift, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    end
                end
                maul.DoClick = function()
                    LocalPlayer():ConCommand("ulx maul "..v:Nick())
                end 
            end
        end


    else
        if IsValid(Scorebase) then
            Scorebase:Remove()
            bg:Remove()
            if IsValid(cmd) then cmd:Remove() end
        end
    end 
end 

hook.Add("ScoreboardShow", "Xenon.show", function()
    ShowScore (true)
    return false
end)

hook.Add("ScoreboardHide", "Xenon.Hide", function()
    ShowScore (false)
end)

timer.Simple(2, function()
    print("Scoreboard wurde Geladen")
end)