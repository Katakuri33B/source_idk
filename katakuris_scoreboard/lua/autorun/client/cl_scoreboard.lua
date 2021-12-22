timer.Simple(1, function()
	hook.Remove("ScoreboardShow", "FAdmin_scoreboard")
	hook.Remove("ScoreboardHide", "FAdmin_scoreboard")
end)

resource.AddFile("resource/fonts/skyrim.ttf")

--UTime function
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

	return string.format( "%02iw %id %02ih %02im", w, d, h, m )
end

surface.CreateFont( "Header", {
    font = "Typo3",
    size = ScrH() * 0 + 35,
    weight = 1000,
    antialias = true,
} )

surface.CreateFont( "Playerpanel", {
    font = "Typo3",
    size = ScrH() * 0 + 25,
    weight = 1000,
    antialias = true,
} )

surface.CreateFont( "Commands2", {
    font = "Typo3",
    size = ScrH() * 0 + 25,
    weight = 1000,
    antialias = true,
    italic = false,

} )

surface.CreateFont( "Commands", {
    font = "Typo3",
    size = ScrH() * 0 + 25,
    weight = 1000,
    antialias = true,
} )

surface.CreateFont( "Infos", {
    font = "Typo3",
    size = ScrH() * 0 + 27,
    weight = 1000,
    antialias = true,
} )

surface.CreateFont( "Infos2", {
    font = "Montserrat",
    size = ScrH() * 0 + 21,
    weight = 100,
    antialias = true,
} )

surface.CreateFont( "Zeit", {
    font = "Montserrat",
    size = ScrH() * 0 + 22,
    weight = 1000,
    antialias = true,
} )

local function ShowScore(toggle)

    local untenteam = {
    ["supporter"] = true,
    ["mod"] = true,
    }

    local mittelteam = {
        ["sr-mod"] = true,
        ["admin"] = true,
    }

    local hohesteam = {
        ["superadmin"] = true,
        ["projektleitung"] = true,
    }

    local commteam = {
        ["comteam"] = true,
    }

    if toggle then
        if IsValid(Scorebase) then return end
        Scorebase = vgui.Create("DFrame")
        Scorebase:SetSize(ScrW() * .8, ScrH() * .7)
        Scorebase:Center()
        Scorebase:SetDraggable(false)
        Scorebase:ShowCloseButton(false)
        Scorebase:SetTitle("")
        Scorebase.Paint = function(me, w, h)
            surface.SetDrawColor(0, 0, 0, 200)
            surface.DrawRect(0, 0, w, h)
            --Ecken
            surface.SetDrawColor(230, 126, 34)
            surface.DrawOutlinedRect(0, 0, w, h)
            surface.DrawRect(0, 0, 15, 3)
            surface.DrawRect(0, h - 3, 15, 3)
            surface.DrawRect(0, 0, 3, 15)
            surface.DrawRect(0, h - 15, 3, 15)
            surface.DrawRect(w - 15, 0, 15, 3)
            surface.DrawRect(w - 15, h - 3, 15, 3)
            surface.DrawRect(w - 3, 0, 3, 15)
            surface.DrawRect(w - 3, h - 15, 3, 15)
            --strich
            surface.SetDrawColor(230, 126, 34)
            surface.DrawRect(0, h * 0 + 50, w, 3)
            Derma_DrawBackgroundBlur(Scorebase, SysTime())
            --text
            draw.SimpleText("NAME", "Infos", 50, h * 0 + 25, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText("LEVEL", "Infos", w * .35, h * 0 + 25, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("JOB", "Infos", w / 2 + 100, h * 0 + 25, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("P", "Infos", w - 20, h * 0 + 25, Color(25, 255, 25), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
            draw.SimpleText("Extras", "Infos", w * .8, h * 0 + 25, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Spieler: "..#player.GetAll().." von "..game.MaxPlayers(), "Infos2", w * 0 + 10, h - 20, Color(230, 126, 34), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            draw.SimpleText("F1: Perksystem", "Infos2", w * .225, h - 20, Color(230, 126, 34), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText("Extras:  (W) = Whitelister,  (q) = Spawnmenu zugang", "Infos2", w / 2, h - 20, Color(230, 126, 34), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            -- UTime
            draw.SimpleText("Spielzeit: "..(timeToStr( LocalPlayer():GetUTimeTotalTime() )), "Infos2", w - 20, h - 20, Color(230, 126, 34), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
        end 

        bg = vgui.Create("DFrame")
        bg:SetSize(ScrW() * .8, Scorebase:GetTall() * .88)
        bg:Center()
        bg:MakePopup()
        bg:SetDraggable(false)
        bg:ShowCloseButton(false)
        bg:SetTitle("")
        bg.Paint = function() end

        local scroll = vgui.Create("DScrollPanel", bg)
        scroll:SetPos(0, bg:GetTall() * 0.03)
        scroll:SetSize(bg:GetWide(), bg:GetTall() * 0.9)
        function scroll:Paint(w, h) end
        local vbar = scroll:GetVBar()
	
		function vbar:Paint(w, h)
			
		end
		
		function vbar.btnUp:Paint(w, h)
			draw.RoundedBox(2, w / 2 - 1, 0, 2, h - 2, Color(230, 126, 34))
		end
		
		function vbar.btnDown:Paint(w, h)
			draw.RoundedBox(2, w / 2 - 1, 2, 2, h, Color(230, 126, 34))
		end
		
		function vbar.btnGrip:Paint(w, h)
			draw.RoundedBox(2, w / 2 - 1, 0, 2, h, Color(230, 126, 34))
		end

        local ypos = 0
        for k, v in pairs(player.GetAll()) do
            

            pp = vgui.Create("DButton", scroll)
            pp:SetText("")
            pp:SetPos(0, ypos)
            pp:SetSize(bg:GetWide(), bg:GetTall() * 0.06)
            pp:SetPlayer(v)
            pp.Paint = function(me, w, h)
                if me:IsHovered() then
                    surface.SetDrawColor(100, 100, 100, 130)
                    surface.SetMaterial(Material("gui/gradient"))
                    surface.DrawTexturedRect(0, 0, w, h )
                else    
                

                end
                draw.SimpleText(v:Nick(), "Playerpanel", 50, h / 2 - 3, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
                draw.SimpleText(v:getDarkRPVar("job"), "Playerpanel", w / 2 + 100, h / 2, team.GetColor(v:Team()), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                if v:IsUserGroup("supporter") then
                    draw.SimpleText("Unteres Team", "Playerpanel", w * .8, h / 2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                if v:IsUserGroup("supporter-w") or v:IsUserGroup("mod") then
                    draw.SimpleText("Unteres Team (W)", "Playerpanel", w * .8, h / 2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                if mittelteam[v:GetUserGroup()] then
                    draw.SimpleText("Mittleres Team (W | Q)", "Playerpanel", w * .8, h / 2, Color(25, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                if hohesteam[v:GetUserGroup()] then
                    draw.SimpleText("Leitungsebene (W | Q)", "Playerpanel", w * .8, h / 2, Color(255, 25, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                if commteam[v:GetUserGroup()] then
                    draw.SimpleText("Communityteam", "Playerpanel", w * .8, h / 2, Color(190, 46, 221), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                if v:IsUserGroup("user") then
                    draw.SimpleText("Spieler", "Playerpanel", w * .8, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER) 
                end
                if v:IsUserGroup("donator") then
                    draw.SimpleText("Donator", "Playerpanel", w * .8, h / 2, Color(25, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                if v:IsUserGroup("noaccess") then
                    draw.SimpleText("Spieler", "Playerpanel", w * .8, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end 


                draw.SimpleText(v:getDarkRPVar("level"), "Playerpanel", w * .35, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                
                if v:Ping() > 100 then
                    draw.SimpleText(v:Ping(), "Playerpanel", w - 18, h / 2, Color(255, 25, 25), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                elseif v:Ping() > 75 then
                    draw.SimpleText(v:Ping(), "Playerpanel", w - 18, h / 2, Color(255, 255, 25), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                elseif v:Ping() < 75 then
                    draw.SimpleText(v:Ping(), "Playerpanel", w - 18, h / 2, Color(25, 255, 25), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                end

                if me:IsHovered() then
                    surface.SetDrawColor(250, 146, 54)
                else
                    surface.SetDrawColor(230, 126, 34)
                end
                surface.SetMaterial(Material("gui/gradient"))
                surface.DrawTexturedRect(0, h - 2, w - 50, 2 )
            end 
            ypos = ypos + pp:GetTall() * 1.25 

        pp.DoRightClick = function()
            if v:IsBot() or v:IsNPC() then 
                chat.AddText(Color(255,255,255),v:Nick().." ist ",Color(255,25,25),"kein Spieler!")
            else
                v:ShowProfile()
            end
        end     
        pp.DoClick = function(ply)
            if !LocalPlayer():IsAdmin() then return end
            if IsValid(commands) then return end
            commands = vgui.Create("DFrame", Scorebase)
            commands:SetSize(ScrW(), 40)
            commands:SetPos(0, ScrH() * 0.87)
            commands:SetTitle("")
            commands:SetDraggable(false)
            commands:MakePopup()
            commands:ShowCloseButton(false)
            commands.Paint = function(self, w, h) 
                surface.SetDrawColor(0, 0, 0, 200)
                surface.DrawRect(0, 0, w, h)
                surface.SetDrawColor(230, 126, 34)
                surface.DrawOutlinedRect(0, 0, w, h)
                surface.DrawRect(0, 0, 10, 3)
                surface.DrawRect(0, h - 3, 10, 3)
                surface.DrawRect(0, 0, 3, 10)
                surface.DrawRect(0, h - 10, 3, 10)
                surface.DrawRect(w - 10, 0, 10, 3)
                surface.DrawRect(w - 10, h - 3, 10, 3)
                surface.DrawRect(w - 3, 0, 3, 10)
                surface.DrawRect(w - 3, h - 10, 3, 10)
            end

            local infos = vgui.Create("DButton", commands)
            infos:SetText("")
            infos:SetPos(commands:GetWide() * 0.03, 0)
            infos:SetSize(200, 40)
            infos.Paint = function(self, w, h)
                if infos:IsHovered() then 
                    draw.SimpleText("Infos ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("Infos", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            infos.DoClick = function(ply)
                chat.AddText(Color(255,25,25),"Leben: ",v:Health().." von "..v:GetMaxHealth())
                chat.AddText(Color(25,25,255),"Rüstung: ",v:Armor())
                chat.AddText(Color(25,255,25),"Gold: ",v:getDarkRPVar("money"))
                chat.AddText(Color(255,25,255),"SteamID: ",v:SteamID())
                chat.AddText(Color(255,25,255),"SteamID64: ",v:SteamID64())
                chat.AddText(Color(25,255,255),"Land: ",system:GetCountry())
                chat.AddText(Color(135,105,65),"Waffe: ",v:GetActiveWeapon():GetPrintName())
            end 

            local freeze = vgui.Create("DButton", commands)
            freeze:SetText("")
            freeze:SetPos(commands:GetWide() * 0.13, 0)
            freeze:SetSize(200, 40)
            freeze.Paint = function(self, w, h)
                if freeze:IsHovered() then 
                    draw.SimpleText("freeze ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("freeze", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            freeze.DoClick = function(ply)
                RunConsoleCommand("ulx","freeze",v:GetName())
            end 

            local unfreeze = vgui.Create("DButton", commands)
            unfreeze:SetText("")
            unfreeze:SetPos(commands:GetWide() * .25, 0)
            unfreeze:SetSize(200, 40)
            unfreeze.Paint = function(self, w, h)
                if unfreeze:IsHovered() then 
                    draw.SimpleText("unfreeze ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("unfreeze", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            unfreeze.DoClick = function(ply)
                RunConsoleCommand("ulx","unfreeze",v:GetName())
            end 

            local god = vgui.Create("DButton", commands)
            god:SetText("")
            god:SetPos(commands:GetWide() * 0.37, 0)            
            god:SetSize(200, 40)
            god.Paint = function(self, w, h)
                if god:IsHovered() then 
                    draw.SimpleText("godmode ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("godmode", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            god.DoClick = function(ply)
                RunConsoleCommand("ulx","god",v:GetName())
            end 
        
            local Goto = vgui.Create("DButton", commands)
            Goto:SetText("")
            Goto:SetPos(commands:GetWide() * 0.48, 0)
            Goto:SetSize(200, 40)
            Goto.Paint = function(self, w, h)
                if Goto:IsHovered() then 
                    draw.SimpleText("Goto ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("Goto", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            Goto.DoClick = function(pnl, ply)
                RunConsoleCommand("ulx","goto",v:GetName())
            end 
        
            local bring = vgui.Create("DButton", commands)
            bring:SetText("")
            bring:SetPos(commands:GetWide() * 0.57, 0)
            bring:SetSize(200, 40)
            bring.Paint = function(self, w, h)
                if bring:IsHovered() then 
                    draw.SimpleText("Bring ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("Bring", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            bring.DoClick = function(ply)
                RunConsoleCommand("ulx","bring",v:GetName())
            end 

            local strip = vgui.Create("DButton", commands)
            strip:SetText("")
            strip:SetPos(commands:GetWide() * 0.66, 0)
            strip:SetSize(200, 40)
            strip.Paint = function(self, w, h)
                if strip:IsHovered() then 
                    draw.SimpleText("strip ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("strip", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            strip.DoClick = function(ply)
                RunConsoleCommand("ulx","strip",v:GetName())
            end 

            local spectate = vgui.Create("DButton", commands)
            spectate:SetText("")
            spectate:SetPos(commands:GetWide() * 0.76, 0)
            spectate:SetSize(200, 40)
            spectate.Paint = function(self, w, h)
                if spectate:IsHovered() then 
                    draw.SimpleText("spectate ", "Commands", 80, h / 2, Color(255, 55, 55), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

                else
                    draw.SimpleText("spectate", "Commands2", 80, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
            end 
            spectate.DoClick = function(ply)
                RunConsoleCommand("ulx","spectate",v:GetName())
            end 

            local watermark = vgui.Create("DButton", commands)
            watermark:SetText("")
            watermark:SetPos(commands:GetWide() * 0.86, 0)
            watermark:SetSize(475, 40)
            watermark.Paint = function(self, w, h)
                if watermark:IsHovered() then 
                    draw.SimpleText("Z: "..(timeToStr( v:GetUTimeTotalTime() )), "Zeit", w / 2 + 15, h / 2, Color(255, 55, 55), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText("Z: "..(timeToStr( v:GetUTimeTotalTime() )), "Zeit", w / 2 + 15, h / 2, Color(255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
                end
            end 


        end

        local avt = vgui.Create("AvatarImage", pp)
            avt:SetSize(30, 30)
            avt:SetPos(10, 0)
            avt:SetPlayer(v, 128)
        end
    else
        if IsValid(Scorebase) then
            Scorebase:Remove()
            bg:Remove()
        end
    end 
end 

hook.Add("ScoreboardShow", "Frost.show", function()
    ShowScore (true)
    return false
end)

hook.Add("ScoreboardHide", "Frost.Hide", function()
    ShowScore (false)
end)

timer.Simple(2, function()
    print("Scoreboard wurde Geladen")
end)