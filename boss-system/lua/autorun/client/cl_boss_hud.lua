surface.CreateFont( "KataBoss.Buff", {
	font = "Montserrat", 
	size = 19,
	weight = 200,
} )

resource.AddFile("sound/loot/drop.wav")

if KatakurisBosse.HUD["Aktiv"] then
    net.Receive("GetBossDropSound", function(len, ply)
        timer.Simple(1, function()
            surface.PlaySound("loot/drop.wav")
            hook.Add("HUDPaint", "DrawBuff", function()
                surface.SetFont("KataBoss.Buff")
                local text_size = surface.GetTextSize(KatakurisBosse.HUD["TEXT"])
                draw.RoundedBox(7.5, 8, ScrH() * 0 + 10, text_size+5+7, 50, Color(50, 50, 50, 230))
                if KatakurisBosse.HUD["Rainbow"] then
                    draw.SimpleText(KatakurisBosse.HUD["TEXT"], "KataBoss.Buff", 12, ScrH() * 0 + 24, HSVToColor(  ( CurTime() * KatakurisBosse.HUD["Rainbowspeed"] ) % 360, 1, 1 ), TEXT_ALIGN_LEFT)
                else 
                    draw.SimpleText(KatakurisBosse.HUD["TEXT"], "KataBoss.Buff", 12, ScrH() * 0 + 24, Color(255, 255, 255), TEXT_ALIGN_LEFT)
                end
                draw.SimpleText("- Lebenregenration", "KataBoss.Buff", 10, ScrH() * 0 + 60, Color(255, 25, 25), TEXT_ALIGN_LEFT)
                draw.SimpleText("- Jumpboost", "KataBoss.Buff", 10, ScrH() * 0 + 80, Color(255, 25, 25), TEXT_ALIGN_LEFT)
            end)
        end)
        timer.Create("RemoveHUD", KatakurisBosse.HUD["DisplayTime"], 1, function()
            hook.Remove("HUDPaint", "DrawBuff")
        end)
    end)
end