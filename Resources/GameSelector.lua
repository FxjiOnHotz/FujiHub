-- Monstrum's Gui to Lua\n-- Version: 3.2

-- Instances:

local FujiHub = Instance.new("ScreenGui")
local Background = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Subtitle = Instance.new("TextLabel")
local Container = Instance.new("Frame")
local Games = Instance.new("Frame")
local GamesList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local Template = Instance.new("TextButton")
local UpdateLog = Instance.new("Frame")
local Text = Instance.new("TextLabel")
local Update1 = Instance.new("TextLabel")
local Update2 = Instance.new("TextLabel")
local Update3 = Instance.new("TextLabel")
local Credits = Instance.new("Frame")
local Text_2 = Instance.new("TextLabel")
local Item1 = Instance.new("TextLabel")
local Item2 = Instance.new("TextLabel")
local Games_2 = Instance.new("TextButton")
local UpdateLog_2 = Instance.new("TextButton")
local Credits_2 = Instance.new("TextButton")
local Exit = Instance.new("TextButton")
local GamesCount = Instance.new("TextLabel")
local DragBox = Instance.new("Frame")
local DragBoxText = Instance.new("TextLabel")

--Properties:

FujiHub.Name = "FujiHub"
FujiHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
FujiHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Background.Name = "Background"
Background.Parent = FujiHub
Background.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.310657591, 0, 0.246523395, 0)
Background.Size = UDim2.new(0, 500, 0, 400)

Title.Name = "Title"
Title.Parent = Background
Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1.000
Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.0280000009, 0, 0.0274999999, 0)
Title.Size = UDim2.new(0, 120, 0, 35)
Title.Font = Enum.Font.GothamBold
Title.Text = "FujiHub"
Title.TextColor3 = Color3.fromRGB(252, 48, 48)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

Subtitle.Name = "Subtitle"
Subtitle.Parent = Background
Subtitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.BackgroundTransparency = 1.000
Subtitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
Subtitle.BorderSizePixel = 0
Subtitle.Position = UDim2.new(0.0280000009, 0, 0.115000002, 0)
Subtitle.Size = UDim2.new(0, 120, 0, 18)
Subtitle.Font = Enum.Font.Gotham
Subtitle.Text = "A script hub?"
Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.TextScaled = true
Subtitle.TextSize = 14.000
Subtitle.TextWrapped = true
Subtitle.TextXAlignment = Enum.TextXAlignment.Left

Container.Name = "Container"
Container.Parent = Background
Container.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
Container.BorderSizePixel = 0
Container.Position = UDim2.new(0.294, 0, 0.0274999999, 0)
Container.Size = UDim2.new(0, 344, 0, 379)

Games.Name = "Games"
Games.Parent = Container
Games.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Games.BackgroundTransparency = 1.000
Games.BorderColor3 = Color3.fromRGB(0, 0, 0)
Games.BorderSizePixel = 0
Games.Size = UDim2.new(1, 0, 1, 0)

GamesList.Name = "GamesList"
GamesList.Parent = Games
GamesList.Active = true
GamesList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GamesList.BackgroundTransparency = 1.000
GamesList.BorderColor3 = Color3.fromRGB(0, 0, 0)
GamesList.BorderSizePixel = 0
GamesList.Size = UDim2.new(1, 0, 1, 0)
GamesList.ScrollBarImageColor3 = Color3.fromRGB(252, 48, 48)

UIListLayout.Parent = GamesList
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 10)
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
UIListLayout.ItemLineAlignment = Enum.ItemLineAlignment.Automatic
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
UIListLayout.Wraps = true

Template.Name = "Template"
Template.Parent = GamesList
Template.BackgroundColor3 = Color3.fromRGB(252, 48, 48)
Template.BorderColor3 = Color3.fromRGB(0, 0, 0)
Template.BorderSizePixel = 0
Template.Position = UDim2.new(0.377906978, 0, 0.039577838, 0)
Template.Size = UDim2.new(0, 100, 0, 50)
Template.Visible = false
Template.Font = Enum.Font.Bangers
Template.Text = "Template"
Template.TextColor3 = Color3.fromRGB(255, 255, 255)
Template.TextScaled = true
Template.TextSize = 14.000
Template.TextWrapped = true

UpdateLog.Name = "UpdateLog"
UpdateLog.Parent = Container
UpdateLog.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UpdateLog.BackgroundTransparency = 1.000
UpdateLog.BorderColor3 = Color3.fromRGB(0, 0, 0)
UpdateLog.BorderSizePixel = 0
UpdateLog.Size = UDim2.new(1, 0, 1, 0)
UpdateLog.Visible = false

Text.Name = "Text"
Text.Parent = UpdateLog
Text.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Text.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text.BorderSizePixel = 0
Text.Position = UDim2.new(0, 0, 0.029023746, 0)
Text.Size = UDim2.new(1, 0, 0.092348285, 0)
Text.Font = Enum.Font.Gotham
Text.Text = "Updates"
Text.TextColor3 = Color3.fromRGB(255, 255, 255)
Text.TextSize = 34.000
Text.TextWrapped = true

Update1.Name = "Update1"
Update1.Parent = UpdateLog
Update1.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Update1.BackgroundTransparency = 1.000
Update1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Update1.BorderSizePixel = 0
Update1.Position = UDim2.new(0, 0, 0.160949871, 0)
Update1.Size = UDim2.new(1, 0, 0.0644218624, 0)
Update1.Font = Enum.Font.Gotham
Update1.Text = "🎮 New game selecting ui"
Update1.TextColor3 = Color3.fromRGB(255, 255, 255)
Update1.TextScaled = true
Update1.TextSize = 34.000
Update1.TextWrapped = true

Update2.Name = "Update2"
Update2.Parent = UpdateLog
Update2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Update2.BackgroundTransparency = 1.000
Update2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Update2.BorderSizePixel = 0
Update2.Position = UDim2.new(0, 0, 0.225371748, 0)
Update2.Size = UDim2.new(1, 0, 0.0644218996, 0)
Update2.Font = Enum.Font.Gotham
Update2.Text = "🕹️ Uhh 3 new games"
Update2.TextColor3 = Color3.fromRGB(255, 255, 255)
Update2.TextScaled = true
Update2.TextSize = 34.000
Update2.TextWrapped = true

Update3.Name = "Update3"
Update3.Parent = UpdateLog
Update3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Update3.BackgroundTransparency = 1.000
Update3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Update3.BorderSizePixel = 0
Update3.Position = UDim2.new(0, 0, 0.297055691, 0)
Update3.Size = UDim2.new(1, 0, 0.0644218624, 0)
Update3.Font = Enum.Font.Gotham
Update3.Text = "👋 Hi"
Update3.TextColor3 = Color3.fromRGB(255, 255, 255)
Update3.TextScaled = true
Update3.TextSize = 34.000
Update3.TextWrapped = true

Credits.Name = "Credits"
Credits.Parent = Container
Credits.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits.BackgroundTransparency = 1.000
Credits.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits.BorderSizePixel = 0
Credits.Size = UDim2.new(1, 0, 1, 0)
Credits.Visible = false

Text_2.Name = "Text"
Text_2.Parent = Credits
Text_2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Text_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Text_2.BorderSizePixel = 0
Text_2.Position = UDim2.new(0, 0, 0.029023746, 0)
Text_2.Size = UDim2.new(1, 0, 0.092348285, 0)
Text_2.Font = Enum.Font.Gotham
Text_2.Text = "Credits"
Text_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Text_2.TextSize = 34.000
Text_2.TextWrapped = true

Item1.Name = "Item1"
Item1.Parent = Credits
Item1.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Item1.BackgroundTransparency = 1.000
Item1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Item1.BorderSizePixel = 0
Item1.Position = UDim2.new(0, 0, 0.160949871, 0)
Item1.Size = UDim2.new(1, 0, 0.0644218624, 0)
Item1.Font = Enum.Font.Gotham
Item1.Text = "Scripted by @f4jii. on DC"
Item1.TextColor3 = Color3.fromRGB(255, 255, 255)
Item1.TextScaled = true
Item1.TextSize = 34.000
Item1.TextWrapped = true

Item2.Name = "Item2"
Item2.Parent = Credits
Item2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
Item2.BackgroundTransparency = 1.000
Item2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Item2.BorderSizePixel = 0
Item2.Position = UDim2.new(0, 0, 0.225371748, 0)
Item2.Size = UDim2.new(1, 0, 0.0644218996, 0)
Item2.Font = Enum.Font.Gotham
Item2.Text = "Script UI is Kavo UI"
Item2.TextColor3 = Color3.fromRGB(255, 255, 255)
Item2.TextScaled = true
Item2.TextSize = 34.000
Item2.TextWrapped = true

Games_2.Name = "Games"
Games_2.Parent = Background
Games_2.BackgroundColor3 = Color3.fromRGB(252, 48, 48)
Games_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Games_2.BorderSizePixel = 0
Games_2.Position = UDim2.new(0.0280000009, 0, 0.189999998, 0)
Games_2.Size = UDim2.new(0, 120, 0, 28)
Games_2.Font = Enum.Font.GothamBold
Games_2.Text = "Games"
Games_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Games_2.TextSize = 18.000
Games_2.TextWrapped = true

UpdateLog_2.Name = "UpdateLog"
UpdateLog_2.Parent = Background
UpdateLog_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UpdateLog_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
UpdateLog_2.BorderSizePixel = 0
UpdateLog_2.Position = UDim2.new(0.0280000009, 0, 0.277500004, 0)
UpdateLog_2.Size = UDim2.new(0, 120, 0, 28)
UpdateLog_2.Font = Enum.Font.GothamBold
UpdateLog_2.Text = "Update Log"
UpdateLog_2.TextColor3 = Color3.fromRGB(0, 0, 0)
UpdateLog_2.TextSize = 18.000
UpdateLog_2.TextWrapped = true

Credits_2.Name = "Credits"
Credits_2.Parent = Background
Credits_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Credits_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Credits_2.BorderSizePixel = 0
Credits_2.Position = UDim2.new(0.0280000009, 0, 0.370000005, 0)
Credits_2.Size = UDim2.new(0, 120, 0, 28)
Credits_2.Font = Enum.Font.GothamBold
Credits_2.Text = "Credits"
Credits_2.TextColor3 = Color3.fromRGB(0, 0, 0)
Credits_2.TextSize = 18.000
Credits_2.TextWrapped = true

Exit.Name = "Exit"
Exit.Parent = Background
Exit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Exit.BorderColor3 = Color3.fromRGB(0, 0, 0)
Exit.BorderSizePixel = 0
Exit.Position = UDim2.new(0.0280000009, 0, 0.462500006, 0)
Exit.Size = UDim2.new(0, 120, 0, 28)
Exit.Font = Enum.Font.GothamBold
Exit.Text = "Exit"
Exit.TextColor3 = Color3.fromRGB(0, 0, 0)
Exit.TextSize = 18.000
Exit.TextWrapped = true

GamesCount.Name = "GamesCount"
GamesCount.Parent = Background
GamesCount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
GamesCount.BackgroundTransparency = 1.000
GamesCount.BorderColor3 = Color3.fromRGB(0, 0, 0)
GamesCount.BorderSizePixel = 0
GamesCount.Position = UDim2.new(0.0263022464, 0, 0.922730863, 0)
GamesCount.Size = UDim2.new(0, 120, 0, 20)
GamesCount.Font = Enum.Font.SourceSansBold
GamesCount.Text = "Games Count: 200"
GamesCount.TextColor3 = Color3.fromRGB(255, 255, 255)
GamesCount.TextScaled = true
GamesCount.TextSize = 14.000
GamesCount.TextWrapped = true

DragBox.Name = "DragBox"
DragBox.Parent = Background
DragBox.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
DragBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragBox.BorderSizePixel = 0
DragBox.Position = UDim2.new(0.0280000009, 0, 0.654999971, 0)
DragBox.Size = UDim2.new(0, 120, 0, 100)

DragBoxText.Name = "DragBoxText"
DragBoxText.Parent = DragBox
DragBoxText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DragBoxText.BackgroundTransparency = 1.000
DragBoxText.BorderColor3 = Color3.fromRGB(0, 0, 0)
DragBoxText.BorderSizePixel = 0
DragBoxText.Position = UDim2.new(-0.00703099556, 0, -0.00726928702, 0)
DragBoxText.Size = UDim2.new(1, 0, 1, 0)
DragBoxText.Font = Enum.Font.SourceSansBold
DragBoxText.Text = "Drag Box"
DragBoxText.TextColor3 = Color3.fromRGB(255, 255, 255)
DragBoxText.TextSize = 22.000
DragBoxText.TextWrapped = true

-- Scripts:

local function QMPGGZ_script() -- Games.SetButton 
	local script = Instance.new('LocalScript', Games)

	local GamesList = {
		DOORS = "DOORS 🚪",
		MurderMystery2 = "Murder Mystery 2 🔪",
		FleeTheFacility = "Flee The Facility 🔨",
		IdentityFraud = "Identity Fraud 🖥️",
		DandysWorld = "Dandy's World 🌈",
		NinjaLegends = "Ninja Legends ⚔️",
		BuildABoatForTreasure = "Build A Boat For Treasure ⛵",
		BasketballLegends = "Basketball Legends 🏀",
		ShardSeekers = "Shard Seekers ✨",
		KaijuArisen = "Kaiju Arisen 🐊",
		UltimateTownSandbox = "Ultimate Town Sandbox 🌲",
		PillarChase2 = "Pillar Chase 2 👹",
		MonsterMetro = "Monster Metro 🚂",
		FloodEscapeClassic = "Flood Escape Classic 🌊"
	}
	
	local scrollingFrame = script.Parent:FindFirstChild("GamesList") -- Adjust if needed
	local templateButton = scrollingFrame:FindFirstChild("Template")
	
	if templateButton then
		templateButton.Visible = false -- Hide the template
	end
	
	local gamesAmount = 0
	
	for gameKey, gameName in pairs(GamesList) do
		local button = templateButton:Clone()
		button.Parent = scrollingFrame
		button.Visible = true
		button.Text = gameName
		button.Name = gameKey -- Set the name to the key in GamesList
	
		-- Add button click functionality
		button.MouseButton1Click:Connect(function()
			local scriptUrl = "https://raw.githubusercontent.com/FxjiOnHotz/FujiHub/refs/heads/main/Supported/" .. gameKey .. ".lua"
			loadstring(game:HttpGet(scriptUrl))()
		end)
		
		gamesAmount += 1
	end
	
	script.Parent.Parent.Parent.GamesCount.Text = "Games Count: " .. gamesAmount
end
coroutine.wrap(QMPGGZ_script)()
local function NJBH_script() -- Background.ButtonAnimation 
	local script = Instance.new('LocalScript', Background)

	local TweenService = game:GetService("TweenService")
	local container = script.Parent:FindFirstChild("Container") -- Get the container frame
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out) -- Tween settings
	
	for i, Button in pairs(script.Parent:GetChildren()) do
		if Button:IsA("TextButton") then
			Button.MouseButton1Click:Connect(function()
				if Button.Name == "Exit" then
					-- Animate and hide all UI elements
					for _, uiElement in pairs(script.Parent.Parent:GetDescendants()) do
						if uiElement:IsA("Frame") or uiElement:IsA("TextButton") or uiElement:IsA("TextLabel") then
							local properties = {}
	
							if uiElement:IsA("Frame") then
								properties.BackgroundTransparency = 1
							elseif uiElement:IsA("TextButton") or uiElement:IsA("TextLabel") then
								properties.BackgroundTransparency = 1
								properties.TextTransparency = 1
							end
	
							local tween = TweenService:Create(uiElement, tweenInfo, properties)
							tween:Play()
							tween.Completed:Connect(function()
								uiElement.Visible = false
							end)
						end
					end
					return -- Stop further execution for exit
				end
	
				-- Reset all button colors
				for _, OtherButton in pairs(script.Parent:GetChildren()) do
					if OtherButton:IsA("TextButton") then
						OtherButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White background
						OtherButton.TextColor3 = Color3.fromRGB(0, 0, 0) -- Black text
					end
				end
	
				-- Change the clicked button's color
				Button.BackgroundColor3 = Color3.fromRGB(252, 48, 48) -- Red background
				Button.TextColor3 = Color3.fromRGB(255, 255, 255) -- White text
	
				-- Hide all frames inside the container
				if container then
					for _, frame in pairs(container:GetChildren()) do
						if frame:IsA("Frame") then
							frame.Visible = false
						end
					end
				end
	
				-- Show the corresponding frame if it exists
				local targetFrame = container:FindFirstChild(Button.Name)
				if targetFrame then
					targetFrame.Visible = true
				end
			end)
		end
	end
	
end
coroutine.wrap(NJBH_script)()
local function PNPMTKT_script() -- DragBox.DraggableGUI 
	local script = Instance.new('LocalScript', DragBox)

	local UserInputService = game:GetService("UserInputService")
	
	local dragger = script.Parent -- Element used to drag the GUI
	local gui = script.Parent.Parent -- The actual GUI being moved
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	dragger.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	dragger.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			if gui.Visible then
				update(input)
			end
		end
	end)
end
coroutine.wrap(PNPMTKT_script)()
