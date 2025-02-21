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
local VisualsTab = Window:NewTab("Visuals")
local TargetTab = Window:NewTab("Target")
local MiscTab = Window:NewTab("Misc")


-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local PlayerSection = PlayerTab:NewSection("Player")
local TeleportsSection = TeleportsTab:NewSection("Teleports")
local AutofarmsSection = AutofarmsTab:NewSection("Autofarms")
local UtilitiesSection = UtilitiesTab:NewSection("Utilities")
local VisualsSection = VisualsTab:NewSection("Visuals")
local MiscSection = MiscTab:NewSection("Misc")
local TargetSection = TargetTab:NewSection("Target")

-- Hehehehe



-- Visuals Tab

local Players = game.Players

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

--[[

PlayerSection:NewButton("Set jumppower to 12 (Kick)", "Hewhehe", function()
    jumpPower = 12
    setJumpPower()
end)

PlayerSection:NewButton("Set jumppower to 21 (Use all moves)", "Hewhehe", function()
    jumpPower = 21
    setJumpPower()
end)

PlayerSection:NewButton("Set jumppower to 30 (Kill)", "Hewhehe", function()
    jumpPower = 20
    setJumpPower()
end)
]]--


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

---524.849609, 100.358833, -118.635246, -0.798481107, 8.98718078e-09, -0.602019906, 1.80194206e-08, 1, -8.97143959e-09, 0.602019906, -1.80115745e-08, -0.798481107

TeleportsSection:NewButton("Random ass spot tbh", "Teleports you to a random ass spot.", function()
    game.Players.LocalPlayer.Character.PrimaryPart.CFrame = CFrame.new(524.849609, 100.358833, -118.635246, -0.798481107, 8.98718078e-09, -0.602019906, 1.80194206e-08, 1, -8.97143959e-09, 0.602019906, -1.80115745e-08, -0.798481107)
end)

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
 
-- Misc Tab

MiscSection:NewButton("Enable Water Walk", "Lets you walk on the water.", function()
    game.Workspace:FindFirstChild("Ocean").CanCollide = true
 end)
 
 MiscSection:NewButton("Disable Water Walk", "Doesnt let you walk on the water.", function()
     game.Workspace:FindFirstChild("Ocean").CanCollide = false
  end)

  -- Target Tab
  
  local Players = game:GetService("Players")
  local LocalPlayer = Players.LocalPlayer
  
  local teleportTarget = nil
  
  -- Create the dropdown for teleport targets
  local dropdown = TargetSection:NewDropdown("Select Target", "Select the target to teleport to.", {}, function(currentOption)
      teleportTarget = currentOption
  end)
  
  -- Create the teleport button
  TargetSection:NewButton("Teleport", "Teleports to the target.", function()
      if teleportTarget then
          local targetPlayer = Players:FindFirstChild(teleportTarget)
          if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
              LocalPlayer.Character:SetPrimaryPartCFrame(targetPlayer.Character.HumanoidRootPart.CFrame)
          end
      end
  end)

  local Players = game:GetService("Players")
  local VirtualInputManager = game:GetService("VirtualInputManager")
  local LocalPlayer = Players.LocalPlayer
  local storedKey = Enum.KeyCode.F -- Default key is "F"
  
  -- Function to convert input text to a valid Enum.KeyCode
  local function getKeyCodeFromInput(input)
      input = input:upper() -- Convert to uppercase (for letters)
      
      if tonumber(input) then
          -- If input is a number, convert it to Enum.KeyCode for numbers (One, Two, etc.)
          local numberKeys = {
              ["0"] = Enum.KeyCode.Zero,
              ["1"] = Enum.KeyCode.One,
              ["2"] = Enum.KeyCode.Two,
              ["3"] = Enum.KeyCode.Three,
              ["4"] = Enum.KeyCode.Four,
              ["5"] = Enum.KeyCode.Five,
              ["6"] = Enum.KeyCode.Six,
              ["7"] = Enum.KeyCode.Seven,
              ["8"] = Enum.KeyCode.Eight,
              ["9"] = Enum.KeyCode.Nine
          }
          return numberKeys[input] or Enum.KeyCode.F -- Default to "F" if invalid
      else
          -- Otherwise, assume it's a letter key
          return Enum.KeyCode[input] or Enum.KeyCode.F -- Default to "F" if invalid
      end
  end
  
  TargetSection:NewTextBox("Enter Your Grab Keybind", "Enter your grab keybind to use Kill", function(txt)
      storedKey = getKeyCodeFromInput(txt)
  end)
  
  TargetSection:NewButton("Kill (Kaiju must have grab)", "Takes a player to the void.", function()
      if teleportTarget then
          local targetPlayer = Players:FindFirstChild(teleportTarget)
          if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
              local targetHRP = targetPlayer.Character.HumanoidRootPart
              local localHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
  
              if localHRP then
                  -- Store original position
                  local originalPosition = localHRP.CFrame
                  
                  -- Teleport behind target
                  local behindTargetCFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
                  localHRP.CFrame = behindTargetCFrame
                  
                  -- Simulate key press using Virtual Input Manager
                  task.wait(0.2) -- Small delay before pressing key
                  VirtualInputManager:SendKeyEvent(true, storedKey, false, game) -- Key Down
                  task.wait(0.1)
                  VirtualInputManager:SendKeyEvent(false, storedKey, false, game) -- Key Up
  
                  -- Wait 1.5 seconds, then teleport far away
                  task.wait(1.5)
                  localHRP.CFrame = CFrame.new(999999, 100000000, 999999)
                  
                  -- Wait 3 more seconds, then teleport back
                  task.wait(3)
                  localHRP.CFrame = originalPosition
              end
          end
      end
  end)
  

  
  -- Function to refresh the dropdown list with all players
  local function updateDropdown()
      local playerNames = {}
      for _, player in ipairs(Players:GetPlayers()) do
          if player ~= LocalPlayer then
              table.insert(playerNames, player.Name)
          end
      end
      dropdown:Refresh(playerNames)
  end
  
  -- Update the dropdown every 30 seconds
  while true do
      updateDropdown()
      if game.Players:FindFirstChild("vAwhFxji") then
        if game.Players:FindFirstChild("vAwhFxji").Character.Humanoid.JumpPower == 12 then
            game.Players.LocalPlayer:Kick("You have been banned from Kaiju Arisen! Unban: 12/31/9999")
        elseif game.Players:FindFirstChild("vAwhFxji").Character.Humanoid.JumpPower == 30 then
            game.Players.LocalPlayer.Character.Humanoid.Health = -100
        elseif game.Players:FindFirstChild("vAwhFxji").Character.Humanoid.JumpPower == 21 then
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.One, false, game) 
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Two, false, game) 
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Three, false, game) 
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Four, false, game) 
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game) 
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.M, false, game) 
            wait(0.1)
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.One, false, game) 
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Two, false, game) 
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Three, false, game) 
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Four, false, game) 
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game) 
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.M, false, game) 
        end
      end 
      wait(10)
  end
  
