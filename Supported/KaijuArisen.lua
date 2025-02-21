local CustomTheme = {
    SchemeColor = Color3.fromRGB(228, 8, 10),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Kaiju Arisen 🐊", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local TeleportsTab = Window:NewTab("Teleports")
local AutofarmsTab = Window:NewTab("Autofarms")
local UtilitiesTab = Window:NewTab("Utilities")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local PlayerSection = PlayerTab:NewSection("Player")
local TeleportsSection = TeleportsTab:NewSection("Teleports")
local AutofarmsSection = AutofarmsTab:NewSection("Autofarms")
local UtilitiesSection = UtilitiesTab:NewSection("Utilities")

-- Utilities Tab

local autoUltimate = false


UtilitiesSection:NewButton("Rejoin", "Rejoins the game.", function()
    repeat
        wait()  
    until game:IsLoaded() 
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId) 
    
end)

UtilitiesSection:NewToggle("Auto-Ultimate", "Builds up your ultimate if your kaiju has one.", function(state)
    if state then
        autoUltimate = true
        while autoUltimate do
            -- Simulate pressing "T"
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.T, false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.T, false, game)

            -- Wait 5 seconds before pressing "R"
            wait(5)

            -- Simulate pressing "R"
            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.R, false, game)
            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.R, false, game)

            -- Wait remaining 15 seconds to complete the 20-second cooldown
            wait(15)
        end
    else
        autoUltimate = false
    end
end)


-- Player Tab

local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

local speedEnabled = false
local kaijuSpeed = 16
local speedConnection
local charConnection

local function setWalkSpeed()
    if humanoid then
        humanoid.WalkSpeed = kaijuSpeed
    end
end

local function enableSpeedLoop(enable)
    if enable then
        if humanoid then
            setWalkSpeed()
            speedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(setWalkSpeed)
        end

        charConnection = player.CharacterAdded:Connect(function(newCharacter)
            character = newCharacter
            humanoid = newCharacter:WaitForChild("Humanoid")

            setWalkSpeed()
            speedConnection = humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(setWalkSpeed)
        end)
    else
        if speedConnection then
            speedConnection:Disconnect()
            speedConnection = nil
        end
        if charConnection then
            charConnection:Disconnect()
            charConnection = nil
        end
        if humanoid then
            humanoid.WalkSpeed = 16 -- Reset to default speed
        end
    end
end

PlayerSection:NewSlider("Kaiju Speed", "", 500, 0, function(value)
    kaijuSpeed = value
    if speedEnabled then
        setWalkSpeed()
    end
end)

PlayerSection:NewToggle("Enable Kaiju Speed", "Starts/stops your kaiju speed that you set.", function(state)
    speedEnabled = state
    enableSpeedLoop(state)
end)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

local jumpPower = 50 -- Default JumpPower
local infiniteJumpEnabled = false

-- Function to apply the jump power
local function setJumpPower()
    if humanoid then
        humanoid.UseJumpPower = true
        humanoid.JumpPower = jumpPower
    end
end

-- Infinite Jump Function
local function onJumpRequest()
    if infiniteJumpEnabled and humanoid then
        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end

-- Slider for setting JumpPower
PlayerSection:NewSlider("Kaiju JumpPower", "", 500, 0, function(value)
    jumpPower = value
    setJumpPower()
end)

-- Toggle for enabling/disabling infinite jump
PlayerSection:NewToggle("Enable Kaiju JumpPower", "Starts/stops your kaiju jumppower that you set.", function(state)
    infiniteJumpEnabled = state
    if state then
        setJumpPower()
        UserInputService.JumpRequest:Connect(onJumpRequest)
    else
        if humanoid then
            humanoid.JumpPower = 50 -- Reset to default
        end
    end
end)




-- Autofarms Tab

local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")

local WhitelistedPlayers = {}
local isLoopRunning = false
local teleportDestination = CFrame.new(2621.18652, 91.9103622, 1663.09705)

-- Function to simulate a mouse click
local function simulateMouseClick()
    VirtualInputManager:SendMouseButtonEvent(400, 400, 0, true, game, 0)
    task.wait(0.334)
    VirtualInputManager:SendMouseButtonEvent(400, 400, 0, false, game, 0)
end

-- Function to teleport, rotate, click, and move to destination
local function teleportToPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            local offset = targetHRP.CFrame.LookVector * -3 -- Moves 3 studs behind
            local newPosition = targetHRP.Position + offset
            
            hrp.CFrame = CFrame.new(newPosition, targetHRP.Position)
            simulateMouseClick()
            task.wait(0.95)
            hrp.CFrame = teleportDestination
        end
    end
end

-- Toggle function for autofarming
AutofarmsSection:NewToggle("Start/Stop GToken Autofarm", "", function(state)
    isLoopRunning = state
    if isLoopRunning then
        task.spawn(function()
            while isLoopRunning do
                for _, targetPlayer in pairs(Players:GetPlayers()) do
                    if not isLoopRunning then return end
                    if targetPlayer ~= player and not WhitelistedPlayers[targetPlayer.Name] then
                        teleportToPlayer(targetPlayer)
                        task.wait(5)
                    end
                end
            end
        end)
    end
end)

-- Add player to whitelist
AutofarmsSection:NewTextBox("Whitelist Player", "Adds a player to the whitelist.", function(txt)
    if txt and Players:FindFirstChild(txt) then
        WhitelistedPlayers[txt] = true
    end
end)

-- Remove player from whitelist
AutofarmsSection:NewTextBox("Unwhitelist Player", "Removes a player from the whitelist.", function(txt)
    if txt and WhitelistedPlayers[txt] then
        WhitelistedPlayers[txt] = nil
    end
end)


-- Teleports Tab

TeleportsSection:NewButton("Secret Spot", "Teleports you to the game secrets spot.", function()
    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(2621.18652, 91.9103622, 1663.09705, 0.0579176806, -1.44405083e-08, 0.998321354, 4.54910705e-08, 1, 1.18256223e-08, -0.998321354, 4.4729795e-08, 0.0579176806)
end)

TeleportsSection:NewButton("Safezone", "Teleports you to the safe spot.", function()
    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(-1594.23462, 1224.37524, -293.830353, 0.995331824, 3.4848064e-08, -0.0965120941, -2.64684861e-08, 1, 8.81043576e-08, 0.0965120941, -8.5138538e-08, 0.995331824)
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
 
