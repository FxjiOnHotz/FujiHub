local CustomTheme = {
    SchemeColor = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255)),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Shard Seekers", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local VisualsTab = Window:NewTab("Visuals")
local UtiltiesTab = Window:NewTab("Utilties")
local AutosTab = Window:NewTab("Autos")
local GameTab = Window:NewTab("Game")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local VisualsSection = VisualsTab:NewSection("Visuals")
local UtilitiesSection = UtiltiesTab:NewSection("Utilties")
local AutosSection = AutosTab:NewSection("Autos")
local GameSection = GameTab:NewSection("Game")

-- Autos Tab

local autoFenabled = false

AutosSection:NewToggle("Auto Forage", "", function(state)
    autoFenabled = state
    if autoFenabled then
        task.spawn(function()
            while autoFenabled do
                for i, object in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                    if object:IsA("TextLabel") or object:IsA("TextButton") then
                        if object.Text == "Forage" then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)

local autoHenabled = false

AutosSection:NewToggle("Auto Hunt", "", function(state)
    autoHenabled = state
    if autoHenabled then
        task.spawn(function()
            while autoHenabled do
                for i, object in pairs(game.Players.LocalPlayer.PlayerGui:GetDescendants()) do
                    if object:IsA("TextLabel") or object:IsA("TextButton") then
                        if object.Text == "Hunt" then
                            game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.E, false, game)
                            wait(0.1)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.E, false, game)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Game Tab

GameSection:NewButton("Rejoin", "Rejoins the game.", function()
    repeat
        wait()  
    until game:IsLoaded() 
    game:GetService("TeleportService"):Teleport(340416369) 
    
end)

-- Utilities Tab

local autoReachFalseToggle = true
local autoRenabled = false

UtilitiesSection:NewButton("Fullbright", "Makes everything bright", function()
    -- FULLBRIGHT by ricey#7090
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

UtilitiesSection:NewToggle("Auto Interact Prompt", "", function(state)
    autoRenabled = state
    if autoRenabled then
        task.spawn(function()
            while autoRenabled do
                autoReachFalseToggle = not autoReachFalseToggle
                game:GetService("VirtualInputManager"):SendKeyEvent(autoReachFalseToggle, Enum.KeyCode.E, false, game)
                task.wait(0.01)
            end
        end)
    end
end)

-- Visuals Tab

VisualsSection:NewButton("Clear all ESP", "Needs to be pressed constantly when moving to new areas", function()
    for i, item in pairs(workspace:GetDescendants()) do
        if item and item:IsA("BillboardGui") then
           item:Destroy()
        end
    end
end)

VisualsSection:NewButton("Memory Shard ESP / Update ESP", "Needs to be pressed constantly when moving to new areas", function()
    for i, item in pairs(workspace:GetDescendants()) do
        if item and item:IsA("BillboardGui") then
           item:Destroy()
        end
    end
    
    for i, item in pairs(workspace:GetDescendants()) do
        if item and item:IsA("MeshPart") and item.MeshId == "rbxassetid://12341585189" then
            -- Create BillboardGui

            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0, 250, 0, 50) -- Adjust the size
            billboard.AlwaysOnTop = true
            billboard.Adornee = item
            billboard.Parent = item

            -- Create TextLabel
            local label = Instance.new("TextLabel")
            label.BackgroundTransparency = 1
            label.Font = Enum.Font.GothamBold
            label.Size = UDim2.new(1, 0, 1, 0)
            label.TextScaled = true
            label.TextColor3 = Color3.fromRGB(156, 254, 255)
            label.Text = "Memory Shard"
            label.Parent = billboard

            item.Changed:Connect(function()
                billboard:Destroy()
            end)
        end
    end
end)

VisualsSection:NewButton("Shard ESP / Update ESP", "Needs to be pressed constantly when moving to new areas", function()
    for i, item in pairs(workspace:GetDescendants()) do
        if item and item:IsA("BillboardGui") then
           item:Destroy()
        end
    end
    
    for i, object in pairs(game.Workspace:GetDescendants()) do
        if object:IsA("MeshPart") then
            if object.Material == Enum.Material.Neon then
                 local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 250, 0, 50) -- Adjust the size
                billboard.AlwaysOnTop = true
                local adornee = object
                billboard.Adornee = object
                billboard.Parent = workspace
        
                -- Create TextLabel
                local label = Instance.new("TextLabel")
                label.BackgroundTransparency = 1
                label.Font = Enum.Font.GothamBold
                label.Size = UDim2.new(1, 0, 1, 0)
                label.TextScaled = true
                label.TextColor3 = object.Color
                label.Text = tostring(object.Color)
                label.Parent = billboard

                -- Renamed Shards

                if label.Text == "0.74902, 0.498039, 1" then
                    label.Text = "Purple Shard"
                end

                if label.Text == "0.596078, 0.682353, 0.858824" then
                    label.Text = "Blue Shard"
                end

                if label.Text == "0.972549, 0.85098, 0.427451" then
                    label.Text = "Golden Shard"
                end

                if label.Text == "1, 0.447059, 0.447059" then
                    label.Text = "Red Shard"
                end

                -- Deleted Shards

                if label.Text == "0.811765, 0.686275, 0.615686" then
                    billboard:Destroy()
                end

                if label.Text == "0.647059, 0.619608, 0.513726" then
                    billboard:Destroy()
                end

                if label.Text == "0.564706, 1, 1" then
                    billboard:Destroy()
                end

                if label.Text == "1, 1, 1" then
                    billboard:Destroy()
                end
            end
        end
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
