util.AddNetworkString("openAdminMSG")
util.AddNetworkString("AdminMSGSend")
util.AddNetworkString("AdminBroadcast")


hook.Add( "PlayerSay", "AdminMSGDing", function( ply, text )
	if ( string.lower( text ) == "/msg" ) then
		if not AdminMSG.Access[ply:GetUserGroup()] then ply:ChatPrint("Nur für Administration...") return "" end
            net.Start("openAdminMSG")
                net.Send(ply)
		return ""
	end
end )

net.Receive("AdminMSGSend", function(len, ply)
    local str = net.ReadString()

    net.Start("AdminBroadcast")
        net.WriteString(str)
    net.Broadcast()
end)