-- Gui to Lua
-- Version: 3.2

-- Instances:

local FujiHubLauncher = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Version = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local Divider = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Date = Instance.new("TextLabel")
local GamesList = Instance.new("Frame")
local GamesScrollbar = Instance.new("ScrollingFrame")
local MurderMystery2 = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local FleeTheFacility = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local DOORS = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local UIListLayout = Instance.new("UIListLayout")
local IdentityFraud = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local UICorner_6 = Instance.new("UICorner")
local Update = Instance.new("Frame")
local UICorner_7 = Instance.new("UICorner")
local Title_2 = Instance.new("TextLabel")
local Update_2 = Instance.new("TextLabel")
local Time = Instance.new("TextLabel")
local Close = Instance.new("TextButton")

--Properties:

FujiHubLauncher.Name = "FujiHubLauncher"
FujiHubLauncher.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FujiHubLauncher.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

MainFrame.Name = "MainFrame"
MainFrame.Parent = FujiHubLauncher
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BackgroundTransparency = 0.450
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.278761059, 0, 0.227560043, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 430)

Version.Name = "Version"
Version.Parent = MainFrame
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.BorderColor3 = Color3.fromRGB(0, 0, 0)
Version.BorderSizePixel = 0
Version.Position = UDim2.new(0.0266666673, 0, 0.123255812, 0)
Version.Size = UDim2.new(0, 61, 0, 23)
Version.Font = Enum.Font.SourceSans
Version.Text = "v1.0.5"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextScaled = true
Version.TextSize = 14.000
Version.TextStrokeColor3 = Color3.fromRGB(31, 51, 80)
Version.TextStrokeTransparency = 0.000
Version.TextWrapped = true
Version.TextXAlignment = Enum.TextXAlignment.Left

UICorner.Parent = MainFrame

Divider.Name = "Divider"
Divider.Parent = MainFrame
Divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
Divider.BorderSizePixel = 0
Divider.Position = UDim2.new(0.215000004, 0, 0.0325581394, 0)
Divider.Size = UDim2.new(0, 2, 0, 62)

Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0266666673, 0, 0.0372093022, 0)
Title.Size = UDim2.new(0, 115, 0, 37)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "FujiHub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextStrokeColor3 = Color3.fromRGB(31, 51, 80)
Title.TextStrokeTransparency = 0.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Date.Name = "Date"
Date.Parent = MainFrame
Date.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Date.BackgroundTransparency = 1.000
Date.BorderColor3 = Color3.fromRGB(0, 0, 0)
Date.BorderSizePixel = 0
Date.Position = UDim2.new(0.23833333, 0, 0.0325581394, 0)
Date.Size = UDim2.new(0, 354, 0, 35)
Date.Font = Enum.Font.SourceSans
Date.Text = "Date"
Date.TextColor3 = Color3.fromRGB(255, 255, 255)
Date.TextScaled = true
Date.TextSize = 14.000
Date.TextStrokeColor3 = Color3.fromRGB(31, 51, 80)
Date.TextStrokeTransparency = 0.000
Date.TextWrapped = true
Date.TextXAlignment = Enum.TextXAlignment.Left

GamesList.Name = "GamesList"
GamesList.Parent = MainFrame
GamesList.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GamesList.BackgroundTransparency = 0.800
GamesList.BorderColor3 = Color3.fromRGB(0, 0, 0)
GamesList.BorderSizePixel = 0
GamesList.Position = UDim2.new(0.0266666673, 0, 0.209302321, 0)
GamesList.Size = UDim2.new(0, 221, 0, 324)

GamesScrollbar.Name = "GamesScrollbar"
GamesScrollbar.Parent = GamesList
GamesScrollbar.Active = true
GamesScrollbar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GamesScrollbar.BackgroundTransparency = 2.000
GamesScrollbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
GamesScrollbar.BorderSizePixel = 0
GamesScrollbar.Position = UDim2.new(0, 0, 0.0370370373, 0)
GamesScrollbar.Size = UDim2.new(1, 0, 0.962962985, 0)
GamesScrollbar.ScrollBarThickness = 0

MurderMystery2.Name = "MurderMystery2"
MurderMystery2.Parent = GamesScrollbar
MurderMystery2.BackgroundColor3 = Color3.fromRGB(31, 51, 80)
MurderMystery2.BorderColor3 = Color3.fromRGB(0, 0, 0)
MurderMystery2.BorderSizePixel = 0
MurderMystery2.Position = UDim2.new(0.0610859729, 0, 0, 0)
MurderMystery2.Size = UDim2.new(0, 195, 0, 33)
MurderMystery2.AutoButtonColor = false
MurderMystery2.Font = Enum.Font.SourceSans
MurderMystery2.Text = "Murder Mystery 2"
MurderMystery2.TextColor3 = Color3.fromRGB(255, 255, 255)
MurderMystery2.TextScaled = true
MurderMystery2.TextSize = 14.000
MurderMystery2.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = MurderMystery2

FleeTheFacility.Name = "FleeTheFacility"
FleeTheFacility.Parent = GamesScrollbar
FleeTheFacility.BackgroundColor3 = Color3.fromRGB(31, 51, 80)
FleeTheFacility.BorderColor3 = Color3.fromRGB(0, 0, 0)
FleeTheFacility.BorderSizePixel = 0
FleeTheFacility.Position = UDim2.new(0.0610859729, 0, 0, 0)
FleeTheFacility.Size = UDim2.new(0, 195, 0, 33)
FleeTheFacility.AutoButtonColor = false
FleeTheFacility.Font = Enum.Font.SourceSans
FleeTheFacility.Text = "Flee The Facility"
FleeTheFacility.TextColor3 = Color3.fromRGB(255, 255, 255)
FleeTheFacility.TextScaled = true
FleeTheFacility.TextSize = 14.000
FleeTheFacility.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = FleeTheFacility

DOORS.Name = "DOORS"
DOORS.Parent = GamesScrollbar
DOORS.BackgroundColor3 = Color3.fromRGB(31, 51, 80)
DOORS.BorderColor3 = Color3.fromRGB(0, 0, 0)
DOORS.BorderSizePixel = 0
DOORS.Position = UDim2.new(0.0723981932, 0, 0.256410271, 0)
DOORS.Size = UDim2.new(0, 195, 0, 33)
DOORS.AutoButtonColor = false
DOORS.Font = Enum.Font.SourceSans
DOORS.Text = "DOORS"
DOORS.TextColor3 = Color3.fromRGB(255, 255, 255)
DOORS.TextScaled = true
DOORS.TextSize = 14.000
DOORS.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0, 6)
UICorner_4.Parent = DOORS

UIListLayout.Parent = GamesScrollbar
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 7)

IdentityFraud.Name = "IdentityFraud"
IdentityFraud.Parent = GamesScrollbar
IdentityFraud.BackgroundColor3 = Color3.fromRGB(31, 51, 80)
IdentityFraud.BorderColor3 = Color3.fromRGB(0, 0, 0)
IdentityFraud.BorderSizePixel = 0
IdentityFraud.Position = UDim2.new(0.0723981932, 0, 0.256410271, 0)
IdentityFraud.Size = UDim2.new(0, 195, 0, 33)
IdentityFraud.AutoButtonColor = false
IdentityFraud.Font = Enum.Font.SourceSans
IdentityFraud.Text = "Identity Fraud"
IdentityFraud.TextColor3 = Color3.fromRGB(255, 255, 255)
IdentityFraud.TextScaled = true
IdentityFraud.TextSize = 14.000
IdentityFraud.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0, 6)
UICorner_5.Parent = IdentityFraud

UICorner_6.CornerRadius = UDim.new(0, 6)
UICorner_6.Parent = GamesList

Update.Name = "Update"
Update.Parent = MainFrame
Update.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Update.BackgroundTransparency = 0.800
Update.BorderColor3 = Color3.fromRGB(0, 0, 0)
Update.BorderSizePixel = 0
Update.Position = UDim2.new(0.418333322, 0, 0.209302321, 0)
Update.Size = UDim2.new(0, 336, 0, 324)

UICorner_7.Parent = Update

Title_2.Name = "Title"
Title_2.Parent = Update
Title_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title_2.BackgroundTransparency = 1.000
Title_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title_2.BorderSizePixel = 0
Title_2.Position = UDim2.new(0.0357142873, 0, 0.0185185187, 0)
Title_2.Size = UDim2.new(0, 315, 0, 33)
Title_2.Font = Enum.Font.SourceSansBold
Title_2.Text = "Updates:"
Title_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Title_2.TextScaled = true
Title_2.TextSize = 14.000
Title_2.TextStrokeColor3 = Color3.fromRGB(31, 51, 80)
Title_2.TextStrokeTransparency = 0.000
Title_2.TextWrapped = true
Title_2.TextXAlignment = Enum.TextXAlignment.Left

Update_2.Name = "Update"
Update_2.Parent = Update
Update_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Update_2.BackgroundTransparency = 1.000
Update_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Update_2.BorderSizePixel = 0
Update_2.Position = UDim2.new(0.0357142873, 0, 0.120370373, 0)
Update_2.Size = UDim2.new(0, 315, 0, 25)
Update_2.Font = Enum.Font.SourceSans
Update_2.Text = "Added support for \"Identity Fraud\"."
Update_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Update_2.TextScaled = true
Update_2.TextSize = 14.000
Update_2.TextStrokeColor3 = Color3.fromRGB(31, 51, 80)
Update_2.TextStrokeTransparency = 0.000
Update_2.TextWrapped = true
Update_2.TextXAlignment = Enum.TextXAlignment.Left

Time.Name = "Time"
Time.Parent = MainFrame
Time.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Time.BackgroundTransparency = 1.000
Time.BorderColor3 = Color3.fromRGB(0, 0, 0)
Time.BorderSizePixel = 0
Time.Position = UDim2.new(0.23833333, 0, 0.113953486, 0)
Time.Size = UDim2.new(0, 354, 0, 28)
Time.Font = Enum.Font.SourceSans
Time.Text = "Time"
Time.TextColor3 = Color3.fromRGB(255, 255, 255)
Time.TextScaled = true
Time.TextSize = 14.000
Time.TextStrokeColor3 = Color3.fromRGB(31, 51, 80)
Time.TextStrokeTransparency = 0.000
Time.TextWrapped = true
Time.TextXAlignment = Enum.TextXAlignment.Left

Close.Name = "Close"
Close.Parent = MainFrame
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderSizePixel = 0
Close.Position = UDim2.new(0.888333321, 0, 0.0325581394, 0)
Close.Size = UDim2.new(0, 54, 0, 61)
Close.Font = Enum.Font.SourceSansBold
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(31, 51, 80)
Close.TextScaled = true
Close.TextSize = 14.000
Close.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
Close.TextStrokeTransparency = 0.000
Close.TextWrapped = true

-- Scripts:

local function QPZVZ_fake_script() -- Date.TimeScript 
	local script = Instance.new('LocalScript', Date)

	while true do
		
		local Unix = os.time()
		
	    local Date2 = script.Parent
		Date2.Text = os.date("%m/%d/%Y", Unix)
		
		
		task.wait(1)
	end
end
coroutine.wrap(QPZVZ_fake_script)()
local function YZCC_fake_script() -- GamesScrollbar.Main 
	local script = Instance.new('LocalScript', GamesScrollbar)

	for i, button in pairs(script.Parent:GetChildren()) do
		if button:IsA("TextButton") then
			button.MouseButton1Click:Connect(function()
				if button.Name == "DOORS" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/DOORS.lua"))()
				elseif button.Name == "MurderMystery2" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/MurderMystery2.lua"))()
				elseif button.Name == "FleeTheFacility" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/FleeTheFacility.lua"))()
				elseif button.Name == "IdentityFraud" then
					loadstring(game:HttpGet("https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/IdentityFraud.lua"))()
				end
			end)
		end
	end
end
coroutine.wrap(YZCC_fake_script)()
local function NDCVCBI_fake_script() -- Time.TimeScript 
	local script = Instance.new('LocalScript', Time)

	while true do
		
		local Unix = os.time()
		
	    local Time2 = script.Parent
		Time2.Text = os.date("%I:%M %p", Unix)
		
		
		task.wait(1)
	end
end
coroutine.wrap(NDCVCBI_fake_script)()
local function DTIFGZL_fake_script() -- Close.CloseGui 
	local script = Instance.new('LocalScript', Close)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent:Destroy()
	end)
end
coroutine.wrap(DTIFGZL_fake_script)()
local function SMKPTC_fake_script() -- MainFrame.DraggableUI 
	local script = Instance.new('LocalScript', MainFrame)

	local FrameDetect = script.Parent
	local FrameMoves = script.Parent
	
	local RunService = game:GetService("RunService")
	local UserInputService = game:GetService("UserInputService")
	local CurrentMousePosition
	local Detected = false
	
	FrameDetect.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			CurrentMousePosition = UserInputService:GetMouseLocation()
			Detected = true
		end
	end)
	
	FrameDetect.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			Detected = false
		end
	end)
	
	RunService.RenderStepped:Connect(function()
		if Detected then
			local MousePosition = UserInputService:GetMouseLocation()
			local MoveX = CurrentMousePosition.X - MousePosition.X
			local MoveY = CurrentMousePosition.Y - MousePosition.Y
			CurrentMousePosition = MousePosition
			FrameMoves.Position = FrameMoves.Position - UDim2.new(0,MoveX,0,MoveY)
		end
	end)
end
coroutine.wrap(SMKPTC_fake_script)()
