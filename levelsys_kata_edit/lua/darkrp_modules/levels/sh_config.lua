/////////////////////////
// Configuration file  //
/////////////////////////

LevelSystemConfiguration = {} -- Ignore
local Printers = {} -- Ignore
local Books = {} -- Ignore

//Language settings
LevelSystemConfiguration.Language = "EN" -- (available: FR, EN, PL, RU, zh-CN)

//Hud settings
LevelSystemConfiguration.EnableBar = false -- Is the XP Bar enabled?
LevelSystemConfiguration.BarText = false -- Is the bar text enabled?
LevelSystemConfiguration.XPTextColor = Color(255,255,255,255) -- The color of the XP percentage HUD element.
LevelSystemConfiguration.LevelBarColor = {6,116,255} -- The color of the XP bar. (Sorry this one is different. It is still {R,G,B})
LevelSystemConfiguration.XPBarYPos = 0 -- Y position of the XP bar
LevelSystemConfiguration.LevelText = false -- Enable the white text on left bottom?
LevelSystemConfiguration.LevelColor = Color(255,255,255,255) -- The color of the "Level: 1" HUD element. White looks best. (This setting is nullified if you have the prestige system)
LevelSystemConfiguration.LevelTextPos = {1.5, 180.0} -- The position of the LevelText. Y starts from bottom. Fiddle with it
LevelSystemConfiguration.DisplayLevel = false -- Show player levels when you look at them
LevelSystemConfiguration.GreenJobBars = true -- Are the green bars at the bottom of jobs enabled? KEEP THIS TRUE!
LevelSystemConfiguration.GreenAllBars = true -- Are the green bars at the bottom of everything but jobs enabled? Recommended(true)

//Kill settings
LevelSystemConfiguration.KillModule = true -- Give XP + Money for kills! -- Next 2 settings control this.
LevelSystemConfiguration.Friendly = true -- Only take away money / give XP if the killer is a lower level/same level than the victim. (Recommended:true)
LevelSystemConfiguration.TakeAwayMoneyAmount = 100 -- How much money to take away from players when they are killed and add to the killer. You can change this to 0 if none. The XP amount is dynamic.
LevelSystemConfiguration.NPCXP = true -- Give XP when an NPC is killed?
LevelSystemConfiguration.NPCXPAmount = 125 -- Amount of XP to give when an NPC is killed

//Timer settings
LevelSystemConfiguration.TimerModule = true -- Give XP to everybody every howeverlong
LevelSystemConfiguration.Timertime = 300 -- How much time (in seconds) until everybody gets given XP
LevelSystemConfiguration.TimerXPAmount = 325 -- How much XP to give each time it goes off
LevelSystemConfiguration.TimerXPAmountVip = 100 -- How much XP to give for vip players each time it goes off
LevelSystemConfiguration.TimerXPVipGroups = {"vip", "premium"} -- The vip groups

//XP settings
LevelSystemConfiguration.XPMult = 1 -- How hard it is to level up. 2 would require twice as much XP, ect.
LevelSystemConfiguration.MaxLevel = 100 -- The max level
LevelSystemConfiguration.ContinueXP = false -- If remaining XP continues over to next levels. I recommend this to be false. Seriously. What if a level 1 gets 99999999 XP somehow? He is level 99 so quickly.
LevelSystemConfiguration.BoughtXP = true -- Does the player gain xp from buying something (shipment/entity)

//Printer settings
LevelSystemConfiguration.PrinterSound = true -- Give the printers sounds?
LevelSystemConfiguration.PrinterMaxP = 4 -- How many times a printer can print before stopping. Change this to 0 if you want infine.
LevelSystemConfiguration.PrinterMax = 4 -- How many printers of a certain type a player can own at any one time
LevelSystemConfiguration.PrinterOverheat = false -- Can printers overheat?
LevelSystemConfiguration.PrinterTime = 120 -- How long it takes printers to print
LevelSystemConfiguration.PrinterCanCollect = true -- Can players collect from printers that are 5 levels above their level? (Recommended: false)
LevelSystemConfiguration.PrinterEpilepsy = true -- If printers flash different colors when they have money in them.

//Book settings
LevelSystemConfiguration.BookMax = 4 -- How many Books of a certain type a player can own at any one time
LevelSystemConfiguration.BookOnTouch = true -- Consume the book on touch?


/*Template Code for printers/*
local Printer= {} -- Leave this line
Printer.Name = "Your Printer Name"
Printer.Type = "yourprintername" -- A UNIQUE identifier STRING, can be anything. NO SPACES! The player does not see this.
Printer.Category = "printers" -- The category of the printer (See http:--wiki.darkrp.com/index.php/DarkRP:Categories)
Printer.XPPerPrint = 10 -- How much XP to give a player every time they print.
Printer.MoneyPerPrint = 50 -- How much money to give a player every time they print.
Printer.Color = Color(255,255,255,255) -- The color of the printer. Setting it to (255,255,255,255) will make it the normal prop color.
Printer.Model = "models/props_lab/reciever01b.mdl" -- The model of the printer. To find the path of a model, right click it in the spawn menu and click "Copy to Clipboard"
Printer.Prestige = 0 -- The prestige you have to be to buy the printer. Only works with the prestige DLC on Gmodstore.
Printer.Allowed = {} -- Same as DarkRP .allowed
Printer.CustomCheck = function(ply) return CLIENT or table.HasValue({"vip"}, ply:GetNWString("usergroup")) end -- Custom check, this one will make the printer vip only
Printer.CustomCheckFailMsg = "This printer is vip only" -- Message to display if the player can"t buy the entity
table.insert(Printers,Printer) -- Leave this line
*/











// Ignore everything under this line.













local en_language = {
	lvl_buy_entity = "You\'re not the right level to buy this!", -- Error message when someone can't buy an entity
	lvl_take_job = "Dein level ist zu niedrig..", -- Error message when someone can't take a job
	lvl_kill_notify = "You got %s XP and %s for killing %s", -- Notification to the killer when he kill someone (vars: XP, money, victime)
	lvl_kill_notify2 = "You got %s XP for killing %s", -- Notification to the killer when he kill someone (vars: XP, victime)
	lvl_kill_notify3 = "You killed %s", -- Notification to the killer when he kill someone (vars: victime)
	lvl_kill_npc = "You got %s XP for killing an NPC.", -- Notification to the killer when he kill a npc (vars: XP)
	lvl_death = "You died and lost %s!", -- Notification to the victim when he lost money on death (vars: money)
	lvl_play_on = "You got %s XP for playing on the server.", -- Notification to everyone when they gain xp by the timer (vars: XP)
	lvl_recieve_xp = "You got %s XP!", -- Notification to the player when he recieve xp (vars: ammount)
	lvl_reach_level = "%s has reached level %s!", -- Notification to everyone when someone reach a level (vars: name, PlayerLevel)
	lvl_book_notify = "You got %s XP for using the book %s!", -- Notification to the player when he use a book (vars: XP, bookname)
	lvl_printer_use = "You got %s XP and %s from this printer.",  -- Notification to the player when he use a printer (vars: XP, money)
	lvl_printer_level = "You need to be a higher level to use this!", -- Notification to the player when he can't use a printer
}
DarkRP.addLanguage("en", en_language)

local fr_language = {
	lvl_buy_entity = "Vous n\'avez pas le bon level pour acheter ??a!",
	lvl_take_job = "Vous n\'avez pas le bon level pour avoir ce job!",
	lvl_kill_notify = "Vous avez re??u %s XP et %s pour avoir tu?? %s",
	lvl_kill_notify2 = "Vous avez re??u %s XP pour avoir tu?? %s",
	lvl_kill_notify3 = "Vous avez tu?? %s",
	lvl_kill_npc = "Vous avez re??u %s XP pour avoir tu?? un NPC.",
	lvl_death = "Vous ??tes mort et avez perdu %s!",
	lvl_play_on = "Vous avez re??u %s XP Pour avoir jou?? sur le serveur.",
	lvl_recieve_xp = "Vous avez re??u %s XP!",
	lvl_reach_level = "%s a atteint le niveau %s!",
	lvl_book_notify = "Vous avez re??u %s XP pour avoir utilis?? un livre %s!",
	lvl_printer_use = "Vous avez re??u %s XP et %s du printer.",
	lvl_printer_level = "Vous devez avoir un plus haut niveau pour utiliser ce printer!",
}
DarkRP.addLanguage("fr", fr_language)

local pl_language = {
	lvl_buy_entity = "Ty nie masz odpowiedniego poziomu by to kupi??!",
	lvl_take_job = "Ty nie masz odpowiedniego poziomu by tym zosta??!",
	lvl_kill_notify = "Ty masz %s XP i %s za zabicie %s",
	lvl_kill_notify2 = "Ty masz %s XP za zabicie %s",
	lvl_kill_notify3 = "Zabi??e?? %s",
	lvl_kill_npc = "Ty masz %s XP za zabicie NPC.",
	lvl_death = "Zmar??e?? i straci??e?? %s!",
	lvl_play_on = "Ty masz %s XP za gr?? na serwerze.",
	lvl_recieve_xp = "Ty masz %s XP!",
	lvl_reach_level = "%s osi??gn???? poziom %s!",
	lvl_book_notify = "Ty masz %s XP za korzystanie z ksi????ki %s!",
	lvl_printer_use = "Ty masz %s XP i %s z tej drukarki.",
	lvl_printer_level = "Aby m??c z tego korzysta??, musisz by?? na wy??szym poziomie!",
}
DarkRP.addLanguage("pl", pl_language)

local ru_language = {
	lvl_buy_entity = "???? ???? ???????? ????????????, ?????????? ???????????? ??????!",
	lvl_take_job = "???? ???? ???????? ???????????? ?????? ???????? ????????????!",
	lvl_kill_notify = "???? ???????????????? %s ?????????? ?? %s ???? ???????????????? %s",
	lvl_kill_notify2 = "???? ???????????????? %s ?????????? ???? ???????????????? %s",
	lvl_kill_notify3 = "???? ?????????? %s",
	lvl_kill_npc = "???? ???????????????? %s ?????????? ???? ???????????????? NPC.",
	lvl_death = "???? ???????????? ?? ???????????????? %s!",
	lvl_play_on = "???? ???????????????? %s ?????????? ???? ???????? ???? ???????? ??????????????.",
	lvl_recieve_xp = "???? ???????????????? %s ??????????!",
	lvl_reach_level = "%s ???????????? ???????????? %s!",
	lvl_book_notify = "???? ???????????????? %s ?????????? ???? ?????????????????????????? ?????????? %s!",
	lvl_printer_use = "???? ???????????????? %s ?????????? ?? %s ???? ????????????????.",
	lvl_printer_level = "???? ???????????? ???????? ?????????? ???????????????? ????????????, ?????????? ???????????????????????? ??????!",
}
DarkRP.addLanguage("ru", ru_language)

local cn_language = {
	lvl_buy_entity = "???????????????????????????????????????!",
	lvl_take_job = "???????????????????????????????????????!",
	lvl_kill_notify = "???????????? %s XP ??? %s ???????????? %s ?????????",
	lvl_kill_notify2 = "???????????? %s XP ???????????? %s ?????????",
	lvl_kill_notify3 = "???????????? %s",
	lvl_kill_npc = "???????????? %s XP ?????????????????????NPC?????????.",
	lvl_death = "????????????????????? %s!",
	lvl_play_on = "???????????? %s XP ???????????????????????????.",
	lvl_recieve_xp = "???????????? %s XP!",
	lvl_reach_level = "%s ?????????????????? %s!",
	lvl_book_notify = "???????????? %s XP ??????????????????????????? %s",
	lvl_printer_use = "?????????????????????????????? %s XP ??? %s.",
	lvl_printer_level = "????????????????????????????????????????????????!",
}
DarkRP.addLanguage("zh-CN", cn_language)


hook.Add("loadCustomDarkRPItems", "manolis:MVLevels:CustomLoad", function()

	for k,v in pairs(Printers) do
		local Errors = {}
		if not type(v.Name) == "string" then table.insert(Errors, "The name of a printer is INVALID!") end
		if not type(v.Type) == "string" then table.insert(Errors, "The type of a printer is INVALID!") end
		if not type(v.XPPerPrint) == "number" then table.insert(Errors, "The XP of a printer is INVALID!") end
		if not type(v.MoneyPerPrint) == "number" then table.insert(Errors, "The money of a printer is INVALID!") end
		if not type(v.Color) == "table" then table.insert(Errors, "The color of a printer is INVALID!") end
		if not type(v.Model) == "string" then table.insert(Errors, "The model of a printer is INVALID!") end
		if not type(v.Price) == "number" then table.insert(Errors, "The price of a printer is INVALID!") end
		if not type(v.Category) == "string" then v.Category="" end
		if not type(v.Level) == "number" then table.insert(Errors, "The level of a printer is INVALID!") end
		local ErrorCount = 0
		for k,v in pairs(Errors) do
			error(v)
			ErrorCount = ErrorCount + 1
		end



		if not(ErrorCount==0) then return false end

		local t = {
			ent = "vrondakis_printer",
			model = v.Model,
			category = v.Category,
			price = v.Price,
			prestige = (v.Prestige or 0),
			printer = true,
			level = v.Level,
			max = LevelSystemConfiguration.PrinterMax,
			cmd = "buyvrondakis"..v.Type.."printer",
			allowed = v.Allowed,
			vrondakisName = v.Name,
			vrondakisType = v.Type,
			vrondakisXPPerPrint = v.XPPerPrint,
			vrondakisMoneyPerPrint = v.MoneyPerPrint,
			vrondakisColor = v.Color,
			vrondakisModel = v.Model,
			customCheck = (v.CustomCheck or function() return true end),
			CustomCheckFailMsg = v.CustomCheckFailMsg,
			vrondakisPrinterOverheat = LevelSystemConfiguration.PrinterOverheat,
			vrondakisPrinterMaxP = LevelSystemConfiguration.PrinterMaxP,
			vrondakisPrinterTime = LevelSystemConfiguration.PrinterTime,
			vrondakisPrinterCanCollect = LevelSystemConfiguration.PrinterCanCollect,
			vrondakisPrinterEpilepsy = LevelSystemConfiguration.PrinterEpilepsy
		}

		if(v.DParams) then
			for k,v in pairs(v.DParams) do
				t[k] = v
			end
		end

		DarkRP.createEntity(v.Name,t)

	end





	for k,v in pairs(Books) do
		local Errors = {}
		if not type(v.Name) == "string" then table.insert(Errors, "The name of a book is INVALID!") end
		if not type(v.Type) == "string" then table.insert(Errors, "The type of a book is INVALID!") end
		if not type(v.Color) == "table" then table.insert(Errors, "The color of a book is INVALID!") end
		if not type(v.Model) == "string" then table.insert(Errors, "The model of a book is INVALID!") end
		if not type(v.Price) == "number" then table.insert(Errors, "The price of a book is INVALID!") end
		if not type(v.XP) == "number" then table.insert(Errors, "The xp ammount of a book is INVALID!") end
		if not type(v.Category) == "string" then v.Category="" end
		if not type(v.Level) == "number" then table.insert(Errors, "The level of a book is INVALID!") end
		local ErrorCount = 0
		for k,v in pairs(Errors) do
			error(v)
			ErrorCount = ErrorCount + 1
		end



		if not(ErrorCount==0) then return false end

		local t = {
			ent = "vrondakis_book",
			model = v.Model,
			category = v.Category,
			price = v.Price,
			xp = v.XP,
			prestige = (v.Prestige or 0),
			book = true,
			level = v.Level,
			max = LevelSystemConfiguration.BookMax,
			cmd = "buyvrondakis"..v.Type.."book",
			allowed = v.Allowed,
			vrondakisName = v.Name,
			vrondakisType = v.Type,
			vrondakisColor = v.Color,
			vrondakisModel = v.Model,
			customCheck = (v.CustomCheck or function() return true end),
			CustomCheckFailMsg = v.CustomCheckFailMsg,
		}

		if(v.DParams) then
			for k,v in pairs(v.DParams) do
				t[k] = v
			end
		end

		DarkRP.createEntity(v.Name,t)

	end

end)


DarkRP.registerDarkRPVar("xp", net.WriteDouble, net.ReadDouble)
DarkRP.registerDarkRPVar("level", net.WriteDouble, net.ReadDouble)
DarkRP.registerDarkRPVar("prestige", net.WriteDouble, net.ReadDouble)
