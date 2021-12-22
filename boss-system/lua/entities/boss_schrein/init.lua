AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

util.AddNetworkString("Bossschrein")
util.AddNetworkString("GetBossSpawn")

function ENT:Initialize()

  self:SetModel("models/props_c17/gravestone_statue001a.mdl")
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
    net.Start("Bossschrein")   
      net.Send(Activator) 
    
    timer.Simple(30, function()
      Entity(1):EmitSound( "bell/bell.wav" )
    end)
end

net.Receive("GetBossSpawn", function(len, ply)
  local Item1 = ents.Create( KatakurisBosse.SchreinSpawn )
        Item1:SetPos( ents.FindByClass( "boss_schrein" )[1]:GetPos() )
        ents.FindByClass( "boss_schrein" )[1]:Remove()
        Item1:Spawn()
        Item1:SetHealth(20000)
  PrintMessage(HUD_PRINTTALK,"Es wurde ein boss von "..ply:Name().." gespawned")
  PrintMessage(HUD_PRINTTALK,"Was habt ihr getan!!! Es hatte einen grund wieso er Begraben war!!")
end)
