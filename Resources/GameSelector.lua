local CustomTheme = {
    SchemeColor = Color3.fromRGB(31, 51, 80),
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
	end
end

GamesSection:NewDropdown("Select Game", "Select a game.", {
"DOORS 👁️", 
"Murder Mystery 2 🔪", 
"Flee The Facility 🔨",
 "Identity Fraud 🖥️"}, function(currentOption)
    SelectGame(currentOption)
	Library:ToggleUI()
end)
