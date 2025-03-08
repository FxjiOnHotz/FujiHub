local CustomTheme = {
    SchemeColor = Color3.fromRGB(252, 48, 48),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Basketball Legends 🏀", CustomTheme)

-- Toggles

local AutoShootEnabled = false
local GetOpenEnabled = false

-- Tabs

local MainTab = Window:NewTab("Main")
local UtilitiesTab = Window:NewTab("Utilities")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local ShootingSection = UtilitiesTab:NewSection("Shooting")

-- Functions

local VIM = game:GetService("VirtualInputManager")
local UIS = game:GetService("UserInputService")

UIS.InputBegan:Connect(function(Input, Typing)
    if Typing then return end

    if Input.KeyCode == Enum.KeyCode.Tab then
        if AutoShootEnabled == true then
            VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game)
            task.wait(0.334)
            VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end
    end
end)

-- Utilities Tab

ShootingSection:NewToggle("Auto Shoot (Tab)", "Automatically shoots for you.", function(state)
    AutoShootEnabled = state
end)

-- Main Tab

local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

MainSection:NewButton("Game Name: " .. GameName, "The game's name", function()
    toClipboard(game.Name)
end)

MainSection:NewButton("PlaceId: " .. game.PlaceId, "The game's place id", function()
    toClipboard(game.PlaceId)
end)

MainSection:NewButton("JobId: " .. game.JobId, "The game's job id", function()
    toClipboard(game.JobId)
end)

MainSectionUI:NewKeybind("Toggle UI", "Key to toggle the gui.", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
