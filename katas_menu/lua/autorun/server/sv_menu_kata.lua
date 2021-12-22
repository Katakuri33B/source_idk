
util.AddNetworkString("SpawnBears")
util.AddNetworkString("SpawnDeers")
util.AddNetworkString("SpawnCrocs")

local bspawn1 =    Vector(-11056.134766, 7498.509277, 58.052525)
local bspawn2 =    Vector(8585.658203, -11268.958984, -649.321289)
local bspawn3 =    Vector(5081.985352, -12421.184570, -421.055206)
local bspawn4 =   Vector(1574.664917, -11159.341797, -122.233307)
local bspawn5 =    Vector(21.849125, -5293.062988, -620.530640)
local bspawn6 =   Vector(-742.767639, 3168.199463, -421.253723)



local cspawn1 =  Vector(-1611.296631, 13722.127930, -126.235321)
local cspawn2 =   Vector(-3197.038574, 12907.248047, -129.412491)
local cspawn3 =   Vector(-462.864227, 10212.182617, -133.601151)
local cspawn4 = Vector(2172.546387, 966.219788, -682.426758)
local cspawn5 = Vector(5662.957031, 1282.654053, -830.849731)
local cspawn6 = Vector(8106.555664, 6008.348145, -877.863281)

local bear  = "npc_citizen"
local croc  = "npc_citizen"
local deer  = "npc_citizen"

local wenig_hp = 300
local mittel_hp = 600
local viel_hp = 900

function SpawnHirsch()  
    
    local Hirsch1 = ents.Create( deer )
    Hirsch1:SetPos( Vector(-9429.536133, 4801.695313, -381.969330) )
    Hirsch1:Spawn()
    Hirsch1:SetHealth(wenig_hp)
    Hirsch1:SetMovementActivity( ACT_WALK )
    Hirsch1:MoveStart()

    local Hirsch2 = ents.Create( deer )
    Hirsch2:SetPos( Vector(-6876.080566, 3516.531494, -395.019928) )
    Hirsch2:Spawn()
    Hirsch2:SetHealth(wenig_hp)
    Hirsch2:SetMovementActivity( ACT_WALK )
    Hirsch2:MoveStart()

    local Hirsch3 = ents.Create( deer )
    Hirsch3:SetPos( Vector(-3097.595703, 3222.550781, -433.618988) )
    Hirsch3:Spawn()
    Hirsch3:SetHealth(wenig_hp)
    Hirsch3:SetMovementActivity( ACT_WALK )
    Hirsch3:MoveStart()

    local Hirsch4 = ents.Create( deer )
    Hirsch4:SetPos( Vector(128.033478, 1847.089355, -356.152130) )
    Hirsch4:Spawn()
    Hirsch4:SetHealth(wenig_hp)
    Hirsch4:SetMovementActivity( ACT_WALK )
    Hirsch4:MoveStart()

    local Hirsch5 = ents.Create( deer )
    Hirsch5:SetPos( Vector(2133.562988, 3197.242432, -226.183014) )
    Hirsch5:Spawn()
    Hirsch5:SetHealth(wenig_hp)
    Hirsch5:SetMovementActivity( ACT_WALK )
    Hirsch5:MoveStart()

    local Hirsch6 = ents.Create( deer )
    Hirsch6:SetPos( Vector(3358.415527, 6964.594238, -432.940521) )
    Hirsch6:Spawn()
    Hirsch6:SetHealth(wenig_hp)
    Hirsch6:SetMovementActivity( ACT_WALK )
    Hirsch6:MoveStart()
end

function SpawnBear() 
    
    local BÃ¤r1 = ents.Create( bear )
    BÃ¤r1:SetPos( bspawn1 )
    BÃ¤r1:Spawn()
    BÃ¤r1:SetHealth(viel_hp)
    BÃ¤r1:SetMovementActivity( ACT_WALK )
    BÃ¤r1:MoveStart()

    local BÃ¤r2 = ents.Create( bear )
    BÃ¤r2:SetPos( bspawn2 )
    BÃ¤r2:Spawn()
    BÃ¤r2:SetHealth(viel_hp)
    BÃ¤r2:SetMovementActivity( ACT_WALK )
    BÃ¤r2:MoveStart()

    local BÃ¤r3 = ents.Create( bear )
    BÃ¤r3:SetPos( bspawn3 )
    BÃ¤r3:Spawn()
    BÃ¤r3:SetHealth(viel_hp)
    BÃ¤r3:SetMovementActivity( ACT_WALK )
    BÃ¤r3:MoveStart()

    local BÃ¤r4 = ents.Create( bear )
    BÃ¤r4:SetPos( bspawn4 )
    BÃ¤r4:Spawn()
    BÃ¤r4:SetHealth(viel_hp)
    BÃ¤r4:SetMovementActivity( ACT_WALK )
    BÃ¤r4:MoveStart()

    local BÃ¤r5 = ents.Create( bear )
    BÃ¤r5:SetPos( bspawn5 )
    BÃ¤r5:Spawn()
    BÃ¤r5:SetHealth(viel_hp)
    BÃ¤r5:SetMovementActivity( ACT_WALK )
    BÃ¤r5:MoveStart()

    local BÃ¤r6 = ents.Create( bear )
    BÃ¤r6:SetPos( bspawn6 )
    BÃ¤r6:Spawn()
    BÃ¤r6:SetHealth(viel_hp)
    BÃ¤r6:SetMovementActivity( ACT_WALK )
    BÃ¤r6:MoveStart()
end

function SpawnCroc() 

    local Croc1 = ents.Create( croc )
    Croc1:SetPos( cspawn1 )
    Croc1:Spawn()
    Croc1:SetHealth(mittel_hp)
    Croc1:SetMovementActivity( ACT_WALK )
    Croc1:MoveStart()

    local Croc2 = ents.Create( croc )
    Croc2:SetPos( cspawn2 )
    Croc2:Spawn()
    Croc2:SetHealth(mittel_hp)
    Croc2:SetMovementActivity( ACT_WALK )
    Croc2:MoveStart()

    local Croc3 = ents.Create( croc )
    Croc3:SetPos( cspawn3 )
    Croc3:Spawn()
    Croc3:SetHealth(mittel_hp)
    Croc3:SetMovementActivity( ACT_WALK )
    Croc3:MoveStart()

    local Croc4 = ents.Create( croc )
    Croc4:SetPos( cspawn4 )
    Croc4:Spawn()
    Croc4:SetHealth(mittel_hp)
    Croc4:SetMovementActivity( ACT_WALK )
    Croc4:MoveStart()

    local Croc5 = ents.Create( croc )
    Croc5:SetPos( cspawn5 )
    Croc5:Spawn()
    Croc5:SetHealth(mittel_hp)
    Croc5:SetMovementActivity( ACT_WALK )
    Croc5:MoveStart()

    local Croc6 = ents.Create( croc )
    Croc6:SetPos( cspawn6 )
    Croc6:Spawn()
    Croc6:SetHealth(mittel_hp)
    Croc6:SetMovementActivity( ACT_WALK )
    Croc6:MoveStart()
end

net.Receive("SpawnDeers", SpawnHirsch)
net.Receive("SpawnBears", SpawnBear)
net.Receive("SpawnCrocs", SpawnCroc)