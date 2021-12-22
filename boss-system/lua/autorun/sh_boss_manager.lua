KatakurisBosse = KatakurisBosse or {}

KatakurisBosse.Classes = {      -- Nicht vergessen, dass hier auch die Spawn bosse rein müssen [ KatakurisBosse.SchreinSpawn oder KatakurisBosse.KatakombenBoss z.B ]
    ["npc_vj_vi_havan"] = true,
    ["npc_metropolice"] = true,
    ["npc_metropolice"] = true,
}

KatakurisBosse.Loot = {
    ["obj_vj_flareround"] = {94},
    ["weapon_p2282"] = {2},
    ["ls_sniper"] = {2},
    ["ls_sniper"] = {2},
}

KatakurisBosse.MiniBoss = {
    ["npc_antlionguard"] = true,
    ["npc_antlion"] = true,
}

KatakurisBosse.GetMoneyPerKill = 1000 --Wie viel geld man pro boss kill bekommen soll

KatakurisBosse.WOSEXP = false -- WOs EXP per boss kill aktivieren

KatakurisBosse.EXP = 2000 -- Wie viel wos exp man bekommt wenn man ein boss killt

KatakurisBosse.MiniBossCooldown = 180 --Gibt an wie lange der Cooldown ist von dem Mini boss Spawner

KatakurisBosse.HUD = {
    ["Rainbow"] = false,
    ["Rainbowspeed"] = 300,
    ["Aktiv"] = true,
    ["TEXT"] = "Buff der Bemächtigung",
    ["DisplayTime"] = 50, -- Gibt an wie viele Sekunden die HUD oben links bleiben soll
}

KatakurisBosse.Buffs = {
    ["Jumppower"] = 350, --Default jumppower vom Spieler is 200
    ["Healthregen"] = 5, -- Gibt an plus wie viel das leben addiert werden soll alle 5 sekunden
    ["BuffdauerHPRegen"] = 5, -- Bitte angeben wie viele SEKUNDEN die buffs anhalten sollen ( die bufftimer werden 10x wiederholt das heisst 5sekunden ist 50 sekunden buff dauer)
    ["Jumpdefaultdelay"] = 50, --Gibt an in wievielen sekunden die Jumppower wieder normal gemacht werden soll
}

KatakurisBosse.SchreinSpawn = "npc_metropolice"

KatakurisBosse.KatakombenBoss = "npc_antlionguard"

KatakurisBosse.TythonBoss = "npc_antlion"