if SERVER then AddCSLuaFile() end

if CLIENT then

	SWEP.PrintName		= "Tavernen SWEP"
	SWEP.Author			= "Katakuri"
	SWEP.Slot			= 0
	SWEP.SlotPos		= 1
	
end

SWEP.Instructions = "Ein Bier schadet nie"

SWEP.Category				= "Medieval SWEPS"
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 60

SWEP.Spawnable				= true
SWEP.AdminOnly				= false
SWEP.UseHands				= false

SWEP.ViewModel				= "models/weapons/c_arms_hev.mdl"
SWEP.WorldModel				= ""

SWEP.Weight			  		= 1
SWEP.AutoSwitchTo			= true
SWEP.AutoSwitchFrom			= true

SWEP.Primary.Recoil			= 0
SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo		    = "none"
SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

function SWEP:Initialize()
	timer.Simple(0.2, function()
		self:SetHoldType("idle")
	end)
	self:SetHoldType("idle")
end

local c = "weapons/taverne/beer.mp3" 

function SWEP:Reload()
	self:EmitSound(c)
end

if (SERVER) then
	timer.Simple(2, function()
		print("Das SWEP 'Tavernen SWEP' ist geladen ")
	end)
end