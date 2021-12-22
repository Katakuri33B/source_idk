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
      local KatakombenBoss = ents.Create( KatakurisBosse.KatakombenBoss )
            KatakombenBoss:SetPos( Vector(-9729.053711, -10860.845703, -6129.968750) )
            KatakombenBoss:Spawn()
            KatakombenBoss:SetHealth(3000)
            PrintMessage(HUD_PRINTTALK, Activator:Name().." hat das Sithmonster in den Katakomben erweckt")

    end
end
