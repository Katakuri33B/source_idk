AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')



function ENT:Initialize()

  self:SetModel("models/props_lab/servers.mdl")
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
  if not Activator:IsValid() then return end
  if not Activator:IsPlayer() then return end

  net.Start("AusbildungEEvent")
    net.Send(Activator)

end
