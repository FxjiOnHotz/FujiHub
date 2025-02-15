local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FxjiX", "Ocean")

-- Tabs

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local VisualsTab = Window:NewTab("Visuals")
local TrollingTab = Window:NewTab("Trolling")
local ExtraTab = Window:NewTab("Extra")

-- Sections

local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local MainSectionHub = MainTab:NewSection("FujiHub")
local PlayerSection = PlayerTab:NewSection("Player")
local VisualsSection = VisualsTab:NewSection("Visuals")
local TrollingSection = TrollingTab:NewSection("Trolling")
local ExtraSection = ExtraTab:NewSection("Extra")

-- Extra Section

ExtraSection:NewButton("Load IY", "Extra scr 1", function()
	loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

-- Trolling Section

TrollingSection:NewButton("Load OP Finality Trolling GUI", "Troll scr 1", function()
	loadstring(game:HttpGet("https://gist.githubusercontent.com/torikooo/54d50877a1388727ea9ca2fa07f3f593/raw/64971f032b6af3023305c57dba0810073a6d5a6b/OP%2520Finality%2520Trolling%2520GUI"))()
end)

TrollingSection:NewButton("Load R6 Trolling GUI", "Troll scr 2", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/MX2s8q5W"))()
end)

-- Visuals Section

local Players = game:GetService("Players")

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

-- Player Tab

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

MainSectionHub:NewButton("Launch FujiHub", "Opens FujiHub", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Resources/GameSelector.lua"))()
end)

