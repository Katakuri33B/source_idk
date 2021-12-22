util.AddNetworkString("BuyItem")
util.AddNetworkString("broadcastNET")
util.AddNetworkString("Alert")

net.Receive("BuyItem", function(len, ply)
    local selected = net.ReadString()
    local leben = net.ReadUInt(64)
    for k, v in pairs(Sortiment) do
        if tostring(k) == selected then
            ply:addMoney(-v.Price)
            if ply:Health() < ply:GetMaxHealth() then
                ply:SetHealth(ply:Health() + v.Leben)
            else end
        end     
    end
end)

local cooldown = false

net.Receive("broadcastNET", function(len, ply)
    if cooldown then ply:ChatPrint("Der Laden wurde erst ausgeraubt, lass die arme doch mal in ruhe...") return end
    local p = net.ReadEntity()
    cooldown = true
    net.Start("Alert")
        net.WriteEntity(ply)
        net.Broadcast()

    ply:ChatPrint("Du fängst an, die Tanke auszurauben... (Bewege dich nicht)")
    timer.Create("AusraubProgress", 30, 1, function()
        p:addMoney(math.random(ladenraub.GeldsummeMinimum, ladenraub.GeldsummeMaximal))
        timer.Simple(300, function()
            cooldown = false
        end)
        hook.Add( "PlayerButtonDown", "TimerDestroy", function( ply, btn )
            if ( btn == KEY_W or KEY_A or KEY_S or KEY_D) then
                if timer.Exists("AusraubProgress") then
                    ply:ChatPrint("Du hast ausversehen die Geldbox fallen lassen")
                    timer.Destroy("AusraubProgress")

                    timer.Simple(300, function()
                        cooldown = false
                    end)
                end
            end
        end)
    end)
end)