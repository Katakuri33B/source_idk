if not file.IsDir('essential_darkrp_f4_menu', 'DATA') then
    file.CreateDir('essential_darkrp_f4_menu')
end

AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_english.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_french.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_russian.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_ukrainian.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_polish.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_spanish.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/languages/cl_german.lua')

AddCSLuaFile('essential_darkrp_f4_menu/client/cl_f4_menu.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_settings.lua')

AddCSLuaFile('essential_darkrp_f4_menu/client/cl_commands.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_jobs.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_entities.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_shipments.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_weapons.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_ammo.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_vehicles.lua')
AddCSLuaFile('essential_darkrp_f4_menu/client/cl_food.lua')

AddCSLuaFile('essential_darkrp_f4_menu/cl_init.lua')

include('essential_darkrp_f4_menu/server/sv_settings.lua')

-- Console print
print('\n')

MsgC(Color(255, 150, 0), [[--------------------------------------------------------------------------

		 Essential DarkRP F4 Menu by Yuriy

--------------------------------------------------------------------------]]
)

MsgC(Color(255, 255, 255), [[


 Thank you for using my addon. If you have any questions or feedback
 for me, let me know!

 Steam profile:
 https://steamcommunity.com/profiles/76561198089349272

 Essential DarkRP Collection:
 https://steamcommunity.com/sharedfiles/filedetails/?id=1460772747

]]
)

MsgC(Color(255, 150, 0), '--------------------------------------------------------------------------\n\n')
