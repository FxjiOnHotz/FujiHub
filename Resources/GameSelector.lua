local CustomTheme = {
    SchemeColor = Color3.fromRGB(210, 1, 3),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1.0.3 | Game Selector", CustomTheme)

-- Main Function

local function SelectGame(Game)
    if Game == "DOORS 👁️" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua"))()
    elseif Game == "Murder Mystery 2 🔪" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua"))()
    elseif Game == "Flee The Facility 🔨" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua"))()
    end
end

-- Tabs

local SelectorTab = Window:NewTab("Selector")

-- Selector Tab

local SelectSection = SelectorTab:NewSection("Select A Game")

SelectSection:NewDropdown("Game Selector", "A list of games that we support.", {
    "DOORS 👁️", 
    "Murder Mystery 2 🔪",
    "Flee The Facility 🔨"}
    , function(currentOption)
    Library:ToggleUI()
    SelectGame(currentOption)
end)
