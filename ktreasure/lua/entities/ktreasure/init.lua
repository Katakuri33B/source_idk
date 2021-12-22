AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')



function ENT:Initialize()

  self:SetModel("models/treasurechest/treasurechest.mdl")
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
local cooldown = 86400
local nextUse = cookie.GetNumber( "myFuncNextUse", 0 )
local time = os.time()

        if time < nextUse then
            if Name == "Use" and ply:IsPlayer() then

                ply:addMoney(math.random(500,12000))
                ply:ChatPrint("Du hast dein Tägliches Gold abgeholt!")
            end
        else
            ply:ChatPrint("Du hast die Truhe schon geöffnet... [ 24 std Cooldown ]")
        end 
end
