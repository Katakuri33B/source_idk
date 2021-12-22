surface.CreateFont( "ausbilder.ui", {
	font = "Orbitron", 
	size = 23,
	weight = 100,
})

surface.CreateFont( "ausbilder.u.small", {
	font = "Orbitron", 
	size = 19,
	weight = 100,
})

local fehler = 0
local frage1 = false

local bestansden = "ausbildung/bestanden.mp3"
local verkackt = "ausbildung/verkackt.mp3"

function FramePaint(s, w, h) 
	surface.SetDrawColor(30, 30, 30, 230)
	surface.DrawRect(0, 0, w, h)
	surface.SetDrawColor(25,255,255) 
	surface.DrawOutlinedRect(0, 0, w, h)
	surface.DrawRect(0, 0, 15, 3)
    surface.DrawRect(0, h - 3, 15, 3)
    surface.DrawRect(0, 0, 3, 15)
    surface.DrawRect(0, h - 15, 3, 15)
    surface.DrawRect(w - 15, 0, 15, 3)
    surface.DrawRect(w - 15, h - 3, 15, 3)
    surface.DrawRect(w - 3, 0, 3, 15)
    surface.DrawRect(w - 3, h - 15, 3, 15)
	surface.DrawRect(0, h/2 - 20, 3, 40)
	surface.DrawRect(w - 3, h/2 - 20, 3, 40)
	surface.DrawRect(w/2, 0, 40, 3)
	surface.DrawRect(w/2, h - 3, 40, 3)

	surface.SetDrawColor(50, 50, 50, 230) 
	surface.DrawRect(w/2 - 250, 50, 500, 200)
end

function FirstText(s, w, h)
	draw.SimpleText("Willkommen bei deiner Ausbildung", "ausbilder.ui", w/2, 10, Color(255, 255, 255), TEXT_ALIGN_CENTER)
	draw.SimpleText("In kürze werden dir Fragen gestellt die du Beantworten musst", "ausbilder.u.small", w/2, 60, Color(255, 255, 255), TEXT_ALIGN_CENTER)
	draw.SimpleText("solltest du ready sein Klick auf den Knopf", "ausbilder.u.small", w/2, 80, Color(255, 255, 255), TEXT_ALIGN_CENTER)
end

function FirstQText(s, w, h)
	draw.SimpleText("Was heisst eigentlich 'RDM' ?", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function SecondQText(s, w, h)
	draw.SimpleText("Was sagt die Goldene Regel aus?", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function ThirdQText(s, w, h)
	draw.SimpleText("Welche Regel brichst du", "ausbilder.ui", w/2, h/2 - 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("wenn du Permanent aus deiner Rolle fällst?", "ausbilder.ui", w/2, h/2 + 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function fourthQText(s, w, h)
	draw.SimpleText("Welche Regel brichst du", "ausbilder.ui", w/2, h/2 - 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("wenn du IC Informationen über Discord teilst?", "ausbilder.ui", w/2, h/2 + 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function fifthQText(s, w, h)
	draw.SimpleText("Wenn man mit einer Waffe auf dich Zielt", "ausbilder.ui", w/2, h/2 - 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("welche Regelung musst du beachten", "ausbilder.ui", w/2, h/2 + 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function sixQText(s, w, h)
	draw.SimpleText("Welche Regel sagt aus", "ausbilder.ui", w/2, h/2 - 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("dass du dich nicht stärker machen darfst als du bist?", "ausbilder.ui", w/2, h/2 + 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function bestanden(s, w, h)
	draw.SimpleText("Fehler: "..fehler, "ausbilder.ui", w * .1, 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("Herzlichen glückwunsch du hast Bestanden!", "ausbilder.ui", w/2, h/2 - 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("Du müsstest jetzt deine Whitelist bekommen", "ausbilder.ui", w/2, h/2 + 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function nichtbestanden(s, w, h)
	draw.SimpleText("Fehler: "..fehler, "ausbilder.ui", w * .1, 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("Leider hast du nicht Bestanden", "ausbilder.ui", w/2, h/2 - 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	draw.SimpleText("probiere es einfach erneut", "ausbilder.ui", w/2, h/2 + 15, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function rightAnswer1(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Random Deathmatch", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Random Deathmatch", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer11(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Rude Display Message", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Rude Display Message", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer12(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Random DM Message", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Random DM Message", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function rightAnswer2(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Keine Brüder schaden", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Keine Brüder schaden", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer21(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Keine Korruption", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Keine Korruption", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer22(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Immer Höflich sein", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Immer Höflich sein", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function rightAnswer3(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("FailRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("FailRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer31(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Metagaming", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Metagaming", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer32(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("PowerRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("PowerRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function rightAnswer4(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Metagaming", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Metagaming", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer41(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("ScriptedRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("ScriptedRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer42(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("QuellenRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("QuellenRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function rightAnswer5(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Ich schütze mein Leben, und rufe die ST", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Ich schütze mein Leben, und rufe die ST", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer51(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Ich erschiesse ihn", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Ich erschiesse ihn", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer52(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Nichts da er die Goldene Regel bricht", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Nichts da er die Goldene Regel bricht", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function rightAnswer6(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("PowerRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("PowerRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer61(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("FailRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("FailRP", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function wrongAnswer62(s, w, h) 
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Metagaming", "ausbilder.ui", w/2, h/2, Color(255, 255, 25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Metagaming", "ausbilder.ui", w/2, h/2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function FirstButtonPaint(s, w, h) 	
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Beginnen", "ausbilder.ui", w/2, h/2, Color(25,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else 
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Beginnen", "ausbilder.ui", w/2, h/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function close(s, w, h) 	
	if s:IsHovered() then 
		surface.SetDrawColor(70, 70, 70, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Schließen", "ausbilder.ui", w/2, h/2, Color(25,255,25), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	else 
		surface.SetDrawColor(50, 50, 50, 230)
		surface.DrawRect(0, 0, w, h)
		draw.SimpleText("Schließen", "ausbilder.ui", w/2, h/2, Color(255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function zusammenfassung() 
		// 1. Frage
		zsm = vgui.Create("DFrame")
		zsm:SetSize(700, 500)
		zsm:Center()
		zsm:MakePopup()
		zsm:SetDraggable(false)
		zsm:SetTitle("")
		zsm.Paint = FramePaint

		local thirdPanel = vgui.Create("DPanel", zsm)
		thirdPanel:SetSize(500, 200)
		thirdPanel:SetPos( zsm:GetWide() / 2 - 250, 50 )
		if fehler < 4 then
			thirdPanel.Paint = bestanden
		else
			thirdPanel.Paint = nichtbestanden
		end

		local wrong61 = vgui.Create("DButton", zsm)
		wrong61:Dock(BOTTOM)
		wrong61:DockMargin(115, 5, 105, 15)
		wrong61:SetSize(0, 35)
		wrong61:SetText("")
		wrong61.Paint = close
		wrong61.DoClick = function(s) 
			zsm:Close()
			fehler = 0
			if fehler < 4 then
				net.Start("CTList")
				net.WriteEntity(LocalPlayer())
				net.SendToServer()
			end
		end 

		if fehler < 4 then
			surface.PlaySound(bestansden)
		else
			surface.PlaySound(verkackt)
		end

end

function Frage6() 
		// 1. Frage
		sixQ = vgui.Create("DFrame")
		sixQ:SetSize(700, 500)
		sixQ:Center()
		sixQ:MakePopup()
		sixQ:SetDraggable(false)
		sixQ:SetTitle("")
		sixQ.Paint = FramePaint

		local thirdPanel = vgui.Create("DPanel", sixQ)
		thirdPanel:SetSize(500, 200)
		thirdPanel:SetPos( sixQ:GetWide() / 2 - 250, 50 )
		thirdPanel.Paint = sixQText

		local wrong61 = vgui.Create("DButton", sixQ)
		wrong61:Dock(BOTTOM)
		wrong61:DockMargin(115, 5, 105, 15)
		wrong61:SetSize(0, 35)
		wrong61:SetText("")
		wrong61.Paint = wrongAnswer61
		wrong61.DoClick = function(s) 
			fehler = fehler + 1
			sixQ:Close()
			zusammenfassung()
		end 

		local right6 = vgui.Create("DButton", sixQ)
		right6:Dock(BOTTOM)
		right6:DockMargin(115, 5, 105, 15)
		right6:SetSize(0, 35)
		right6:SetText("")
		right6.Paint = rightAnswer6
		right6.DoClick = function(s) 
			sixQ:Close()
			zusammenfassung()
		end 

		local wrong62 = vgui.Create("DButton", sixQ)
		wrong62:Dock(BOTTOM)
		wrong62:DockMargin(115, 5, 105, 15)
		wrong62:SetSize(0, 35)
		wrong62:SetText("")
		wrong62.Paint = wrongAnswer62
		wrong62.DoClick = function(s) 
			fehler = fehler + 1
			sixQ:Close()
			zusammenfassung()
		end 

end


function Frage5() 
		// 1. Frage
		fifthhQ = vgui.Create("DFrame")
		fifthhQ:SetSize(700, 500)
		fifthhQ:Center()
		fifthhQ:MakePopup()
		fifthhQ:SetDraggable(false)
		fifthhQ:SetTitle("")
		fifthhQ.Paint = FramePaint

		local thirdPanel = vgui.Create("DPanel", fifthhQ)
		thirdPanel:SetSize(500, 200)
		thirdPanel:SetPos( fifthhQ:GetWide() / 2 - 250, 50 )
		thirdPanel.Paint = fifthQText

		local wrong51 = vgui.Create("DButton", fifthhQ)
		wrong51:Dock(BOTTOM)
		wrong51:DockMargin(115, 5, 105, 15)
		wrong51:SetSize(0, 35)
		wrong51:SetText("")
		wrong51.Paint = wrongAnswer51
		wrong51.DoClick = function(s) 
			fehler = fehler + 1
			fifthhQ:Close()
			Frage6() 
		end 

		local wrong52 = vgui.Create("DButton", fifthhQ)
		wrong52:Dock(BOTTOM)
		wrong52:DockMargin(115, 5, 105, 15)
		wrong52:SetSize(0, 35)
		wrong52:SetText("")
		wrong52.Paint = wrongAnswer52
		wrong52.DoClick = function(s) 
			fehler = fehler + 1
			fifthhQ:Close()
			Frage6() 
		end 

		local right5 = vgui.Create("DButton", fifthhQ)
		right5:Dock(BOTTOM)
		right5:DockMargin(115, 5, 105, 15)
		right5:SetSize(0, 35)
		right5:SetText("")
		right5.Paint = rightAnswer5
		right5.DoClick = function(s) 
			fifthhQ:Close()
			Frage6() 
		end 

end


function Frage4() 
		// 1. Frage
		fourthQ = vgui.Create("DFrame")
		fourthQ:SetSize(700, 500)
		fourthQ:Center()
		fourthQ:MakePopup()
		fourthQ:SetDraggable(false)
		fourthQ:SetTitle("")
		fourthQ.Paint = FramePaint

		local thirdPanel = vgui.Create("DPanel", fourthQ)
		thirdPanel:SetSize(500, 200)
		thirdPanel:SetPos( fourthQ:GetWide() / 2 - 250, 50 )
		thirdPanel.Paint = fourthQText

		local right4 = vgui.Create("DButton", fourthQ)
		right4:Dock(BOTTOM)
		right4:DockMargin(115, 5, 105, 15)
		right4:SetSize(0, 35)
		right4:SetText("")
		right4.Paint = rightAnswer4
		right4.DoClick = function(s) 
			fourthQ:Close()
			Frage5() 
		end 


		local wrong41 = vgui.Create("DButton", fourthQ)
		wrong41:Dock(BOTTOM)
		wrong41:DockMargin(115, 5, 105, 15)
		wrong41:SetSize(0, 35)
		wrong41:SetText("")
		wrong41.Paint = wrongAnswer41
		wrong41.DoClick = function(s) 
			fehler = fehler + 1
			fourthQ:Close()
			Frage5() 
		end 

		local wrong42 = vgui.Create("DButton", fourthQ)
		wrong42:Dock(BOTTOM)
		wrong42:DockMargin(115, 5, 105, 15)
		wrong42:SetSize(0, 35)
		wrong42:SetText("")
		wrong42.Paint = wrongAnswer42
		wrong42.DoClick = function(s) 
			fehler = fehler + 1
			fourthQ:Close()
			Frage5()
		end 

end


function Frage3() 
		// 1. Frage
		thirdQ = vgui.Create("DFrame")
		thirdQ:SetSize(700, 500)
		thirdQ:Center()
		thirdQ:MakePopup()
		thirdQ:SetDraggable(false)
		thirdQ:SetTitle("")
		thirdQ.Paint = FramePaint

		local thirdPanel = vgui.Create("DPanel", thirdQ)
		thirdPanel:SetSize(500, 200)
		thirdPanel:SetPos( thirdQ:GetWide() / 2 - 250, 50 )
		thirdPanel.Paint = ThirdQText

		local wrong31 = vgui.Create("DButton", thirdQ)
		wrong31:Dock(BOTTOM)
		wrong31:DockMargin(115, 5, 105, 15)
		wrong31:SetSize(0, 35)
		wrong31:SetText("")
		wrong31.Paint = wrongAnswer31
		wrong31.DoClick = function(s) 
			fehler = fehler + 1
			thirdQ:Close()
			Frage4() 
		end 

		local right3 = vgui.Create("DButton", thirdQ)
		right3:Dock(BOTTOM)
		right3:DockMargin(115, 5, 105, 15)
		right3:SetSize(0, 35)
		right3:SetText("")
		right3.Paint = rightAnswer3
		right3.DoClick = function(s) 
			thirdQ:Close()
			Frage4() 
		end 

		local wrong32 = vgui.Create("DButton", thirdQ)
		wrong32:Dock(BOTTOM)
		wrong32:DockMargin(115, 5, 105, 15)
		wrong32:SetSize(0, 35)
		wrong32:SetText("")
		wrong32.Paint = wrongAnswer32
		wrong32.DoClick = function(s) 
			fehler = fehler + 1
			thirdQ:Close()
			Frage4()
		end 

end

function Frage2() 
		// 1. Frage
		secondQ = vgui.Create("DFrame")
		secondQ:SetSize(700, 500)
		secondQ:Center()
		secondQ:MakePopup()
		secondQ:SetDraggable(false)
		secondQ:SetTitle("")
		secondQ.Paint = FramePaint

		local secondPanel = vgui.Create("DPanel", secondQ)
		secondPanel:SetSize(500, 200)
		secondPanel:SetPos( secondQ:GetWide() / 2 - 250, 50 )
		secondPanel.Paint = SecondQText

		local wrong21 = vgui.Create("DButton", secondQ)
		wrong21:Dock(BOTTOM)
		wrong21:DockMargin(115, 5, 105, 15)
		wrong21:SetSize(0, 35)
		wrong21:SetText("")
		wrong21.Paint = wrongAnswer21
		wrong21.DoClick = function(s) 
			fehler = fehler + 1
			secondQ:Close()
			Frage3()
		end 

		local wrong22 = vgui.Create("DButton", secondQ)
		wrong22:Dock(BOTTOM)
		wrong22:DockMargin(115, 5, 105, 15)
		wrong22:SetSize(0, 35)
		wrong22:SetText("")
		wrong22.Paint = wrongAnswer22
		wrong22.DoClick = function(s) 
			fehler = fehler + 1
			secondQ:Close()
			Frage3()
		end 

		local right2 = vgui.Create("DButton", secondQ)
		right2:Dock(BOTTOM)
		right2:DockMargin(115, 5, 105, 15)
		right2:SetSize(0, 35)
		right2:SetText("")
		right2.Paint = rightAnswer2
		right2.DoClick = function(s) 
			secondQ:Close()
			Frage3()
		end 
end


function Frage1() 
		// 1. Frage
		FirstQ = vgui.Create("DFrame")
		FirstQ:SetSize(700, 500)
		FirstQ:Center()
		FirstQ:MakePopup()
		FirstQ:SetDraggable(false)
		FirstQ:SetTitle("")
		FirstQ.Paint = FramePaint

		local secondPanel = vgui.Create("DPanel", FirstQ)
		secondPanel:SetSize(500, 200)
		secondPanel:SetPos( FirstQ:GetWide() / 2 - 250, 50 )
		secondPanel.Paint = FirstQText

		local right1 = vgui.Create("DButton", FirstQ)
		right1:Dock(BOTTOM)
		right1:DockMargin(115, 5, 105, 15)
		right1:SetSize(0, 35)
		right1:SetText("")
		right1.Paint = rightAnswer1
		right1.DoClick = function(s) 
			FirstQ:Close()
			Frage2()
		end 

		local wrong11 = vgui.Create("DButton", FirstQ)
		wrong11:Dock(BOTTOM)
		wrong11:DockMargin(115, 5, 105, 15)
		wrong11:SetSize(0, 35)
		wrong11:SetText("")
		wrong11.Paint = wrongAnswer11
		wrong11.DoClick = function(s) 
			fehler = fehler + 1
			FirstQ:Close()
			Frage2()
		end 

		local wrong12 = vgui.Create("DButton", FirstQ)
		wrong12:Dock(BOTTOM)
		wrong12:DockMargin(115, 5, 105, 15)
		wrong12:SetSize(0, 35)
		wrong12:SetText("")
		wrong12.Paint = wrongAnswer12
		wrong12.DoClick = function(s) 
			fehler = fehler + 1
			FirstQ:Close()
			Frage2()
		end 
end



net.Receive("AusbildungEEvent", function(len, ply)
    if IsValid(FirstUI) then return end

	// Anfangs Frame
	FirstUI = vgui.Create("DFrame")
	FirstUI:SetSize(700, 500)
	FirstUI:Center()
	FirstUI:MakePopup()
	FirstUI:SetDraggable(false)
	FirstUI:SetTitle("")
	FirstUI.Paint = FramePaint
	
	// Anfangs Text
	local FirstPanel = vgui.Create("DPanel", FirstUI)
	FirstPanel:SetSize(500, 200)
	FirstPanel:SetPos( FirstUI:GetWide() / 2 - 250, 50 )
	FirstPanel.Paint = FirstText

	// Startknopf
	local FirstButton = vgui.Create("DButton", FirstUI)
	FirstButton:Dock(BOTTOM)
	FirstButton:DockMargin(115, 5, 105, 15)
	FirstButton:SetSize(0, 35)
	FirstButton:SetText("")
	FirstButton.Paint = FirstButtonPaint
	FirstButton.DoClick = function(s) 
		FirstUI:Close()
		Frage1()
	end 

end)