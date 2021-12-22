util.AddNetworkString("GetStartscreenUI")

hook.Add( "PlayerInitialSpawn", "GetStartscreen", function( ply )
	net.Start("GetStartscreenUI")
        net.Send(ply)
end )