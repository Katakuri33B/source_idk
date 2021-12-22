util.AddNetworkString("Gesund1")
util.AddNetworkString("Gesund2")
util.AddNetworkString("Stabil1")
util.AddNetworkString("Stabil2")
util.AddNetworkString("Sprint1")
util.AddNetworkString("Sprint2")

// 600


net.Receive("Gesund1", function(len, ply)
    if g1 then
        ply:ChatPrint("Hier ist ein 5 Minuten Cooldown drauf")
    return end
    ply:SetMaxHealth(ply:GetMaxHealth() + 50)
    ply:SetHealth(ply:GetMaxHealth())
    g1 = true
    timer.Simple(300, function()
        g1 = false
    end)
end)

net.Receive("Gesund2", function(len, ply)
    if g2 then 
        ply:ChatPrint("Hier ist ein 5 Minuten Cooldown drauf")
    return end
    ply:SetMaxHealth(ply:GetMaxHealth() + 50)
    ply:SetHealth(ply:GetMaxHealth())
    g2 = true
    timer.Simple(300, function()
        g2 = false
    end)
end)

net.Receive("Stabil1", function(len, ply)
    if s1 then 
        ply:ChatPrint("Hier ist ein 5 Minuten Cooldown drauf")
    return end
    ply:SetMaxArmor(ply:GetMaxArmor() + 25)
    ply:SetArmor(ply:GetMaxArmor())
    s1 = true
    timer.Simple(300, function()
        s1 = false
    end)
end)

net.Receive("Stabil2", function(len, ply)
    if s2 then 
        ply:ChatPrint("Hier ist ein 5 Minuten Cooldown drauf")
    return end
    ply:SetMaxArmor(ply:GetMaxArmor() + 25)
    ply:SetArmor(ply:GetMaxArmor())
    s2 = true
    timer.Simple(300, function()
        s2 = false
    end)
end)

net.Receive("Sprint1", function(len, ply)
    if ss1 then 
        ply:ChatPrint("Hier ist ein 5 Minuten Cooldown drauf")
    return end
    ply:SetRunSpeed(ply:GetRunSpeed() + 50)
    ss1 = true
    timer.Simple(300, function()
        ss1 = false
    end)
end)

net.Receive("Sprint2", function(len, ply) 
    if ss2 then 
        ply:ChatPrint("Hier ist ein 5 Minuten Cooldown drauf")
    return end
    ply:SetRunSpeed(ply:GetRunSpeed() + 75)
    ss2 = true
    timer.Simple(300, function()
        ss2 = false
    end)
end)

hook.Add( "PlayerDeath", "ResetPerk", function( victim, inflictor, attacker )
    if victim:IsPlayer() then
        if victim:IsValid() then
            victim:SetRunSpeed(victim:GetRunSpeed())
            victim:SetMaxArmor(victim:GetMaxArmor())
            victim:SetMaxHealth(victim:GetMaxHealth())
            chat.AddText(Color(255,255,25),"[Perksystem] ",Color(255,255,25),"Deine Perks sind Deaktiviert worden")
        end
    end
end )