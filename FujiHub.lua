-- Gui to Lua
-- Version: 3.2

-- Instances:

local FujiHubKey = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local Version = Instance.new("TextLabel")
local Exit = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local GamesListFrame = Instance.new("Frame")
local UICorner_3 = Instance.new("UICorner")
local KeyText = Instance.new("TextBox")
local UICorner_4 = Instance.new("UICorner")
local GetLink = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Submit = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")

--Properties:

FujiHubKey.Name = "FujiHubKey"
FujiHubKey.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FujiHubKey.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = FujiHubKey
Background.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.278761059, 0, 0.246523395, 0)
Background.Size = UDim2.new(0.442477882, 0, 0.666666687, 0)

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = Background

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0183333326, 0, 0.0299999993, 0)
Title.Size = UDim2.new(0.393333346, 0, 0.0799999982, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "FujiHub | KEY"
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
Version.Size = UDim2.new(0.333333343, 0, 0.0450000018, 0)
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
Exit.Size = UDim2.new(0.0833333358, 0, 0.125, 0)
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
GamesListFrame.Position = UDim2.new(0.0183333326, 0, 0.189999998, 0)
GamesListFrame.Size = UDim2.new(0.964999974, 0, 0.785000026, 0)

UICorner_3.CornerRadius = UDim.new(0, 10)
UICorner_3.Parent = GamesListFrame

KeyText.Name = "KeyText"
KeyText.Parent = GamesListFrame
KeyText.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
KeyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
KeyText.BorderSizePixel = 0
KeyText.Position = UDim2.new(0.0260277521, 0, 0.0541401282, 0)
KeyText.Size = UDim2.new(0.946459413, 0, 0.207006365, 0)
KeyText.ClearTextOnFocus = false
KeyText.Font = Enum.Font.SourceSans
KeyText.PlaceholderText = "Enter Key"
KeyText.Text = ""
KeyText.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyText.TextScaled = true
KeyText.TextSize = 14.000
KeyText.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = KeyText

GetLink.Name = "GetLink"
GetLink.Parent = KeyText
GetLink.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GetLink.BorderColor3 = Color3.fromRGB(0, 0, 0)
GetLink.BorderSizePixel = 0
GetLink.Position = UDim2.new(-6.12579097e-05, 0, 2.17461491, 0)
GetLink.Size = UDim2.new(1, 0, 0.661538482, 0)
GetLink.AutoButtonColor = false
GetLink.Font = Enum.Font.SourceSansBold
GetLink.Text = "No key link yet."
GetLink.TextColor3 = Color3.fromRGB(0, 0, 0)
GetLink.TextScaled = true
GetLink.TextSize = 14.000
GetLink.TextWrapped = true

UICorner_5.Parent = GetLink

Submit.Name = "Submit"
Submit.Parent = KeyText
Submit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Submit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Submit.BorderSizePixel = 0
Submit.Position = UDim2.new(-6.12579097e-05, 0, 1.26692271, 0)
Submit.Size = UDim2.new(1, 0, 0.661538482, 0)
Submit.AutoButtonColor = false
Submit.Font = Enum.Font.SourceSansBold
Submit.Text = "Submit"
Submit.TextColor3 = Color3.fromRGB(0, 0, 0)
Submit.TextScaled = true
Submit.TextSize = 14.000
Submit.TextWrapped = true

UICorner_6.Parent = Submit

TextLabel.Parent = GamesListFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.025906736, 0, 0.882165611, 0)
TextLabel.Size = UDim2.new(0.946459413, 0, 0.0732484087, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Since there is no key, the key is \"appleslices\"."
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

-- Scripts:

local function OZDEL_fake_script() -- Exit.Close 
	local script = Instance.new('LocalScript', Exit)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(OZDEL_fake_script)()
local function CKLF_fake_script() -- Submit.LocalScript 
	local script = Instance.new('LocalScript', Submit)

	script.Parent.MouseButton1Click:Connect(function()
		if script.Parent.Parent.Text == "appleslices" then
			loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Resources/GameSelector.lua"))()
			script.Parent.Parent.Parent.Parent.Parent:Destroy()
		else
			script.Parent.Parent.Text = "Invalid Key"
			wait(1)
			script.Parent.Parent.Text = ""
		end
	end)
end
coroutine.wrap(CKLF_fake_script)()
local function ZURCI_fake_script() -- Background.Smooth GUI Dragging 
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
coroutine.wrap(ZURCI_fake_script)()
