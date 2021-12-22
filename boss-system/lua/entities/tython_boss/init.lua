AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

local lastOccurance = 0 

function ENT:Initialize()

  self:SetModel("models/props_lab/tpplugholder_single.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)
  self:SetUseType(SIMPLE_USE)
  self.NextUse = CurTime()

  local phys = self:GetPhysicsObject()

  if(phys:IsValid()) then

    phys:Wake()

  end

end

function ENT:AcceptInput( Name, Activator, ply )
local delay = KatakurisBosse.MiniBossCooldown
    local timeElapsed = CurTime() - lastOccurance
    if timeElapsed < delay then 
      Activator:ChatPrint("Hier ist ein Cooldown drauf.. komm später wieder..")
    else
      lastOccurance = CurTime()
      local TythonBoss = ents.Create( KatakurisBosse.TythonBoss )
            TythonBoss:SetPos( Vector(12771.363281, 5339.099609, 9214.925781) )
            TythonBoss:Spawn()
            TythonBoss:SetHealth(3000)
            PrintMessage(HUD_PRINTTALK, Activator:Name().." hat das Monster von Tython beschworen")

    end
end
