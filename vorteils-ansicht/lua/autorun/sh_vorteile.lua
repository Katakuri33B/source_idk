Vorteile = Vorteile or {}

Vorteile[1] = { 
	name = "Tägliche Belohnung [In Work]",
    func = function()
        net.Start("Vorteile")
            net.WriteString("Daily")
            net.WriteEntity(LocalPlayer())
        net.SendToServer()
    end
}


Vorteile[2] = { 
	name = "Sattel die Pferde. [Level 10]",
    func = function()
        if LocalPlayer():getDarkRPVar("level") < 10 then 
            chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Du brauchst ein Höheres Level.")
        return end
        if mount_cooldown then 
            chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Du hast noch einen Cooldown...")
        return end
        net.Start("Vorteile")
            net.WriteEntity(LocalPlayer())
            net.WriteString("Stallmeister")
        net.SendToServer()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Dein Pferd ist nun für 5 Minuten an deiner Seite! [310 Sekunden cooldown].")
        mount_cooldown = true 

        timer.Simple(310, function()
            mount_cooldown = false
        end)
    end
}

Vorteile[3] = { 
	name = "In Arbeit. [Level 30]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[4] = { 
	name = "In Arbeit. [Level 40]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[5] = { 
	name = "In Arbeit. [Level 50]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[6] = { 
	name = "In Arbeit. [Level 60]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[7] = { 
	name = "In Arbeit. [Level 70]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[8] = { 
	name = "In Arbeit. [Level 80]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[9] = { 
	name = "In Arbeit. [Level 90]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}

Vorteile[10] = { 
	name = "In Arbeit. [Level 95]",
    func = function()
        chat.AddText(Color(255,255,255),"[Vorteile] ",Color(255,25,25),"Wir arbeiten dran :)")
    end
}