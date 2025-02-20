local CustomTheme = {
    SchemeColor = Color3.fromRGB(241, 193, 19),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Shard Seekers ✨", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local VisualsTab = Window:NewTab("Visuals")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local VisualsSection = VisualsTab:NewSection("Visuals")

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
