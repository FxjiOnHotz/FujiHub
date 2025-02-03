local CustomTheme = {
    SchemeColor = Color3.fromRGB(161, 3, 248),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1", CustomTheme)

local EnteredKey = ""
local Key = "appleslices"

-- Tabs

local EntryTab = Window:NewTab("Entry")

-- Entry

local KeySection = EntryTab:NewSection("XX - ENTER KEY - XX")

KeySection:NewTextBox("Enter Key", "Your key goes here.", function(txt)
	EnteredKey = txt
    if EnteredKey == Key then
        Library:ToggleUI()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Resources/GameSelector.lua"))()
    else
        print("The key you have entered for FujiHub is incorrect.")
    end
end)
