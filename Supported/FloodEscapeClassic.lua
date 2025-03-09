local CustomTheme = {
    SchemeColor = Color3.fromRGB(252, 48, 48),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Resources/KavoUILibraryBackup.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Flood Escape CLASSIC", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local VisualsTab = Window:NewTab("Visuals")
local HardTab = Window:NewTab("Hard")
local MediumTab = Window:NewTab("Medium")
local EasyTab = Window:NewTab("Easy")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local VisualsSection = VisualsTab:NewSection("Visuals")
local HardSection = HardTab:NewSection("Hard Mode")
local MediumSection = MediumTab:NewSection("Medium Mode")
local EasySection = EasyTab:NewSection("Easy Mode")

-- Toggles

local SwitchESP = false

-- Visuals Tab

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

local Players = game.Players

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


VisualsSection:NewToggle("Switch ESP", "Shows you every switch.", function(state)
   SwitchESP = state

   while SwitchESP do
    for i, Switch in pairs(workspace:FindFirstChild("Easy"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch:FindFirstChild("Highlight") then
                return
            else
                local highlight = Instance.new("Highlight")
                highlight.Parent = Switch
                highlight.FillColor = Switch.Button.Color
                highlight.FillTransparency = 0.5
                highlight.Adornee = Switch
            end
        end
    end
    for i, Switch in pairs(workspace:FindFirstChild("Hard"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch:FindFirstChild("Highlight") then
                return
            else
                local highlight = Instance.new("Highlight")
                highlight.Parent = Switch
                highlight.FillColor = Switch.Button.Color
                highlight.FillTransparency = 0.5
                highlight.Adornee = Switch
            end
        end
    end
    for i, Switch in pairs(workspace:FindFirstChild("Medium"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch:FindFirstChild("Highlight") then
                return
            else
                local highlight = Instance.new("Highlight")
                highlight.Parent = Switch
                highlight.FillColor = Switch.Button.Color
                highlight.FillTransparency = 0.5
                highlight.Adornee = Switch
            end
        end
    end

    task.wait(1)
   end 

   if not SwitchESP then
    for i, Switch in pairs(workspace:FindFirstChild("Easy"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch:FindFirstChild("Highlight") then
                Switch:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
    for i, Switch in pairs(workspace:FindFirstChild("Hard"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch:FindFirstChild("Highlight") then
                Switch:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
    for i, Switch in pairs(workspace:FindFirstChild("Medium"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch:FindFirstChild("Highlight") then
                Switch:FindFirstChild("Highlight"):Destroy()
            end
        end
    end
   end
end)

-- Easy Mode

EasySection:NewButton("Activate Blue Switches", "Activates all blue switches.", function()
    local OgPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, Switch in pairs(workspace:FindFirstChild("Easy"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch.Button.Color == Color3.fromRGB(13, 105, 172) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Switch.Button.CFrame
                task.wait(1)
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OgPosition
end)

EasySection:NewButton("Activate Escape Switch", "Activates all green switches.", function()
    local OgPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, Switch in pairs(workspace:FindFirstChild("Easy"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch.Button.Color == Color3.fromRGB(75, 151, 75) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Switch.Button.CFrame
                task.wait(1)
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OgPosition
end)

EasySection:NewButton("Go To Escape", "Automatically escapes for you.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241, 160.600006, 62, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)


-- Medium Mode

MediumSection:NewButton("Activate Blue Switches", "Activates all blue switches.", function()
    local OgPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, Switch in pairs(workspace:FindFirstChild("Medium"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch.Button.Color == Color3.fromRGB(13, 105, 172) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Switch.Button.CFrame
                task.wait(1)
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OgPosition
end)

MediumSection:NewButton("Activate Escape Switch", "Activates all green switches.", function()
    local OgPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, Switch in pairs(workspace:FindFirstChild("Medium"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch.Button.Color == Color3.fromRGB(75, 151, 75) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Switch.Button.CFrame
                task.wait(1)
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OgPosition
end)

MediumSection:NewButton("Go To Escape", "Automatically escapes for you.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241, 160.600006, 192, 0, 0, -1, 0, 1, 0, 1, 0, 0)
end)

-- Hard Mode

HardSection:NewButton("Activate Blue Switches", "Activates all blue switches.", function()
    local OgPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, Switch in pairs(workspace:FindFirstChild("Hard"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch.Button.Color == Color3.fromRGB(13, 105, 172) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Switch.Button.CFrame
                task.wait(1)
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OgPosition
end)

HardSection:NewButton("Activate Escape Switch", "Activates all green switches.", function()
    local OgPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i, Switch in pairs(workspace:FindFirstChild("Hard"):GetDescendants()) do
        if Switch:IsA("Model") and Switch.Name == "Switch" then
            if Switch.Button.Color == Color3.fromRGB(75, 151, 75) then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Switch.Button.CFrame
                task.wait(1)
            end
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OgPosition
end)

HardSection:NewButton("Go To Escape", "Automatically escapes for you.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-241, 160.600006, 322, 0, 0, -1, 0, 1, 0, 1, 0, 0)
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
