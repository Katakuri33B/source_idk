AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

  self:SetModel("models/props_junk/GlassBottle01a.mdl")
  self:PhysicsInit(SOLID_VPHYSICS)
  self:SetMoveType(MOVETYPE_VPHYSICS)
  self:SetSolid(SOLID_VPHYSICS)
  self:SetUseType(SIMPLE_USE)

  local phys = self:GetPhysicsObject()

  if(phys:IsValid()) then

    phys:Wake()

  end
end 

  function ENT:AcceptInput( Name, Activator, Caller )

    if Name == "Use" and Caller:IsPlayer() then

        Activator:SetArmor(Activator:GetMaxArmor() + 20)
        Activator:ChatPrint("Du fühlst dich Standhafter!")
        self:Remove()
    end

  end
