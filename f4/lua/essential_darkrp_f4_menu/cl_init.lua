local function precache(tbl)
  for v = 1, #tbl do
    if istable(tbl[v].model) then
      for i = 1, #tbl[v].model do
        if util.IsValidModel(tbl[v].model[i]) then
          util.PrecacheModel(tbl[v].model[i])
        end
      end
    else
      if util.IsValidModel(tbl[v].model) then
        util.PrecacheModel(tbl[v].model)
      end
    end
  end
end

hook.Add('InitPostEntity', 'edf_precaching', function()
	if #RPExtraTeams > 0 then
    precache(RPExtraTeams)
	end

	if #DarkRPEntities > 0 then
    precache(DarkRPEntities)
	end

	if #CustomShipments > 0 then
    precache(CustomShipments)
	end

	if #GAMEMODE.AmmoTypes > 0 then
    precache(GAMEMODE.AmmoTypes)
	end

	if #CustomVehicles > 0 then
    precache(CustomVehicles)
	end

	if not DarkRP.disabledDefaults.modules.hungermod then
    precache(FoodItems)
	end
end)

include('essential_darkrp_f4_menu/client/languages/cl_english.lua')
include('essential_darkrp_f4_menu/client/languages/cl_french.lua')
include('essential_darkrp_f4_menu/client/languages/cl_russian.lua')
include('essential_darkrp_f4_menu/client/languages/cl_ukrainian.lua')
include('essential_darkrp_f4_menu/client/languages/cl_polish.lua')
include('essential_darkrp_f4_menu/client/languages/cl_spanish.lua')
include('essential_darkrp_f4_menu/client/languages/cl_german.lua')

include('essential_darkrp_f4_menu/client/cl_f4_menu.lua')
include('essential_darkrp_f4_menu/client/cl_settings.lua')

include('essential_darkrp_f4_menu/client/cl_commands.lua')
include('essential_darkrp_f4_menu/client/cl_jobs.lua')
include('essential_darkrp_f4_menu/client/cl_entities.lua')
include('essential_darkrp_f4_menu/client/cl_shipments.lua')
include('essential_darkrp_f4_menu/client/cl_weapons.lua')
include('essential_darkrp_f4_menu/client/cl_ammo.lua')
include('essential_darkrp_f4_menu/client/cl_vehicles.lua')
include('essential_darkrp_f4_menu/client/cl_food.lua')


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
