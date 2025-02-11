local CustomTheme = {
    SchemeColor = Color3.fromRGB(208, 3, 255),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | GAMES", CustomTheme)

-- Tabs

local GamesTab = Window:NewTab("Games")
local GamesSection = GamesTab:NewSection("Game Selector")

--  Game Selector

function SelectGame(currentOption)
	if currentOption == "DOORS 👁️" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua"))()
	elseif currentOption == "Murder Mystery 2 🔪" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua"))()
	elseif currentOption == "Flee The Facility 🔨" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua"))()
	elseif currentOption == "Identity Fraud 🖥️" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/IdentityFraud.lua"))()
	elseif currentOption == "Dandy's World 🌈" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DandysWorld.lua"))()
	elseif currentOption == "Ninja Legends ⚔️" then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/NinjaLegends.lua"))()
	end
end

GamesSection:NewDropdown("Select Game", "Select a game.", {
"DOORS 👁️", 
"Murder Mystery 2 🔪", 
"Flee The Facility 🔨",
 "Identity Fraud 🖥️",
"Dandy's World 🌈",
"Ninja Legends ⚔️"}, function(currentOption)
    SelectGame(currentOption)
	Library:ToggleUI()
end)
