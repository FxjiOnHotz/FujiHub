local CustomTheme = {
    SchemeColor = Color3.fromRGB(5, 233, 36),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Dandy's World 🌈", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local VisualsTab = Window:NewTab("Visuals")
local UtilitiesTab = Window:NewTab("Utilities")

-- Main

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")

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


-- Player

local PlayerSection = PlayerTab:NewSection("LocalPlayer")

PlayerSection:NewSlider("WalkSpeed", "Sets the walkspeed of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewButton("Fullbright", "Makes everything bright", function()
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
            spawn(function()
                local character = game:GetService("Players").LocalPlayer.Character;
                while wait() do
                    repeat
                        wait()
                    until character ~= nil;
                    if not character.HumanoidRootPart:FindFirstChildWhichIsA("PointLight") then
                        local headlight = Instance.new("PointLight", character.HumanoidRootPart);
                        headlight.Brightness = 1;
                        headlight.Range = 60;
                    end;
                end;
            end);
        end)
    end)

-- Visuals

local Players = game.Players
local VisualsSection = VisualsTab:NewSection("Visuals")

VisualsSection:NewToggle("Player ESP", "Shows every player.", function(state)
    if state then
        -- Enable ESP
        for _, player in pairs(Players:GetChildren()) do
            if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                -- Create highlight
                local highlight = Instance.new("Highlight")
                highlight.Parent = player.Character
                highlight.FillColor = Color3.fromRGB(0, 255, 255) -- Red color
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

VisualsSection:NewToggle("Monster ESP", "Shows every monster.", function(state)
    if state then
        -- Enable ESP
        for _, monster in pairs(workspace.CurrentRoom:GetDescendants()) do
            if monster:IsA("Model") and monster.Parent.Name == "Monsters" then
                -- Create highlight
                local highlight = Instance.new("Highlight")
                highlight.Parent = monster
                highlight.FillColor = Color3.fromRGB(255, 0, 0) -- Red color
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop

                -- Create BillboardGui
                local billboard = Instance.new("BillboardGui")
                billboard.Size = UDim2.new(0, 100, 0, 50)
                billboard.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                billboard.StudsOffset = Vector3.new(0, 2, 0)
                billboard.Parent = monster
                billboard.AlwaysOnTop = true

                -- Create text label
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextStrokeTransparency = 0
                textLabel.Text = monster.Name
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

generatorESP = false
VisualsSection:NewToggle("Generator ESP", "View all generators.", function(state)

    generatorESP = state

    while generatorESP do
        task.wait(1)
        
        -- Find GunDrop anywhere in the workspace
        for _, obj in ipairs(workspace.CurrentRoom:GetDescendants()) do
            if obj:IsA("Model") and obj.Parent.Name == "Generators" and obj.Name == "Generator" then
                -- Create ESP effect
                local highlight = obj:FindFirstChild("Highlight")
                if not highlight then
                    highlight = Instance.new("Highlight")
                    highlight.Parent = obj
                    highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Green
                    highlight.FillTransparency = 0.5
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.OutlineTransparency = 0
                end
            end
        end
    end
end)


-- Utilities

local UtilitiesSection = UtilitiesTab:NewSection("Utilities")

UtilitiesSection:NewButton("Auto Skill Check", "Automatically does the skill check.", function()
    -- Handle skill check

	local VirtualInputManager = game:GetService("VirtualInputManager")
	local player = game:GetService("Players").LocalPlayer

		local player = game.Players.LocalPlayer
		local VirtualInputManager = game:GetService('VirtualInputManager')

		-- Define the tolerance range
		local TOLERANCE = 5 -- Adjust this value as needed

		-- Function to handle skill check alignment
		local function handleSkillCheck()
			local screenGui = player.PlayerGui:FindFirstChild("ScreenGui")
			if not screenGui then
				return
			end

			local menu = screenGui:FindFirstChild("Menu")
			if not menu then
				return
			end

			local skillCheckFrame = menu:FindFirstChild("SkillCheckFrame")
			if not skillCheckFrame then
				return
			end

			-- Function to perform the check when skill check frame is visible
			local function onVisibilityChanged()
				if skillCheckFrame.Visible then
					local marker = skillCheckFrame:FindFirstChild("Marker")
					local goldArea = skillCheckFrame:FindFirstChild("GoldArea")

					if marker and goldArea then
						local markerPosition = marker.AbsolutePosition
						local goldAreaPosition = goldArea.AbsolutePosition
						local goldAreaSize = goldArea.AbsoluteSize

						-- Check if the Marker is within the bounds of the GoldArea
						if markerPosition.X >= goldAreaPosition.X and markerPosition.X <= (goldAreaPosition.X + goldAreaSize.X) + TOLERANCE then
							-- Send spacebar press event
							VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
						end
					end
				end
			end

			-- Connect to the VisibilityChanged event
			skillCheckFrame.Changed:Connect(function(property)
				if property == "Visible" then
					onVisibilityChanged()
				end
			end)

			-- Detect changes in Marker and GoldArea positions
			local marker = skillCheckFrame:FindFirstChild("Marker")
			local goldArea = skillCheckFrame:FindFirstChild("GoldArea")

			if marker then
				marker.Changed:Connect(function(property)
					if property == "AbsolutePosition" then
						onVisibilityChanged()
					end
				end)
			end

			if goldArea then
				goldArea.Changed:Connect(function(property)
					if property == "AbsolutePosition" or property == "AbsoluteSize" then
						onVisibilityChanged()
					end
				end)
			end
		end

		-- Start handling the skill check
		handleSkillCheck()
end)
