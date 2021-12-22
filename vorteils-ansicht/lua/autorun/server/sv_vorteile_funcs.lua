util.AddNetworkString("ShowVorteilsPanel")
util.AddNetworkString("Vorteile")
util.AddNetworkString("ClientChatPrint")

-----------------

local dailycooldown = false

------------------------------------------------------------------------

net.Receive("Vorteile", function(len, ply)
	local pl = net.ReadEntity()
	local str = net.ReadString()

	if str == "Stallmeister" then
		local mount = ents.Create("npc_horse")
		mount:SetPos(Vector(pl:GetPos().x + 90, pl:GetPos().y + 90, pl:GetPos().z + 10))
		mount:Spawn()

		timer.Simple(300, function()
			mount:Remove()
		end)
	end 

	if str == "Daily" then
		local cooldown = 86400
		
		if dailycooldown then 
			net.Start("ClientChatPrint")
				net.WriteString("DailyPrint")
			net.Send(ply)
		return end

		pl:addMoney(1500) 

		timer.Simple(cooldown, function()
			dailycooldown = false
		end)



	end

end)

------------------------------------------------------------------------

hook.Add( "PlayerSay", "VorteileOpen", function( ply, text )
	if ( string.lower( text ) == "!vorteile" ) then
		net.Start("ShowVorteilsPanel")
            net.Send(ply)
		return ""
	end
end )