surface.CreateFont( "krp.npc.overhead", {
    font = "Montserrat",
    size = 20,
    weight = 10,
    antialias = true,
} )

function NPCOverhead() 
    local tr = util.GetPlayerTrace( LocalPlayer(), LocalPlayer():GetAimVector() )
    local trace = util.TraceLine( tr )
    local gegner = trace.Entity
    local Distance = LocalPlayer():GetPos():Distance( trace.Entity:GetPos() )
    
    local hp, mhp = math.Clamp(gegner:Health(), 0, gegner:GetMaxHealth()), gegner:GetMaxHealth()

    if (!trace.Hit) then return end
    if (!trace.HitNonWorld) then return end

    if !gegner:IsNPC() then return end

    if Distance < 350 then
        draw.RoundedBox(7.5, ScrW() * .2, ScrH() - 30, 250, 25, Color(0, 0, 0, 175))
        draw.RoundedBox(7.5, ScrW() * .2, ScrH() - 30, 250*(hp/mhp), 25, Color(200, 0, 0, 150))
        if gegner:GetClass() == "npc_horse" then
            draw.SimpleText("Pferd", "krp.npc.overhead", ScrW() * .2 + 130, ScrH() - 18, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("Feindliche Kreatur", "krp.npc.overhead", ScrW() * .2 + 130, ScrH() - 18, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    end
end

hook.Add("HUDPaint", "NPCOH", function()
    NPCOverhead() 
end)