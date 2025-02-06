-- Gui to Lua
-- Version: 3.2

-- Instances:

local FujiHub = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local GamesListFrame = Instance.new("Frame")
local GamesScroller = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local MurderMystery2 = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local FleeTheFacility = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local IdentityFraud = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local DOORS = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local UICorner_7 = Instance.new("UICorner")
local GameData = Instance.new("Frame")
local UICorner_8 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local Description = Instance.new("TextLabel")
local Execute = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local Icon = Instance.new("ImageLabel")
local ReportBug = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local Icon_2 = Instance.new("ImageLabel")
local ScriptLink = Instance.new("TextLabel")
local PlaceId = Instance.new("TextLabel")
local Source = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local Icon_3 = Instance.new("ImageLabel")
local Link = Instance.new("TextBox")
local UICorner_12 = Instance.new("UICorner")
local Exit_2 = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")

--Properties:

FujiHub.Name = "FujiHub"
FujiHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FujiHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = FujiHub
Background.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.278761059, 0, 0.246523395, 0)
Background.Size = UDim2.new(0, 600, 0, 400)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Background

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0183333326, 0, 0.0299999993, 0)
Title.Size = UDim2.new(0, 200, 0, 32)
Title.Font = Enum.Font.GothamBold
Title.Text = "FujiHub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Version.Name = "Version"
Version.Parent = Background
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
Version.BorderSizePixel = 0
Version.Position = UDim2.new(0.0183333326, 0, 0.109999999, 0)
Version.Size = UDim2.new(0, 200, 0, 18)
Version.Font = Enum.Font.Gotham
Version.Text = "v1.0.7"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextScaled = true
Version.TextSize = 14.000
Version.TextWrapped = true
Version.TextXAlignment = Enum.TextXAlignment.Left

Exit.Name = "Exit"
Exit.Parent = Background
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.899999976, 0, 0.0299999993, 0)
Exit.Size = UDim2.new(0, 50, 0, 50)
Exit.AutoButtonColor = false
Exit.Font = Enum.Font.SourceSansBold
Exit.Text = "X"
Exit.TextColor3 = Color3.fromRGB(0, 0, 0)
Exit.TextScaled = true
Exit.TextSize = 14.000
Exit.TextWrapped = true

UICorner_2.Parent = Exit

GamesListFrame.Name = "GamesListFrame"
GamesListFrame.Parent = Background
GamesListFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GamesListFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
GamesListFrame.BorderSizePixel = 0
GamesListFrame.Position = UDim2.new(0.0183333326, 0, 0.189999968, 0)
GamesListFrame.Size = UDim2.new(0, 256, 0, 314)

GamesScroller.Name = "GamesScroller"
GamesScroller.Parent = GamesListFrame
GamesScroller.Active = true
GamesScroller.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GamesScroller.BackgroundTransparency = 1.000
GamesScroller.BorderColor3 = Color3.fromRGB(0, 0, 0)
GamesScroller.BorderSizePixel = 0
GamesScroller.Position = UDim2.new(0, 0, 0.0286624208, 0)
GamesScroller.Size = UDim2.new(1, 0, 0.971337557, 0)
GamesScroller.ScrollBarThickness = 0

UIListLayout.Parent = GamesScroller
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 13)

MurderMystery2.Name = "MurderMystery2"
MurderMystery2.Parent = GamesScroller
MurderMystery2.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MurderMystery2.BorderColor3 = Color3.fromRGB(0, 0, 0)
MurderMystery2.BorderSizePixel = 0
MurderMystery2.Size = UDim2.new(0, 236, 0, 31)
MurderMystery2.AutoButtonColor = false
MurderMystery2.Font = Enum.Font.GothamBold
MurderMystery2.Text = "Murder Mystery 2"
MurderMystery2.TextColor3 = Color3.fromRGB(255, 255, 255)
MurderMystery2.TextScaled = true
MurderMystery2.TextSize = 14.000
MurderMystery2.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = MurderMystery2

FleeTheFacility.Name = "FleeTheFacility"
FleeTheFacility.Parent = GamesScroller
FleeTheFacility.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
FleeTheFacility.BorderColor3 = Color3.fromRGB(0, 0, 0)
FleeTheFacility.BorderSizePixel = 0
FleeTheFacility.Size = UDim2.new(0, 236, 0, 31)
FleeTheFacility.AutoButtonColor = false
FleeTheFacility.Font = Enum.Font.GothamBold
FleeTheFacility.Text = "Flee The Facility"
FleeTheFacility.TextColor3 = Color3.fromRGB(255, 255, 255)
FleeTheFacility.TextScaled = true
FleeTheFacility.TextSize = 14.000
FleeTheFacility.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = FleeTheFacility

IdentityFraud.Name = "IdentityFraud"
IdentityFraud.Parent = GamesScroller
IdentityFraud.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IdentityFraud.BorderColor3 = Color3.fromRGB(0, 0, 0)
IdentityFraud.BorderSizePixel = 0
IdentityFraud.Size = UDim2.new(0, 236, 0, 31)
IdentityFraud.AutoButtonColor = false
IdentityFraud.Font = Enum.Font.GothamBold
IdentityFraud.Text = "Identity Fraud"
IdentityFraud.TextColor3 = Color3.fromRGB(255, 255, 255)
IdentityFraud.TextScaled = true
IdentityFraud.TextSize = 14.000
IdentityFraud.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 6)
UICorner_5.Parent = IdentityFraud

DOORS.Name = "DOORS"
DOORS.Parent = GamesScroller
DOORS.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
DOORS.BorderColor3 = Color3.fromRGB(0, 0, 0)
DOORS.BorderSizePixel = 0
DOORS.Size = UDim2.new(0, 236, 0, 31)
DOORS.AutoButtonColor = false
DOORS.Font = Enum.Font.GothamBold
DOORS.Text = "DOORS"
DOORS.TextColor3 = Color3.fromRGB(255, 255, 255)
DOORS.TextScaled = true
DOORS.TextSize = 14.000
DOORS.TextWrapped = true

UICorner_6.CornerRadius = UDim.new(0, 6)
UICorner_6.Parent = DOORS

UICorner_7.CornerRadius = UDim.new(0, 10)
UICorner_7.Parent = GamesListFrame

GameData.Name = "GameData"
GameData.Parent = Background
GameData.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
GameData.BorderColor3 = Color3.fromRGB(0, 0, 0)
GameData.BorderSizePixel = 0
GameData.Position = UDim2.new(0.460000008, 0, 0.189999998, 0)
GameData.Size = UDim2.new(0, 314, 0, 314)

UICorner_8.CornerRadius = UDim.new(0, 10)
UICorner_8.Parent = GameData

Title_2.Name = "Title"
Title_2.Parent = GameData
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.034256272, 0, 0.0236306153, 0)
Title_2.Size = UDim2.new(0, 297, 0, 32)
Title_2.Visible = false
Title_2.Font = Enum.Font.GothamBold
Title_2.Text = "Murder Mystery 2"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 14.000
Title_2.TextWrapped = true
Title_2.TextXAlignment = Enum.TextXAlignment.Left

Description.Name = "Description"
Description.Parent = GameData
Description.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Description.BackgroundTransparency = 1.000
Description.BorderColor3 = Color3.fromRGB(0, 0, 0)
Description.BorderSizePixel = 0
Description.Position = UDim2.new(0.034256272, 0, 0.125541732, 0)
Description.Size = UDim2.new(0, 297, 0, 95)
Description.Visible = false
Description.Font = Enum.Font.Gotham
Description.Text = "A game where you survive the murderer, kill the murderer, or become the murder and kill all players."
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextScaled = true
Description.TextSize = 14.000
Description.TextWrapped = true
Description.TextXAlignment = Enum.TextXAlignment.Left

Execute.Name = "Execute"
Execute.Parent = GameData
Execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.0318471342, 0, 0.474522293, 0)
Execute.Size = UDim2.new(0, 297, 0, 41)
Execute.Visible = false
Execute.AutoButtonColor = false
Execute.Font = Enum.Font.GothamBold
Execute.Text = "EXECUTE "
Execute.TextColor3 = Color3.fromRGB(0, 0, 0)
Execute.TextScaled = true
Execute.TextSize = 14.000
Execute.TextWrapped = true
Execute.TextXAlignment = Enum.TextXAlignment.Right

UICorner_9.CornerRadius = UDim.new(0, 6)
UICorner_9.Parent = Execute

Icon.Name = "Icon"
Icon.Parent = Execute
Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon.BackgroundTransparency = 1.000
Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon.BorderSizePixel = 0
Icon.Position = UDim2.new(0.0235690232, 0, 0.097560972, 0)
Icon.Size = UDim2.new(0, 32, 0, 32)
Icon.Image = "rbxassetid://12099513379"
Icon.ImageColor3 = Color3.fromRGB(0, 0, 0)

ReportBug.Name = "ReportBug"
ReportBug.Parent = GameData
ReportBug.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ReportBug.BorderColor3 = Color3.fromRGB(0, 0, 0)
ReportBug.BorderSizePixel = 0
ReportBug.Position = UDim2.new(0.0318471342, 0, 0.834394932, 0)
ReportBug.Size = UDim2.new(0, 297, 0, 41)
ReportBug.Visible = false
ReportBug.AutoButtonColor = false
ReportBug.Font = Enum.Font.GothamBold
ReportBug.Text = "REPORT BUG "
ReportBug.TextColor3 = Color3.fromRGB(0, 0, 0)
ReportBug.TextScaled = true
ReportBug.TextSize = 14.000
ReportBug.TextWrapped = true
ReportBug.TextXAlignment = Enum.TextXAlignment.Right

UICorner_10.CornerRadius = UDim.new(0, 6)
UICorner_10.Parent = ReportBug

Icon_2.Name = "Icon"
Icon_2.Parent = ReportBug
Icon_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon_2.BackgroundTransparency = 1.000
Icon_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon_2.BorderSizePixel = 0
Icon_2.Position = UDim2.new(0.0235690232, 0, 0.097560972, 0)
Icon_2.Size = UDim2.new(0, 32, 0, 32)
Icon_2.Image = "rbxassetid://10165650767"
Icon_2.ImageColor3 = Color3.fromRGB(0, 0, 0)

ScriptLink.Name = "ScriptLink"
ScriptLink.Parent = GameData
ScriptLink.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptLink.BackgroundTransparency = 1.000
ScriptLink.BorderColor3 = Color3.fromRGB(0, 0, 0)
ScriptLink.BorderSizePixel = 0
ScriptLink.Position = UDim2.new(0.034256272, 0, 0.0236306153, 0)
ScriptLink.Size = UDim2.new(0, 297, 0, 32)
ScriptLink.Visible = false
ScriptLink.Font = Enum.Font.GothamBold
ScriptLink.Text = ""
ScriptLink.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptLink.TextScaled = true
ScriptLink.TextSize = 14.000
ScriptLink.TextWrapped = true
ScriptLink.TextXAlignment = Enum.TextXAlignment.Left

PlaceId.Name = "PlaceId"
PlaceId.Parent = GameData
PlaceId.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
PlaceId.BackgroundTransparency = 1.000
PlaceId.BorderColor3 = Color3.fromRGB(0, 0, 0)
PlaceId.BorderSizePixel = 0
PlaceId.Position = UDim2.new(0.034256272, 0, 0.0236306153, 0)
PlaceId.Size = UDim2.new(0, 297, 0, 32)
PlaceId.Visible = false
PlaceId.Font = Enum.Font.GothamBold
PlaceId.Text = ""
PlaceId.TextColor3 = Color3.fromRGB(255, 255, 255)
PlaceId.TextScaled = true
PlaceId.TextSize = 14.000
PlaceId.TextWrapped = true
PlaceId.TextXAlignment = Enum.TextXAlignment.Left

Source.Name = "Source"
Source.Parent = GameData
Source.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Source.BorderColor3 = Color3.fromRGB(0, 0, 0)
Source.BorderSizePixel = 0
Source.Position = UDim2.new(0.0318471342, 0, 0.652866244, 0)
Source.Size = UDim2.new(0, 297, 0, 41)
Source.Visible = false
Source.AutoButtonColor = false
Source.Font = Enum.Font.GothamBold
Source.Text = "SOURCE "
Source.TextColor3 = Color3.fromRGB(0, 0, 0)
Source.TextScaled = true
Source.TextSize = 14.000
Source.TextWrapped = true
Source.TextXAlignment = Enum.TextXAlignment.Right

UICorner_11.CornerRadius = UDim.new(0, 6)
UICorner_11.Parent = Source

Icon_3.Name = "Icon"
Icon_3.Parent = Source
Icon_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Icon_3.BackgroundTransparency = 1.000
Icon_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Icon_3.BorderSizePixel = 0
Icon_3.Position = UDim2.new(0.0235690232, 0, 0.097560972, 0)
Icon_3.Size = UDim2.new(0, 32, 0, 32)
Icon_3.Image = "rbxassetid://11663743444"
Icon_3.ImageColor3 = Color3.fromRGB(0, 0, 0)

Link.Name = "Link"
Link.Parent = GameData
Link.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Link.BorderColor3 = Color3.fromRGB(0, 0, 0)
Link.BorderSizePixel = 0
Link.Position = UDim2.new(-0.878980875, 0, -0.42993632, 0)
Link.Size = UDim2.new(0, 454, 0, 50)
Link.Visible = false
Link.ClearTextOnFocus = false
Link.Font = Enum.Font.SourceSans
Link.PlaceholderText = "Link Text"
Link.Text = ""
Link.TextColor3 = Color3.fromRGB(255, 255, 255)
Link.TextScaled = true
Link.TextSize = 14.000
Link.TextWrapped = true

UICorner_12.CornerRadius = UDim.new(0, 6)
UICorner_12.Parent = Link

Exit_2.Name = "Exit"
Exit_2.Parent = Link
Exit_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exit_2.BorderSizePixel = 0
Exit_2.Position = UDim2.new(1.01453733, 0, -0.00999999978, 0)
Exit_2.Size = UDim2.new(0, 139, 0, 50)
Exit_2.AutoButtonColor = false
Exit_2.Font = Enum.Font.SourceSansBold
Exit_2.Text = "Finish"
Exit_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Exit_2.TextScaled = true
Exit_2.TextSize = 14.000
Exit_2.TextWrapped = true

UICorner_13.Parent = Exit_2

-- Scripts:

local function RHKOXP_fake_script() -- Exit.Close 
	local script = Instance.new('LocalScript', Exit)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(RHKOXP_fake_script)()
local function SVJY_fake_script() -- GamesScroller.LoadScript 
	local script = Instance.new('LocalScript', GamesScroller)

	local ScriptLink = script.Parent.Parent.Parent.GameData.ScriptLink
	
	function ShowElements()
		script.Parent.Parent.Parent.GameData.Execute.Visible = true
		script.Parent.Parent.Parent.GameData.Source.Visible = true
		script.Parent.Parent.Parent.GameData.ReportBug.Visible = true
		script.Parent.Parent.Parent.GameData.Title.Visible = true
		script.Parent.Parent.Parent.GameData.Description.Visible = true
		script.Parent.Parent.Parent.GameData.ScriptLink.Visible = false
		script.Parent.Parent.Parent.GameData.PlaceId.Visible = false
	end
	
	for i, button in pairs(script.Parent:GetChildren()) do
		if button:IsA("TextButton") then
			button.MouseButton1Click:Connect(function()
				ShowElements()
				if button.Name == "MurderMystery2" then
					ScriptLink.Text = 'https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua'
					script.Parent.Parent.Parent.GameData.PlaceId.Text = 142823291
					script.Parent.Parent.Parent.GameData.Title.Text = "Murder Mystery 2"
					script.Parent.Parent.Parent.GameData.Description.Text = "A game where you survive the murderer, kill the murderer, or become the murder and kill all players."
				elseif button.Name == "FleeTheFacility" then
					ScriptLink.Text = 'https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua'
					script.Parent.Parent.Parent.GameData.PlaceId.Text = 893973440
					script.Parent.Parent.Parent.GameData.Title.Text = "Flee The Facility"
					script.Parent.Parent.Parent.GameData.Description.Text = "A game where a group of 5 players max; one is randomly selected as a 'killer' and has to kill all players before they escape."
				elseif button.Name == "IdentityFraud" then
					ScriptLink.Text = 'https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/IdentityFraud.lua'
					script.Parent.Parent.Parent.GameData.PlaceId.Text = 338521019
					script.Parent.Parent.Parent.GameData.Title.Text = "Identity Fraud"
					script.Parent.Parent.Parent.GameData.Description.Text = "A game where you have to escape mazes by solving puzzles in order to escape and destroy the final boss with different difficulties."
				elseif button.Name == "DOORS" then
					ScriptLink.Text = 'https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua'
					script.Parent.Parent.Parent.GameData.PlaceId.Text = 6839171747
					script.Parent.Parent.Parent.GameData.Title.Text = "DOORS 👁️"
					script.Parent.Parent.Parent.GameData.Description.Text = "A game where you open up doors and a random room generates behind it. You have to get to the final door in order to escape."
				end
			end)
		end
	end
end
coroutine.wrap(SVJY_fake_script)()
local function TXPUOL_fake_script() -- Execute.ExecuteScript 
	local script = Instance.new('LocalScript', Execute)

	local Script = script.Parent.Parent.ScriptLink
	
	script.Parent.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet(Script.Text))()
	end)
end
coroutine.wrap(TXPUOL_fake_script)()
local function QUJJ_fake_script() -- Source.SourceScript 
	local script = Instance.new('LocalScript', Source)

	local Script = script.Parent.Parent.ScriptLink
	
	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Link.Text = Script.Text
		script.Parent.Parent.Link.Visible = true
	end)
end
coroutine.wrap(QUJJ_fake_script)()
local function IAJX_fake_script() -- Exit_2.Close 
	local script = Instance.new('LocalScript', Exit_2)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Visible = false
	end)
end
coroutine.wrap(IAJX_fake_script)()
local function ICNHQRA_fake_script() -- Background.Smooth GUI Dragging 
	local script = Instance.new('LocalScript', Background)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(ICNHQRA_fake_script)()
