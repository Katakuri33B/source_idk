surface.CreateFont("HealthFont", {
	font = "Montserrat",
	size = 40,
	shadow = false,
})

function DrawHealthbar(ENT)
    local tr = util.GetPlayerTrace( LocalPlayer(), LocalPlayer():GetAimVector() )
    local trace = util.TraceLine( tr )
    if not trace.Entity:IsNPC() then return end
    if trace.Entity == nil then return end
    local hp, maxhp = math.Clamp(trace.Entity:Health(), 0, trace.Entity:GetMaxHealth()), trace.Entity:GetMaxHealth()

    if (!trace.Hit) then return end
    if (!trace.HitNonWorld) then return end
    

        local Distance = LocalPlayer():GetPos():Distance( trace.Entity:GetPos() ) 

        if KatakurisBosse.Classes[trace.Entity:GetClass()] or KatakurisBosse.KatakombenBoss[trace.Entity:GetClass()] then
            if ( Distance < 1550 ) then
                draw.RoundedBox(20, ScrW() * .5 - 300, ScrH() * 0 + 25, 600, 50, Color(0, 0, 0, 200))
                draw.RoundedBox(20, ScrW() * .5 - 300, ScrH() * 0 + 25, 600*(hp / maxhp), 50, Color(200, 0, 0, 240))
                draw.SimpleText("Bossleben: "..trace.Entity:Health(), "HealthFont", ScrW() * .5, ScrH() * 0 + 50, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                
            end
        end
        if KatakurisBosse.MiniBoss[trace.Entity:GetClass()] then
            if ( Distance < 1550 ) then
                draw.RoundedBox(20, ScrW() * .5 - 300, ScrH() * 0 + 25, 600, 50, Color(0, 0, 0, 200))
                draw.RoundedBox(20, ScrW() * .5 - 300, ScrH() * 0 + 25, 600*(hp / maxhp), 50, Color(200, 0, 0, 240))
                draw.SimpleText("Bossleben: "..trace.Entity:Health(), "HealthFont", ScrW() * .5, ScrH() * 0 + 50, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                
            end
        end
end 

hook.Add("HUDPaint", "NPCHealthbar", DrawHealthbar)
