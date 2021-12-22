local map = game.GetMap()

net.Receive("Ausparken", function(len, ply)
    local txt = net.ReadString()

    if txt == "LaatAusparken" then
    local spawn = ents.Create(XGCardealer.LAATEnt)
        if spawn != nil then
            spawn:SetPos(Vector(309.766815, -115.376450, -65.804871))
            --spawn:SetModel("models/props_c17/furnitureStove001a.mdl")
            spawn:Spawn()
        end
    elseif txt == "SpeederAusparken" then
        local spawn = ents.Create(XGCardealer.SpeederENT)
        if spawn != nil then
            spawn:SetPos(Vector(309.766815, -115.376450, -65.804871))
            --spawn:SetModel("models/props_c17/furnitureStove001a.mdl")
            spawn:Spawn()
        end
    elseif txt == "PanzerAusparken" then
        local spawn = ents.Create(XGCardealer.TankENT)
        if spawn != nil then
            spawn:SetPos(Vector(309.766815, -115.376450, -65.804871))
            --spawn:SetModel("models/props_c17/furnitureStove001a.mdl")
            spawn:Spawn()
        end
    end
end)