util.AddNetworkString("TryOutMenuOpen")
util.AddNetworkString("TryOutMenuSend")
util.AddNetworkString("TryOutMenuBroadcast")

hook.Add( "PlayerSay", "CoinFlip", function( ply, text )
    if not tryout.access[team.GetName(ply:Team())] then return end
	if ( string.lower( text ) == "!tryout" ) then
		net.Start("TryOutMenuOpen")
            net.Send(ply)
		return ""
	end
end )


net.Receive("TryOutMenuSend", function(len, ply)
    local einheit_txt = net.ReadString()
    local wann_txt = net.ReadString()
    local ort_txt = net.ReadString()

    net.Start("TryOutMenuBroadcast")
        net.WriteString(einheit_txt)
        net.WriteString(wann_txt)
        net.WriteString(ort_txt)
    net.Broadcast()
end)