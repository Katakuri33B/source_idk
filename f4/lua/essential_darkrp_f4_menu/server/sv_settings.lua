util.AddNetworkString('edf_settingsUpdate')
util.AddNetworkString('edf_changeLanguage')
util.AddNetworkString('edf_changeHideSettingsButton')

essentialDarkRPF4Menu = essentialDarkRPF4Menu or {}
essentialDarkRPF4Menu.settings = essentialDarkRPF4Menu.settings or {}

local function settingsToJson()
	file.Write('essential_darkrp_f4_menu/settings.txt', util.TableToJSON(essentialDarkRPF4Menu.settings, true))
end

if file.Exists('essential_darkrp_f4_menu/settings.txt', 'DATA') then
	essentialDarkRPF4Menu.settings = util.JSONToTable(file.Read('essential_darkrp_f4_menu/settings.txt', 'DATA'))

	if essentialDarkRPF4Menu.settings == nil or essentialDarkRPF4Menu.settings == '' then
		essentialDarkRPF4Menu.settings['display_language'] = 'English'
		essentialDarkRPF4Menu.settings['hide_settings_button'] = false

		settingsToJson()
	end
else
	essentialDarkRPF4Menu.settings['display_language'] = 'English'
	essentialDarkRPF4Menu.settings['hide_settings_button'] = false

	settingsToJson()
end

hook.Add('PlayerInitialSpawn', 'edf_sendSettingsOnSpawn', function(ply)
	timer.Simple(2, function()
		net.Start('edf_settingsUpdate')
			net.WriteTable(essentialDarkRPF4Menu.settings)
		net.Send(ply)
	end)
end)

net.Receive('edf_changeLanguage', function(len, ply)
	if not ply:IsSuperAdmin() or ply:IsUserGroup('owner') then return end

	essentialDarkRPF4Menu.settings['display_language'] = net.ReadString()

	net.Start('edf_settingsUpdate')
		net.WriteTable(essentialDarkRPF4Menu.settings)
	net.Broadcast()

	settingsToJson()
end)

net.Receive('edf_changeHideSettingsButton', function(len, ply)
	if not ply:IsSuperAdmin() or ply:IsUserGroup('owner') then return end

	essentialDarkRPF4Menu.settings['hide_settings_button'] = not essentialDarkRPF4Menu.settings['hide_settings_button']

	net.Start('edf_settingsUpdate')
		net.WriteTable(essentialDarkRPF4Menu.settings)
	net.Broadcast()

	settingsToJson()
end)
