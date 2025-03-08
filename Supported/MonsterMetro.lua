local CustomTheme = {
    SchemeColor = Color3.fromRGB(252, 48, 48),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Monster Metro", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local VisualsTab = Window:NewTab("Visuals")
local UtilitiesTab = Window:NewTab("Utilities")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local PlayerSection = PlayerTab:NewSection("Player")
local VisualsSection = VisualsTab:NewSection("Visuals")
local UtilitiesSection = UtilitiesTab:NewSection("Utilities")

-- Toggles

local TrainESP = false
local AutoHideEnabled = false
local TrainNotifier = false

-- Events

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local humanoid = character:FindFirstChildOfClass("Humanoid")
local tweenService = game:GetService("TweenService")

-- Stores original position of the local player
local originalCFrame = nil
local hiding = false
local platform = nil

-- Function to hide the local player
local function hidePlayer()
    if not hiding and rootPart then
        originalCFrame = rootPart.CFrame
        hiding = true
        
        humanoid.WalkSpeed = 0

        -- Create a platform above the player
        platform = Instance.new("Part")
        platform.Size = Vector3.new(10, 1, 10)
        platform.Position = originalCFrame.Position + Vector3.new(0, 100, 0)
        platform.Anchored = true
        platform.Parent = workspace
        
        -- Teleport player to platform
        rootPart.CFrame = CFrame.new(platform.Position + Vector3.new(0, 3, 0))
    end
end

-- Function to restore the local player
local function restorePlayer()
    if hiding and originalCFrame and rootPart then
        rootPart.CFrame = originalCFrame
        hiding = false
        humanoid.WalkSpeed = 16

        -- Remove platform
        if platform then
            platform:Destroy()
            platform = nil
        end
    end
end
-- Events
workspace.trainFolder.ChildAdded:Connect(function(child)
    if TrainESP then
        if child then
            local highlight = Instance.new("Highlight")
            highlight.Parent = child
            highlight.FillTransparency = 0.5
            highlight.FillColor = Color3.new(1, 0, 0)
            highlight.OutlineColor = Color3.new(0.5, 0, 0)
        end
    end
    
    if TrainNotifier then
        if child and character:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui")
            billboard.Parent = character.Head
            billboard.Size = UDim2.new(4, 0, 1, 0)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 0
            textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
            textLabel.Text = "Train Incoming!"
            textLabel.TextColor3 = Color3.new(1, 0, 0)
            textLabel.TextScaled = true
        end
    end
    
    if AutoHideEnabled then
        hidePlayer()
    end
end)

workspace.trainFolder.ChildRemoved:Connect(function(child)
    if TrainNotifier then
        if child then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    if player.Character:FindFirstChild("Head"):FindFirstChild("BillboardGui") then
                        player.Character:FindFirstChild("Head"):FindFirstChild("BillboardGui"):Destroy()
                    end
                end
            end
        end
    end

    if AutoHideEnabled then
        restorePlayer()
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

PlayerSection:NewSlider("Speed", "", 500, 0, function(value)
    kaijuSpeed = value
    if speedEnabled then
        setWalkSpeed()
    end
end)

PlayerSection:NewToggle("Enable Speed", "Starts/stops your speed that you set.", function(state)
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

PlayerSection:NewSlider("JumpPower", "", 500, 0, function(value)
    jumpPower = value
    setJumpPower()
end)

PlayerSection:NewToggle("Enable JumpPower", "Starts/stops your jumppower that you set.", function(state)
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

-- Utilities Tab

UtilitiesSection:NewToggle("Auto Hide", "Hides your player every time a train spawns.", function(state)
    AutoHideEnabled = state
end)

UtilitiesSection:NewButton("Fullbright", "Activates fullbright.", function()
    pcall(function()
        local lighting = game:GetService("Lighting");
        lighting.Ambient = Color3.fromRGB(255, 255, 255);
        lighting.Brightness = 1;
        lighting.FogEnd = 1e10;
        for i, v in pairs(lighting:GetDescendants()) do
            if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") then
                v.Enabled = false;
            end;
        end;
        lighting.Changed:Connect(function()
            lighting.Ambient = Color3.fromRGB(255, 255, 255);
            lighting.Brightness = 1;
            lighting.FogEnd = 1e10;
        end);
    end)
end)

UtilitiesSection:NewButton("Infinite Yield", "Activates infinite yield.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

-- Visuals Tab

VisualsSection:NewToggle("Train ESP", "Shows you every train when it spawns.", function(state)
    TrainESP = state
end)

VisualsSection:NewToggle("Train Notifier", "Shows you every train when it spawns.", function(state)
    TrainNotifier = state
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
