surface.CreateFont( "xg.hud.small", {
    font = "Montserrat",
    size = 17,
    weight = 10,
    antialias = true,
} )

surface.CreateFont( "xg.hud.mark", {
    font = "Montserrat",
    size = 14,
    weight = 10,
    antialias = true,
} )


local p = LocalPlayer()
local xx, yy = ScrW(), ScrH()

function GetAmmoForCurrentWeapon( ply )
	if ( !IsValid( ply ) ) then return -1 end

	local wep = ply:GetActiveWeapon()
	if ( !IsValid( wep ) ) then return -1 end
 
	return ply:GetAmmoCount( wep:GetPrimaryAmmoType() )
end

local function HUDBase()

    if !LocalPlayer():IsValid() then return end
    local hp, mhp = math.Clamp(p:Health(), 0, p:GetMaxHealth()), p:GetMaxHealth()
    local ap, map = math.Clamp(p:Armor(), 0, p:GetMaxArmor()), p:GetMaxArmor()
    local clone = Material("materials/icons/clone.png")
    local money = DarkRP.formatMoney((LocalPlayer():getDarkRPVar("money") || 0))

    if p:Alive() then
        if p:Armor() > 0 then

            draw.RoundedBox(5, 45, ScrH() - 40, 300, 30, Color(0, 0, 0, 180))
            draw.RoundedBox(5, 50, ScrH() - 35, 290*(hp/mhp), 10, Color(255, 25, 25, 200))
            draw.RoundedBox(5, 50, ScrH() - 20, 290*(ap/map), 5, Color(25, 235, 235, 200))

        else

            draw.RoundedBox(5, 45, ScrH() - 40, 300, 20, Color(0, 0, 0, 180))
            draw.RoundedBox(5, 50, ScrH() - 35, 290*(hp/mhp), 10, Color(255, 25, 25, 200))

        end
    else 
        draw.RoundedBox(5, 45, ScrH() - 40, 335, 20, Color(0, 0, 0, 180))
        draw.SimpleText("Bist wohl doch nicht so gut wie du dachtest :)", "xg.hud.small", 215, ScrH() - 40, Color(255, 4, 4), TEXT_ALIGN_CENTER)
    end

    surface.SetFont("xg.hud.small")
    
    local ntxt = surface.GetTextSize(p:Nick())

    local geld = surface.GetTextSize(money)

    draw.RoundedBox(7.5, 45, ScrH() - 80, ntxt + 20, 32, Color(0, 0, 0, 180))

    draw.RoundedBox(7.5, 45, ScrH() - 120, geld + 20, 32, Color(0, 0, 0, 180))

    draw.SimpleText(p:Nick(), "xg.hud.small", 55, ScrH() - 73, Color(255, 255, 255), TEXT_ALIGN_LEFT)

    draw.SimpleText(money, "xg.hud.small", 55, ScrH() - 113, Color(255, 255, 255), TEXT_ALIGN_LEFT)


end

local function ammoHUD()
    if(!IsValid(LocalPlayer():GetActiveWeapon())) then return end
    if(LocalPlayer():GetActiveWeapon():Clip1() == -1) then return end
    if(LocalPlayer():GetActiveWeapon():GetMaxClip1() == 0) then return end
        if (p:GetActiveWeapon():IsValid()) then
            if (p:GetActiveWeapon():GetPrintName() != nil) then
            local curWeapon = p:GetActiveWeapon():GetClass()

                draw.RoundedBox(7.5, ScrW() - 205, ScrH() - 50, 190, 40, Color(0, 0, 0, 180))
                draw.SimpleText(p:GetActiveWeapon():GetPrintName(), "xg.hud.small", ScrW() - 104, ScrH() - 50, Color(255, 255, 255), TEXT_ALIGN_CENTER)
                draw.SimpleText(p:GetActiveWeapon():Clip1().." von "..p:GetActiveWeapon():GetMaxClip1(), "xg.hud.small", ScrW() - 104, ScrH() - 30, Color(255, 255, 255), TEXT_ALIGN_CENTER)


            end   
        end
end 

local function Overhead()
    local tr = util.GetPlayerTrace( LocalPlayer(), LocalPlayer():GetAimVector() )
    local trace = util.TraceLine( tr )

    local hp, maxhp = math.Clamp(trace.Entity:Health(), 0, trace.Entity:GetMaxHealth()), trace.Entity:GetMaxHealth()

    local Distance = LocalPlayer():GetPos():Distance( trace.Entity:GetPos() ) 

    if (!trace.Hit) then return end
    if (!trace.HitNonWorld) then return end
    if trace.Entity:GetNoDraw() then return end
    if !trace.Entity:IsValid() then return end
    if !trace.Entity:IsPlayer() then return end

    if ( Distance < 150 ) then 
    
        draw.RoundedBox(5, ScrW() * .5 - 125, ScrH() - 40, 250, 30, Color(0, 0, 0, 180))

        draw.SimpleText(trace.Entity:Nick(), "xg.hud.small", ScrW() / 2, ScrH() - 35, Color(255, 255, 255) ,TEXT_ALIGN_CENTER)

    end

end

local function Watermark()
    draw.SimpleText("CW:RP by Xenon Gaming", "xg.hud.mark", ScrW() - 10, ScrH() * 0 + 5, Color(255, 255, 255) ,TEXT_ALIGN_RIGHT)
end


hook.Add("HUDPaint", "XenonHUD", function()
    HUDBase()
    ammoHUD()
    Overhead()
    Watermark()
end)