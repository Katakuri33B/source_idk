resource.AddFile("sound/loot/drop.wav")

net.Receive("GetBossDropSound", function(len, ply)
    surface.PlaySound("loot/drop.wav")
end)