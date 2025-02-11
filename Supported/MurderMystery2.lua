local CustomTheme = {
    SchemeColor = Color3.fromRGB(5, 43, 255),
    Background = Color3.fromRGB(25, 25, 25),
    Header = Color3.fromRGB(20, 20, 20),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("FujiHub v1 | MM2 🔪", CustomTheme)

local MainTab = Window:NewTab("Main")
local PlayerTab = Window:NewTab("Player")
local UtiltiesTab = Window:NewTab("Utilities")
local VisualsTab = Window:NewTab("Visuals")


local MainSection = MainTab:NewSection("Game Info")
local MainSectionUI = MainTab:NewSection("UI")
local PlayerSection = PlayerTab:NewSection("LocalPlayer")
local UtilitiesSection = UtiltiesTab:NewSection("Utilities")
local VisualsSection = VisualsTab:NewSection("Game Info")

-- Player Tab

PlayerSection:NewSlider("WalkSpeed", "Sets the walkspeed of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("JumpPower", "Sets the jumppower of the player.", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPoqwe = s
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

-- Utilities Tab

local gunTPEnabled = false

UtilitiesSection:NewToggle("Gun Teleport", "Automatically teleports you to the gun after sheriff dies.", function(state)
    if state then
        gunTPEnabled = true
        while gunTPEnabled do
            task.wait(.5)
            print("searching")
            -- Find GunDrop anywhere in the workspace
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "GunDrop" then
                    -- Create ESP effect
                    local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = obj.Position
                    wait(0.5)
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = position
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character.UpperTorso
                    break
                end
            end
        end
    else
        gunTPEnabled = false
    end
end)

UtilitiesSection:NewButton("Kill All (Must be spam clicking)", "Must be murderer", function()
    for i, player in pairs(game.Players:GetChildren()) do
        local plr = game.Players.LocalPlayer
        local character = plr.Character
        local hrp = character.HumanoidRootPart
        hrp.CFrame = player.Character.HumanoidRootPart.CFrame
        wait(1)
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

-- Visuals Tab

VisualsSection:NewButton("View All Roles ESP (Use after 10 second start)", "View everyone's role.", function()
    for i, player in pairs(game.Players:GetChildren()) do
    print(player.Name)
    if player:FindFirstChild("Backpack"):FindFirstChild("Knife") or player.Character:FindFirstChild("Knife") then
       print(player.Name .. " is the murder.")
       local Highlight = Instance.new("Highlight")
       Highlight.Parent = player.Character
    elseif player:FindFirstChild("Backpack"):FindFirstChild("Gun") or player.Character:FindFirstChild("Gun") then
       print(player.Name .. " is the sheriff.")
       local Highlight = Instance.new("Highlight")
       Highlight.Parent = player.Character
       Highlight.FillColor = Color3.fromRGB(0,0,255)
    else
local Highlight = Instance.new("Highlight")
       Highlight.Parent = player.Character
       Highlight.FillColor = Color3.fromRGB(0,255,0)
    end
end
end)

local gunESP = false

VisualsSection:NewToggle("Gun ESP", "View the gun when the sheriff dies.", function(state)
    if state then
        gunESP = true
        while gunESP do
            if gunESP == false then
                break
            end
            task.wait(.5)
            print("searching")
            -- Find GunDrop anywhere in the workspace
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name == "GunDrop" then
                    -- Create ESP effect
                    
                    local highlight = obj:FindFirstChild("Highlight")
                    if not highlight then
                        highlight = Instance.new("Highlight")
                        highlight.Parent = obj
                        highlight.FillColor = Color3.fromRGB(255, 255, 0) -- Green
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                        highlight.OutlineTransparency = 0
                    end
                end
            end
        end
    else
        gunESP = false
    end
end)



