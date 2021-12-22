AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

local truheninhalt = math.random(2000, 10000)
local geld = true
local cooldown = false

function ENT:Initialize()

  self:SetModel("models/woodenchest.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)
  self:SetUseType(SIMPLE_USE)

  local phys = self:GetPhysicsObject()

  if(phys:IsValid()) then

    phys:Wake()

  end
end 

hook.Add("lockpickStarted", "getHUDNotify", function(ply, ent)
  if cooldown then return end
  if not IsValid(ply) then return end
  if not ent:GetClass() == "truhe_raubbar" then return end
      timer.Simple(2, function()
        net.Start("Schatzraub")
          net.Broadcast()
        cooldown = true
        timer.Simple(30, function()
          cooldown = false
        end)
        ply:ChatPrint("Du wurdest gesehen... die Wachen sind auf dem Weg")
      end)
end)

hook.Add("onLockpickCompleted", "jaodernein", function(ply, suc, ent)
  if not IsValid(ply) then return end
  if not ent:GetClass() == "truhe_raubbar" then return end

  if suc then 
        timer.Simple(1200, function()
          geld = true
        end)
    if geld then
      ply:addMoney(truheninhalt)
      PrintMessage(HUD_PRINTTALK, ply:Name().." Hat die Truhe aufgebrochen und sein Gold bekommen")
    else  
      ply:ChatPrint("Leider ist nichts drin. ( wurde schon ausgeraubt )")
    end 
  end
  geld = false
end)

hook.Add("lockpickTime", "zeit", function(ply, ent)
  if not ent:GetClass() == "truhe_raubbar" then return end
    return 10
end)
