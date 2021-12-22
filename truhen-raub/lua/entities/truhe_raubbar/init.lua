AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')


local truheninhalt = math.random(500, 2000)
local geld = true
local cooldown = false

function ENT:Initialize()

  self:SetModel("models/props_junk/wood_crate002a.mdl")
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
  if not IsValid(ply) then return end
  if not ent:GetClass() == "truhe_raubbar" then return end
    PrintMessage(HUD_PRINTTALK, "[Truhenraub] Jemand bricht in die Goldkammer der Zarocks ein!")
    ply:ChatPrint("Du wurdest gesehen... die Wachen sind auf dem Weg")
    timer.Simple(70, function()
      ent:EmitSound("ambient/alarms/alarm1.wav", 75, 100, 1)
      timer.Simple(30, function()
        ent:StopSound("ambient/alarms/alarm1.wav")
      end)
    end)
end)

hook.Add("onLockpickCompleted", "jaodernein", function(ply, suc, ent)
  if not IsValid(ply) then return end
  if not ent:GetClass() == "truhe_raubbar" then return end

  if suc then 
    timer.Simple(0.5, function()
      ply:addMoney(truheninhalt)
      ply:addXP(truheninhalt * .1)
      SetGlobalBool("Truhen_Cooldown", true)
      PrintMessage(HUD_PRINTTALK, "[Truhenraub] "..ply:Name().." Hat die Truhe aufgebrochen und sein Gold bekommen")
      ply:ChatPrint("Es ist nun ein 5 Minuten cooldown auf dieser kiste")
      cooldown = true
      timer.Simple(300, function()
        cooldown = false
        SetGlobalBool("Truhen_Cooldown", false)
      end)
    end)
  end
end)

hook.Add("lockpickTime", "zeit", function(ply, ent)
  if not ent:GetClass() == "truhe_raubbar" then return end
    return 90
end)

hook.Add("Initialize", "GlobalBoolTruhe", function()
  SetGlobalBool("Truhen_Cooldown", false)
end)