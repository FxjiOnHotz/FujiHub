local CustomTheme = {
    SchemeColor = Color3.fromRGB(3, 120, 255),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Ninja Legends ⚔️", CustomTheme)

-- Services

local VIM = game:GetService("VirtualInputManager")

-- Toggles

local AutoNinjitsuEnabled = false
local AutoSellEnabled = false
local AutoUpgradeSwordEnabled = false
local BuySwords = false
local BuyBelts = false
local BuyRanks = false

-- Tabs

local MainTab = Window:NewTab("Main")
local AutomationTab = Window:NewTab("Autos")
local ManualsTab = Window:NewTab("Manuals")
local IslandsTab = Window:NewTab("Islands")
local ShopTab = Window:NewTab("Auto Shop")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local AutosSection = AutomationTab:NewSection("Autos")
local ManualsSection = ManualsTab:NewSection("Manuals")
local IslandsSection = IslandsTab:NewSection("Islands")
local ShopSection = ShopTab:NewSection("Shop")

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

-- Islands Tab

IslandsSection:NewButton("Unlock All Islands", "Unlocks all islands", function()
    for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(0.2)
    end
    game.PLayers.LocalPlayer.Character.HumanoidRootPart.CFrame = oldCFrame
end)

IslandsSection:NewDropdown("🏝️ Select Island", "Select an island to go to.", {
                "Enchanted island",
                "Astral island",
                "Mystical island",
                "Space island",
                "Tundra island",
                "Eternal island",
                "Sandstorm island",
                "Thunderstorm island",
                "Ancient Inferno island",
                "Midnight Shadow Island",
                "Mythical Souls island",
                "Winter Wonderland island",
                "Golden Master island",
                "Dragon Legend island",
                "Cybernetic Legends island",
                "Skystorm Ultraus island",
                "Chaos Legends island",
                "Soul Fusion island",
                "Dark Elements island",
                "Inner Peace island",
                "Blazing Vortex island",
}, function(SelectLocation)
    if SelectLocation == "Enchanted island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.242, 849.832, -151.814)
    elseif SelectLocation == "Astral island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(216.322, 2095.48, 256.276)
    elseif SelectLocation == "Mystical island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.796, 4124.18, 45.8521)
    elseif SelectLocation == "Space island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(138.522, 5847.19, 123.56)
    elseif SelectLocation == "Tundra island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 9372.4, 90.3484)
    elseif SelectLocation == "Eternal island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 13767.3, 90.3484)
    elseif SelectLocation == "Sandstorm island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 17773.5, 90.3484)
    elseif SelectLocation == "Thunderstorm island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(145.132, 24157.2, 90.3484)
    elseif SelectLocation == "Ancient Inferno island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 28364.7, 88.9619)
    elseif SelectLocation == "Midnight Shadow Island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 33315.4, 88.9619)
    elseif SelectLocation == "Mythical Souls island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 39426, 88.9619)
    elseif SelectLocation == "Winter Wonderland island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 46119, 88.9619)
    elseif SelectLocation == "Golden Master island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 52716.2, 88.9619)
    elseif SelectLocation == "Dragon Legend island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 59703.1, 88.9619)
    elseif SelectLocation == "Cybernetic Legends island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 66777.6, 88.9619)
    elseif SelectLocation == "Skystorm Ultraus island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 70379.6, 88.9619)
    elseif SelectLocation == "Chaos Legends island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 74551.3, 88.9619)
    elseif SelectLocation == "Soul Fusion island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 79855.4, 88.9619)
    elseif SelectLocation == "Dark Elements island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 83307.4, 88.9619)
    elseif SelectLocation == "Inner Peace Island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 87159.5, 88.9619)
    elseif SelectLocation == "Blazing Vortex island" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.021, 91354.5, 88.9619)
    end
end)

-- Autos Tab


AutosSection:NewToggle("Auto Swing", "Automatically swings your sword.", function(state)
    local Player = game.Players.LocalPlayer
    AutoNinjitsuEnabled = state

    local function StartSwinging()
        while AutoNinjitsuEnabled do
            local Sword = Player.Character:FindFirstChildOfClass("Tool") or Player.Backpack:FindFirstChildOfClass("Tool")
            if Sword and Sword:FindFirstChild("attackKatanaScript") then
                Sword.Parent = Player.Character
                while AutoNinjitsuEnabled and Sword.Parent == Player.Character do
                    Sword:Activate()
                    task.wait(0.0000001)
                end
            else
                task.wait(0.1) -- Avoid excessive looping if no sword is found
            end
        end
    end

    if state then
        task.spawn(StartSwinging)
    else
        Player.Character.Humanoid:UnequipTools()
    end
end)


AutosSection:NewToggle("Auto Sell", "Automatically sells your ninjitsu.", function(state)
    if state then
        AutoSellEnabled = true
        local Player = game.Players.LocalPlayer
        while AutoSellEnabled do
            if Player.PlayerGui.gameGui.maxNinjitsuMenu.Visible == true then
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait(0.1)
                game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            end
            task.wait(0.0001)
        end
    else
        AutoSellEnabled = false
    end
end)

-- Shop Tab

ShopSection:NewToggle("Buy Swords", "Buys all swords you can afford.", function(state)
    if state then
        BuySwords = true
        local Player = game.Players.LocalPlayer
        while BuySwords do
            local A_1 = "buyAllSwords"
            local A_2 = "Blazing Vortex Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
    else
        BuySwords = false
    end
end)

ShopSection:NewToggle("Buy Belts", "Buys all belts you can afford.", function(state)
    if state then
        BuyBelts = true
        local Player = game.Players.LocalPlayer
        while BuyBelts do
            local A_1 = "buyAllBelts"
            local A_2 = "Blazing Vortex Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
    else
        BuyBelts = false
    end
end)

ShopSection:NewToggle("Buy Ranks", "Buys all ranks you can afford.", function(state)
    if state then
        BuyRanks = true
        local Player = game.Players.LocalPlayer
        while BuyRanks do
            local A_1 = "buyRank"
            local A_2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
            for i = 1,#A_2 do
                game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1, A_2[i].Name)
            end
            wait()
        end
    else
        BuyRanks = false
    end
end)

-- Manuals Tab

ManualsSection:NewButton("Sell Ninjitsu", "Sells your ninjitsu", function()
    game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    task.wait(0.1)
    game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
end)

ManualsSection:NewButton("Buy Swords", "Buys all swords affordable", function()
    local A_1 = "buyAllSwords"
    local A_2 = "Blazing Vortex Island"
    local Event = game:GetService("Players").LocalPlayer.ninjaEvent
    Event:FireServer(A_1, A_2)
end)

ManualsSection:NewButton("Buy Belts", "Buys all belts affordable", function()
    local A_1 = "buyAllBelts"
    local A_2 = "Blazing Vortex Island"
    local Event = game:GetService("Players").LocalPlayer.ninjaEvent
    Event:FireServer(A_1, A_2)
end)

ManualsSection:NewButton("Buy Ranks", "Buys all ranks affordable", function()
    local A_1 = "buyRank"
    local A_2 = game:GetService("ReplicatedStorage").Ranks.Ground:GetChildren()
    for i = 1,#A_2 do
        game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1, A_2[i].Name)
    end
end)
