--Hide
local hide = {
     ["CHudHealth"] = true,
     ["CHudBattery"] = true,
     ["CHudAmmo"] = true,
     ["CHudVoiceStatus"] = true,
     ["CHudVoiceSelfStatus"] = true,
     ["CHudEnergy"] = true,
     ["DarkRP_EntityDisplay"] = true,
     ["DarkRP_HUD"] = true,
     ["CHudSecondaryAmmo"] = true
 }

 hook.Add( "HUDShouldDraw", "HideHUD", function( name )
     if ( hide[ name ] ) then return false end
 end )





