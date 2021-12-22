AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

util.AddNetworkString("DealerUI")
util.AddNetworkString("Ausparken")

function ENT:Initialize( )

	self:SetModel( XGCardealer.NPCModel )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
	self:SetMaxYawSpeed( 90 )

end

function ENT:OnTakeDamage()
	return false
end

function ENT:AcceptInput( Name, Activator, Caller ) --function ENT:Use1( Name, Activator, Caller )

			if Name == "Use" and Activator:IsPlayer() then

				net.Start("DealerUI")
				net.Send(Activator)

	end

end


