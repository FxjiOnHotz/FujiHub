-- Best game ive played in terms of freedom and looks imo

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | Ultimate Town Sandbox", UITheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local UtiltiesTab = Window:NewTab("Utilties")
local PlayerTab = Window:NewTab("Player")
local PlantsTab = Window:NewTab("Plants")
local NPCsTab = Window:NewTab("NPCs")
local VisualsTab = Window:NewTab("Visuals")
local TeleportsTab = Window:NewTab("Teleports")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local PlayerSection = PlayerTab:NewSection("Player")
local UtiltiesSection = UtiltiesTab:NewSection("Utilties")
local PlantSellSection = PlantsTab:NewSection("Selling")
local PlantFarmsSection = PlantsTab:NewSection("Plant Farms (DONT ENABLE MULTIPLE)")
local NPCsSection = NPCsTab:NewSection("NPCs")
local VisualsSection = VisualsTab:NewSection("Visuals")
local TeleportsSection = TeleportsTab:NewSection("Teleports")

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


-- Teleports Tab

TeleportsSection:NewButton("Burger Place", "Takes you to the Burger Place.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(415.499908, 12, 29.9997692, 1, -9.32586897e-09, 3.26429017e-06, 9.32582633e-09, 1, 1.31798936e-08, -3.26429017e-06, -1.31798625e-08, 1)
end)

TeleportsSection:NewButton("Pizza Place", "Takes you to the Pizza Place.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226.177414, 4.99999905, 97.9839478, 0.0594406128, -4.58584175e-08, 0.998231828, 8.22204171e-09, 1, 4.54500579e-08, -0.998231828, 5.50592416e-09, 0.0594406128)
end)

TeleportsSection:NewButton("Gas Station", "Takes you to the Gas Station.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(517.499878, 11.4999981, -173.999573, -1, 1.3493513e-08, 8.63612877e-06, 1.34932563e-08, 1, -2.97437559e-08, -8.63612877e-06, -2.97436387e-08, -1)
end)

TeleportsSection:NewButton("Gun Store", "Takes you to the Gun Store.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(454.499939, 12.4999981, 78.0000687, -1, -1.7574685e-09, 1.58110215e-05, -1.75741932e-09, 1, 3.11044968e-09, -1.58110215e-05, 3.11042192e-09, -1)
end)

TeleportsSection:NewButton("Cafe Verde", "Takes you to the Cafe.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(230.499573, 5.49999905, 13.9998722, 1.23480868e-05, 3.65107802e-08, 1, 1.54974327e-08, 1, -3.6510972e-08, -1, 1.54978839e-08, 1.23480868e-05)
end)

TeleportsSection:NewButton("Barber", "Takes you to the Barber.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(270.500458, 5.5, 14.0001011, -1.53677156e-05, 1.03610681e-07, -1, -6.21245846e-08, 1, 1.03611633e-07, 1, 6.21261762e-08, -1.53677156e-05)
end)

TeleportsSection:NewButton("Clothing Store", "Takes you to the Clothing Store.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(82.5001755, 5, 67.0002747, -1, 3.76783049e-08, -1.596625e-06, 3.76782197e-08, 1, 5.18915328e-08, 1.596625e-06, 5.18914725e-08, -1)
end)

TeleportsSection:NewButton("Beach Hut", "Takes you to the Beach Hut.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(625.274048, 4.49999905, -59.1915321, 0.0366527364, 3.83977081e-08, -0.999328077, -8.29001081e-08, 1, 3.53829641e-08, 0.999328077, 8.15475261e-08, 0.0366527364)
end)

TeleportsSection:NewButton("Jeriah's Trading Post", "Takes you to Jeriah's Trading Post.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(118.500336, 72.5999985, -441.999969, 1, 4.07561771e-08, -3.67644247e-07, -4.07561807e-08, 1, -1.03014406e-08, 3.67644247e-07, 1.03014548e-08, 1)
end)

TeleportsSection:NewButton("Isle Village", "Takes you to Isle Village.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2099, 6.99999142, 1180.00012, -1, -5.58827118e-08, -2.36724281e-06, -5.58826194e-08, 1, -3.88734129e-08, 2.36724281e-06, -3.88732815e-08, -1)
end)

-- Visuals Tab
local NPCFolder = workspace:FindFirstChild("NPCs")
local highlights = {}
local enabled = false

-- Function to find all NPC models inside subfolders
local function getAllNPCModels(folder)
    local models = {}
    for _, child in pairs(folder:GetChildren()) do
        if child:IsA("Model") and child.PrimaryPart then
            table.insert(models, child)
        elseif child:IsA("Folder") then
            for _, model in pairs(getAllNPCModels(child)) do
                table.insert(models, model)
            end
        end
    end
    return models
end

-- Function to check if an NPC is inside the "Enemies" folder
local function isEnemy(npc)
    local parent = npc.Parent
    while parent do
        if parent.Name == "Enemies" and parent.Parent == NPCFolder then
            return true
        end
        parent = parent.Parent
    end
    return false
end

-- Function to update ESP
local function updateESP()
    -- Clear old highlights
    for _, highlight in pairs(highlights) do
        highlight:Destroy()
    end
    highlights = {}

    if enabled and NPCFolder then
        local npcModels = getAllNPCModels(NPCFolder)
        for _, npc in pairs(npcModels) do
            local highlight = Instance.new("Highlight")
            highlight.Adornee = npc
            highlight.FillTransparency = 1
            highlight.OutlineColor = isEnemy(npc) and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255) -- Red for enemies, white for others
            highlight.Parent = npc
            table.insert(highlights, highlight)
        end
    end
end

-- Toggle function
VisualsSection:NewToggle("Show All NPCs", "Displays NPCs' locations using a Highlight.", function(state)
    enabled = state
    updateESP()
end)

-- Detect NPC changes inside any folder
local function monitorFolder(folder)
    folder.ChildAdded:Connect(updateESP)
    folder.ChildRemoved:Connect(updateESP)
    for _, child in pairs(folder:GetChildren()) do
        if child:IsA("Folder") then
            monitorFolder(child) -- Recursively monitor subfolders
        end
    end
end

-- Start monitoring all folders inside NPCFolder
if NPCFolder then
    monitorFolder(NPCFolder)
end

local NPCFolder = workspace:FindFirstChild("NPCs")
local enemyHighlights = {}
local neutralHighlights = {}
local enemyESPEnabled = false
local neutralESPEnabled = false

-- Function to find all NPC models inside subfolders
local function getAllNPCModels(folder)
    local models = {}
    for _, child in pairs(folder:GetChildren()) do
        if child:IsA("Model") and child.PrimaryPart then
            table.insert(models, child)
        elseif child:IsA("Folder") then
            for _, model in pairs(getAllNPCModels(child)) do
                table.insert(models, model)
            end
        end
    end
    return models
end

-- Function to check if an NPC is inside the "Enemies" folder
local function isEnemy(npc)
    local parent = npc.Parent
    while parent do
        if parent.Name == "Enemies" and parent.Parent == NPCFolder then
            return true
        end
        parent = parent.Parent
    end
    return false
end

-- Function to update ESP
local function updateESP()
    -- Clear old highlights
    for _, highlight in pairs(enemyHighlights) do
        highlight:Destroy()
    end
    for _, highlight in pairs(neutralHighlights) do
        highlight:Destroy()
    end
    enemyHighlights = {}
    neutralHighlights = {}

    if NPCFolder then
        local npcModels = getAllNPCModels(NPCFolder)
        for _, npc in pairs(npcModels) do
            if isEnemy(npc) and enemyESPEnabled then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = npc
                highlight.FillTransparency = 1
                highlight.OutlineColor = Color3.fromRGB(255, 0, 0) -- Red for enemies
                highlight.Parent = npc
                table.insert(enemyHighlights, highlight)
            elseif not isEnemy(npc) and neutralESPEnabled then
                local highlight = Instance.new("Highlight")
                highlight.Adornee = npc
                highlight.FillTransparency = 1
                highlight.OutlineColor = Color3.fromRGB(255, 255, 255) -- White for neutral NPCs
                highlight.Parent = npc
                table.insert(neutralHighlights, highlight)
            end
        end
    end
end

-- Enemy ESP Toggle
VisualsSection:NewToggle("Show Enemies", "Displays enemy NPCs with a red outline.", function(state)
    enemyESPEnabled = state
    updateESP()
end)

-- Neutral ESP Toggle
VisualsSection:NewToggle("Show Neutrals", "Displays neutral NPCs with a white outline.", function(state)
    neutralESPEnabled = state
    updateESP()
end)

-- Detect NPC changes inside any folder
local function monitorFolder(folder)
    folder.ChildAdded:Connect(updateESP)
    folder.ChildRemoved:Connect(updateESP)
    for _, child in pairs(folder:GetChildren()) do
        if child:IsA("Folder") then
            monitorFolder(child) -- Recursively monitor subfolders
        end
    end
end

-- Start monitoring all folders inside NPCFolder
if NPCFolder then
    monitorFolder(NPCFolder)
end


-- NPCs Tab

local Vim = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local autoInsultActive = false
local autoInsultThread

local function teleportAndAct(npc, key)
    if npc and npc:FindFirstChild("HumanoidRootPart") then
        humanoidRootPart.CFrame = npc.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0) -- Teleport above NPC
        
        task.wait(0.5)
        Vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.1)
        Vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        
        task.wait(1)
        Vim:SendKeyEvent(true, key, false, game)
        task.wait(0.1)
        Vim:SendKeyEvent(false, key, false, game)
        
        task.wait(1)
        Vim:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        task.wait(0.1)
        Vim:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        
        task.wait(1)
    end
end

local function startAutoAction(actionKey)
    autoInsultThread = task.spawn(function()
        while autoInsultActive do
            local NPCsFolder = workspace:FindFirstChild("NPCs")
            if NPCsFolder then
                for _, category in ipairs({"StaticNPCs", "SittingNPCs", "SidewalkNPCs"}) do
                    local npcs = NPCsFolder:FindFirstChild(category)
                    if npcs then
                        for _, npc in ipairs(npcs:GetChildren()) do
                            if not autoInsultActive then return end
                            teleportAndAct(npc, actionKey)
                        end
                    end
                end
            end
            task.wait(1) -- Small delay before restarting
        end
    end)
end

NPCsSection:NewToggle("Auto-Insult", "Automatically insults NPCs", function(state)
    autoInsultActive = state
    if state then
        startAutoAction(Enum.KeyCode.F)
    else
        if autoInsultThread then
            task.cancel(autoInsultThread)
            autoInsultThread = nil
        end
    end
end)

NPCsSection:NewToggle("Auto-Greet", "Automatically greets NPCs", function(state)
    autoInsultActive = state
    if state then
        startAutoAction(Enum.KeyCode.R)
    else
        if autoInsultThread then
            task.cancel(autoInsultThread)
            autoInsultThread = nil
        end
    end
end)

local Players = game:GetService("Players")

local function createBillboardGui(npc, amount)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Adornee = npc
    billboardGui.Name = "MoneyDisplay"
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "$" .. tostring(amount)
    textLabel.TextColor3 = Color3.fromRGB(88, 220, 93)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextScaled = true
    textLabel.Parent = billboardGui
    textLabel.TextStrokeTransparency = 0
    
    billboardGui.Parent = npc
end

local function displayMoney()
    local NPCsFolder = workspace:FindFirstChild("NPCs")
    if NPCsFolder then
        for _, npc in ipairs(NPCsFolder:GetDescendants()) do
            if npc:IsA("Model") and npc:GetAttribute("HeldMoney") and npc.PrimaryPart then
                createBillboardGui(npc.PrimaryPart, npc:GetAttribute("HeldMoney"))
            end
        end
    end
end

local function removeMoneyDisplay()
    for _, billboard in ipairs(workspace:GetDescendants()) do
        if billboard:IsA("BillboardGui") and billboard.Name == "MoneyDisplay" then
            billboard:Destroy()
        end
    end
end

local moneyDisplayActive = false
local function toggleMoneyDisplay(state)
    moneyDisplayActive = state
    if state then
        displayMoney()
    else
        removeMoneyDisplay()
    end
end

NPCsSection:NewToggle("Show Carried Money", "Displays NPCs' HeldMoney attribute as a floating UI", function(state)
    toggleMoneyDisplay(state)
end)

-- Utilities Tab

UtiltiesSection:NewButton("Rejoin", "Rejoins the game.", function()
    repeat
        wait()  
    until game:IsLoaded() 
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId) 
end)

UtiltiesSection:NewButton("Redeem All Codes", "1 code every 5 seconds cuz theres weird cooldown", function()
    

game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("BOUNTYHUNTER")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("TOMMY")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("10MIL")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("CROWN")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("QUESTING")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("25KMEMBERS")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("3XCLUSIV3")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("7KAY")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("cavedin")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("code")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("FIFTYTHOUSANDMEMBERS")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("giveme5dollars")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("HAPPYTOBEHERE")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("IHEARTINFINIDEV")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("ilovemoney")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("ISLANDVILLAGE")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("jacobisthebest")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("JOBATTIRE")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("L4V4K1N6")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("MRBEAST")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("multiplayer")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("sillybilly")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("SORRY4NOUPDATES")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("SUMMERTIME")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("TREASUREFINDER")
task.wait(5)
game:GetService("ReplicatedStorage").Events.RedeemCode:FireServer("UTSCODE1")

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

-- Farms Tab

PlantSellSection:NewButton("Sell Flowers Only", "Sells only flowers.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2080.37085, 6.49999237, 1158.66821, -0.168418393, 6.85039367e-08, 0.985715628, 4.89639973e-08, 1, -6.113072e-08, -0.985715628, 3.79690412e-08, -0.168418393)
    wait(1.5)
    workspace.ShopItems.SellPlantsFlowers2x.ProximityPrompt:InputHoldBegin()
    wait(workspace.ShopItems.SellPlantsFlowers2x.ProximityPrompt.HoldDuration)
    workspace.ShopItems.SellPlantsFlowers2x.ProximityPrompt:InputHoldEnd()
end)

PlantSellSection:NewButton("Sell All Plants", "Sells all your plants.", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2080.60986, 6.49999332, 1164.17139, -0.189221174, -3.34001804e-08, 0.981934488, 9.18792509e-09, 1, 3.57852059e-08, -0.981934488, 1.57932583e-08, -0.189221174)
    wait(1.5)
    workspace.ShopItems.SellPlants2x.ProximityPrompt:InputHoldBegin()
    wait(workspace.ShopItems.SellPlants2x.ProximityPrompt.HoldDuration)
    workspace.ShopItems.SellPlants2x.ProximityPrompt:InputHoldEnd()
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Plants = workspace.Foliage.Plants
local farming = false -- Control variable

PlantFarmsSection:NewToggle("Goldenberry Farm", "Farms goldenberries.", function(state)
    farming = state -- Update control variable

    if farming then
        task.spawn(function() -- Run farming in a separate thread
            while farming do
                local hasHarvested = false -- Track if we farmed at least one plant

                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then break end -- Exit if toggled off

                    if plant:IsA("Model") and plant.Name == "GoldenberryBush" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox safely
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2) -- Shorter wait to improve efficiency

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin()
                                task.wait(3) -- Hold duration
                                prompt:InputHoldEnd()

                                hasHarvested = true
                                task.wait(1) -- Wait before moving to the next bush
                            end
                        end
                    end
                end

                if not hasHarvested then
                    -- If no plants were harvested, prevent infinite loops
                    task.wait(2)
                end
            end
        end)
    end
end)

PlantFarmsSection:NewToggle("Elderberry Farm", "Farms elderberries.", function(state)
    farming = state -- Update control variable

    if farming then
        task.spawn(function() -- Run farming in a separate thread
            while farming do
                local hasHarvested = false -- Track if we farmed at least one plant

                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then break end -- Exit if toggled off

                    if plant:IsA("Model") and plant.Name == "ElderberryBush" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox safely
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2) -- Shorter wait to improve efficiency

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin()
                                task.wait(2) -- Hold duration
                                prompt:InputHoldEnd()

                                hasHarvested = true
                                task.wait(1) -- Wait before moving to the next bush
                            end
                        end
                    end
                end

                if not hasHarvested then
                    -- If no plants were harvested, prevent infinite loops
                    task.wait(2)
                end
            end
        end)
    end
end)

PlantFarmsSection:NewToggle("Blackberry Farm", "Farms blackberries.", function(state)
    farming = state -- Update control variable

    if farming then
        task.spawn(function() -- Run farming in a separate thread
            while farming do
                local hasHarvested = false -- Track if we farmed at least one plant

                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then break end -- Exit if toggled off

                    if plant:IsA("Model") and plant.Name == "BlackberryBush" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox safely
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2) -- Shorter wait to improve efficiency

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin()
                                task.wait(3) -- Hold duration
                                prompt:InputHoldEnd()

                                hasHarvested = true
                                task.wait(1) -- Wait before moving to the next bush
                            end
                        end
                    end
                end

                if not hasHarvested then
                    -- If no plants were harvested, prevent infinite loops
                    task.wait(2)
                end
            end
        end)
    end
end)

PlantFarmsSection:NewToggle("Strawberry Farm", "Farms strawberries.", function(state)
    farming = state -- Update control variable

    if farming then
        task.spawn(function() -- Run farming in a separate thread
            while farming do
                local hasHarvested = false -- Track if we farmed at least one plant

                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then break end -- Exit if toggled off

                    if plant:IsA("Model") and plant.Name == "StrawberryBush" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox safely
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2) -- Shorter wait to improve efficiency

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin()
                                task.wait(3) -- Hold duration
                                prompt:InputHoldEnd()

                                hasHarvested = true
                                task.wait(1) -- Wait before moving to the next bush
                            end
                        end
                    end
                end

                if not hasHarvested then
                    -- If no plants were harvested, prevent infinite loops
                    task.wait(2)
                end
            end
        end)
    end
end)

PlantFarmsSection:NewToggle("Mulberry Farm", "Farms mulberries.", function(state)
    farming = state -- Update control variable

    if farming then
        task.spawn(function() -- Run farming in a separate thread
            while farming do
                local hasHarvested = false -- Track if we farmed at least one plant

                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then break end -- Exit if toggled off

                    if plant:IsA("Model") and plant.Name == "MulberryBush" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox safely
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2) -- Shorter wait to improve efficiency

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin()
                                task.wait(3) -- Hold duration
                                prompt:InputHoldEnd()

                                hasHarvested = true
                                task.wait(1) -- Wait before moving to the next bush
                            end
                        end
                    end
                end

                if not hasHarvested then
                    -- If no plants were harvested, prevent infinite loops
                    task.wait(2)
                end
            end
        end)
    end
end)

PlantFarmsSection:NewToggle("Blueberry Farm", "Farms blueberries.", function(state)
    farming = state -- Update control variable

    if farming then
        task.spawn(function() -- Run farming in a separate thread
            while farming do
                local hasHarvested = false -- Track if we farmed at least one plant

                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then break end -- Exit if toggled off

                    if plant:IsA("Model") and plant.Name == "BlueberryBush" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox safely
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                task.wait(0.2) -- Shorter wait to improve efficiency

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin()
                                task.wait(3) -- Hold duration
                                prompt:InputHoldEnd()

                                hasHarvested = true
                                task.wait(1) -- Wait before moving to the next bush
                            end
                        end
                    end
                end

                if not hasHarvested then
                    -- If no plants were harvested, prevent infinite loops
                    task.wait(2)
                end
            end
        end)
    end
end)

local Camera = workspace.CurrentCamera

PlantFarmsSection:NewToggle("Cornflower Farm", "Farms cornflowers.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Cornflower" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Lily Farm", "Farms lily's.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Lily" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Sunflower Farm", "Farms sunflower's.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Sunflower" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Marigold Farm", "Farms marigold's.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Marigold" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Snowdrop Farm", "Farms snowdrop's.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Snowdrop" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)


PlantFarmsSection:NewToggle("Lavender Farm", "Farms lavender's.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Lavender" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Daisy Farm", "Farms daisys.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Daisy" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Poppy Farm", "Farms poppys.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Poppy" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)

PlantFarmsSection:NewToggle("Dandelion Farm", "Farms dandelions.", function(state)
    farming = state -- Update control variable

    if farming then
        -- Force first-person mode
        LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson 

        task.spawn(function() -- Run the farming in a separate thread
            while farming do
                for _, plant in ipairs(Plants:GetChildren()) do
                    if not farming then 
                        -- Reset camera mode when stopping
                        LocalPlayer.CameraMode = Enum.CameraMode.Classic
                        return 
                    end 

                    if plant:IsA("Model") and plant.Name == "Dandelion" then
                        local hitbox = plant:FindFirstChild("Hitbox")
                        if hitbox and hitbox:IsA("BasePart") then
                            local prompt = hitbox:FindFirstChildOfClass("ProximityPrompt")
                            if prompt and prompt.Enabled then
                                -- Teleport to the hitbox
                                HumanoidRootPart.CFrame = hitbox.CFrame + Vector3.new(0, 3, 0)
                                Camera.CameraType = Enum.CameraType.Custom
                                task.wait(0.5) -- Small wait to ensure teleport is processed

                                -- Make the camera smoothly look straight down
                                Camera.CameraType = Enum.CameraType.Scriptable
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position - Vector3.new(0, 5, 0))

                                -- Simulate ProximityPrompt hold
                                prompt:InputHoldBegin() -- Start holding
                                task.wait(0.5) -- Hold duration
                                prompt:InputHoldEnd() -- Release

                                if not farming then 
                                    -- Reset camera mode when stopping
                                    LocalPlayer.CameraMode = Enum.CameraMode.Classic
                                    Camera.CameraType = Enum.CameraType.Custom
                                    return 
                                end 

                                task.wait(1) -- Wait 1 second before moving to the next bush
                            end
                        end
                    end
                end
            end
        end)
    else
        -- Reset camera mode when toggled off
        LocalPlayer.CameraMode = Enum.CameraMode.Classic
        Camera.CameraType = Enum.CameraType.Custom
    end
end)
