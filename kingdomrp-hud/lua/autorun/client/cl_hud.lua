surface.CreateFont( "krp.hud.normal", {
    font = "Montserrat",
    size = 22,
    weight = 10,
    antialias = true,
} )

surface.CreateFont( "krp.hud.mark", {
    font = "Montserrat",
    size = 14,
    weight = 10,
    antialias = true,
} )

surface.CreateFont( "krp.hud.zeit", {
    font = "Montserrat",
    size = 18,
    weight = 10,
    antialias = true,
    shadow = true,
} )

surface.CreateFont( "krp.hud.stats", {
    font = "Montserrat",
    size = 15,
    weight = 10,
    antialias = true,
} )

surface.CreateFont( "krp.hud.overhead", {
    font = "Montserrat",
    size = 105,
    weight = 10,
    antialias = true,
} )

surface.CreateFont( "krp.hud.overhead2", {
    font = "Montserrat",
    size = 80,
    weight = 10,
    antialias = true,
} )

surface.CreateFont( "krp.hud.overhead3", {
    font = "Montserrat",
    size = 60,
    weight = 10,
    antialias = true,

} )

local tag = true
local nacht = false
local buff = false
local buff_zeit = 0
local lvlbar = true
local OldXP = 0
local init = false



local tag_mp3 = "zyklus/tag.mp3"
local nacht_mp3 = "zyklus/nacht.mp3"

local function PlayerOverhead( ply )
	if ( !IsValid( ply ) ) then return end 
	if ( ply == LocalPlayer() ) then return end 
	if ( !ply:Alive() ) then return end 
    if ( ply:GetNoDraw() ) then return end 
 

	local Distance = LocalPlayer():GetPos():Distance( ply:GetPos() ) 
	
	if ( Distance < 100 ) then 
 
		local offset = Vector( 0, 0, 85 )
		local ang = LocalPlayer():EyeAngles()
		local pos = ply:GetPos() + offset + ang:Up()
	 
		ang:RotateAroundAxis( ang:Forward(), 90 )
		ang:RotateAroundAxis( ang:Right(), 90 )
	 
		
		cam.Start3D2D( pos, Angle( 0, ang.y, 90 ), 0.05 )

            if ply:IsBot() then
                draw.SimpleText("Ungültiger Spieler (Bot)", "krp.hud.overhead3", 0, 150, Color(55,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            cam.End3D2D()
            return end

            surface.SetDrawColor(0, 0, 0, 200)

            if LocalPlayer():getJobTable().category == ply:getJobTable().category then
                if ply:IsSpeaking() then 
                    draw.SimpleText(ply:Nick().." [Spricht]", "krp.hud.overhead", 0, 30, Color(255,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else 
                    draw.SimpleText(ply:Nick(), "krp.hud.overhead", 0, 30, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                
                surface.DrawRect(-150, 75, 300, 7.5)
                surface.DrawRect(-150, -15, 300, 7.5)
            else
                if ply:IsSpeaking() then 
                    draw.SimpleText("Fremde Person [Spricht]", "krp.hud.overhead", 0, 30, Color(255,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                else 
                    draw.SimpleText("Fremde Person", "krp.hud.overhead", 0, 30, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                end
                surface.DrawRect(-275, 80, 550, 7.5)
                surface.DrawRect(-275, -15, 550, 7.5)

            end

            if ply:IsSuperAdmin() then
                draw.SimpleText("Leitungsebene", "krp.hud.overhead2", 0, 120, Color(255,25,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            if ply:IsTyping() then
                draw.SimpleText("Derzeitig im Chat", "krp.hud.overhead2", 0, -60, Color(255,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
		cam.End3D2D()
	end
end

hook.Add( "PostPlayerDraw", "DrawName", PlayerOverhead )

net.Receive("CountdownPaint", function()
    local zeit = net.ReadString()

    if zeit == "tag" then
        tag = true
        nacht = false
        surface.PlaySound(tag_mp3)
    elseif zeit == "nacht" then
        nacht = true
        tag = false
        surface.PlaySound(nacht_mp3)
    end
end)

net.Receive("WaffenBuffHUD", function()
    buff = true
    timer.Simple(300, function()
        buff = false
    end)
end)

hook.Add("HUDPaint", "MRPHud", function()


    local p = LocalPlayer()
    local hp, mhp = math.Clamp(p:Health(), 0, p:GetMaxHealth()), p:GetMaxHealth()
    local ap, map = math.Clamp(p:Armor(), 0, p:GetMaxArmor()), p:GetMaxArmor()
    local TimeString = os.date( " %H:%M " , Timestamp )
    local money = DarkRP.formatMoney((LocalPlayer():getDarkRPVar("money") || 0))
    

    draw.RoundedBox(7.5, ScrW() * 0 + 20, ScrH() * 0 + 20, 300, 25, Color(20, 20, 20, 100))
    draw.RoundedBox(5, ScrW() * 0 + 20 + 5, ScrH() * 0 + 20 + 5, 300 - 10, 25 - 10, Color(250, 20, 20, 70))
    draw.RoundedBox(5, ScrW() * 0 + 20 + 5, ScrH() * 0 + 20 + 5, 300*(hp / mhp) - 9, 25 - 10, Color(250, 20, 20, 200))

    draw.SimpleText("HP: "..p:Health(), "krp.hud.stats", ScrW() * 0 + 30, ScrH() * 0 + 24, Color(255,255,255),TEXT_ALIGN_LEFT)

    if p:Armor() > 0 then
    draw.RoundedBox(7.5, ScrW() * 0 + 20, ScrH() * 0 + 50, 300, 25, Color(20, 20, 20, 100))
    draw.RoundedBox(5, ScrW() * 0 + 20 + 5, ScrH() * 0 + 50 + 5, 300 - 10, 25 - 10, Color(20, 250, 250, 50))
    draw.RoundedBox(5, ScrW() * 0 + 20 + 5, ScrH() * 0 + 50 + 5, 300*(ap/map) - 9, 25 - 10, Color(20, 250, 250, 200))
    else end

    surface.SetDrawColor(20, 20, 20, 150)
    surface.DrawRect(0, ScrH() - 30, 300, 30)
    surface.DrawRect(0, ScrH() - 60, 200, 30)
    surface.SetDrawColor(20, 20, 20, 150)

    local name_r = {
    { x = 300, y = ScrH() - 30},
    { x = 330, y = ScrH() - 0},
    { x = 300, y = ScrH() - 0}
    }

    local geld_r = {
    { x = 200, y = ScrH() - 60},
    { x = 230, y = ScrH() - 30},
    { x = 200, y = ScrH() - 30}
    }

    draw.NoTexture()
    surface.DrawPoly(name_r)
    surface.DrawPoly(geld_r)

    draw.SimpleText("Name: "..p:Nick(), "krp.hud.normal", 10, ScrH() - 25, Color(255,255,255), TEXT_ALIGN_LEFT)
    draw.SimpleText("Gold: "..money, "krp.hud.normal", 10, ScrH() - 57.5, Color(205,175,25), TEXT_ALIGN_LEFT)

    draw.SimpleText("Es ist:"..TimeString.."uhr", "krp.hud.zeit", ScrW() - 10, ScrH() * 0 + 10, Color(255,255,255), TEXT_ALIGN_RIGHT)

    if p:IsSpeaking() then
        draw.SimpleText("Du Sprichst", "krp.hud.zeit", ScrW() - 10, ScrH() * 0 + 30, Color(255,255,25), TEXT_ALIGN_RIGHT)
    else
        draw.SimpleText("Du Sprichst nicht", "krp.hud.zeit", ScrW() - 10, ScrH() * 0 + 30, Color(255,25,25), TEXT_ALIGN_RIGHT)
    end

    if tag then
        draw.RoundedBox(7.5, ScrW() / 2 - 150, ScrH() * 0 + 20, 300, 25, Color(20, 20, 20, 150))    
        draw.SimpleText("Es ist derzeitig Tag", "krp.hud.zeit", ScrW() / 2, ScrH() * 0 + 24, Color(255,255,25), TEXT_ALIGN_CENTER)
    else
        draw.RoundedBox(7.5, ScrW() / 2 - 150, ScrH() * 0 + 20, 300, 25, Color(20, 20, 20, 150))    
        draw.SimpleText("Es ist derzeitig Nacht", "krp.hud.zeit", ScrW() / 2, ScrH() * 0 + 24, Color(255,25,25), TEXT_ALIGN_CENTER)
    end

    if buff then
        draw.SimpleText("Damage Buff aktiv", "krp.hud.zeit", ScrW() - 10, ScrH() * 0 + 50, Color(255,25,25), TEXT_ALIGN_RIGHT)
    end

    if lvlbar then
        local PlayerLevel = LocalPlayer():getDarkRPVar("level")
        local PlayerXP = LocalPlayer():getDarkRPVar("xp")
        
        local percent = ((PlayerXP or 0)/(((10+(((PlayerLevel or 1)*((PlayerLevel or 1)+1)*90))))*LevelSystemConfiguration.XPMult)) // Gets the accurate level up percentage
        
        local drawXP = Lerp(8*FrameTime(),OldXP,percent)
        OldXP = drawXP
        local percent2 = percent*100
        percent2 = math.Round(percent2)
        percent2 = math.Clamp(percent2, 0, 99) 

        surface.SetDrawColor(0, 0, 0, 180)
        surface.DrawRect(ScrW() / 2, ScrH() - 7, ScrW() / 2, 7)

        surface.SetDrawColor(255, 195, 18, 120)
        surface.DrawRect(ScrW() / 2, ScrH() - 7, ScrW() / 2 *drawXP, 7)

        surface.SetDrawColor(0, 0, 0, 180)
        surface.DrawRect(ScrW() * .55, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .6, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .65, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .7, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .75, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .8, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .85, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .9, ScrH() - 7, 2, 7)
        surface.DrawRect(ScrW() * .95, ScrH() - 7, 2, 7)
        surface.DrawOutlinedRect(ScrW() / 2, ScrH() - 7, ScrW() / 2, 8)

    end 

end)