local CustomTheme = {
    SchemeColor = Color3.fromRGB(31, 51, 80),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | DOORS 👁️", CustomTheme)

-- Tabs

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local PromptsTab = Window:NewTab("Prompts")
local VisualsTab = Window:NewTab("Visuals")
local ModsTab = Window:NewTab("Mods")

-- Main Tab

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

-- Player Tab

local PlayerSection = PlayerTab:NewSection("LocalPlayer")

PlayerSection:NewSlider("WalkSpeed", "Sets the walkspeed of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Sets the jumppower of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPoqwe = s
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

PlayerSection:NewButton("Fly (G to toggle)", "You can fly with this script.", function()
    repeat wait() 
    until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 400 
local speed = 5000 
 
function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.7+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "g" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)

PlayerSection:NewButton("Noclip [E to stop]", "Activates a noclip script.", function()
    local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local torso = localplayer.Character.HumanoidRootPart 
local hum = localplayer.Character:FindFirstChildOfClass("Humanoid")
local mouse = localplayer:GetMouse()
local enabled = true
local running = true
local dir = {w = 0, s = 0, a = 0, d = 0} 
local spd = 2 
	
local moos = mouse.KeyDown:connect(function(key)
	if key:lower() == "w" then 
		dir.w = 1 
	elseif key:lower() == "s" then 
		dir.s = 1 
	elseif key:lower() == "a" then 
		dir.a = 1 
	elseif key:lower() == "d" then 
		dir.d = 1 
	elseif key:lower() == "t" then 
		spd = spd + 1 
	elseif key:lower() == "y" then 
		spd = spd - 1 
    elseif key:lower() == "e" then
        running = false
	end 
end) 

local moos1 = mouse.KeyUp:connect(function(key)
	if key:lower() == "w" then 
		dir.w = 0 
	elseif key:lower() == "s" then 
		dir.s = 0 
	elseif key:lower() == "a" then 
		dir.a = 0 
	elseif key:lower() == "d" then 
		dir.d = 0 
	end 
end) 
					
torso.Anchored = true 
hum.PlatformStand = true 
local macka = hum.Changed:connect(function() 
	hum.PlatformStand = true 
end) 

repeat 
	if enabled == false then
		running = false
		break
	end
	wait(1/60)
	torso.CFrame = CFrame.new(torso.Position, workspace.CurrentCamera.CoordinateFrame.p) * CFrame.Angles(0,math.rad(180),0) * CFrame.new((dir.d-dir.a)*spd,0,(dir.s-dir.w)*spd) 
until not running or hum.Parent == nil or torso.Parent == nil or not enabled

moos:disconnect()
moos1:disconnect()
macka:disconnect()
torso.Anchored = false
hum.PlatformStand = false
end)

PlayerSection:NewButton("Levitate", "Makes you levitate", function()
	game.Players.LocalPlayer.Character.Humanoid.HipHeight = 5
end)

PlayerSection:NewButton("UnLevitate", "Makes you unlevitate", function()
	game.Players.LocalPlayer.Character.Humanoid.HipHeight = 3
end)

PlayerSection:NewButton("Leave Game", "Leaves the game", function()
	game.Players.LocalPlayer:Kick()
end)

PlayerSection:NewButton("Rejoin Game", "Rejoins the game", function()
	game.TeleportService:Teleport(game.PlaceId)
end)

PlayerSection:NewSlider("FOV", "Sets your FOV", 120, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
	game.Workspace.CurrentCamera.FieldOfView = s
end)

-- Visuals Tab

local VisualsSection = VisualsTab:NewSection("Visuals")

local leverESPEnabled = false  -- Variable to control the loop

VisualsSection:NewToggle("Lever ESP", " ", function(state)
    leverESPEnabled = state

    if state then
        task.spawn(function()
            while leverESPEnabled do
                task.wait(0.1)  -- Prevents lag

                -- Function to find all wardrobes
                local function findParts(parent)
                    local parts = {}
                    for _, child in pairs(parent:GetChildren()) do
                        if child:IsA("BasePart") and child.Name == "LeverForGate" then
                            table.insert(parts, child)
                        end
                        local childParts = findParts(child)
                        for _, part in pairs(childParts) do
                            table.insert(parts, part)
                        end
                    end
                    return parts
                end

                -- Highlighting logic
                local parts = findParts(game.Workspace)
                for _, part in pairs(parts) do
                    if not part:FindFirstChild("ESPHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlight.Name = "ESPHighlight"
                        highlight.Parent = part
                    end
                end
            end
        end)
    else
        -- Remove highlights when ESP is turned off
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Highlight") and obj.Name == "ESPHighlight" then
                obj:Destroy()
            end
        end
    end
end)

local doorESPEnabled = false  -- Variable to control the loop

VisualsSection:NewToggle("Door ESP", " ", function(state)
    doorESPEnabled = state

    if state then
        task.spawn(function()
            while doorESPEnabled do
                task.wait(0.1)  -- Prevents lag

                -- Function to find all wardrobes
                local function findParts(parent)
                    local parts = {}
                    for _, child in pairs(parent:GetChildren()) do
                        if child:IsA("BasePart") and child.Name == "Door" then
                            table.insert(parts, child)
                        end
                        local childParts = findParts(child)
                        for _, part in pairs(childParts) do
                            table.insert(parts, part)
                        end
                    end
                    return parts
                end

                -- Highlighting logic
                local parts = findParts(game.Workspace)
                for _, part in pairs(parts) do
                    if not part:FindFirstChild("ESPHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.FillColor = Color3.fromRGB(0, 255, 0)
                        highlight.Name = "ESPHighlight"
                        highlight.Parent = part
                    end
                end
            end
        end)
    else
        -- Remove highlights when ESP is turned off
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Highlight") and obj.Name == "ESPHighlight" then
                obj:Destroy()
            end
        end
    end
end)

local keyESPEnabled = false  -- Variable to control the loop

VisualsSection:NewToggle("Key ESP", " ", function(state)
    keyESPEnabled = state

    if state then
        task.spawn(function()
            while keyESPEnabled do
                task.wait(0.1)  -- Prevents lag

                -- Function to find all wardrobes
                local function findParts(parent)
                    local parts = {}
                    for _, child in pairs(parent:GetChildren()) do
                        if child:IsA("Model") and child.Name == "KeyObtain" then
                            table.insert(parts, child)
                        end
                        local childParts = findParts(child)
                        for _, part in pairs(childParts) do
                            table.insert(parts, part)
                        end
                    end
                    return parts
                end

                -- Highlighting logic
                local parts = findParts(game.Workspace)
                for _, part in pairs(parts) do
                    if not part:FindFirstChild("ESPHighlight") then
                        local highlight = Instance.new("Highlight")
                        highlight.FillColor = Color3.fromRGB(0, 0, 255)
                        highlight.Name = "ESPHighlight"
                        highlight.Parent = part
                    end
                end
            end
        end)
    else
        -- Remove highlights when ESP is turned off
        for _, obj in pairs(game.Workspace:GetDescendants()) do
            if obj:IsA("Highlight") and obj.Name == "ESPHighlight" then
                obj:Destroy()
            end
        end
    end
end)


VisualsSection:NewButton("Clear ESP", "Removes the ESP", function()
    -- Loop through all descendants and remove Highlights
    for _, obj in pairs(game.Workspace:GetDescendants()) do
        if obj:IsA("Highlight") then
            obj:Destroy()
        end
    end
    print("ESP Cleared!")
end)

-- Mods Tab

local InventorySection = ModsTab:NewSection("Inventory Mods")
local ModsSection = ModsTab:NewSection("Mods")

InventorySection:NewButton("Clear Inventory", "Clears ur inventoiry (dont use if you have real items)", function()
	game.Players.LocalPlayer.Backpack:ClearAllChildren()
end)

ModsSection:NewButton("Banana Launcher", "A launcher that launches bananas.", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local BananaPeel = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Mesh = Instance.new("SpecialMesh")
        local Sound = Instance.new("Sound")
        local SlipSound = Instance.new("Sound")
        local BananaScript = Instance.new("Script")
        local PlantBomb = Instance.new("Script")
        local Animation_Tool = Instance.new("LocalScript")
        BananaPeel.Grip = CFrame.new(- 0.0999614596, 0.36163044, 0, 0.00374198705, - 0.999614656, - 0.027505463, - 0.134751514, - 0.0277588349, 0.990490556, - 0.990872383, 0, - 0.134803459)
        BananaPeel.GripForward = Vector3.new(0.027505462989211082, - 0.9904905557632446, 0.13480345904827118)
        BananaPeel.GripPos = Vector3.new(- 0.09996145963668823, 0.3616304397583008, 0)
        BananaPeel.GripRight = Vector3.new(0.0037419870495796204, - 0.13475151360034943, - 0.9908723831176758)
        BananaPeel.GripUp = Vector3.new(- 0.9996146559715271, - 0.02775883488357067, 0)
        BananaPeel.Name = [[BananaPeel]]
        BananaPeel.Parent = game.Players.LocalPlayer.Backpack
        BananaPeel.TextureId = [[http://www.roblox.com/asset/?id=28937264]]
        Handle.BottomSurface = Enum.SurfaceType.Smooth
        Handle.CFrame = CFrame.new(11.4614258, 7, - 1.65873671, 0.00374198705, - 0.134751514, - 0.990872383, - 0.027505463, 0.990490556, - 0.134803459, 0.999614656, 0.0277588349, - 8.25433194e-18)
        Handle.Name = [[Handle]]
        Handle.Orientation = Vector3.new(7.75, -90, - 1.590000033378601)
        Handle.Parent = BananaPeel
        Handle.Position = Vector3.new(11.46142578125, 7, - 1.6587367057800293)
        Handle.RotVelocity = Vector3.new(1, 1, 1)
        Handle.Rotation = Vector3.new(90, - 82.25, 88.41000366210938)
        Handle.Size = Vector3.new(1, 2, 1)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Mesh.MeshId = [[http://www.roblox.com/asset/?id=28937301]]
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.Parent = Handle
        Mesh.TextureId = [[http://www.roblox.com/asset/?id=28937670]]
        Sound.Parent = Handle
        Sound.SoundId = [[http://www.roblox.com/asset/?id=28940430]]
        SlipSound.Name = [[SlipSound]]
        SlipSound.Parent = BananaPeel
        SlipSound.SoundId = [[rbxassetid://143796003]]
        SlipSound.Volume = 1
        function BananaScript_ScriptfakeXD()
            local script = Instance.new("Script", BananaPeel)
            BananaScript = script
            script.Name = [[BananaScript]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
            wait(0.5)
            local banana = script.Parent
            local touched = false
            function onTouched(part)
                if touched then
                    return
                end
                touched = true
                local humanoid = part.Parent:FindFirstChild("Humanoid")
                if humanoid ~= nil then
                    banana.SlipSound:Play()
                    humanoid.Jump = true
                    humanoid.Sit = true
                    wait(0.9)
                    humanoid.Sit = false
                end
                touched = false
            end
            banana.Touched:connect(onTouched)
        end
        coroutine.wrap(BananaScript_ScriptfakeXD)()
        function PlantBomb_ScriptfakeXD()
            local script = Instance.new("Script", BananaPeel)
            PlantBomb = script
            script.Name = [[PlantBomb]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
            Tool = script.Parent
            local bomb = nil
            local debris = game:GetService("Debris")
            function plant(pos)
                Tool.Handle.Sound:Play()
                local vCharacter = Tool.Parent
                local vPlayer = game.Players:playerFromCharacter(vCharacter)
                local spawnPos = vCharacter.PrimaryPart.Position
                bomb = Instance.new("Part")
                bomb.Locked = true
                bomb.Size = Vector3.new(1, 2, 1)
                bomb.Name = "BananaPeel"
                bomb.Position = pos
                bomb.Velocity = Tool.Handle.CFrame.LookVector * 100
                local mesh = Tool.Handle.Mesh:clone()
                mesh.Parent = bomb
                local creator_tag = Instance.new("ObjectValue")
                creator_tag.Value = vPlayer
                creator_tag.Name = "creator"
                creator_tag.Parent = bomb
                local slip = Tool.SlipSound:clone()
                slip.Parent = bomb
                slip.Name = "SlipSound"
                local script = Tool.BananaScript:clone()
                script.Parent = bomb
                script.Disabled = false
    -- Change this number to adjust bullet speed
                bomb.Parent = game.Workspace
                debris:AddItem(bomb, 120)
            end
            Tool.Enabled = true
            function onActivated()
                if not Tool.Enabled then
                    return
                end
                Tool.Enabled = false
                local character = Tool.Parent;
                local humanoid = character.Humanoid
                if humanoid == nil then
                    print("Humanoid not found")
                    return
                end
                local targetPos = humanoid.TargetPoint
                Tool.Handle.Transparency = 1
                plant(Tool.Handle.Position)
                Tool.Handle.Transparency = 0
                Tool.Enabled = true
            end
            script.Parent.Activated:connect(onActivated)
        end
        coroutine.wrap(PlantBomb_ScriptfakeXD)()
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", BananaPeel)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
    
    --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
    
    -- SUSSY AMOGUS RYAN POOKI DOOKI
    
    --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
    end)
    
    ModsSection:NewButton("Among Us Toy", "A tiny little among us figure.", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Among_us_sussy_edition = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Mesh = Instance.new("SpecialMesh")
        local Animation_Tool = Instance.new("LocalScript")
        Among_us_sussy_edition.CanBeDropped = false
        Among_us_sussy_edition.Grip = CFrame.new(- 0.00820080377, - 0.160531923, 0.0218219273, 0.936081052, - 0.0444033779, - 0.348970711, 1.88087341e-08, 0.992001832, - 0.126223236, 0.351784378, 0.118155174, 0.928594112)
        Among_us_sussy_edition.GripForward = Vector3.new(0.3489707112312317, 0.12622323632240295, - 0.9285941123962402)
        Among_us_sussy_edition.GripPos = Vector3.new(- 0.008200803771615028, - 0.1605319231748581, 0.021821927279233932)
        Among_us_sussy_edition.GripRight = Vector3.new(0.936081051826477, 1.8808734125741466e-08, 0.3517843782901764)
        Among_us_sussy_edition.GripUp = Vector3.new(- 0.044403377920389175, 0.9920018315315247, 0.11815517395734787)
        Among_us_sussy_edition.Name = [[Among us sussy edition!!]]
        Among_us_sussy_edition.Parent = game.Players.LocalPlayer.Backpack
        Among_us_sussy_edition.TextureId = [[rbxassetid://7209196188]]
        Handle.BottomSurface = Enum.SurfaceType.Smooth
        Handle.CFrame = CFrame.new(4.63188171, 0.746500015, 12.3914795, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Handle.Name = [[Handle]]
        Handle.Parent = Among_us_sussy_edition
        Handle.Position = Vector3.new(4.6318817138671875, 0.7465000152587891, 12.3914794921875)
        Handle.Size = Vector3.new(1.0219999551773071, 1.4930000305175781, 1.2740000486373901)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Mesh.MeshId = [[rbxassetid://6686375902]]
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.Parent = Handle
        Mesh.Scale = Vector3.new(0.03500000014901161, 0.03500000014901161, 0.03500000014901161)
        Mesh.TextureId = [[rbxassetid://6686375937]]
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", Among_us_sussy_edition)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
    
    --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
    
    -- SUSSY AMOGUS RYAN POOKI DOOKI
    
    --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
    end)
    
    ModsSection:NewButton("Doge Head", "DogeMazterYT inspired.", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Tool = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Mesh = Instance.new("SpecialMesh")
        local Animation_Tool = Instance.new("LocalScript")
        Tool.Grip = CFrame.new(0, 0, 0.419555664, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Tool.GripPos = Vector3.new(0, 0, 0.4195556640625)
        Tool.Parent = game.Players.LocalPlayer.Backpack
        Tool.TextureId = "rbxassetid://631727248"
        Handle.Anchored = false
        Handle.BottomSurface = Enum.SurfaceType.Smooth
        Handle.CFrame = CFrame.new(3.64359617, 0.445704252, 13.5771866, - 7.65003918e-08, 4.58603409e-07, -1, 2.39735613e-07, 1, 4.58603381e-07, 1, - 2.39735584e-07, - 7.65004984e-08)
        Handle.Name = [[Handle]]
        Handle.Orientation = Vector3.new(0, -90, 0)
        Handle.Parent = Tool
        Handle.Position = Vector3.new(3.6435961723327637, 0.44570425152778625, 13.577186584472656)
        Handle.Rotation = Vector3.new(0, -90, 0)
        Handle.Size = Vector3.new(0.891394853591919, 0.891394853591919, 0.891394853591919)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Mesh.MeshId = [[http://www.roblox.com/asset/?id=151778863 ]]
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.Parent = Handle
        Mesh.Scale = Vector3.new(0.6685460805892944, 0.6685460805892944, 0.6685460805892944)
        Mesh.TextureId = [[http://www.roblox.com/asset/?id=151778895 ]]
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", Tool)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
    
    --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
    
    -- SUSSY AMOGUS RYAN POOKI DOOKI
    
    --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
    end)
    
    ModsSection:NewButton("Gold Play Button", "Congrats for passing 1m subs!", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Tool = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Wedge = Instance.new("WedgePart")
        local Wedge_1 = Instance.new("WedgePart")
        local Animation_Tool = Instance.new("LocalScript")
        local WeldConstraint = Instance.new("WeldConstraint")
        local WeldConstraint_1 = Instance.new("WeldConstraint")
        Tool.Grip = CFrame.new(1.23176551, 0, 0.305128366, 0.963317513, 0, 0.26836431, 0, 1, 0, - 0.26836431, 0, 0.963317513)
        Tool.GripForward = Vector3.new(- 0.2683643102645874, 0, - 0.9633175134658813)
        Tool.GripPos = Vector3.new(1.2317655086517334, 0, 0.3051283657550812)
        Tool.GripRight = Vector3.new(0.9633175134658813, 0, - 0.2683643102645874)
        Tool.Parent = game.Players.LocalPlayer.Backpack
        Tool.TextureId = "rbxassetid://4870116212"
        Handle.BottomSurface = Enum.SurfaceType.Smooth
        Handle.BrickColor = BrickColor.new([[Daisy orange]])
        Handle.CFrame = CFrame.new(11.4614258, 7, - 1.65873718, - 0.999988437, - 2.9440622e-19, - 0.00480801798, 0.00480801798, - 6.12316346e-17, - 0.999988437, 0, -1, 6.12323426e-17)
        Handle.Color = Color3.new(0.972549, 0.85098, 0.427451)
        Handle.Material = Enum.Material.Glass
        Handle.Name = [[Handle]]
        Handle.Orientation = Vector3.new(89.72000122070312, -90, 90)
        Handle.Parent = Tool
        Handle.Position = Vector3.new(11.46142578125, 7, - 1.6587371826171875)
        Handle.Reflectance = 0.30000001192092896
        Handle.RotVelocity = Vector3.new(1, 1, 1)
        Handle.Rotation = Vector3.new(90, - 0.2800000011920929, 180)
        Handle.Size = Vector3.new(2.4994254112243652, 1.5443223714828491, 0.2918965816497803)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Wedge.BottomSurface = Enum.SurfaceType.Smooth
        Wedge.BrickColor = BrickColor.new([[Institutional white]])
        Wedge.CFrame = CFrame.new(11.4594393, 6.85355949, - 1.8655901, - 0.00480801798, - 2.94406169e-19, 0.999988437, - 0.999988437, - 6.12316346e-17, - 0.00480801798, 6.12323426e-17, -1, 5.16987883e-26)
        Wedge.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Wedge.Orientation = Vector3.new(0.2800000011920929, 90, -90)
        Wedge.Parent = Handle
        Wedge.Position = Vector3.new(11.459439277648926, 6.853559494018555, - 1.8655900955200195)
        Wedge.RotVelocity = Vector3.new(1, 1, 1)
        Wedge.Rotation = Vector3.new(90, 89.72000122070312, 180)
        Wedge.Size = Vector3.new(0.0010000000474974513, 0.28784775733947754, 0.4271516799926758)
        Wedge.Velocity = Vector3.new(- 0.06041240692138672, 0.2048664093017578, - 0.1444540023803711)
        Wedge_1.BottomSurface = Enum.SurfaceType.Smooth
        Wedge_1.BrickColor = BrickColor.new([[Institutional white]])
        Wedge_1.CFrame = CFrame.new(11.4542961, 6.85358381, - 1.58081818, 0.00480801798, 2.94406169e-19, 0.999988437, 0.999988437, 6.12316346e-17, - 0.00480801798, - 6.12323426e-17, 1, 5.16987883e-26)
        Wedge_1.Color = Color3.new(0.972549, 0.972549, 0.972549)
        Wedge_1.Orientation = Vector3.new(0.2800000011920929, 90, 90)
        Wedge_1.Parent = Handle
        Wedge_1.Position = Vector3.new(11.454296112060547, 6.853583812713623, - 1.5808181762695312)
        Wedge_1.RotVelocity = Vector3.new(1, 1, 1)
        Wedge_1.Rotation = Vector3.new(90, 89.72000122070312, 0)
        Wedge_1.Size = Vector3.new(0.0010000000474974513, 0.28784775733947754, 0.4271516799926758)
        Wedge_1.Velocity = Vector3.new(0.2243351936340332, - 0.08504867553710938, - 0.13928651809692383)
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", Tool)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
        
        --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
        
        -- SUSSY AMOGUS RYAN POOKI DOOKI
        
        --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
        WeldConstraint.Parent = Wedge
        WeldConstraint.Part0 = Wedge
        WeldConstraint.Part1 = Handle
        WeldConstraint_1.Parent = Wedge_1
        WeldConstraint_1.Part0 = Wedge_1
        WeldConstraint_1.Part1 = Handle
    
    end)
    
    ModsSection:NewButton("Free Robux", "Want free robux? Go to yourmom.com!", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Tool = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Decal = Instance.new("Decal")
        local Animation_Tool = Instance.new("LocalScript")
        Tool.Parent = game.Players.LocalPlayer.Backpack
        Tool.TextureId = [[rbxassetid://1542459464]]
        Handle.Anchored = false
        Handle.BottomSurface = Enum.SurfaceType.Weld
        Handle.BrickColor = BrickColor.new([[Bright green]])
        Handle.CFrame = CFrame.new(- 5.22888184, 0.200012207, 40.9151611, 0, 0, -1, 0, 1, 0, 1, 0, 0)
        Handle.Color = Color3.new(0.294118, 0.592157, 0.294118)
        Handle.Name = [[Handle]]
        Handle.Orientation = Vector3.new(0, -90, 0)
        Handle.Parent = Tool
        Handle.Position = Vector3.new(- 5.2288818359375, 0.20001220703125, 40.9151611328125)
        Handle.Rotation = Vector3.new(0, -90, 0)
        Handle.Size = Vector3.new(2, 0.4000000059604645, 1)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Decal.Face = Enum.NormalId.Top
        Decal.Parent = Handle
        Decal.Texture = [[http://www.roblox.com/asset/?id=28872862]]
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", Tool)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
    
    --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
    
    -- SUSSY AMOGUS RYAN POOKI DOOKI
    
    --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
    end)
    
    ModsSection:NewButton("Shotgun", "So.. How did you get a shotgun again?", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Shotgun = Instance.new("Tool")
        local Animation_Tool = Instance.new("LocalScript")
        local Handle = Instance.new("Part")
        local Mesh = Instance.new("SpecialMesh")
        local ShotgunFlash = Instance.new("PointLight")
        local onFire = Instance.new("Sound")
        local onActivated = Instance.new("LocalScript")
        Shotgun.Grip = CFrame.new(- 0.974044085, - 0.200260162, 7.4505806e-09, 0.102305949, 0, - 0.994753003, 0, 1, 0, 0.994753003, 0, 0.102305949)
        Shotgun.GripForward = Vector3.new(0.9947530031204224, 0, - 0.10230594873428345)
        Shotgun.GripPos = Vector3.new(- 0.9740440845489502, - 0.20026016235351562, 7.450580596923828e-09)
        Shotgun.GripRight = Vector3.new(0.10230594873428345, 0, 0.9947530031204224)
        Shotgun.Name = [[Shotgun]]
        Shotgun.Parent = game.Players.LocalPlayer.Backpack
        Shotgun.TextureId = [[rbxassetid://10753200368]]
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", Shotgun)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
    
    --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
    
    -- SUSSY AMOGUS RYAN POOKI DOOKI
    
    --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
        Handle.BottomSurface = Enum.SurfaceType.Smooth
        Handle.CFrame = CFrame.new(50.557682, 1.03106701, - 79.1497269, 6.09110591e-17, 1, - 6.26443275e-18, - 0.994753003, 6.12323426e-17, 0.102305949, 0.102305949, 0, 0.994753003)
        Handle.CanCollide = false
        Handle.Name = [[Handle]]
        Handle.Orientation = Vector3.new(- 5.869999885559082, 0, -90)
        Handle.Parent = Shotgun
        Handle.Position = Vector3.new(50.557682037353516, 1.0310670137405396, - 79.14972686767578)
        Handle.Rotation = Vector3.new(- 5.869999885559082, 0, -90)
        Handle.Size = Vector3.new(2.863628387451172, 1, 2)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Mesh.MeshId = [[rbxassetid://584172612]]
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.Parent = Handle
        Mesh.Scale = Vector3.new(0.007159070577472448, 0.009999999776482582, 0.009999999776482582)
        Mesh.TextureId = [[rbxassetid://584172619]]
        ShotgunFlash.Brightness = 4.659999847412109
        ShotgunFlash.Color = Color3.new(1, 1, 0.498039)
        ShotgunFlash.Enabled = false
        ShotgunFlash.Name = [[ShotgunFlash]]
        ShotgunFlash.Parent = Handle
        ShotgunFlash.Range = 15
        onFire.Name = [[onFire]]
        onFire.Parent = Handle
        onFire.SoundId = [[rbxassetid://5686379468]]
        function onActivated_ScriptfakeXD()
            local script = Instance.new("LocalScript", Shotgun)
            onActivated = script
            script.Name = [[onActivated]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
            script.Parent.Activated:Connect(function()
                script.Parent.Handle.ShotgunFlash.Enabled = true
                script.Parent.Handle.onFire:Play()
                wait(1)
                script.Parent.Handle.ShotgunFlash.Enabled = false
            end)
        end
        coroutine.wrap(onActivated_ScriptfakeXD)()
    end)
    
    ModsSection:NewButton("Portal Gun", "Uh-- what the hell!?", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Portal_Gun = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Mesh = Instance.new("SpecialMesh")
        local Blue = Instance.new("Sound")
        local Orange = Instance.new("Sound")
        local Invalid = Instance.new("Sound")
        local portallocal = Instance.new("LocalScript")
        local portal = Instance.new("RemoteEvent")
        local portalserver = Instance.new("Script")
        local Light = Instance.new("Part")
        local Weld = Instance.new("Weld")
    
              -- Properties --
        Portal_Gun.Name = [[Portal Gun]]
        Portal_Gun.Parent = game.Players.LocalPlayer.Backpack
        Handle.BottomSurface = Enum.SurfaceType.Smooth
        Handle.CFrame = CFrame.new(34.9965973, 0.5, - 13.9102478, 1, 0, 0, 0, 0, 1, 0, -1, 0)
        Handle.Name = [[Handle]]
        Handle.Orientation = Vector3.new(-90, 0, 0)
        Handle.Parent = Portal_Gun
        Handle.Position = Vector3.new(34.99659729003906, 0.5, - 13.910247802734375)
        Handle.Rotation = Vector3.new(-90, 0, 0)
        Handle.Size = Vector3.new(1, 2.5, 1)
        Handle.TopSurface = Enum.SurfaceType.Smooth
        Mesh.MeshId = [[rbxassetid://445285256]]
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.Parent = Handle
        Mesh.Scale = Vector3.new(0.15000000596046448, 0.15000000596046448, 0.15000000596046448)
        Mesh.TextureId = [[rbxassetid://445285268]]
        Blue.Name = [[Blue]]
        Blue.Parent = Handle
        Blue.SoundId = [[rbxassetid://182981554]]
        Orange.Name = [[Orange]]
        Orange.Parent = Handle
        Orange.SoundId = [[rbxassetid://142774034]]
        Invalid.Name = [[Invalid]]
        Invalid.Parent = Handle
        Invalid.SoundId = [[rbxassetid://182981577]]
        function portallocal_ScriptfakeXD()
            local script = Instance.new("LocalScript", Portal_Gun)
            portallocal = script
            script.Name = [[portallocal]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
        
        --By Rufus14, edited by deathcharge415
            local owner
            local character
            local rootpart
            local charhum
            mouse = game:GetService("Players").LocalPlayer:GetMouse()
            equipped = false
            canshoot = true
            grabbingwho = nil
            runservice = game:GetService("RunService")
            tool = script.Parent
            handle = tool.Handle
            remote = tool:WaitForChild("portal")
            bluesound = handle.Blue
            orangesound = handle.Orange
            invalid = handle.Invalid
            zoffset = 0
            yoffset = 0
            xoffset = 0
            xrotoffset = 0
            yrotoffset = 0
            zrotoffset = 0
            xrotoffsetportal = 0
            yrotoffsetportal = 0
            zrotoffsetportal = 0
            tool.Unequipped:connect(function()
                equipped = false
                charhum.AutoRotate = true
                if character["RightHand"]:findFirstChild("RightGriplocal") then
                    character["RightHand"]:findFirstChild("RightGriplocal"):destroy()
                end
                if character.UpperTorso:findFirstChild("LeftArmWeldportallocal") then
                    character.UpperTorso:findFirstChild("LeftArmWeldportallocal"):destroy()
                end
                if character.UpperTorso:findFirstChild("RightArmWeldportallocal") then
                    character.UpperTorso:findFirstChild("RightArmWeldportallocal"):destroy()
                end
                if character.UpperTorso:findFirstChild("HeadWeldportallocal") then
                    character.UpperTorso:findFirstChild("HeadWeldportallocal"):destroy()
                end
                if character:findFirstChild("HumanoidRootPart") then
                    if character.HumanoidRootPart:findFirstChild("HumanoidRootPartWeldportallocal") then
                        character.HumanoidRootPart:findFirstChild("HumanoidRootPartWeldportallocal"):destroy()
                    end
                end
            end)
            orangeshot = false
            mouse.KeyDown:connect(function(key)
                if not equipped then
                    return
                end
                key = key:lower()
                if key == "r" then
                    remote:FireServer("closeportals")
                    for i = 1, 20 do
                        yrotoffsetportal = math.sin(i / 2) / 8
                        runservice.RenderStepped:wait()
                    end
                    yrotoffsetportal = 0
                elseif key == "e" then
                    if grabbingwho == nil then
                        local ray = Ray.new(character.Head.Position, character.Head.CFrame.lookVector * 7)
                        local hitray, hitposition = workspace:FindPartOnRayWithIgnoreList(ray, {
                            character
                        })
                        if hitray then
                            if not hitray.Anchored then
                                grabbingwho = hitray
                                canshoot = false
                                remote:FireServer("grab", hitray)
                                coroutine.wrap(function()
                                    while runservice.RenderStepped:wait() do
                                        if grabbingwho ~= nil then
                                            grabbingwho.Velocity = Vector3.new()
                                            grabbingwho.CFrame = grabbingwho.CFrame:lerp(character.Head.CFrame * CFrame.new(0, 0, -7), 0.1)
                                        end
                                    end
                                end)()
                            end
                        end
                    else
                        grabbingwho = nil
                        remote:FireServer("grab")
                        for i = 1, 20 do
                            yrotoffsetportal = math.sin(i / 2) / 8
                            runservice.RenderStepped:wait()
                        end
                        yrotoffsetportal = 0
                        canshoot = true
                    end
                end
            end)
            mouse.Button1Down:connect(function()
                if equipped and canshoot then
                    remote:FireServer("shootblue", handle.CFrame, mouse.Hit)
                    for i = 1, 10 do
                        zoffset = math.cos(i / 12) / 1.5
                        xrotoffset = math.cos(i / 12) / 5
                        runservice.RenderStepped:wait()
                    end
                    xrotoffset = 0
                    zoffset = 0
                end
            end)
            mouse.Button2Down:connect(function()
                orangeshot = true
                coroutine.wrap(function()
                    if orangeshot then
                        wait(0.1)
                        orangeshot = false
                    end
                end)()
            end)
            mouse.Button2Up:connect(function()
                if equipped and canshoot then
                    if orangeshot then
                        remote:FireServer("shootorange", handle.CFrame, mouse.Hit)
                        for i = 1, 10 do
                            zoffset = math.cos(i / 12) / 1.5
                            xrotoffset = math.cos(i / 12) / 5
                            runservice.RenderStepped:wait()
                        end
                        xrotoffset = 0
                        zoffset = 0
                    end
                end
            end)
            tool.Equipped:connect(function()
                equipped = true
                owner = game:GetService("Players").LocalPlayer
                character = owner.Character
                charhum = character:findFirstChildOfClass("Humanoid")
                charhum.AutoRotate = false
                rootpart = character.HumanoidRootPart
                mouse = owner:GetMouse()
                character["RightHand"]:WaitForChild("RightGrip")
                local fakegrip = Instance.new("Weld", character["RightHand"])
                fakegrip.Part0 = character["RightHand"]
                fakegrip.Part1 = handle
                fakegrip.Name = "RightGriplocal"
                fakegrip.C0 = CFrame.new(0.0172424316, - 1.10172808, - 0.631057739, 0.939694643, 0.342014611, 1.5361735e-06, 0.336815238, - 0.925408483, - 0.173644245, - 0.0593881048, 0.163174912, - 0.984808147)
                local rightarm = Instance.new("Weld", character.UpperTorso)
                rightarm.Part0 = character.UpperTorso
                rightarm.Part1 = character["RightHand"]
                rightarm.C0 = CFrame.new(1.5, 0, 0)
                rightarm.Name = "RightArmWeldportallocal"
                local leftarm = Instance.new("Weld", character.UpperTorso)
                leftarm.Part0 = character.UpperTorso
                leftarm.Part1 = character["LeftHand"]
                leftarm.C0 = CFrame.new(- 1.5, 0, 0)
                leftarm.Name = "LeftArmWeldportallocal"
                local head = Instance.new("Weld", character.UpperTorso)
                head.Part0 = character.UpperTorso
                head.Part1 = character.Head
                head.C0 = CFrame.new(0, 1.5, 0)
                head.Name = "HeadWeldportallocal"
                local humanoidrootpart = Instance.new("Weld", rootpart)
                humanoidrootpart.Part0 = rootpart
                humanoidrootpart.Part1 = character.UpperTorso
                humanoidrootpart.Name = "HumanoidRootPartWeldportallocal"
                coroutine.wrap(function()
                    while wait() and equipped do --send c0
                        remote:FireServer("updatec0", "RightGrip", fakegrip.C0)
                        remote:FireServer("updatec0", "HeadWeldportal", head.C0)
                        remote:FireServer("updatec0", "HumanoidRootPartWeldportal", humanoidrootpart.C0)
                        remote:FireServer("updatec0", "LeftArmWeldportal", leftarm.C0)
                        remote:FireServer("updatec0", "RightArmWeldportal", rightarm.C0)
                    end
                end)()
                coroutine.wrap(function()
                    while runservice.RenderStepped:wait() and equipped do
                        if rootpart.Velocity.x >= 2 or rootpart.Velocity.x <= -2 or rootpart.Velocity.z >= 2 or rootpart.Velocity.z <= -2 then
                            xoffset = math.sin(tick() * 5) / 10
                            yoffset = math.sin(tick() * 10) / 10
                        elseif rootpart.Velocity.x <= 2 or rootpart.Velocity.x >= -2 or rootpart.Velocity.z <= 2 or rootpart.Velocity.z >= -2 then
                            xoffset = 0
                            yoffset = math.sin(tick()) / 20
                    --print("standing")
                        end
                    end
                end)()
                coroutine.wrap(function()
                    while runservice.RenderStepped:wait() and equipped do
                        character["LeftHand"].LocalTransparencyModifier = 0
                        character["RightHand"].LocalTransparencyModifier = 0
                        for q, w in pairs(character.Head:GetDescendants()) do
                            if w.Name == "NoPortal" or w.Name == "BluePortal" or w.Name == "OrangePortal" or w.Name == "pellet" then
                                w.LocalTransparencyModifier = 0
                            end
                        end
                        if (workspace.CurrentCamera.CFrame.p - character.Head.CFrame.p).magnitude <= 1.5 then
                            charhum.CameraOffset = Vector3.new(0, 0.5, 0)
                        else
                            charhum.CameraOffset = Vector3.new(0, 0, 0)
                        end
                        local absvel = rootpart.CFrame:vectorToObjectSpace(rootpart.Velocity)
                        humanoidrootpart.C0 = humanoidrootpart.C0:lerp(CFrame.fromEulerAnglesXYZ(absvel.z / 120, 0, - absvel.x / 120), 0.1)
                        if not charhum.PlatformStand then
                            rootpart.CFrame = rootpart.CFrame:lerp(CFrame.new(rootpart.Position, Vector3.new(mouse.Hit.p.x, rootpart.Position.y, mouse.Hit.p.z)), 0.2)
                        else
                            charhum.PlatformStand = false
                        end
                        fakegrip.C0 = fakegrip.C0:lerp(CFrame.new(0.0172424316, - 1.10172808, - 0.631057739, 0.939694643, 0.342014611, 1.5361735e-06, 0.336815238, - 0.925408483, - 0.173644245, - 0.0593881048, 0.163174912, - 0.984808147) * CFrame.fromEulerAnglesXYZ(xrotoffsetportal, yrotoffsetportal, zrotoffsetportal), 0.2)
                        head.C0 = head.C0:lerp(CFrame.new(0, 1, 0) * CFrame.fromEulerAnglesXYZ(((mouse.Hit.p - mouse.Origin.p).unit.y), 0, 0) * CFrame.new(0, 0.5, 0), 0.2)
                        leftarm.C0 = leftarm.C0:lerp(CFrame.new(- 0.3 + xoffset, - 0.3 + yoffset, - 0.5 + zoffset) * CFrame.fromEulerAnglesXYZ((((mouse.Hit.p - mouse.Origin.p).unit.y) + math.pi / 2) + xrotoffset, yrotoffset, math.rad(30) + zrotoffset) * CFrame.new(0, -1, - 0.5), 0.2)
                        rightarm.C0 = rightarm.C0:lerp(CFrame.new(1 + xoffset, 0 + yoffset, - 0.3 + zoffset) * CFrame.fromEulerAnglesXYZ((((mouse.Hit.p - mouse.Origin.p).unit.y) + math.pi / 2) + xrotoffset, yrotoffset, math.rad(-20) + zrotoffset) * CFrame.new(0, - 0.5, - 0.5), 0.2)
                    end
                    character["LeftHand"].LocalTransparencyModifier = 0
                    character["RightHand"].LocalTransparencyModifier = 0
                    charhum.CameraOffset = Vector3.new(0, 0, 0)
                end)()
            end)
        end
        coroutine.wrap(portallocal_ScriptfakeXD)()
        portal.Name = [[portal]]
        portal.Parent = Portal_Gun
        function portalserver_ScriptfakeXD()
            local script = Instance.new("Script", Portal_Gun)
            portalserver = script
            script.Name = [[portalserver]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
        
        --By Rufus14, edited by deathcharge415
            local owner
            local character
            equipped = false
            canshoot = true
            grabbing = false
            tool = script.Parent
            handle = tool.Handle
            remote = tool.portal
            runservice = game:GetService("RunService")
            bluesound = handle.Blue
            orangesound = handle.Orange
            invalid = handle.Invalid
            light = tool.Light
            illegalmaterial = {
                Enum.Material.WoodPlanks,
                Enum.Material.CorrodedMetal,
                Enum.Material.Grass,
                Enum.Material.Brick,
                Enum.Material.Cobblestone,
                Enum.Material.ForceField,
                Enum.Material.Fabric
            }
            tool.Equipped:connect(function()
                equipped = true
                owner = game:GetService("Players"):GetPlayerFromCharacter(tool.Parent)
                character = owner.Character
                local rightarm = Instance.new("Weld", character.UpperTorso)
                rightarm.Part0 = character.UpperTorso
                rightarm.Part1 = character["RightHand"]
                rightarm.C0 = CFrame.new(1.5, 0, 0)
                rightarm.Name = "RightArmWeldportal"
                local leftarm = Instance.new("Weld", character.UpperTorso)
                leftarm.Part0 = character.UpperTorso
                leftarm.Part1 = character["LeftHand"]
                leftarm.C0 = CFrame.new(- 1.5, 0, 0)
                leftarm.Name = "LeftArmWeldportal"
                local head = Instance.new("Weld", character.UpperTorso)
                head.Part0 = character.UpperTorso
                head.Part1 = character.Head
                head.C0 = CFrame.new(0, 1.5, 0)
                head.Name = "HeadWeldportal"
                local humanoidrootpart = Instance.new("Weld", character.HumanoidRootPart)
                humanoidrootpart.Part0 = character.HumanoidRootPart
                humanoidrootpart.Part1 = character.UpperTorso
                humanoidrootpart.Name = "HumanoidRootPartWeldportal"
            end)
            tool.Unequipped:connect(function()
                equipped = false
                if character.UpperTorso:findFirstChild("LeftArmWeldportal") then
                    character.UpperTorso:findFirstChild("LeftArmWeldportal"):destroy()
                end
                if character.UpperTorso:findFirstChild("RightArmWeldportal") then
                    character.UpperTorso:findFirstChild("RightArmWeldportal"):destroy()
                end
                if character.UpperTorso:findFirstChild("HeadWeldportal") then
                    character.UpperTorso:findFirstChild("HeadWeldportal"):destroy()
                end
                if character:findFirstChild("HumanoidRootPart") then
                    if character.HumanoidRootPart:findFirstChild("HumanoidRootPartWeldportal") then
                        character.HumanoidRootPart:findFirstChild("HumanoidRootPartWeldportal"):destroy()
                    end
                end
            end)
            remote.OnServerEvent:connect(function(plr, what, value, value2)
                if plr ~= owner then
                    return
                end
        --
                if what == "updatec0" then
                    for i, v in pairs(character:GetDescendants()) do
                        if v.Name == value then
                            v.C0 = value2
                        end
                    end
                elseif what == "grab" then
                    if not grabbing then
                        grabbing = true
                        light.Transparency = 0
                        light.BrickColor = BrickColor.new("Institutional white")
                        for q, w in pairs(value:GetDescendants()) do
                            if w.ClassName == "Part" or w.ClassName == "MeshPart" then
                                w.Anchored = false
                            end
                        end
                        value:SetNetworkOwner(owner)
                        local wentthh = Instance.new("BoolValue", value)
                        wentthh.Name = "wentthroughportal"
                        coroutine.wrap(function()
                            while grabbing do
                                runservice.Stepped:wait()
                            end
                            wentthh:destroy()
                            value:SetNetworkOwner(nil)
                        end)()
                    else
                        light.Transparency = 1
                        grabbing = false
                    end
                elseif what == "closeportals" then
                    light.Transparency = 1
                    if character.Head:findFirstChild("BluePortal") then
                        local blu = character.Head:findFirstChild("BluePortal")
                        local soundpart = Instance.new("Part", character.Head)
                        soundpart.Transparency = 1
                        soundpart.CanCollide = false
                        soundpart.CFrame = blu.CFrame
                        soundpart.Anchored = true
                        local soundclose = Instance.new("Sound", soundpart)
                        soundclose.SoundId = "rbxassetid://182981587"
                        soundclose.Volume = 1
                        soundclose:Play()
                        game.Debris:AddItem(soundpart, soundclose.TimeLength)
                        coroutine.wrap(function()
                            for i = 1, 10 do
                                blu.Size = blu.Size - Vector3.new(0.35, 0.5, 0)
                                runservice.Stepped:wait()
                            end
                            blu:destroy()
                        end)()
                    end
                    if character.Head:findFirstChild("OrangePortal") then
                        local orang = character.Head:findFirstChild("OrangePortal")
                        local soundpart = Instance.new("Part", character.Head)
                        soundpart.Transparency = 1
                        soundpart.CanCollide = false
                        soundpart.CFrame = orang.CFrame
                        soundpart.Anchored = true
                        local soundclose = Instance.new("Sound", soundpart)
                        soundclose.SoundId = "rbxassetid://182981587"
                        soundclose.Volume = 1
                        soundclose:Play()
                        game.Debris:AddItem(soundpart, soundclose.TimeLength)
                        coroutine.wrap(function()
                            for i = 1, 10 do
                                orang.Size = orang.Size - Vector3.new(0.35, 0.5, 0)
                                runservice.Stepped:wait()
                            end
                            orang:destroy()
                        end)()
                    end
                elseif what == "shootblue" then
                    bluesound.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                    bluesound:Play()
                    light.Transparency = 0
                    light.BrickColor = BrickColor.new("Toothpaste")
                    local pellet = Instance.new("Part", character.Head)
                    pellet.Size = Vector3.new(0.7, 0.7, 1.7)
                    pellet.Name = "pellet"
                    pellet.Material = "Neon"
                    pellet.BrickColor = BrickColor.new("Toothpaste")
                    pellet.CFrame = value * CFrame.new(0, 2, 0)
                    pellet.CFrame = CFrame.new(pellet.Position, value2.p)
                    pellet.CanCollide = false
                    pellet.Anchored = true
                    Instance.new("PointLight", pellet).Brightness = 4
                    local mesh = Instance.new("SpecialMesh", pellet)
                    mesh.MeshType = "Sphere"
                    local hitwall = false
                    local ignorelist = {}
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v.ClassName == "Model" then
                            if v:findFirstChildOfClass("Humanoid") then
                                table.insert(ignorelist, v)
                            end
                        end
                    end
                    local function awman()
                        invalid:Play()
                        invalid.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                        local boom = Instance.new("Part", character.Head)
                        boom.CanCollide = false
                        boom.Anchored = false
                        boom.Shape = "Ball"
                        boom.Name = "NoPortal"
                        boom.Anchored = true
                        boom.Material = "Neon"
                        boom.CFrame = pellet.CFrame
                        coroutine.wrap(function()
                            for i = 1, 10 do
                                boom.Size = boom.Size + Vector3.new(0.15, 0.15, 0.15)
                                boom.Transparency = boom.Transparency + 0.1
                                runservice.Stepped:wait()
                            end
                            boom:Destroy()
                        end)()
                        for i = 1, math.random(4, 10) do
                            local laser = Instance.new("Part", character.Head)
                            Instance.new("BlockMesh", laser)
                            laser.BrickColor = BrickColor.new("Toothpaste")
                            laser.Anchored = true
                            laser.Material = "Neon"
                            laser.Name = "NoPortal"
                            laser.Size = Vector3.new(0.1, 0.1, 1)
                            laser.CanCollide = false
                            laser.CFrame = pellet.CFrame
                            laser.CFrame = laser.CFrame * CFrame.fromEulerAnglesXYZ(math.random(-10, 10) / 1.5, math.random(-10, 10) / 1.5, math.random(-10, 10) / 1.5)
                            coroutine.wrap(function()
                                for i = 1, 20 do
                                    laser.Transparency = laser.Transparency + 0.05
                                    laser.CFrame = laser.CFrame * CFrame.new(0, 0, - 0.1)
                                    runservice.Stepped:wait()
                                end
                                laser:destroy()
                            end)()
                        end
                        pellet:destroy()
                    end
                    coroutine.wrap(function()
                        local threshold = 0
                        while runservice.Stepped:wait() and not hitwall do
                            local ray = Ray.new(pellet.Position, pellet.CFrame.lookVector * 8)
                            local rayhit, raypos, raysurface = workspace:FindPartOnRayWithIgnoreList(ray, ignorelist)
                            if rayhit then
                                if rayhit.Name ~= "NoPortal" then
                                    hitwall = true
                                    if rayhit.Name == "OrangePortal" then
                                        awman()
                                        return
                                    end
                                    for i, v in pairs(illegalmaterial) do
                                        if v == rayhit.Material then
                                            awman()
                                            return
                                        end
                                    end
                                    if character.Head:findFirstChild("BluePortal") then
                                        character.Head.BluePortal:destroy()
                                    end
                                    local portal = Instance.new("Part", character.Head)
                                    local mesh = Instance.new("SpecialMesh", portal)
                                    mesh.MeshType = "Sphere"
                                    portal.Size = Vector3.new(1, 1, 0.4)
                                    portal.Name = "BluePortal"
                                    portal.BrickColor = BrickColor.new("Toothpaste")
                                    portal.Material = "Neon"
                                    portal.CanCollide = false
                                    portal.Anchored = true
                                    portal.CFrame = CFrame.new(raypos, raypos - raysurface)
                                    coroutine.wrap(function()
                                        for i = 1, 10 do
                                            portal.Size = portal.Size + Vector3.new(0.35, 0.5, 0)
                                            runservice.Stepped:wait()
                                        end
                                    end)()
                                    local portalopen = Instance.new("Sound", portal)
                                    portalopen.SoundId = "rbxassetid://171399373"
                                    portalopen.Volume = 1.5
                                    portalopen.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                                    portalopen:Play()
                                    local portalidle = Instance.new("Sound", portal)
                                    portalidle.SoundId = "rbxassetid://148894502"
                                    portalidle.Volume = 0.25
                                    portalidle:Play()
                                    portalidle.Looped = true
                                    local gothroughsound = Instance.new("Sound", portal)
                                    gothroughsound.Volume = 3
                                    game.Debris:AddItem(portalopen, portalopen.TimeLength)
                                    portal.Touched:connect(function(part)
                                        if part.Anchored then
                                            return
                                        end
                                        gothroughsound.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                                        if part.Parent.ClassName == "Accessory" or part.Parent.ClassName == "Hat" or part.Parent.ClassName == "Tool" then
                                            if part.Parent.Parent ~= workspace then
                                        --print("ignored hat on player")
                                                return
                                            end
                                        end
                                        if character.Head:findFirstChild("OrangePortal") then
                                            local humus = part.Parent:findFirstChildOfClass("Humanoid")
                                            if humus then
                                                local head = part.Parent:findFirstChild("Head")
                                                if head then
                                                    local wentthrough = part.Parent:findFirstChild("wentthroughportal")
                                                    if not wentthrough then
                                                        local wentth = Instance.new("BoolValue", part.Parent)
                                                        wentth.Name = "wentthroughportal"
                                                        game.Debris:AddItem(wentth, 0.4)
                                                        local headvelocity = head.Velocity
                                                        if headvelocity.y < -50 or headvelocity.y > 50 or headvelocity.z < -50 or headvelocity.z > 50 or headvelocity.x < -50 or headvelocity.x > 50 then
                                                            gothroughsound.SoundId = "rbxassetid://2769872789"
                                                        else
                                                            gothroughsound.SoundId = "rbxassetid://232806289"
                                                        end
                                                        gothroughsound:Play()
                                                        head.CFrame = character.Head.OrangePortal.CFrame * CFrame.new(0, 2, 4)
                                                        local px, py, pz = character.Head.OrangePortal.CFrame:toEulerAnglesXYZ()
                                                        head.CFrame = CFrame.new(head.Position) * CFrame.fromEulerAnglesXYZ(0, py, 0)
                                                        local pushv = Instance.new("BodyVelocity", head)
                                                        pushv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                        pushv.Velocity = character.Head.OrangePortal.CFrame.lookVector * (-15 + headvelocity.y / 1.2)
                                                        humus:ChangeState(Enum.HumanoidStateType.GettingUp)
                                                        game.Debris:AddItem(pushv, 0.2)
                                                    end
                                                else
                                                    local wentthrough = part:findFirstChild("wentthroughportal")
                                                    if not wentthrough then
                                                        local wentth = Instance.new("BoolValue", part)
                                                        wentth.Name = "wentthroughportal"
                                                        game.Debris:AddItem(wentth, 0.4)
                                                        local partvelocity = part.Velocity
                                                        if partvelocity.y < -50 or partvelocity.y > 50 or partvelocity.z < -50 or partvelocity.z > 50 or partvelocity.x < -50 or partvelocity.x > 50 then
                                                            gothroughsound.SoundId = "rbxassetid://2769872789"
                                                        else
                                                            gothroughsound.SoundId = "rbxassetid://232806289"
                                                        end
                                                        gothroughsound:Play()
                                                        part.CFrame = character.Head.OrangePortal.CFrame * CFrame.new(0, 2, 4)
                                                        local pushv = Instance.new("BodyVelocity", part)
                                                        pushv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                        pushv.Velocity = character.Head.OrangePortal.CFrame.lookVector * (-15 + partvelocity.y / 1.2)
                                                        game.Debris:AddItem(pushv, 0.2)
                                                    end
                                                end
                                            else
                                                local wentthrough = part:findFirstChild("wentthroughportal")
                                                if not wentthrough then
                                                    local wentth = Instance.new("BoolValue", part)
                                                    wentth.Name = "wentthroughportal"
                                                    game.Debris:AddItem(wentth, 0.4)
                                                    local partvelocity = part.Velocity
                                                    if partvelocity.y < -50 or partvelocity.y > 50 or partvelocity.z < -50 or partvelocity.z > 50 or partvelocity.x < -50 or partvelocity.x > 50 then
                                                        gothroughsound.SoundId = "rbxassetid://2769872789"
                                                    else
                                                        gothroughsound.SoundId = "rbxassetid://232806289"
                                                    end
                                                    gothroughsound:Play()
                                                    part.CFrame = character.Head.OrangePortal.CFrame * CFrame.new(0, 2, 4)
                                                    local pushv = Instance.new("BodyVelocity", part)
                                                    pushv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                    pushv.Velocity = character.Head.OrangePortal.CFrame.lookVector * (-15 + partvelocity.y / 1.2)
                                                    game.Debris:AddItem(pushv, 0.2)
                                                end
                                            end
                                        end
                                    end)
                                else
                                    awman()
                                end
                            end
                            pellet.CFrame = pellet.CFrame * CFrame.new(0, 0, -8)
                            threshold = threshold + 1
                            if threshold == 200 then
                                pellet:destroy()
                                break
                            end
                        end
                        pellet:destroy()
                    end)()
                elseif what == "shootorange" then
                    orangesound.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                    orangesound:Play()
                    light.Transparency = 0
                    light.BrickColor = BrickColor.new("Deep orange")
                    local pellet = Instance.new("Part", character.Head)
                    pellet.Size = Vector3.new(0.7, 0.7, 1.7)
                    pellet.Material = "Neon"
                    pellet.Name = "pellet"
                    pellet.BrickColor = BrickColor.new("Deep orange")
                    pellet.CFrame = value * CFrame.new(0, 2, 0)
                    pellet.CFrame = CFrame.new(pellet.Position, value2.p)
                    pellet.CanCollide = false
                    pellet.Anchored = true
                    Instance.new("PointLight", pellet).Brightness = 4
                    local mesh = Instance.new("SpecialMesh", pellet)
                    mesh.MeshType = "Sphere"
                    local hitwall = false
                    local ignorelist = {}
                    for i, v in pairs(workspace:GetDescendants()) do
                        if v.ClassName == "Model" then
                            if v:findFirstChildOfClass("Humanoid") then
                                table.insert(ignorelist, v)
                            end
                        end
                    end
                    local function awman()
                        invalid:Play()
                        invalid.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                        local boom = Instance.new("Part", character.Head)
                        boom.CanCollide = false
                        boom.Anchored = true
                        boom.Shape = "Ball"
                        boom.Name = "NoPortal"
                        boom.Material = "Neon"
                        boom.CFrame = pellet.CFrame
                        coroutine.wrap(function()
                            for i = 1, 10 do
                                boom.Size = boom.Size + Vector3.new(0.15, 0.15, 0.15)
                                boom.Transparency = boom.Transparency + 0.1
                                runservice.Stepped:wait()
                            end
                            boom:Destroy()
                        end)()
                        for i = 1, math.random(4, 10) do
                            local laser = Instance.new("Part", character.Head)
                            Instance.new("BlockMesh", laser)
                            laser.BrickColor = BrickColor.new("Deep orange")
                            laser.Size = Vector3.new(0.1, 0.1, 1)
                            laser.Anchored = true
                            laser.Material = "Neon"
                            laser.Name = "NoPortal"
                            laser.CanCollide = false
                            laser.CFrame = pellet.CFrame
                            laser.CFrame = laser.CFrame * CFrame.fromEulerAnglesXYZ(math.random(-10, 10) / 1.5, math.random(-10, 10) / 1.5, math.random(-10, 10) / 1.5)
                            coroutine.wrap(function()
                                for i = 1, 20 do
                                    laser.Transparency = laser.Transparency + 0.05
                                    laser.CFrame = laser.CFrame * CFrame.new(0, 0, - 0.1)
                                    runservice.Stepped:wait()
                                end
                                laser:destroy()
                            end)()
                        end
                        pellet:destroy()
                    end
                    coroutine.wrap(function()
                        local threshold = 0
                        while runservice.Stepped:wait() and not hitwall do
                            local ray = Ray.new(pellet.Position, pellet.CFrame.lookVector * 8)
                            local rayhit, raypos, raysurface = workspace:FindPartOnRayWithIgnoreList(ray, ignorelist)
                            if rayhit then
                                if rayhit.Name ~= "NoPortal" then
                                    hitwall = true
                                    if rayhit.Name == "BluePortal" then
                                        awman()
                                        return
                                    end
                                    for i, v in pairs(illegalmaterial) do
                                        if v == rayhit.Material then
                                            awman()
                                            return
                                        end
                                    end
                                    if character.Head:findFirstChild("OrangePortal") then
                                        character.Head.OrangePortal:destroy()
                                    end
                                    local portal = Instance.new("Part", character.Head)
                                    local mesh = Instance.new("SpecialMesh", portal)
                                    mesh.MeshType = "Sphere"
                                    portal.Size = Vector3.new(1, 1, 0.4)
                                    portal.Name = "OrangePortal"
                                    portal.BrickColor = BrickColor.new("Deep orange")
                                    portal.Material = "Neon"
                                    portal.CanCollide = false
                                    portal.Anchored = true
                                    portal.CFrame = CFrame.new(raypos, raypos - raysurface)
                                    coroutine.wrap(function()
                                        for i = 1, 10 do
                                            portal.Size = portal.Size + Vector3.new(0.35, 0.5, 0)
                                            runservice.Stepped:wait()
                                        end
                                    end)()
                                    local portalopen = Instance.new("Sound", portal)
                                    portalopen.SoundId = "rbxassetid://171399373"
                                    portalopen.Volume = 1.5
                                    portalopen.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                                    portalopen:Play()
                                    local portalidle = Instance.new("Sound", portal)
                                    portalidle.SoundId = "rbxassetid://148894502"
                                    portalidle.Volume = 0.25
                                    portalidle:Play()
                                    portalidle.Looped = true
                                    local gothroughsound = Instance.new("Sound", portal)
                                    gothroughsound.Volume = 1.5
                                    game.Debris:AddItem(portalopen, portalopen.TimeLength)
                                    portal.Touched:connect(function(part)
                                        if part.Anchored then
                                            return
                                        end
                                        gothroughsound.PlaybackSpeed = 1 + (math.random(-20, 20) / 120)
                                        if part.Parent.ClassName == "Accessory" or part.Parent.ClassName == "Hat" or part.Parent.ClassName == "Tool" then
                                            if part.Parent.Parent ~= workspace then
                                        --print("ignored hat on player")
                                                return
                                            end
                                        end
                                        if character.Head:findFirstChild("BluePortal") then
                                            local humus = part.Parent:findFirstChildOfClass("Humanoid")
                                            if humus then
                                                local head = part.Parent:findFirstChild("Head")
                                                if head then
                                                    local wentthrough = part.Parent:findFirstChild("wentthroughportal")
                                                    if not wentthrough then
                                                        local wentth = Instance.new("BoolValue", part.Parent)
                                                        wentth.Name = "wentthroughportal"
                                                        game.Debris:AddItem(wentth, 0.4)
                                                        local headvelocity = head.Velocity
                                                        if headvelocity.y < -50 or headvelocity.y > 50 or headvelocity.z < -50 or headvelocity.z > 50 or headvelocity.x < -50 or headvelocity.x > 50 then
                                                            gothroughsound.SoundId = "rbxassetid://2769872789"
                                                        else
                                                            gothroughsound.SoundId = "rbxassetid://232806289"
                                                        end
                                                        gothroughsound:Play()
                                                        head.CFrame = character.Head.BluePortal.CFrame * CFrame.new(0, 2, 4)
                                                        local px, py, pz = character.Head.BluePortal.CFrame:toEulerAnglesXYZ()
                                                        head.CFrame = CFrame.new(head.Position) * CFrame.fromEulerAnglesXYZ(0, py, 0)
                                                        local pushv = Instance.new("BodyVelocity", head)
                                                        pushv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                        pushv.Velocity = character.Head.BluePortal.CFrame.lookVector * (-15 + headvelocity.y / 1.2)
                                                        humus:ChangeState(Enum.HumanoidStateType.GettingUp)
                                                        game.Debris:AddItem(pushv, 0.2)
                                                    end
                                                else
                                                    local wentthrough = part:findFirstChild("wentthroughportal")
                                                    if not wentthrough then
                                                        local wentth = Instance.new("BoolValue", part)
                                                        wentth.Name = "wentthroughportal"
                                                        game.Debris:AddItem(wentth, 0.4)
                                                        local partvelocity = part.Velocity
                                                        if partvelocity.y < -50 or partvelocity.y > 50 or partvelocity.z < -50 or partvelocity.z > 50 or partvelocity.x < -50 or partvelocity.x > 50 then
                                                            gothroughsound.SoundId = "rbxassetid://2769872789"
                                                        else
                                                            gothroughsound.SoundId = "rbxassetid://232806289"
                                                        end
                                                        gothroughsound:Play()
                                                        part.CFrame = character.Head.BluePortal.CFrame * CFrame.new(0, 2, 4)
                                                        local pushv = Instance.new("BodyVelocity", part)
                                                        pushv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                        pushv.Velocity = character.Head.BluePortal.CFrame.lookVector * (-15 + partvelocity.y / 1.2)
                                                        game.Debris:AddItem(pushv, 0.2)
                                                    end
                                                end
                                            else
                                                local wentthrough = part:findFirstChild("wentthroughportal")
                                                if not wentthrough then
                                                    local wentth = Instance.new("BoolValue", part)
                                                    wentth.Name = "wentthroughportal"
                                                    game.Debris:AddItem(wentth, 0.4)
                                                    local partvelocity = part.Velocity
                                                    if partvelocity.y < -50 or partvelocity.y > 50 or partvelocity.z < -50 or partvelocity.z > 50 or partvelocity.x < -50 or partvelocity.x > 50 then
                                                        gothroughsound.SoundId = "rbxassetid://2769872789"
                                                    else
                                                        gothroughsound.SoundId = "rbxassetid://232806289"
                                                    end
                                                    gothroughsound:Play()
                                                    part.CFrame = character.Head.BluePortal.CFrame * CFrame.new(0, 2, 4)
                                                    local pushv = Instance.new("BodyVelocity", part)
                                                    pushv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                                                    pushv.Velocity = character.Head.BluePortal.CFrame.lookVector * (-15 + partvelocity.y / 1.2)
                                                    game.Debris:AddItem(pushv, 0.2)
                                                end
                                            end
                                        end
                                    end)
                                else
                                    awman()
                                end
                            end
                            pellet.CFrame = pellet.CFrame * CFrame.new(0, 0, -8)
                            threshold = threshold + 1
                            if threshold == 200 then
                                pellet:destroy()
                                break
                            end
                        end
                        pellet:destroy()
                    end)()
                end
            end)
        end
        coroutine.wrap(portalserver_ScriptfakeXD)()
        Light.BottomSurface = Enum.SurfaceType.Smooth
        Light.BrickColor = BrickColor.new([[Toothpaste]])
        Light.CFrame = CFrame.new(35.1935005, 0.580810189, - 13.1235809, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Light.Color = Color3.new(0, 1, 1)
        Light.Material = Enum.Material.Neon
        Light.Name = [[Light]]
        Light.Parent = Portal_Gun
        Light.Position = Vector3.new(35.19350051879883, 0.5808101892471313, - 13.123580932617188)
        Light.Shape = Enum.PartType.Ball
        Light.Size = Vector3.new(0.23000094294548035, 0.23000094294548035, 0.23000094294548035)
        Light.TopSurface = Enum.SurfaceType.Smooth
        Light.Transparency = 1
        Weld.C0 = CFrame.new(0.196903229, - 0.78666687, 0.0808101892, 1, 0, 0, 0, 0, -1, 0, 1, 0)
        Weld.Parent = Handle
        Weld.Part0 = Handle
        Weld.Part1 = Light
    
                  -- End --
            -- Thank for using --
    end)
    
    ModsSection:NewButton("Quandale Dingle Flashlight", "QUANDALE DINGEL HERE!!! (goofy ahh scream)", function()
    -- Objects To Lua Make By HairBaconGamming --
        local Module_Scripts = {}
        local Flash_Light = Instance.new("Tool")
        local Handle = Instance.new("Part")
        local Mesh = Instance.new("SpecialMesh")
        local SpotLight = Instance.new("SpotLight")
        local Sound = Instance.new("Sound")
        local equip = Instance.new("Sound")
        local LocalScript = Instance.new("LocalScript")
        local Animation_Tool = Instance.new("LocalScript")
    
              -- Properties --
        Flash_Light.Name = [[Flash Light]]
        Flash_Light.Parent = game.Players.LocalPlayer.Backpack
        Flash_Light.TextureId = [[rbxassetid://9288240216]]
        Handle.BrickColor = BrickColor.new([[Reddish brown]])
        Handle.CFrame = CFrame.new(35.3623009, 0.300018311, - 15.4182396, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        Handle.Color = Color3.new(0.411765, 0.25098, 0.156863)
        Handle.Material = Enum.Material.Wood
        Handle.Name = [[Handle]]
        Handle.Parent = Flash_Light
        Handle.Position = Vector3.new(35.362300872802734, 0.300018310546875, - 15.41823959350586)
        Handle.Size = Vector3.new(0.40000003576278687, 0.600000262260437, 2.4000003337860107)
        Mesh.MeshId = [[http://www.roblox.com/asset/?id=115955313]]
        Mesh.MeshType = Enum.MeshType.FileMesh
        Mesh.Parent = Handle
        Mesh.Scale = Vector3.new(0.699999988079071, 0.699999988079071, 0.699999988079071)
        Mesh.TextureId = [[rbxassetid://9288240216]]
        SpotLight.Brightness = 3
        SpotLight.Parent = Handle
        SpotLight.Range = 40
        Sound.Parent = Handle
        Sound.SoundId = [[rbxassetid://198914875]]
        Sound.Volume = 2
        equip.Name = [[equip]]
        equip.Parent = Handle
        equip.SoundId = [[rbxassetid://4458750140]]
        function LocalScript_ScriptfakeXD()
            local script = Instance.new("LocalScript", Flash_Light)
            LocalScript = script
            script.Name = [[LocalScript]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
            script.Parent.Activated:Connect(function()
                if script.Parent.Handle.SpotLight.Enabled == true then
                    script.Parent.Handle.SpotLight.Enabled = false
                    script.Parent.Handle.Sound:Play()
                else
                    script.Parent.Handle.SpotLight.Enabled = true
                    script.Parent.Handle.Sound:Play()
                end
            end)
            script.Parent.Equipped:Connect(function()
                script.Parent.Handle.SpotLight.Enabled = false
                script.Parent.Handle.equip:Play()
            end)
            script.Parent.Unequipped:Connect(function()
                script.Parent.Handle.equip:Play()
            end)
        end
        coroutine.wrap(LocalScript_ScriptfakeXD)()
        function Animation_Tool_ScriptfakeXD()
            local script = Instance.new("LocalScript", Flash_Light)
            Animation_Tool = script
            script.Name = [[Animation Tool]]
            local require_fake = require
            local require = function(Object)
                local functiom = Module_Scripts[Object]
                if functiom then
                    return functiom()
                end
                return require_fake(Object)
            end
        
        --Insert into tool the bool the cool
            local tool = script.Parent
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://6516424098" --Animation ID
            local track
            tool.Equipped:Connect(function()
                track = script.Parent.Parent.Humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
            end)
            tool.Unequipped:Connect(function()
                if track then
                    track:Stop()
                end
            end)
    
    -- SUSSY AMOGUS RYAN POOKI DOOKI
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    --ABDUZCAN!
        end
        coroutine.wrap(Animation_Tool_ScriptfakeXD)()
    
    
                  -- End --
            -- Thank for using --
    end)

    -- Prompts Tab

    local PromptsSection = PromptsTab:NewSection("Prompt Settings")

    local reachEnabled = false
local cooldownEnabled = false
local autoInteractEnabled = false

-- REACH TOGGLE (Increase Activation Distance)
PromptsSection:NewToggle("Reach", "Lets you press E far away.", function(state)
    reachEnabled = state

    if state then
        task.spawn(function()
            while reachEnabled do
                task.wait(0.1)  -- Optimized delay
                
                for _, prompt in pairs(game.Workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        prompt.MaxActivationDistance = 50
                    end
                end
            end
        end)
    else
        -- Reset Activation Distance when disabled
        for _, prompt in pairs(game.Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.MaxActivationDistance = 10  -- Default value
            end
        end
    end
end)

-- NO PROMPT COOLDOWN TOGGLE
PromptsSection:NewToggle("No Prompt Cooldown", "Removes the hold duration.", function(state)
    cooldownEnabled = state

    if state then
        task.spawn(function()
            while cooldownEnabled do
                task.wait(0.1)  -- Optimized delay
                
                for _, prompt in pairs(game.Workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        prompt.HoldDuration = 0
                    end
                end
            end
        end)
    else
        -- Reset Hold Duration when disabled
        for _, prompt in pairs(game.Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 1  -- Default value
            end
        end
    end
end)

-- AUTO INTERACT TOGGLE
PromptsSection:NewToggle("Auto Interact", "Automatically triggers prompts.", function(state)
    autoInteractEnabled = state

    if state then
        task.spawn(function()
            while autoInteractEnabled do
                task.wait(0.1)  -- Optimized delay
                
                for _, prompt in pairs(game.Workspace:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        prompt.AutoTrigger = true
                    end
                end
            end
        end)
    else
        -- Reset AutoTrigger when disabled
        for _, prompt in pairs(game.Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.AutoTrigger = false  -- Default value
            end
        end
    end
end)
