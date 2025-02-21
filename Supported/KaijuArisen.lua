```Lua
local Players = game:GetService("Players")
local VirtualInputManager = game:GetService("VirtualInputManager")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local playerGui = player:WaitForChild("PlayerGui") -- Ensure GUI appears

local isLoopRunning = false
local teleportDestination = CFrame.new(2621.18652, 91.9103622, 1663.09705, 0.0579176806, -1.44405083e-08, 0.998321354, 4.54910705e-08, 1, 1.18256223e-08, -0.998321354, 4.4729795e-08, 0.0579176806)

-- Function to create a GUI button
local function createGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = playerGui -- Parent it to PlayerGui so it actually appears

    local button = Instance.new("TextButton")
    button.Parent = screenGui
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0.9, -50)
    button.Text = "Start Teleport"
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 20
    button.BorderSizePixel = 2

    return button
end

-- Function to simulate a mouse click
local function simulateMouseClick()
    VirtualInputManager:SendMouseButtonEvent(400, 400, 0, true, game, 0) -- Press down
    task.wait(0.334)
    VirtualInputManager:SendMouseButtonEvent(400, 400, 0, false, game, 0) -- Release
end

-- Function to teleport, rotate, click, and move to destination
local function teleportToPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        if targetHRP then
            -- Calculate position behind the target
            local offset = targetHRP.CFrame.LookVector * -3 -- Moves 3 studs behind
            local newPosition = targetHRP.Position + offset
            
            -- Teleport behind the target
            hrp.CFrame = CFrame.new(newPosition, targetHRP.Position) -- Face the target
            
            -- Simulate mouse click after teleporting
            simulateMouseClick()
            
            -- Wait 0.95 seconds after clicking
            task.wait(0.95)

            -- Teleport to the fixed destination
            hrp.CFrame = teleportDestination
        end
    end
end

-- Function to start/stop teleport loop
local function startTeleportLoop(button)
    if isLoopRunning then
        isLoopRunning = false
        button.Text = "Start Teleport"
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        return
    end

    isLoopRunning = true
    button.Text = "Stop Teleport"
    button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

    task.spawn(function()
        while isLoopRunning do
            for _, targetPlayer in pairs(Players:GetPlayers()) do
                if not isLoopRunning then return end
                if targetPlayer ~= player then
                    teleportToPlayer(targetPlayer)
                    task.wait(5) -- Wait 5 seconds before teleporting again
                end
            end
        end
    end)
end

-- Create the GUI and set up button functionality
local button = createGUI()
button.MouseButton1Click:Connect(function()
    startTeleportLoop(button)
end)
```
