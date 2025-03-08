local CustomTheme = {
    SchemeColor = Color3.fromRGB(252, 48, 48),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Flee The Facility", CustomTheme)

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local VisualsTab = Window:NewTab("Visuals")
local BeastTab = Window:NewTab("Beast")
local SurvivorTab = Window:NewTab("Survivor")

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local PlayerSection = PlayerTab:NewSection("LocalPlayer")
local VisualsSection = VisualsTab:NewSection("Visuals")
local BeastSection = BeastTab:NewSection("Beast")
local SurvivorSection = SurvivorTab:NewSection("Survivor")

-- Survivor Tab

SurvivorSection:NewButton("No Errors", "Doesn't give you errors at all.", function()
    spawn(function()
        while wait() do
            game.ReplicatedStorage.RemoteEvent:FireServer("SetPlayerMinigameResult",true)
        end
    end)
end)

-- Beast tab

BeastSection:NewButton("Infinite Stamina", "Gives you infinite stamina.", function()
    if game.Players.LocalPlayer.TempPlayerStatsModule.IsBeast.Value == true then
        game.UserInputService.InputBegan:Connect(function(key)
            if key.KeyCode == Enum.KeyCode.Q then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 30
            end
        end)
    end
end)

BeastSection:NewButton("No Slow", "Doesn't make you slow down.", function()
    if game.Players.LocalPlayer.TempPlayerStatsModule.IsBeast.Value == true then
        pcall(function()
            game.Players.LocalPlayer.Character.PowersLocalScript:Destroy()
        end)
    end
end)

-- Visuals tab

local function toggleComputerESP(state)
    getgenv().StopComputerESP = not state -- Track ESP state

    if state then
        -- Enable ESP for ComputerTables
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "ComputerTable" then
                pcall(function()
                    -- Create Highlight if it doesn't exist
                    if not v:FindFirstChild("Highlight") then
                        local ESP = Instance.new("Highlight")
                        ESP.Parent = v
                        ESP.FillColor = Color3.new(0, 0, 1) -- Blue color for computers
                        ESP.OutlineColor = Color3.new(1, 1, 1) -- White outline
                        ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                end)
            end
        end
    else
        -- Disable ESP by removing highlights
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "ComputerTable" then
                pcall(function()
                    local highlight = v:FindFirstChild("Highlight")
                    if highlight then highlight:Destroy() end
                end)
            end
        end
    end
end

VisualsSection:NewToggle("Computer ESP", "Highlights all computer tables.", function(state)
    toggleComputerESP(state)
end)

local function toggleFreezePodESP(state)
    if state then
        -- Enable ESP for FreezePods
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "FreezePod" then
                pcall(function()
                    -- Create Highlight if it doesn't exist
                    if not v:FindFirstChild("Highlight") then
                        local ESP = Instance.new("Highlight")
                        ESP.Parent = v
                        ESP.FillColor = Color3.fromRGB(0, 255, 255) -- Cyan color for frozen pods
                        ESP.OutlineColor = Color3.fromRGB(255, 255, 255) -- White outline
                        ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                end)
            end
        end
    else
        -- Disable ESP by removing highlights
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "FreezePod" then
                pcall(function()
                    local highlight = v:FindFirstChild("Highlight")
                    if highlight then highlight:Destroy() end
                end)
            end
        end
    end
end

VisualsSection:NewToggle("FreezePod ESP", "Highlights all freeze pods.", function(state)
    toggleFreezePodESP(state)
end)



local function toggleDoorESP(state)
    getgenv().DoorESP = state
    
    if state then
        -- Enable ESP
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "SingleDoor" or v.Name == "DoubleDoor" then
                pcall(function()
                    -- Create Highlight if it doesn't exist
                    if not v:FindFirstChild("Highlight") then
                        local ESP = Instance.new("Highlight")
                        ESP.Parent = (v.Name == "SingleDoor" and v.Door) or v
                        ESP.FillColor = Color3.new(1, 0, 0) -- Default to red (closed)
                        ESP.OutlineColor = Color3.new(1, 1, 1) -- White outline
                        ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                end)

                -- Monitor door status changes
                spawn(function()
                    while getgenv().DoorESP do
                        pcall(function()
                            local highlight = (v.Name == "SingleDoor" and v.Door:FindFirstChild("Highlight")) or v:FindFirstChild("Highlight")
                            if highlight and v.DoorTrigger.ActionSign.Value then
                                highlight.FillColor = (v.DoorTrigger.ActionSign.Value == 11) and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
                            end
                        end)
                        wait(0.1) -- Prevents high CPU usage
                    end
                end)
            end
        end
    else
        -- Disable ESP
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "SingleDoor" or v.Name == "DoubleDoor" then
                pcall(function()
                    local highlight = (v.Name == "SingleDoor" and v.Door:FindFirstChild("Highlight")) or v:FindFirstChild("Highlight")
                    if highlight then highlight:Destroy() end
                end)
            end
        end
    end
end

local Players = game:GetService("Players")

VisualsSection:NewToggle("Door ESP", "Highlights doors based on their state.", function(state)
    toggleDoorESP(state)
end)

VisualsSection:NewToggle("Player ESP", "Shows every player.", function(state)
    if state then
        -- Enable ESP
        for _, player in pairs(Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- Create highlight
                local highlight = Instance.new("Highlight")
                highlight.Parent = player.Character
                highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Red color
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                -- Create BillboardGui
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.Parent = player.Character
                billboard.AlwaysOnTop = true

                -- Create text label
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextStrokeTransparency = 0
                textLabel.Text = player.Name
                textLabel.Parent = billboard
            end
        end
    else
        -- Disable ESP
        for _, player in pairs(Players:GetPlayers()) do
            if player.Character then
                if player.Character:FindFirstChild("Highlight") then
                    player.Character.Highlight:Destroy()
                end
                for _, obj in pairs(player.Character:GetChildren()) do
                    if obj:IsA("BillboardGui") then
                        obj:Destroy()
                    end
                end
            end
        end
    end
end)

-- Update ESP for new players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        wait(1) -- Give time for character to load
        if state then
            -- Create highlight
            local highlight = Instance.new("Highlight")
            highlight.Parent = character
            highlight.FillColor = Color3.fromRGB(255, 0, 0)
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

            -- Create BillboardGui
            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.Adornee = character:FindFirstChild("HumanoidRootPart")
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.Parent = character
            billboard.AlwaysOnTop = true

            -- Create text label
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.TextStrokeTransparency = 0
            textLabel.Text = player.Name
            textLabel.Parent = billboard
        end
    end)
end)


-- Player tab

PlayerSection:NewSlider("WalkSpeed", "Sets the walkspeed of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Sets the jumppower of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

-- Main tab

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
