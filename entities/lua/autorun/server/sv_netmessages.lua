util.AddNetworkString("WorkbenchUI")
util.AddNetworkString("WaffeVerbessern")
util.AddNetworkString("WaffenBuffHUD")

local Damageboost_dauer = 300

net.Receive("WaffeVerbessern", function(len, ply)
    local waffe = net.ReadEntity()
    ply:addMoney(-15000)
    hook.Add( "EntityTakeDamage", "EntityDamageExample", function( target, dmginfo )
        if ( target:IsPlayer() or target:IsNPC() ) then
            
            dmginfo:ScaleDamage(1.5)
        end
    end )
    net.Start("WaffenBuffHUD")
    net.Send(ply)
    timer.Simple(Damageboost_dauer, function()
        hook.Add( "EntityTakeDamage", "EntityDamageExample", function( target, dmginfo )
            if ( target:IsPlayer() or target:IsNPC() ) then
                dmginfo:ScaleDamage(1)
            end
        end )
    end)
end)

