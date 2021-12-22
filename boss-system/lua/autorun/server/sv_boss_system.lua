util.AddNetworkString("GetMiniBossHP")

util.AddNetworkString("GetBossDropSound")

function weighted_random()
    local poolsize = 0
    for k,v in pairs(KatakurisBosse.Loot) do
       poolsize = poolsize + v[1]
    end
    local selection = math.random(1,poolsize)
    for k,v in pairs(KatakurisBosse.Loot) do
       selection = selection - v[1] 
       if (selection <= 0) then
          return k
       end
    end
end




hook.Add("OnNPCKilled", "GetLoot", function(npc, attacker, inflictor)
    if KatakurisBosse.Classes[npc:GetClass()] then
        local Item1 = ents.Create( weighted_random() )
        Item1:SetPos( npc:GetPos() )
        Item1:Spawn()

        local Item2 = ents.Create( weighted_random() )
        Item2:SetPos( npc:GetPos() )
        Item2:Spawn()

        local Item3 = ents.Create( weighted_random() )
        Item3:SetPos( npc:GetPos() )
        Item3:Spawn()
        
        attacker:addMoney(KatakurisBosse.GetMoneyPerKill)

        if KatakurisBosse.WOSEXP then
            attacker:AddSkillXP(KatakurisBosse.EXP)
        end
        net.Start("GetBossDropSound")
            net.Send(attacker)


        PrintMessage( HUD_PRINTTALK, "Der Boss wurde gefinished von: "..inflictor:GetName())

        timer.Create("HealthRegeneration"..attacker:UserID(), KatakurisBosse.Buffs["BuffdauerHPRegen"], 10, function()
            attacker:SetHealth( math.Clamp(attacker:Health() + KatakurisBosse.Buffs["Healthregen"] , 0 , attacker:GetMaxHealth()) )
        end)

        timer.Create("JumpPowerBuff", 1, 1, function()
            attacker:SetJumpPower(KatakurisBosse.Buffs["Jumppower"])
            timer.Simple(KatakurisBosse.Buffs["Jumpdefaultdelay"], function()
                attacker:SetJumpPower(200)
            end)
        end)
    end 

    if KatakurisBosse.MiniBoss[npc:GetClass()] then
        local Item1 = ents.Create( weighted_random() )
        Item1:SetPos( npc:GetPos() )
        Item1:Spawn()

        if KatakurisBosse.WOSEXP then
            attacker:AddSkillXP(500)
        end
    end
end)