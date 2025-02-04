local CustomTheme = {
    SchemeColor = Color3.fromRGB(161, 3, 248),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | MM2 🔪", CustomTheme)

local MainTab = Window:NewTab("Main")
local UtiltiesTab = Window:NewTab("Utilities")
local VisualsTab = Window:NewTab("Visuals")


local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local UtilitiesSection = UtiltiesTab:NewSection("Utilities")
local VisualsSection = VisualsTab:NewSection("Game Info")

-- Utilities Tab

local gunTPEnabled = false

UtilitiesSection:NewToggle("Gun Teleport", "Automatically teleports you to the gun after sheriff dies.", function(state)
    if state then
        gunTPEnabled = true
        while gunTPEnabled do
            task.wait(.5)
            print("searching")
            -- Find GunDrop anywhere in the workspace
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "GunDrop" then
                    -- Create ESP effect
                    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = obj.Position
                    wait(0.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = position
                    break
                end
            end
        end
    else
        gunTPEnabled = false
    end
end)

UtilitiesSection:NewButton("Kill All (Must be spam clicking)", "Must be murderer", function()
    if game.Players.LocalPlayer.Character:FindFirstChild("Knife") then

    end
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

-- Visuals Tab

VisualsSection:NewButton("View All Roles ESP (Use after 10 second start)", "View everyone's role.", function()
    for i, player in pairs(game.Players:GetChildren()) do
    print(player.Name)
    if player:FindFirstChild("Backpack"):FindFirstChild("Knife") or player.Character:FindFirstChild("Knife") then
       print(player.Name .. " is the murder.")
       local Highlight = Instance.new("Highlight")
       Highlight.Parent = player.Character
    elseif player:FindFirstChild("Backpack"):FindFirstChild("Gun") or player.Character:FindFirstChild("Gun") then
       print(player.Name .. " is the sheriff.")
       local Highlight = Instance.new("Highlight")
       Highlight.Parent = player.Character
       Highlight.FillColor = Color3.fromRGB(0,0,255)
    else
local Highlight = Instance.new("Highlight")
       Highlight.Parent = player.Character
       Highlight.FillColor = Color3.fromRGB(0,255,0)
    end
end
end)

local gunESP = false

VisualsSection:NewToggle("Gun ESP", "View the gun when the sheriff dies.", function(state)
    if state then
        gunESP = true
        while gunESP do
            if gunESP == false then
                break
            end
            task.wait(.5)
            print("searching")
            -- Find GunDrop anywhere in the workspace
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "GunDrop" then
                    -- Create ESP effect
                    
                    local highlight = obj:FindFirstChild("Highlight")
                    if not highlight then
                        highlight = Instance.new("Highlight")
                        highlight.Parent = obj
                        highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Green
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.OutlineTransparency = 0
                    end
                end
            end
        end
    else
        gunESP = false
    end
end)



