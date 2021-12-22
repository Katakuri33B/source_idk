print("SERVERSIDE Geladen")

util.AddNetworkString("CountdownPaint")

function SpawnNPCsAtNight()
    /*
    timer.Simple(1, function()
        for k, v in pairs(Gegner) do
            local npc = ents.Create( v.code )
            npc:SetPos( v.pos )
            npc:Spawn()
            npc:SetHealth( v.hp )
        end
    end)
    */
    

    timer.Simple(5, function()
        for k, v in pairs(Gegner2) do
            local npc = ents.Create( v.code )
            npc:SetPos( v.pos )
            npc:Spawn()
            npc:SetHealth( v.hp )
        end
    end)

    timer.Simple(10, function()
        for k, v in pairs(Gegner3) do
            local npc = ents.Create( v.code )
            npc:SetPos( v.pos )
            npc:Spawn()
            npc:SetHealth( v.hp )
        end
    end)

    timer.Simple(20, function()
        for k, v in pairs(Gegner4) do
            local npc = ents.Create( v.code )
            npc:SetPos( v.pos )
            npc:Spawn()
            npc:SetHealth( v.hp )
        end
    end)

    timer.Simple(25, function()
        for k, v in pairs(Gegner1) do
            local npc = ents.Create( v.code )
            npc:SetPos( v.pos )
            npc:Spawn()
            npc:SetHealth( v.hp )
        end
    end)
end

function TagCleanUp()
    timer.Simple(5, function()
        game.CleanUpMap(false, Gegner1)
    end)

    timer.Simple(7, function()
        game.CleanUpMap(false, Gegner2)
    end)

    timer.Simple(9, function()
        game.CleanUpMap(false, Gegner3)
    end)

    timer.Simple(11, function()
        game.CleanUpMap(false, Gegner4)
    end)
end

function TimerSetUPTag() 
    timer.Create("TagZyklus", TAGNACHT.Nachtzeit, 1, function()
        net.Start("CountdownPaint")
            net.WriteString("tag")
            --TagCleanUp()
            SetGlobalBool("ZyklusTag", true)
            SetGlobalBool("ZyklusNacht", false)
        net.Broadcast()
        TimerSetUPNacht()
    end)
end

function TimerSetUPNacht()
    timer.Create("NachtZyklus", TAGNACHT.Tageszeit, 1, function()
        net.Start("CountdownPaint")
            net.WriteString("nacht")
            --SpawnNPCsAtNight()
            SetGlobalBool("ZyklusTag", false)
            SetGlobalBool("ZyklusNacht", true)
        net.Broadcast()
        TimerSetUPTag()
    end)
end

hook.Add( "Initialize", "TimerSetUP", function()
    timer.Simple(10, function()
	    TimerSetUPTag()
    end)
end)

concommand.Add("shaba", function(ply)
    if not ply:IsSuperAdmin() then return end
    SpawnNPCsAtNight()
    print("kek")
end)

concommand.Add("kek", function(ply)
    if not ply:IsSuperAdmin() then return end
    TagCleanUp()
    print("kek")
end)